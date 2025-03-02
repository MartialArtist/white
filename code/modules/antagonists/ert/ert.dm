//Both ERT and DS are handled by the same datums since they mostly differ in equipment in objective.
/datum/team/ert
	name = "Emergency Response Team"
	var/datum/objective/mission //main mission

/datum/antagonist/ert
	name = "Emergency Response Officer"
	var/datum/team/ert/ert_team
	var/leader = FALSE
	var/datum/outfit/outfit = /datum/outfit/centcom/ert/security
	var/datum/outfit/plasmaman_outfit = /datum/outfit/plasmaman/centcom_official
	var/role = "Офицер"
	var/list/name_source
	var/random_names = TRUE
	var/rip_and_tear = FALSE
	var/equip_ert = TRUE
	var/forge_objectives_for_ert = TRUE
	can_elimination_hijack = ELIMINATION_PREVENT
	show_in_antagpanel = FALSE
	show_to_ghosts = TRUE
	antag_moodlet = /datum/mood_event/focused
	greentext_reward = 15

/datum/antagonist/ert/on_gain()
	if(random_names)
		update_name()
	if(forge_objectives_for_ert)
		forge_objectives()
	if(equip_ert)
		equipERT()
	. = ..()

/datum/antagonist/ert/get_team()
	return ert_team

/datum/antagonist/ert/New()
	. = ..()
	name_source = GLOB.last_names

/datum/antagonist/ert/proc/update_name()
	owner.current.fully_replace_character_name(owner.current.real_name,"[role] [pick(name_source)]")

/datum/antagonist/ert/security // kinda handled by the base template but here for completion

/datum/antagonist/ert/security/red
	outfit = /datum/outfit/centcom/ert/security/alert

/datum/antagonist/ert/engineer
	role = "Инженер"
	outfit = /datum/outfit/centcom/ert/engineer

/datum/antagonist/ert/engineer/red
	outfit = /datum/outfit/centcom/ert/engineer/alert

/datum/antagonist/ert/medic
	role = "Доктор"
	outfit = /datum/outfit/centcom/ert/medic

/datum/antagonist/ert/medic/red
	outfit = /datum/outfit/centcom/ert/medic/alert

/datum/antagonist/ert/commander
	role = "Командир"
	outfit = /datum/outfit/centcom/ert/commander
	plasmaman_outfit = /datum/outfit/plasmaman/centcom_commander
	leader = TRUE

/datum/antagonist/ert/commander/red
	outfit = /datum/outfit/centcom/ert/commander/alert

/datum/antagonist/ert/janitor
	role = "Уборщик"
	outfit = /datum/outfit/centcom/ert/janitor

/datum/antagonist/ert/janitor/heavy
	role = "Сверхмощный Уборщик"
	outfit = /datum/outfit/centcom/ert/janitor/heavy

/datum/antagonist/ert/deathsquad
	name = "Deathsquad Trooper"
	outfit = /datum/outfit/centcom/death_commando
	plasmaman_outfit = /datum/outfit/plasmaman/centcom_commander
	role = "Солдат"
	rip_and_tear = TRUE

/datum/antagonist/ert/deathsquad/New()
	. = ..()
	name_source = GLOB.commando_names

/datum/antagonist/ert/deathsquad/leader
	name = "Deathsquad Officer"
	outfit = /datum/outfit/centcom/death_commando
	role = "Офицер"
	leader = TRUE

/datum/antagonist/ert/medic/inquisitor
	outfit = /datum/outfit/centcom/ert/medic/inquisitor

/datum/antagonist/ert/medic/inquisitor/on_gain()
	. = ..()
	owner.holy_role = HOLY_ROLE_PRIEST

/datum/antagonist/ert/security/inquisitor
	outfit = /datum/outfit/centcom/ert/security/inquisitor

/datum/antagonist/ert/security/inquisitor/on_gain()
	. = ..()
	owner.holy_role = HOLY_ROLE_PRIEST

/datum/antagonist/ert/chaplain
	role = "Священник"
	outfit = /datum/outfit/centcom/ert/chaplain

/datum/antagonist/ert/chaplain/inquisitor
	outfit = /datum/outfit/centcom/ert/chaplain/inquisitor

/datum/antagonist/ert/chaplain/on_gain()
	. = ..()
	owner.holy_role = HOLY_ROLE_PRIEST

/datum/antagonist/ert/commander/inquisitor
	outfit = /datum/outfit/centcom/ert/commander/inquisitor

/datum/antagonist/ert/commander/inquisitor/on_gain()
	. = ..()
	owner.holy_role = HOLY_ROLE_PRIEST

/datum/antagonist/ert/intern
	name = "CentCom Intern"
	outfit = /datum/outfit/centcom/centcom_intern
	plasmaman_outfit = /datum/outfit/plasmaman/centcom_intern
	random_names = TRUE
	role = "Интерн"
	greentext_reward = 10

