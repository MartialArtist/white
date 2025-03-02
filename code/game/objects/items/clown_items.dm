/* Clown Items
 * Contains:
 *		Soap
 *		Bike Horns
 *		Air Horns
 *		Canned Laughter
 */

/*
 * Soap
 */

/obj/item/soap
	name = "мыло"
	desc = "Дешевый брусок мыла без запаха."
	gender = PLURAL
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "soap"
	lefthand_file = 'icons/mob/inhands/equipment/custodial_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/custodial_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	item_flags = NOBLUDGEON
	throwforce = 0
	throw_speed = 3
	throw_range = 7
	grind_results = list(/datum/reagent/lye = 10)
	var/cleanspeed = 35 //slower than mop
	force_string = "robust... against germs"
	var/uses = 100

/obj/item/soap/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/slippery, 80)
	var/datum/component/slippery/slipper = GetComponent(/datum/component/slippery)
	slipper.paralyze_time = 20

/obj/item/soap/examine(mob/user)
	. = ..()
	var/max_uses = initial(uses)
	var/msg = "Только что из упаковки."
	if(uses != max_uses)
		var/percentage_left = uses / max_uses
		switch(percentage_left)
			if(0 to 0.15)
				msg = "Жалкий обмылок, почти ничего не осталось."
			if(0.15 to 0.30)
				msg = "Осталось еще немного, но на пару раз еще хватит."
			if(0.30 to 0.50)
				msg = "Тут немого меньше половины."
			if(0.50 to 0.75)
				msg = "Тут все еще очень много."
			else
				msg = "Почти как новое, но заметны следы использования."
	. += "<hr><span class='notice'>[msg]</span>"

/obj/item/soap/nanotrasen
	desc = "Сверхпрочный брусок мыла марки Nanotrasen. Немного пахнет плазмой."
	grind_results = list(/datum/reagent/toxin/plasma = 10, /datum/reagent/lye = 10)
	icon_state = "soapnt"
	cleanspeed = 28 //janitor gets this
	uses = 300

/obj/item/soap/homemade
	desc = "Самодельный брусок мыла пахнет он мягко говоря... на любителя...."
	icon_state = "soapgibs"
	cleanspeed = 30 // faster to reward chemists for going to the effort

/obj/item/soap/deluxe
	desc = "Роскошный кусок мыла марки Waffle Co. Пахнет высококлассной роскошью."
	icon_state = "soapdeluxe"
	cleanspeed = 20 //captain gets one of these

/obj/item/soap/syndie
	desc = "Подозрительный кусок мыла, изготовленный из едких химических веществ, быстро растворяющих кровь."
	icon_state = "soapsyndie"
	cleanspeed = 5 //faster than mop so it is useful for traitors who want to clean crime scenes

/obj/item/soap/omega
	name = "омега мыло"
	desc = "Самое совершенное мыло, известное человечеству."
	icon_state = "soapomega"
	cleanspeed = 3 //Only the truest of mind soul and body get one of these
	uses = 301

/obj/item/soap/omega/suicide_act(mob/user)
	user.visible_message(span_suicide("[user] is using [src] to scrub themselves from the timeline! It looks like [user.p_theyre()] trying to commit suicide!"))
	new /obj/structure/chrono_field(user.loc, user)
	return MANUAL_SUICIDE

/obj/item/paper/fluff/stations/soap
	name = "ancient janitorial poem"
	desc = "An old paper that has passed many hands."
	info = "The legend of the omega soap</B><BR><BR> Essence of <B>potato</B>. Juice, not grind.<BR><BR> A <B>lizard's</B> tail, turned into <B>wine</B>.<BR><BR> <B>powder of monkey</B>, to help the workload.<BR><BR> Some <B>Krokodil</B>, because meth would explode.<BR><BR> <B>Nitric acid</B> and <B>Baldium</B>, for organic dissolving.<BR><BR> A cup filled with <B>Hooch</B>, for sinful absolving<BR><BR> Some <B>Bluespace Dust</B>, for removal of stains.<BR><BR> A syringe full of <B>Pump-up</B>, it's security's bane.<BR><BR> Add a can of <B>Space Cola</B>, because we've been paid.<BR><BR> <B>Heat</B> as hot as you can, let the soap be your blade.<BR><BR> <B>Ten units of each regent create a soap that could topple all others.</B>"


