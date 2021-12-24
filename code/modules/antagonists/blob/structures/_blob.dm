GLOBAL_VAR_INIT(blob_current_icon, pick('icons/mob/blob_64.dmi', 'icons/mob/blob_skeleton_64.dmi', 'icons/mob/blob_ame_64.dmi'))

//I will need to recode parts of this but I am way too tired atm //I don't know who left this comment but they never did come back
/obj/structure/blob
	name = "масса"
	icon = 'icons/mob/blob_64.dmi'
	light_range = 2
	desc = "Крепкая стена."
	density = TRUE
	opacity = FALSE
	anchored = TRUE
	layer = BELOW_MOB_LAYER
	pass_flags_self = PASSBLOB
	CanAtmosPass = ATMOS_PASS_PROC
	/// How many points the blob gets back when it removes a blob of that type. If less than 0, blob cannot be removed.
	var/point_return = 0
	max_integrity = 30
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 80, ACID = 70)
	/// how much health this blob regens when pulsed
	var/health_regen = BLOB_REGULAR_HP_REGEN
	/// We got pulsed when?
	COOLDOWN_DECLARE(pulse_timestamp)
	/// we got healed when?
	COOLDOWN_DECLARE(heal_timestamp)
	/// Multiplies brute damage by this
	var/brute_resist = BLOB_BRUTE_RESIST
	/// Multiplies burn damage by this
	var/fire_resist = BLOB_FIRE_RESIST
	/// Only used by the synchronous mesh strain. If set to true, these blobs won't share or receive damage taken with others.
	var/ignore_syncmesh_share = 0
	/// If the blob blocks atmos and heat spread
	var/atmosblock = FALSE
	var/mob/camera/blob/overmind
	pixel_x = -16
	pixel_y = -16

/obj/structure/blob/Initialize(mapload, owner_overmind)
	. = ..()

	icon = GLOB.blob_current_icon

	if(owner_overmind)
		overmind = owner_overmind
		overmind.all_blobs += src
		var/area/Ablob = get_area(src)
		if(Ablob.area_flags & BLOBS_ALLOWED) //Is this area allowed for winning as blob?
			overmind.blobs_legit += src
	GLOB.blobs += src //Keep track of the blob in the normal list either way
	setDir(pick(GLOB.cardinals))
	update_icon()
	if(atmosblock)
		air_update_turf(TRUE, TRUE)
	ConsumeTile()
	AddElement(/datum/element/swabable, CELL_LINE_TABLE_BLOB, CELL_VIRUS_TABLE_GENERIC, 2, 2)

	icon_state = initial(icon_state) + "_spawn"
	spawn(10)
		icon_state = initial(icon_state)

	for(var/obj/structure/blob/B in orange(src,1))
		anim(target = loc, a_icon = icon, flick_anim = "connect_spawn", sleeptime = 15, direction = get_dir(src, B), lay = layer, offX = -16, offY = -16, plane = plane)

/obj/structure/blob/proc/creation_action() //When it's created by the overmind, do this.
	return

/obj/structure/blob/Destroy()
	if(atmosblock)
		atmosblock = FALSE
		air_update_turf(TRUE, FALSE)
	if(overmind)
		overmind.all_blobs -= src
		overmind.blobs_legit -= src  //if it was in the legit blobs list, it isn't now
		overmind = null
	GLOB.blobs -= src //it's no longer in the all blobs list either
	playsound(src.loc, 'sound/effects/splat.ogg', 50, TRUE) //Expand() is no longer broken, no check necessary.

	for(var/obj/structure/blob/B in orange(loc,1))
		B.update_icon()
		anim(target = B.loc, a_icon = icon, flick_anim = "connect_die", sleeptime = 50, direction = get_dir(B, src), plane = src.plane, lay = layer+0.3, offX = -16, offY = -16, col = "red")

	return ..()

/obj/structure/blob/blob_act()
	return

