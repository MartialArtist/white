

// TRAIT_DEATHCOMA -  Activate this when you're in your coffin to simulate sleep/death.


// Coffins...
//	-heal all wounds, and quickly.
//	-restore limbs & organs
//

// Without Coffins...
//	-
//	-limbs stay lost



// To put to sleep:  use 		owner.current.fakedeath("bloodsucker") but change name to "bloodsucker_coffin" so you continue to stay fakedeath despite healing in the main thread!


/datum/antagonist/bloodsucker/proc/ClaimCoffin(obj/structure/closet/crate/claimed) // NOTE: This can be any "closet" that you are resting AND inside of.
	// ALREADY CLAIMED
	if (claimed.resident)
		if (claimed.resident == owner.current)
			to_chat(owner, "This is your [src].")
		else
			to_chat(owner, "This [src] has already been claimed by another.")
		return FALSE

	// Bloodsucker Learns new Recipes!
	owner.teach_crafting_recipe(/datum/crafting_recipe/bloodsucker/vassalrack)
	owner.teach_crafting_recipe(/datum/crafting_recipe/bloodsucker/candelabrum)

	// This is my Lair
	coffin = claimed
	lair = get_area(claimed)
	// DONE
	to_chat(owner, span_userdanger("You have claimed the [claimed] as your place of immortal rest! Your lair is now [lair]."))
	to_chat(owner, span_danger("You have learned new construction recipes to improve your lair."))
	to_chat(owner, "<span class='announce'>Bloodsucker Tip: Find new lair recipes in the Structures tab of the <i>Crafting Menu</i> at the bottom of the screen, including the <i>Persuasion Rack</i> for converting crew into Vassals.</span><br><br>")

	RunLair() // Start
	return TRUE



// crate.dm
/obj/structure/closet/crate
	var/mob/living/resident	// This lets bloodsuckers claim any "closet" as a Coffin, so long as they could get into it and close it. This locks it in place, too.

/obj/structure/closet/crate/coffin
	var/pryLidTimer = 250
	can_weld_shut = FALSE
	breakout_time = 200


/obj/structure/closet/crate/coffin/blackcoffin // closet.dmi, closets.dm, and job_closets.dm
	name = "чёрный coffin"
	desc = "For those departed who are not so dear."
	icon_state = "coffin"
	icon = 'white/valtos/icons/bloodsucker/fulpobjects.dmi'
	can_weld_shut = FALSE
	resistance_flags = 0			// Start off with no bonuses.
	open_sound = 'white/valtos/sounds/bloodsucker/coffin_open.ogg'//'sound/machines/door_open.ogg'
	close_sound = 'white/valtos/sounds/bloodsucker/coffin_close.ogg'//'sound/machines/door_close.ogg'
	breakout_time = 600
	pryLidTimer = 400
	resistance_flags = NONE

/obj/structure/closet/crate/coffin/meatcoffin // closet.dmi, closets.dm, and job_closets.dm
	name = "meat coffin"
	desc = "When you're ready to meat your maker, the steaks can never be too high."
	icon_state = "meatcoffin"
	icon = 'white/valtos/icons/bloodsucker/fulpobjects.dmi'
	can_weld_shut = FALSE
	resistance_flags = 0			// Start off with no bonuses.
	open_sound = 'sound/effects/footstep/slime1.ogg'//'sound/machines/door_open.ogg'
	close_sound = 'sound/effects/footstep/slime1.ogg'//'sound/machines/door_close.ogg'
	breakout_time = 200
	pryLidTimer = 200
	resistance_flags = NONE
	material_drop = /obj/item/food/meat/slab
	material_drop_amount = 3

/obj/structure/closet/crate/coffin/metalcoffin // closet.dmi, closets.dm, and job_closets.dm
	name = "metal coffin"
	desc = "A big metal sardine can inside of another big metal sardine can, in space."
	icon_state = "metalcoffin"
	icon = 'white/valtos/icons/bloodsucker/fulpobjects.dmi'
	can_weld_shut = FALSE
	resistance_flags = FIRE_PROOF | LAVA_PROOF
	open_sound = 'sound/effects/pressureplate.ogg'//'sound/machines/door_open.ogg'
	close_sound = 'sound/effects/pressureplate.ogg'//'sound/machines/door_close.ogg'
	breakout_time = 300
	pryLidTimer = 200
	resistance_flags = NONE
	material_drop = /obj/item/stack/sheet/iron
	material_drop_amount = 5

//////////////////////////////////////////////

/obj/structure/closet/crate/proc/ClaimCoffin(mob/living/claimant) // NOTE: This can be any "closet" that you are resting AND inside of.
	// Bloodsucker Claim
	var/datum/antagonist/bloodsucker/bloodsuckerdatum = claimant.mind.has_antag_datum(ANTAG_DATUM_BLOODSUCKER)
	if (bloodsuckerdatum)
		// Vamp Successfuly Claims Me?
		if (bloodsuckerdatum.ClaimCoffin(src))
			resident = claimant
			anchored = 1					// No moving this


/obj/structure/closet/crate/coffin/Destroy()
	UnclaimCoffin()
	return ..()

/obj/structure/closet/crate/proc/UnclaimCoffin()
	if (resident)
		// Vamp Un-Claim
		if (resident.mind)
			var/datum/antagonist/bloodsucker/bloodsuckerdatum = resident.mind.has_antag_datum(ANTAG_DATUM_BLOODSUCKER)
			if (bloodsuckerdatum && bloodsuckerdatum.coffin == src)
				bloodsuckerdatum.coffin = null
				bloodsuckerdatum.lair = null
			to_chat(resident, span_danger(span_italics("You sense that the link with your coffin, your sacred place of rest, has been brokem! You will need to seek another.")))
		resident = null // Remove resident. Because this object isnt removed from the game immediately (GC?) we need to give them a way to see they don't have a home anymore.