/obj/item/soap/suicide_act(mob/user)
	user.say(";FFFFFFFFFFFFFFFFUUUUUUUDGE!!", forced="soap suicide")
	user.visible_message(span_suicide("[user] lifts [src] to [user.ru_ego()] mouth and gnaws on it furiously, producing a thick froth! [user.ru_who(TRUE)]'ll never get that BB gun now!"))
	new /obj/effect/particle_effect/foam(loc)
	return (TOXLOSS)

/**
 * Decrease the number of uses the bar of soap has.
 *
 * The higher the cleaning skill, the less likely the soap will lose a use.
 * Arguments
 * * user - The mob that is using the soap to clean.
 */
/obj/item/soap/proc/decreaseUses(mob/user)
	var/skillcheck = 1
	if(user?.mind)
		skillcheck = user.mind.get_skill_modifier(/datum/skill/cleaning, SKILL_SPEED_MODIFIER)
	if(prob(skillcheck*100)) //higher level = more uses assuming RNG is nice
		uses--
	if(uses <= 0)
		to_chat(user, span_warning("[capitalize(src.name)] crumbles into tiny bits!"))
		qdel(src)

/obj/item/soap/afterattack(atom/target, mob/user, proximity)
	. = ..()
	if(!proximity || !check_allowed_items(target))
		return
	var/clean_speedies = 1 * cleanspeed
	if(user.mind)
		clean_speedies = cleanspeed * min(user.mind.get_skill_modifier(/datum/skill/cleaning, SKILL_SPEED_MODIFIER)+0.1,1) //less scaling for soapies
	//I couldn't feasibly  fix the overlay bugs caused by cleaning items we are wearing.
	//So this is a workaround. This also makes more sense from an IC standpoint. ~Carn
	if(user.client && ((target in user.client.screen) && !user.is_holding(target)))
		to_chat(user, span_warning("You need to take that [target.name] off before cleaning it!"))
	else if(istype(target, /obj/effect/decal/cleanable))
		user.visible_message(span_notice("[user] begins to scrub [target.name] out with [src].") , span_warning("You begin to scrub [target.name] out with [src]..."))
		if(do_after(user, clean_speedies, target = target))
			to_chat(user, span_notice("You scrub [target.name] out."))
			var/obj/effect/decal/cleanable/cleanies = target
			user.mind?.adjust_experience(/datum/skill/cleaning, max(round(cleanies.beauty/CLEAN_SKILL_BEAUTY_ADJUSTMENT),0)) //again, intentional that this does NOT round but mops do.
			qdel(target)
			decreaseUses(user)

	else if(ishuman(target) && user.zone_selected == BODY_ZONE_PRECISE_MOUTH)
		var/mob/living/carbon/human/human_user = user
		user.visible_message(span_warning("\the [user] washes [target] mouth out with [src.name]!") , span_notice("You wash [target] mouth out with [src.name]!")) //washes mouth out with soap sounds better than 'the soap' here			if(user.zone_selected == "mouth")
		if(human_user.lip_style)
			user.mind?.adjust_experience(/datum/skill/cleaning, CLEAN_SKILL_GENERIC_WASH_XP)
			human_user.lip_style = null //removes lipstick
			human_user.update_body()
		decreaseUses(user)
		return
	else if(istype(target, /obj/structure/window))
		user.visible_message(span_notice("[user] begins to clean [target.name] with [src]...") , span_notice("You begin to clean [target.name] with [src]..."))
		if(do_after(user, clean_speedies, target = target))
			to_chat(user, span_notice("You clean [target.name]."))
			target.remove_atom_colour(WASHABLE_COLOUR_PRIORITY)
			target.set_opacity(initial(target.opacity))
			var/obj/structure/window/our_window = target
			if(our_window.bloodied)
				for(var/obj/effect/decal/cleanable/blood/iter_blood in our_window)
					our_window.vis_contents -= iter_blood
					qdel(iter_blood)
					our_window.bloodied = FALSE
			user.mind?.adjust_experience(/datum/skill/cleaning, CLEAN_SKILL_GENERIC_WASH_XP)
			decreaseUses(user)
	else
		user.visible_message(span_notice("[user] begins to clean [target.name] with [src]...") , span_notice("You begin to clean [target.name] with [src]..."))
		if(do_after(user, clean_speedies, target = target))
			to_chat(user, span_notice("You clean [target.name]."))
			if(user && isturf(target))
				for(var/obj/effect/decal/cleanable/cleanable_decal in target)
					user.mind?.adjust_experience(/datum/skill/cleaning, round(cleanable_decal.beauty / CLEAN_SKILL_BEAUTY_ADJUSTMENT))
			target.wash(CLEAN_SCRUB)
			target.remove_atom_colour(WASHABLE_COLOUR_PRIORITY)
			user.mind?.adjust_experience(/datum/skill/cleaning, CLEAN_SKILL_GENERIC_WASH_XP)
			decreaseUses(user)
	return


