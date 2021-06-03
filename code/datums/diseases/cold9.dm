/datum/disease/cold9
	name = "The Cold"
	max_stages = 3
	spread_text = "On contact"
	spread_flags = DISEASE_SPREAD_BLOOD | DISEASE_SPREAD_CONTACT_SKIN | DISEASE_SPREAD_CONTACT_FLUIDS
	cure_text = "Common Cold Anti-bodies & Spaceacillin"
	cures = list(/datum/reagent/medicine/spaceacillin)
	agent = "ICE9-rhinovirus"
	viable_mobtypes = list(/mob/living/carbon/human)
	desc = "If left untreated the subject will slow, as if partly frozen."
	severity = DISEASE_SEVERITY_HARMFUL


/datum/disease/cold9/stage_act()
	. = ..()
	if(!.)
		return

	switch(stage)
		if(2)
			affected_mob.adjust_bodytemperature(-10)
			if(prob(0.1))
				to_chat(affected_mob, "<span class='notice'>Чувствую себя лучше.</span>")
				cure()
				return FALSE
			if(prob(1))
				affected_mob.emote("sneeze")
			if(prob(1))
				affected_mob.emote("cough")
			if(prob(1))
				to_chat(affected_mob, "<span class='danger'>У меня болит горло.</span>")
			if(prob(5))
				to_chat(affected_mob, "<span class='danger'>Немею.</span>")
		if(3)
			affected_mob.adjust_bodytemperature(-20)
			if(prob(1))
				affected_mob.emote("sneeze")
			if(prob(1))
				affected_mob.emote("cough")
			if(prob(1))
				to_chat(affected_mob, "<span class='danger'>У меня болит горло.</span>")
			if(prob(10))
				to_chat(affected_mob, "<span class='danger'>Немею.</span>")