/datum/antagonist/ert/intern/leader
	name = "CentCom Head Intern"
	outfit = /datum/outfit/centcom/centcom_intern/leader
	role = "Старший Интерн"
	leader = TRUE
	greentext_reward = 15

/datum/antagonist/ert/clown
	role = "Клоун"
	outfit = /datum/outfit/centcom/ert/clown
	plasmaman_outfit = /datum/outfit/plasmaman/party_comedian
	greentext_reward = 10

/datum/antagonist/ert/clown/New()
	. = ..()
	name_source = GLOB.clown_names

/datum/antagonist/ert/janitor/party
	role = "Чистильщик"
	outfit = /datum/outfit/centcom/ert/janitor/party
	plasmaman_outfit = /datum/outfit/plasmaman/party_janitor
	greentext_reward = 10

/datum/antagonist/ert/security/party
	role = "Вышибала"
	outfit = /datum/outfit/centcom/ert/security/party
	plasmaman_outfit = /datum/outfit/plasmaman/party_bouncer
	greentext_reward = 10

/datum/antagonist/ert/engineer/party
	role = "Строитель"
	outfit = /datum/outfit/centcom/ert/engineer/party
	plasmaman_outfit = /datum/outfit/plasmaman/party_constructor
	greentext_reward = 10

/datum/antagonist/ert/clown/party
	role = "Комик"
	outfit = /datum/outfit/centcom/ert/clown/party
	greentext_reward = 10

/datum/antagonist/ert/commander/party
	role = "Координатор тусы"
	outfit = /datum/outfit/centcom/ert/commander/party
	greentext_reward = 15

/datum/antagonist/ert/create_team(datum/team/ert/new_team)
	if(istype(new_team))
		ert_team = new_team

/datum/antagonist/ert/proc/forge_objectives()
	if(ert_team)
		objectives |= ert_team.objectives

/datum/antagonist/ert/proc/equipERT()
	var/mob/living/carbon/human/H = owner.current
	if(!istype(H))
		return
	if(isplasmaman(H))
		H.equipOutfit(plasmaman_outfit)
		H.internal = H.get_item_for_held_index(2)
		H.update_internals_hud_icon(1)
	H.equipOutfit(outfit)


/datum/antagonist/ert/greet()
	if(!ert_team)
		return

	to_chat(owner, span_warningplain("<B><font size=3 color=red>Я [name].</font></B>"))

	var/missiondesc = "Мой отряд был отправлен на станцию [station_name()] с миссией от Отдела Безопасности NanoTrasen."
	if(leader) //If Squad Leader
		missiondesc += " Ведите свой отряд, чтобы обеспечить выполнение миссии. Отправьтесь на станцию при помощи шаттла, когда ваша команда будет готова."
	else
		missiondesc += " Следуйте приказам командира отряда."
	if(!rip_and_tear)
		missiondesc += " По возможности избегайте жертв среди гражданского населения."

	missiondesc += span_warningplain("<BR><B>Задание</B>: [ert_team.mission.explanation_text]")
	to_chat(owner,missiondesc)


/datum/antagonist/ert/families
	name = "Space Police Responder"
	antag_hud_name = "hud_spacecop"
	greentext_reward = 20

/datum/antagonist/ert/families/apply_innate_effects(mob/living/mob_override)
	..()
	var/mob/living/M = mob_override || owner.current
	if(M.hud_used)
		var/datum/hud/H = M.hud_used
		var/atom/movable/screen/wanted/giving_wanted_lvl = new /atom/movable/screen/wanted()
		H.wanted_lvl = giving_wanted_lvl
		giving_wanted_lvl.hud = H
		H.infodisplay += giving_wanted_lvl
		H.mymob.client.screen += giving_wanted_lvl


/datum/antagonist/ert/families/remove_innate_effects(mob/living/mob_override)
	var/mob/living/M = mob_override || owner.current
	if(M.hud_used)
		var/datum/hud/H = M.hud_used
		H.infodisplay -= H.wanted_lvl
		QDEL_NULL(H.wanted_lvl)
	..()

/datum/antagonist/ert/families/greet()
	to_chat(owner, "<B><font size=6 color=red>You are the [name].</font></B>")
	to_chat(owner, "<B><font size=5 color=red>You are NOT a Nanotrasen Employee. You work for the local government.</font></B>")
	to_chat(owner, "<B><font size=5 color=red>You are NOT a deathsquad. You are here to help innocents escape violence, criminal activity, and other dangerous things.</font></B>")
	var/missiondesc = "After an uptick in gang violence on [station_name()], you are responding to emergency calls from the station for immediate SSC Police assistance!\n"
	missiondesc += "<BR><B>Your Mission</B>:"
	missiondesc += "<BR> <B>1.</B> Serve the public trust."
	missiondesc += "<BR> <B>2.</B> Protect the innocent."
	missiondesc += "<BR> <B>3.</B> Uphold the law."
	missiondesc += "<BR> <B>4.</B> Find the Undercover Cops."
	missiondesc += "<BR> <B>5.</B> Detain Nanotrasen Security personnel if they harm any citizen."
	missiondesc += "<BR> You can <B>see gangsters</B> using your <B>special sunglasses</B>."
	to_chat(owner,missiondesc)
	var/policy = get_policy(ROLE_FAMILIES)
	if(policy)
		to_chat(owner, policy)
	var/mob/living/M = owner.current
	M.playsound_local(M, 'sound/effects/families_police.ogg', 100, FALSE, pressure_affected = FALSE, use_reverb = FALSE)

