/obj/effect/proc_holder/spell/targeted/shed_human_form
	name = "Смена формы"
	desc = "Смените свою хрупкую оболочку, став его десницей, становясь единым с императором."
	action_icon = 'icons/mob/actions/actions_ecult.dmi'
	action_icon_state = "worm_ascend"
	invocation = "REALITY UNCOIL!"
	invocation_type = INVOCATION_SHOUT
	school = SCHOOL_FORBIDDEN
	clothes_req = FALSE
	action_background_icon_state = "bg_ecult"
	range = -1
	include_user = TRUE
	charge_max = 100
	/// The length of our new wormy when we shed.
	var/segment_length = 10

/obj/effect/proc_holder/spell/targeted/shed_human_form/cast(list/targets, mob/user)
	. = ..()
	var/mob/living/target = user
	var/mob/living/mob_inside = locate() in target.contents - target

	if(!mob_inside)
		var/mob/living/simple_animal/hostile/heretic_summon/armsy/prime/outside = new(user.loc, TRUE, segment_length)
		target.mind.transfer_to(outside, TRUE)
		target.forceMove(outside)
		target.apply_status_effect(/datum/status_effect/grouped/stasis, STASIS_ASCENSION_EFFECT)
		for(var/mob/living/carbon/human/nearby_human in view(9, outside) - target)
			if(IS_HERETIC_OR_MONSTER(nearby_human))
				continue
			SEND_SIGNAL(nearby_human, COMSIG_ADD_MOOD_EVENT, "gates_of_mansus", /datum/mood_event/gates_of_mansus)
			///They see the very reality uncoil before their eyes.
			if(prob(25))
				var/trauma = pick(subtypesof(BRAIN_TRAUMA_MILD) + subtypesof(BRAIN_TRAUMA_SEVERE))
				nearby_human.gain_trauma(new trauma(), TRAUMA_RESILIENCE_LOBOTOMY)
		return

	if(iscarbon(mob_inside))
		var/mob/living/simple_animal/hostile/heretic_summon/armsy/prime/armsy = target
		if(mob_inside.remove_status_effect(/datum/status_effect/grouped/stasis, STASIS_ASCENSION_EFFECT))
			mob_inside.forceMove(armsy.loc)
		armsy.mind.transfer_to(mob_inside, TRUE)
		segment_length = armsy.get_length()
		qdel(armsy)
		return

/obj/effect/proc_holder/spell/targeted/worm_contract
	name = "Сжатие"
	desc = "Позволяет сжать все сегменты вашего тела в одну единственную клетку."
	invocation_type = INVOCATION_NONE
	school = SCHOOL_FORBIDDEN
	clothes_req = FALSE
	action_background_icon_state = "bg_ecult"
	range = -1
	include_user = TRUE
	charge_max = 300
	action_icon = 'icons/mob/actions/actions_ecult.dmi'
	action_icon_state = "worm_contract"

/obj/effect/proc_holder/spell/targeted/worm_contract/cast(list/targets, mob/user)
	. = ..()
	if(!istype(user, /mob/living/simple_animal/hostile/heretic_summon/armsy))
		to_chat(user, span_userdanger("Вы напрягаете ваши мышцы, но ничего не происходит..."))
		return

	var/mob/living/simple_animal/hostile/heretic_summon/armsy/lord_of_night = user
	lord_of_night.contract_next_chain_into_single_tile()