/obj/structure/blob/Adjacent(atom/neighbour)
	. = ..()
	if(.)
		var/result = 0
		var/direction = get_dir(src, neighbour)
		var/list/dirs = list("[NORTHWEST]" = list(NORTH, WEST), "[NORTHEAST]" = list(NORTH, EAST), "[SOUTHEAST]" = list(SOUTH, EAST), "[SOUTHWEST]" = list(SOUTH, WEST))
		for(var/A in dirs)
			if(direction == text2num(A))
				for(var/B in dirs[A])
					var/C = locate(/obj/structure/blob) in get_step(src, B)
					if(C)
						result++
		. -= result - 1

/obj/structure/blob/BlockSuperconductivity()
	return atmosblock

/obj/structure/blob/CanAtmosPass(turf/T)
	return !atmosblock

/obj/structure/blob/update_icon() //Updates color based on overmind color if we have an overmind.
	. = ..()
	if(overmind)
		add_atom_colour(overmind.blobstrain.color, FIXED_COLOUR_PRIORITY)
	else
		remove_atom_colour(FIXED_COLOUR_PRIORITY)

	cut_overlays()

	for(var/obj/structure/blob/B in orange(src,1))
		overlays += image(icon, "connect", dir = get_dir(src,B))

	underlays.len = 0
	underlays += image(icon,"roots")

	update_health_overlay()

/obj/structure/blob/proc/update_health_overlay()
	if(obj_integrity < max_integrity)
		var/hurt_percentage = round((obj_integrity * 100) / max_integrity)
		var/hurt_icon
		switch(hurt_percentage)
			if(0 to 25)
				hurt_icon = "hurt_100"
			if(26 to 50)
				hurt_icon = "hurt_75"
			if(51 to 75)
				hurt_icon = "hurt_50"
			else
				hurt_icon = "hurt_25"
		overlays += image(icon,hurt_icon)

/obj/structure/blob/proc/Be_Pulsed()
	if(COOLDOWN_FINISHED(src, pulse_timestamp))
		ConsumeTile()
		if(COOLDOWN_FINISHED(src, heal_timestamp))
			obj_integrity = min(max_integrity, obj_integrity+health_regen)
			COOLDOWN_START(src, heal_timestamp, 20)
		update_icon()
		COOLDOWN_START(src, pulse_timestamp, 10)
		return TRUE//we did it, we were pulsed!
	return FALSE //oh no we failed

/obj/structure/blob/proc/ConsumeTile()
	for(var/atom/A in loc)
		if(isliving(A) && overmind && !isblobmonster(A)) // Make sure to inject strain-reagents with automatic attacks when needed.
			overmind.blobstrain.attack_living(A)
			continue // Don't smack them twice though
		A.blob_act(src)
	if(iswallturf(loc))
		loc.blob_act(src) //don't ask how a wall got on top of the core, just eat it

/obj/structure/blob/proc/blob_attack_animation(atom/A = null, controller) //visually attacks an atom
	var/obj/effect/temp_visual/blob/O = new /obj/effect/temp_visual/blob(src.loc)
	O.setDir(dir)
	if(controller)
		var/mob/camera/blob/BO = controller
		O.color = BO.blobstrain.color
		O.alpha = 200
	else if(overmind)
		O.color = overmind.blobstrain.color
	if(A)
		O.do_attack_animation(A) //visually attack the whatever
	return O //just in case you want to do something to the animation.