/datum/antagonist/ert/families/undercover_cop
	name = "Undercover Cop"
	role = "Коп под прикрытием"
	outfit = /datum/outfit/families_police/beatcop
	plasmaman_outfit = /datum/outfit/plasmaman/security
	var/free_clothes = list(/obj/item/clothing/glasses/hud/spacecop/hidden,
						/obj/item/clothing/under/rank/security/officer/beatcop,
						/obj/item/clothing/head/spacepolice)
	forge_objectives_for_ert = FALSE
	equip_ert = FALSE
	random_names = FALSE

/datum/antagonist/ert/families/undercover_cop/on_gain()
	if(istype(owner.current, /mob/living/carbon/human))
		for(var/C in free_clothes)
			var/obj/O = new C(owner.current)
			var/list/slots = list (
				"backpack" = ITEM_SLOT_BACKPACK,
				"left pocket" = ITEM_SLOT_LPOCKET,
				"right pocket" = ITEM_SLOT_RPOCKET
			)
			var/mob/living/carbon/human/H = owner.current
			var/equipped = H.equip_in_one_of_slots(O, slots)
			if(!equipped)
				to_chat(owner.current, "Unfortunately, you could not bring your [O] to this shift. You will need to find one.")
				qdel(O)
	. = ..()


/datum/antagonist/ert/families/undercover_cop/greet()
	to_chat(owner, "<B><font size=3 color=red>You are the [name].</font></B>")
	to_chat(owner, "<B><font size=3 color=red>You are NOT a Nanotrasen Employee. You work for the local government.</font></B>")

	var/missiondesc = "You are an undercover police officer on board [station_name()]. You've been sent here by the Spinward Stellar Coalition because of suspected abusive behavior by the security department, and to keep tabs on a potential criminal organization operation."
	missiondesc += "<BR><B>Your Mission</B>:"
	missiondesc += "<BR> <B>1.</B> Keep a close eye on any gangsters you spot. You can view gangsters using your sunglasses in your backpack."
	missiondesc += "<BR> <B>2.</B> Keep an eye on how Security handles any gangsters, and watch for excessive security brutality."
	missiondesc += "<BR> <B>3.</B> Remain undercover and do not get found out by Security or any gangs. Nanotrasen does not take kindly to being spied on."
	missiondesc += "<BR> <B>4.</B> When your backup arrives to extract you in 1 hour, inform them of everything you saw of note, and assist them in securing the situation."
	to_chat(owner,missiondesc)

/datum/antagonist/ert/families/beatcop
	name = "Beat Cop"
	role = "Офицер Полиции"
	outfit = /datum/outfit/families_police/beatcop

/datum/antagonist/ert/families/beatcop/armored
	name = "Armored Beat Cop"
	role = "Офицер Полиции"
	outfit = /datum/outfit/families_police/beatcop/armored

/datum/antagonist/ert/families/beatcop/swat
	name = "S.W.A.T. Member"
	role = "Офицер S.W.A.T."
	outfit = /datum/outfit/families_police/beatcop/swat

/datum/antagonist/ert/families/beatcop/fbi
	name = "FBI Agent"
	role = "Агент ФБР"
	outfit = /datum/outfit/families_police/beatcop/fbi

/datum/antagonist/ert/families/beatcop/military
	name = "Space Military"
	role = "Сержант"
	outfit = /datum/outfit/families_police/beatcop/military

/datum/antagonist/ert/families/beatcop/military/New()
	. = ..()
	name_source = GLOB.commando_names

/datum/antagonist/ert/marine
	name = "Marine Commander"
	outfit = /datum/outfit/centcom/ert/marine
	role = "Командир"

/datum/antagonist/ert/marine/security
	name = "Marine Heavy"
	outfit = /datum/outfit/centcom/ert/marine/security
	role = "Солдат"

/datum/antagonist/ert/marine/engineer
	name = "Marine Engineer"
	outfit = /datum/outfit/centcom/ert/marine/engineer
	role = "Инженер"

/datum/antagonist/ert/marine/medic
	name = "Marine Medic"
	outfit = /datum/outfit/centcom/ert/marine/medic
	role = "Медик"
