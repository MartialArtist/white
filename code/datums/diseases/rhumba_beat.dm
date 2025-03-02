/datum/disease/rhumba_beat
	name = "Румба Бит"
	max_stages = 5
	spread_text = "При контакте"
	spread_flags = DISEASE_SPREAD_BLOOD | DISEASE_SPREAD_CONTACT_SKIN | DISEASE_SPREAD_CONTACT_FLUIDS
	cure_text = "Чики-чики-бум!"
	cures = list("plasma")
	agent = "Неизвестный"
	viable_mobtypes = list(/mob/living/carbon/human)
	permeability_mod = 1
	severity = DISEASE_SEVERITY_BIOHAZARD

/datum/disease/rhumba_beat/stage_act(delta_time, times_fired)
	. = ..()
	if(!.)
		return

	switch(stage)
		if(2)
			if(DT_PROB(26, delta_time))
				affected_mob.adjustFireLoss(5, FALSE)
			if(DT_PROB(0.5, delta_time))
				to_chat(affected_mob, span_danger("Чувствую себя странно..."))
		if(3)
			if(DT_PROB(2.5, delta_time))
				to_chat(affected_mob, span_danger("Пора танцевать..."))
			else if(DT_PROB(2.5, delta_time))
				affected_mob.emote("gasp")
			else if(DT_PROB(5, delta_time))
				to_chat(affected_mob, span_danger("Нужно срочно чики-чики-бум..."))
		if(4)
			if(DT_PROB(10, delta_time))
				if(prob(50))
					affected_mob.adjust_fire_stacks(2)
					affected_mob.ignite_mob()
				else
					affected_mob.emote("gasp")
					to_chat(affected_mob, span_danger("Ощущаю горящий бит внутри..."))
		if(5)
			to_chat(affected_mob, span_danger("Моё тело не может сдержать ритм Румбы..."))
			if(DT_PROB(29, delta_time))
				explosion(affected_mob, devastation_range = -1, light_impact_range = 2, flame_range = 2, flash_range = 3, adminlog = FALSE, explosion_cause = src) // This is equivalent to a lvl 1 fireball