/obj/structure/blob/proc/expand(turf/T = null, controller = null, expand_reaction = 1)
	if(!T)
		var/list/dirs = list(1,2,4,8)
		for(var/i = 1 to 4)
			var/dirn = pick(dirs)
			dirs.Remove(dirn)
			T = get_step(src, dirn)
			if(!(locate(/obj/structure/blob) in T))
				break
			else
				T = null
	if(!T)
		return
	var/make_blob = TRUE //can we make a blob?

	if(isspaceturf(T) && !(locate(/obj/structure/lattice) in T) && prob(80))
		make_blob = FALSE
		playsound(src.loc, 'sound/effects/splat.ogg', 50, TRUE) //Let's give some feedback that we DID try to spawn in space, since players are used to it

	ConsumeTile() //hit the tile we're in, making sure there are no border objects blocking us
	if(!T.CanPass(src, get_dir(T, src))) //is the target turf impassable
		make_blob = FALSE
		T.blob_act(src) //hit the turf if it is
	for(var/atom/A in T)
		if(!A.CanPass(src, get_dir(T, src))) //is anything in the turf impassable
			make_blob = FALSE
		if(isliving(A) && overmind && !controller) // Make sure to inject strain-reagents with automatic attacks when needed.
			overmind.blobstrain.attack_living(A)
			continue // Don't smack them twice though
		A.blob_act(src) //also hit everything in the turf

	if(make_blob) //well, can we?
		var/obj/structure/blob/B = new /obj/structure/blob/normal(src.loc, (controller || overmind))
		B.set_density(TRUE)
		if(T.Enter(B,src)) //NOW we can attempt to move into the tile
			B.set_density(initial(B.density))
			B.forceMove(T)
			B.update_icon()
			if(B.overmind && expand_reaction)
				B.overmind.blobstrain.expand_reaction(src, B, T, controller)
			return B
		else
			blob_attack_animation(T, controller)
			T.blob_act(src) //if we can't move in hit the turf again
			qdel(B) //we should never get to this point, since we checked before moving in. destroy the blob so we don't have two blobs on one tile
			return
	else
		blob_attack_animation(T, controller) //if we can't, animate that we attacked
	return