/obj/structure/closet/crate/coffin/can_open(mob/living/user)
	// You cannot lock in/out a coffin's owner. SORRY.
	if (locked)
		if(user == resident)
			if (welded)
				welded = FALSE
				update_icon()
			//to_chat(user, span_notice("You flip a secret latch and unlock [src].")) // Don't bother. We know it's unlocked.
			locked = FALSE
			return 1
		else
			playsound(get_turf(src), 'sound/machines/door_locked.ogg', 20, 1)
			to_chat(user, span_notice("[capitalize(src.name)] is locked tight from the inside."))
	return ..()

/obj/structure/closet/crate/coffin/close(mob/living/user)
	if (!..())
		return FALSE
	// Only the User can put themself into Torpor (if you're already in it, you'll start to heal)
	if ((user in src))
		// Bloodsucker Only
		var/datum/antagonist/bloodsucker/bloodsuckerdatum = user.mind.has_antag_datum(ANTAG_DATUM_BLOODSUCKER)
		if (bloodsuckerdatum)
			LockMe(user)
			// Claim?
			if (!bloodsuckerdatum.coffin && !resident)
				switch(alert(user,"Do you wish to claim this as your coffin? [get_area(src)] will be your lair.","Claim Lair","Yes", "No"))
					if("Yes")
						ClaimCoffin(user)
			// Stake? No Heal!
			if (user.AmStaked())
				to_chat(bloodsuckerdatum.owner.current, span_userdanger("You are staked! Remove the offending weapon from your heart before sleeping."))
				return
			// Heal
			if (bloodsuckerdatum.HandleHealing(0)) // Healing Mult 0 <--- We only want to check if healing is valid!
				to_chat(bloodsuckerdatum.owner.current, span_notice("You enter the horrible slumber of deathless Torpor. You will heal until you are renewed."))
				bloodsuckerdatum.Torpor_Begin()
			// Level Up?
			bloodsuckerdatum.SpendRank() // Auto-Fails if not appropriate

	return TRUE

/obj/structure/closet/crate/coffin/attackby(obj/item/W, mob/user, params)
	// You cannot weld or deconstruct an owned coffin. STILL NOT SORRY.
	if (resident != null && user != resident) // Owner can destroy their own coffin.
		if(opened)
			if(istype(W, cutting_tool))
				to_chat(user, span_notice("This is a much more complex mechanical structure than you thought. You don't know where to begin cutting [src]."))
				return
		else if (anchored && istype(W, /obj/item/wrench)) // Can't unanchor unless owner.
			to_chat(user, span_danger("The coffin won't come unanchored from the floor."))
			return

	if(locked && istype(W, /obj/item/crowbar))
		var/pry_time = pryLidTimer * W.toolspeed // Pry speed must be affected by the speed of the tool.
		user.visible_message(span_notice("[user] tries to pry the lid off of [src] with [W].") , \
							  span_notice("You begin prying the lid off of [src] with [W]. This should take about [DisplayTimeText(pry_time)]."))
		if (!do_mob(user,src,pry_time))
			return
		bust_open()
		user.visible_message(span_notice("[user] snaps the door of [src] wide open.") , \
							  span_notice("The door of [src] snaps open."))
		return
	..()



/obj/structure/closet/crate/coffin/AltClick(mob/user)
	// Distance Check (Inside Of)
	if (user in src) // user.Adjacent(src)
		LockMe(user, !locked)

/obj/structure/closet/crate/proc/LockMe(mob/user, inLocked = TRUE)
		// Lock
	if (user == resident)
		if (!broken)
			locked = inLocked
			to_chat(user, span_notice("You flip a secret latch and [locked?"":"un"]lock yourself inside [src]."))
		else
			to_chat(resident, span_notice("The secret latch to lock [src] from the inside is broken. You set it back into place..."))
			if (do_mob(resident, src, 50))//sleep(10)
				if (broken) // Spam Safety
					to_chat(resident, span_notice("You fix the mechanism and lock it."))
					broken = FALSE
					locked = TRUE









// Look up recipes.dm OR pneumaticCannon.dm
/datum/crafting_recipe/bloodsucker/blackcoffin
	name = "Black Coffin"
	result = /obj/structure/closet/crate/coffin/blackcoffin
	tool_paths = list(/obj/item/weldingtool,
				 /obj/item/screwdriver)
	reqs = list(/obj/item/stack/sheet/cloth = 1,
				/obj/item/stack/sheet/mineral/wood = 5,
				/obj/item/stack/sheet/iron = 1)
				///obj/item/stack/package_wrap = 8,
				///obj/item/pipe = 2)
	time = 150
	category = CAT_STRUCTURE
	always_available = TRUE

/datum/crafting_recipe/bloodsucker/meatcoffin
	name = "Meat Coffin"
	result =/obj/structure/closet/crate/coffin/meatcoffin
	tool_paths = list(/obj/item/kitchen/knife,
				 /obj/item/kitchen/rollingpin)
	reqs = list(/obj/item/food/meat/slab = 5,
				/obj/item/restraints/handcuffs/cable = 1)
	time = 150
	category = CAT_STRUCTURE
	always_available = TRUE

/datum/crafting_recipe/bloodsucker/metalcoffin
	name = "Metal Coffin"
	result =/obj/structure/closet/crate/coffin/metalcoffin
	tool_paths = list(/obj/item/weldingtool,
				 /obj/item/screwdriver)
	reqs = list(/obj/item/stack/sheet/iron = 5)
	time = 100
	category = CAT_STRUCTURE
	always_available = TRUE