/*
 * Bike Horns
 */

/obj/item/bikehorn
	name = "велосипедный гудок"
	desc = "Клаксон от велосипеда. Ходят слухи, что они сделаны из переработанных клоунов."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "bike_horn"
	inhand_icon_state = "bike_horn"
	worn_icon_state = "horn"
	lefthand_file = 'icons/mob/inhands/equipment/horns_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/horns_righthand.dmi'
	throwforce = 0
	hitsound = null //To prevent tap.ogg playing, as the item lacks of force
	w_class = WEIGHT_CLASS_TINY
	slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_BELT
	throw_speed = 3
	throw_range = 7
	attack_verb_continuous = list("ХОНКАЕТ")
	attack_verb_simple = list("ХОНКАЕТ")
	///sound file given to the squeaky component we make in Initialize()
	var/soundfile = 'sound/items/bikehorn.ogg'

/obj/item/bikehorn/Initialize(mapload)
	. = ..()
	var/list/sound_list = list()
	sound_list[soundfile] = 1
	AddComponent(/datum/component/squeak, sound_list, 50, falloff_exponent = 20)

/obj/item/bikehorn/attack(mob/living/carbon/M, mob/living/carbon/user)
	if(user != M && ishuman(user))
		var/mob/living/carbon/human/H = user
		if (HAS_TRAIT(H, TRAIT_CLUMSY)) //only clowns can unlock its true powers
			SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "honk", /datum/mood_event/honk)
	return ..()

/obj/item/bikehorn/suicide_act(mob/user)
	user.visible_message(span_suicide("[user] solemnly points [src] at [user.ru_ego()] temple! It looks like [user.p_theyre()] trying to commit suicide!"))
	playsound(src, 'sound/items/bikehorn.ogg', 50, TRUE)
	return (BRUTELOSS)

//air horn
/obj/item/bikehorn/airhorn
	name = "корабельный гудок"
	desc = "Дьявол тебя побери, сынок, где ты это достал?"
	icon_state = "air_horn"
	worn_icon_state = "horn_air"
	soundfile = 'sound/items/airhorn2.ogg'

//golden bikehorn
/obj/item/bikehorn/golden
	name = "золотой велосипедный гудок"
	desc = "Золотой? Вообще то он сделан из бананиума. Хонк!"
	icon_state = "gold_horn"
	inhand_icon_state = "gold_horn"
	worn_icon_state = "horn_gold"
	COOLDOWN_DECLARE(golden_horn_cooldown)

/obj/item/bikehorn/golden/attack()
	flip_mobs()
	return ..()

/obj/item/bikehorn/golden/attack_self(mob/user)
	flip_mobs()
	..()

/obj/item/bikehorn/golden/proc/flip_mobs(mob/living/carbon/M, mob/user)
	if(!COOLDOWN_FINISHED(src, golden_horn_cooldown))
		return
	var/turf/T = get_turf(src)
	for(M in ohearers(7, T))
		if(M.can_hear())
			M.emote("flip")
	COOLDOWN_START(src, golden_horn_cooldown, 0.5 SECONDS)

//canned laughter
/obj/item/reagent_containers/food/drinks/soda_cans/canned_laughter
	name = "Canned Laughter"
	desc = "Just looking at this makes you want to giggle."
	icon_state = "laughter"
	list_reagents = list(/datum/reagent/consumable/laughter = 50)