/obj/structure/blob/emp_act(severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return
	if(severity > 0)
		if(overmind)
			overmind.blobstrain.emp_reaction(src, severity)
		if(prob(100 - severity * 30))
			new /obj/effect/temp_visual/emp(get_turf(src))

/obj/structure/blob/zap_act(power, zap_flags)
	if(overmind)
		if(overmind.blobstrain.tesla_reaction(src, power))
			take_damage(power * 0.0025, BURN, ENERGY)
	else
		take_damage(power * 0.0025, BURN, ENERGY)
	power -= power * 0.0025 //You don't get to do it for free
	return ..() //You don't get to do it for free

/obj/structure/blob/extinguish()
	..()
	if(overmind)
		overmind.blobstrain.extinguish_reaction(src)

/obj/structure/blob/hulk_damage()
	return 15

/obj/structure/blob/attackby(obj/item/I, mob/user, params)
	if(I.tool_behaviour == TOOL_ANALYZER)
		user.changeNext_move(CLICK_CD_MELEE)
		to_chat(user, "<b>Анализатор пищит и выдаёт:</b><br>")
		SEND_SOUND(user, sound('sound/machines/ping.ogg'))
		if(overmind)
			to_chat(user, "<b>Прогресс до критической массы:</b> <span class='notice'>[overmind.blobs_legit.len]/[overmind.blobwincount].</span>")
			to_chat(user, chemeffectreport(user).Join("\n"))
		else
			to_chat(user, "<b>Ядро массы нейтрализовано. Набор критической массы более невозможен.</b>")
		to_chat(user, typereport(user).Join("\n"))
	else
		return ..()

/obj/structure/blob/proc/chemeffectreport(mob/user)
	RETURN_TYPE(/list)
	. = list()
	if(overmind)
		. += list("\n<b>Материал: <font color=\"[overmind.blobstrain.color]\">[overmind.blobstrain.name]</font><span class='notice'>.</span></b>",
		"\n<b>Эффекты:</b> <span class='notice'>[overmind.blobstrain.analyzerdescdamage]</span>",
		"\n<b>Свойства:</b> <span class='notice'>[overmind.blobstrain.analyzerdesceffect || "N/A"]</span>")
	else
		. += "\n<b>Не обнаружен материал!</b>"

/obj/structure/blob/proc/typereport(mob/user)
	RETURN_TYPE(/list)
	return list("\n<b>Тип массы:</b> <span class='notice'>[uppertext(initial(name))]</span>",
							"\n<b>Здоровье:</b> <span class='notice'>[obj_integrity]/[max_integrity]</span>",
							"\n<b>Эффекты:</b> <span class='notice'>[scannerreport()]</span>")


/obj/structure/blob/attack_animal(mob/living/simple_animal/M)
	if(ROLE_BLOB in M.faction) //sorry, but you can't kill the blob as a blobbernaut
		return
	..()

/obj/structure/blob/play_attack_sound(damage_amount, damage_type = BRUTE, damage_flag = 0)
	switch(damage_type)
		if(BRUTE)
			if(damage_amount)
				playsound(src.loc, 'sound/effects/attackblob.ogg', 50, TRUE)
			else
				playsound(src, 'sound/weapons/tap.ogg', 50, TRUE)
		if(BURN)
			playsound(src.loc, 'sound/items/welder.ogg', 100, TRUE)

/obj/structure/blob/run_obj_armor(damage_amount, damage_type, damage_flag = 0, attack_dir)
	switch(damage_type)
		if(BRUTE)
			damage_amount *= brute_resist
		if(BURN)
			damage_amount *= fire_resist
		if(CLONE)
		else
			return 0
	var/armor_protection = 0
	if(damage_flag)
		armor_protection = armor.getRating(damage_flag)
	damage_amount = round(damage_amount * (100 - armor_protection)*0.01, 0.1)
	if(overmind && damage_flag)
		damage_amount = overmind.blobstrain.damage_reaction(src, damage_amount, damage_type, damage_flag)
	return damage_amount

/obj/structure/blob/take_damage(damage_amount, damage_type = BRUTE, damage_flag = 0, sound_effect = 1, attack_dir)
	. = ..()
	if(. && obj_integrity > 0)
		update_icon()

/obj/structure/blob/obj_destruction(damage_flag)
	if(overmind)
		overmind.blobstrain.death_reaction(src, damage_flag)
	..()

/obj/structure/blob/proc/change_to(type, controller)
	if(!ispath(type))
		CRASH("change_to(): invalid type for blob")
	var/obj/structure/blob/B = new type(src.loc, controller)
	B.creation_action()
	B.update_icon()
	B.setDir(dir)
	qdel(src)
	return B

/obj/structure/blob/examine(mob/user)
	. = ..()
	var/datum/atom_hud/hud_to_check = GLOB.huds[DATA_HUD_MEDICAL_ADVANCED]
	if(user.research_scanner || hud_to_check.hudusers[user])
		. += "<hr><b>HUD показывает расширенный отчёт...</b><br>"
		if(overmind)
			. += overmind.blobstrain.examine(user)
		else
			. += "\n<b>Ядро массы нейтрализовано. Набор критической массы более невозможен.</b>"
		. += chemeffectreport(user)
		. += typereport(user)
	else
		if((user == overmind || isobserver(user)) && overmind)
			. += overmind.blobstrain.examine(user)
		. += "<hr>Материал судя по всему [get_chem_name()]."

/obj/structure/blob/proc/scannerreport()
	return "Обычная масса. Блять."

/obj/structure/blob/proc/get_chem_name()
	if(overmind)
		return overmind.blobstrain.name
	return "какая-то органика"

/obj/structure/blob/normal
	name = "обычная масса"
	icon_state = "center"
	light_range = 0
	max_integrity = BLOB_REGULAR_MAX_HP
	health_regen = BLOB_REGULAR_HP_REGEN
	brute_resist = BLOB_BRUTE_RESIST * 0.5

/obj/structure/blob/normal/scannerreport()
	if(obj_integrity <= 15)
		return "Сильный удар и эта штука развалится."
	return "N/A"

/obj/structure/blob/normal/update_icon_state()
	name = "[(obj_integrity <= 15) ? "хрупкая " : (overmind ? null : "мёртвая ")][initial(name)]"
	if(obj_integrity <= 15)
		desc = "Крепкая стена, которая сейчас развалится."
	else if(overmind)
		desc = "Крепкая стена."
	else
		desc = "Крепкая стена."

	/// - [] TODO: Move this elsewhere
	if(obj_integrity <= 15)
		brute_resist = BLOB_BRUTE_RESIST
	else if (overmind)
		brute_resist = BLOB_BRUTE_RESIST * 0.5
	else
		brute_resist = BLOB_BRUTE_RESIST * 0.5
	return ..()

/obj/structure/blob/special // Generic type for nodes/factories/cores/resource
	// Core and node vars: claiming, pulsing and expanding
	/// The radius inside which (previously dead) blob tiles are 'claimed' again by the pulsing overmind. Very rarely used.
	var/claim_range = 0
	/// The radius inside which blobs are pulsed by this overmind. Does stuff like expanding, making blob spores from factories, make resources from nodes etc.
	var/pulse_range = 0
	/// The radius up to which this special structure naturally grows normal blobs.
	var/expand_range = 0

	// Spore production vars: for core, factories, and nodes (with strains)
	var/mob/living/simple_animal/hostile/blob/blobbernaut/naut = null
	var/max_spores = 0
	var/list/spores = list()
	COOLDOWN_DECLARE(spore_delay)
	var/spore_cooldown = BLOBMOB_SPORE_SPAWN_COOLDOWN

	// Area reinforcement vars: used by cores and nodes, for strains to modify
	/// Range this blob free upgrades to strong blobs at: for the core, and for strains
	var/strong_reinforce_range = 0
	/// Range this blob free upgrades to reflector blobs at: for the core, and for strains
	var/reflector_reinforce_range = 0

/obj/structure/blob/special/proc/reinforce_area(delta_time) // Used by cores and nodes to upgrade their surroundings
	if(strong_reinforce_range)
		for(var/obj/structure/blob/normal/B in range(strong_reinforce_range, src))
			if(DT_PROB(BLOB_REINFORCE_CHANCE, delta_time))
				B.change_to(/obj/structure/blob/shield/core, overmind)
	if(reflector_reinforce_range)
		for(var/obj/structure/blob/shield/B in range(reflector_reinforce_range, src))
			if(DT_PROB(BLOB_REINFORCE_CHANCE, delta_time))
				B.change_to(/obj/structure/blob/shield/reflective/core, overmind)

/obj/structure/blob/special/proc/pulse_area(mob/camera/blob/pulsing_overmind, claim_range = 10, pulse_range = 3, expand_range = 2)
	if(QDELETED(pulsing_overmind))
		pulsing_overmind = overmind
	Be_Pulsed()
	var/expanded = FALSE
	if(prob(70*(1/BLOB_EXPAND_CHANCE_MULTIPLIER)) && expand())
		expanded = TRUE
	var/list/blobs_to_affect = list()
	for(var/obj/structure/blob/B in urange(claim_range, src, 1))
		blobs_to_affect += B
	shuffle_inplace(blobs_to_affect)
	for(var/L in blobs_to_affect)
		var/obj/structure/blob/B = L
		if(!B.overmind && prob(30))
			B.overmind = pulsing_overmind //reclaim unclaimed, non-core blobs.
			B.update_icon()
		var/distance = get_dist(get_turf(src), get_turf(B))
		var/expand_probablity = max(20 - distance * 8, 1)
		if(B.Adjacent(src))
			expand_probablity = 20
		if(distance <= expand_range)
			var/can_expand = TRUE
			if(blobs_to_affect.len >= 120 && !(COOLDOWN_FINISHED(B, heal_timestamp)))
				can_expand = FALSE
			if(can_expand && COOLDOWN_FINISHED(B, pulse_timestamp) && prob(expand_probablity*BLOB_EXPAND_CHANCE_MULTIPLIER))
				if(!expanded)
					var/obj/structure/blob/newB = B.expand(null, null, !expanded) //expansion falls off with range but is faster near the blob causing the expansion
					if(newB)
						expanded = TRUE
		if(distance <= pulse_range)
			B.Be_Pulsed()

/obj/structure/blob/special/proc/produce_spores()
	if(naut)
		return FALSE
	if(spores.len >= max_spores)
		return FALSE
	if(!COOLDOWN_FINISHED(src, spore_delay))
		return FALSE
	COOLDOWN_START(src, spore_delay, spore_cooldown)
	var/mob/living/simple_animal/hostile/blob/blobspore/BS = new (loc, src)
	if(overmind) //if we don't have an overmind, we don't need to do anything but make a spore
		BS.overmind = overmind
		BS.update_icons()
		overmind.blob_mobs.Add(BS)
	return TRUE

/obj/effect/temp_visual/blobthing
	name = "масса"
	icon = 'icons/mob/blob_64.dmi'
	icon_state = "nothing"
	duration = 8
	randomdir = 0
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	layer = RIPPLE_LAYER
