//DEFINITIONS FOR ASSET DATUMS START HERE.

/datum/asset/simple/tgui
	keep_local_name = TRUE
	assets = list(
		"tgui.bundle.js" = file("tgui/public/tgui.bundle.js"),
		"tgui.bundle.css" = file("tgui/public/tgui.bundle.css"),
	)

/datum/asset/simple/tgui_panel
	keep_local_name = TRUE
	assets = list(
		"tgui-panel.bundle.js" = file("tgui/public/tgui-panel.bundle.js"),
		"tgui-panel.bundle.css" = file("tgui/public/tgui-panel.bundle.css"),
	)

/datum/asset/simple/headers
	assets = list(
		"alarm_green.gif" = 'icons/program_icons/alarm_green.gif',
		"alarm_red.gif" = 'icons/program_icons/alarm_red.gif',
		"batt_5.gif" = 'icons/program_icons/batt_5.gif',
		"batt_20.gif" = 'icons/program_icons/batt_20.gif',
		"batt_40.gif" = 'icons/program_icons/batt_40.gif',
		"batt_60.gif" = 'icons/program_icons/batt_60.gif',
		"batt_80.gif" = 'icons/program_icons/batt_80.gif',
		"batt_100.gif" = 'icons/program_icons/batt_100.gif',
		"charging.gif" = 'icons/program_icons/charging.gif',
		"downloader_finished.gif" = 'icons/program_icons/downloader_finished.gif',
		"downloader_running.gif" = 'icons/program_icons/downloader_running.gif',
		"ntnrc_idle.gif" = 'icons/program_icons/ntnrc_idle.gif',
		"ntnrc_new.gif" = 'icons/program_icons/ntnrc_new.gif',
		"power_norm.gif" = 'icons/program_icons/power_norm.gif',
		"power_warn.gif" = 'icons/program_icons/power_warn.gif',
		"sig_high.gif" = 'icons/program_icons/sig_high.gif',
		"sig_low.gif" = 'icons/program_icons/sig_low.gif',
		"sig_lan.gif" = 'icons/program_icons/sig_lan.gif',
		"sig_none.gif" = 'icons/program_icons/sig_none.gif',
		"smmon_0.gif" = 'icons/program_icons/smmon_0.gif',
		"smmon_1.gif" = 'icons/program_icons/smmon_1.gif',
		"smmon_2.gif" = 'icons/program_icons/smmon_2.gif',
		"smmon_3.gif" = 'icons/program_icons/smmon_3.gif',
		"smmon_4.gif" = 'icons/program_icons/smmon_4.gif',
		"smmon_5.gif" = 'icons/program_icons/smmon_5.gif',
		"smmon_6.gif" = 'icons/program_icons/smmon_6.gif',
		"borg_mon.gif" = 'icons/program_icons/borg_mon.gif',
		"robotact.gif" = 'icons/program_icons/robotact.gif'
	)

/datum/asset/simple/radar_assets
	assets = list(
		"ntosradarbackground.png" = 'icons/UI_Icons/tgui/ntosradar_background.png',
		"ntosradarpointer.png" = 'icons/UI_Icons/tgui/ntosradar_pointer.png',
		"ntosradarpointerS.png" = 'icons/UI_Icons/tgui/ntosradar_pointer_S.png'
	)

/datum/asset/simple/circuit_assets
	assets = list(
		"grid_background.png" = 'icons/UI_Icons/tgui/grid_background.png'
	)

/datum/asset/spritesheet/simple/pda
	name = "pda"
	assets = list(
		"atmos" = 'icons/pda_icons/pda_atmos.png',
		"back" = 'icons/pda_icons/pda_back.png',
		"bell" = 'icons/pda_icons/pda_bell.png',
		"blank" = 'icons/pda_icons/pda_blank.png',
		"boom" = 'icons/pda_icons/pda_boom.png',
		"bucket" = 'icons/pda_icons/pda_bucket.png',
		"medbot" = 'icons/pda_icons/pda_medbot.png',
		"floorbot" = 'icons/pda_icons/pda_floorbot.png',
		"cleanbot" = 'icons/pda_icons/pda_cleanbot.png',
		"crate" = 'icons/pda_icons/pda_crate.png',
		"cuffs" = 'icons/pda_icons/pda_cuffs.png',
		"eject" = 'icons/pda_icons/pda_eject.png',
		"flashlight" = 'icons/pda_icons/pda_flashlight.png',
		"honk" = 'icons/pda_icons/pda_honk.png',
		"mail" = 'icons/pda_icons/pda_mail.png',
		"medical" = 'icons/pda_icons/pda_medical.png',
		"menu" = 'icons/pda_icons/pda_menu.png',
		"mule" = 'icons/pda_icons/pda_mule.png',
		"notes" = 'icons/pda_icons/pda_notes.png',
		"power" = 'icons/pda_icons/pda_power.png',
		"rdoor" = 'icons/pda_icons/pda_rdoor.png',
		"reagent" = 'icons/pda_icons/pda_reagent.png',
		"refresh" = 'icons/pda_icons/pda_refresh.png',
		"scanner" = 'icons/pda_icons/pda_scanner.png',
		"signaler" = 'icons/pda_icons/pda_signaler.png',
		"skills" = 'icons/pda_icons/pda_skills.png',
		"status" = 'icons/pda_icons/pda_status.png',
		"dronephone" = 'icons/pda_icons/pda_dronephone.png',
		"emoji" = 'icons/pda_icons/pda_emoji.png'
	)

/datum/asset/spritesheet/simple/paper
	name = "paper"
	assets = list(
		"stamp-clown" = 'icons/stamp_icons/large_stamp-clown.png',
		"stamp-deny" = 'icons/stamp_icons/large_stamp-deny.png',
		"stamp-ok" = 'icons/stamp_icons/large_stamp-ok.png',
		"stamp-hop" = 'icons/stamp_icons/large_stamp-hop.png',
		"stamp-cmo" = 'icons/stamp_icons/large_stamp-cmo.png',
		"stamp-ce" = 'icons/stamp_icons/large_stamp-ce.png',
		"stamp-hos" = 'icons/stamp_icons/large_stamp-hos.png',
		"stamp-rd" = 'icons/stamp_icons/large_stamp-rd.png',
		"stamp-cap" = 'icons/stamp_icons/large_stamp-cap.png',
		"stamp-qm" = 'icons/stamp_icons/large_stamp-qm.png',
		"stamp-law" = 'icons/stamp_icons/large_stamp-law.png',
		"stamp-chap" = 'icons/stamp_icons/large_stamp-chap.png',
		"stamp-mime" = 'icons/stamp_icons/large_stamp-mime.png',
		"stamp-centcom" = 'icons/stamp_icons/large_stamp-centcom.png',
		"stamp-syndicate" = 'icons/stamp_icons/large_stamp-syndicate.png'
	)


/datum/asset/simple/irv
	assets = list(
		"jquery-ui.custom-core-widgit-mouse-sortable-min.js" = 'html/IRV/jquery-ui.custom-core-widgit-mouse-sortable-min.js',
	)

/datum/asset/group/irv
	children = list(
		/datum/asset/simple/jquery,
		/datum/asset/simple/irv
	)

/datum/asset/simple/namespaced/changelog
	assets = list(
		"88x31.png" = 'html/88x31.png',
		"bug-minus.png" = 'html/bug-minus.png',
		"cross-circle.png" = 'html/cross-circle.png',
		"hard-hat-exclamation.png" = 'html/hard-hat-exclamation.png',
		"image-minus.png" = 'html/image-minus.png',
		"image-plus.png" = 'html/image-plus.png',
		"music-minus.png" = 'html/music-minus.png',
		"music-plus.png" = 'html/music-plus.png',
		"tick-circle.png" = 'html/tick-circle.png',
		"wrench-screwdriver.png" = 'html/wrench-screwdriver.png',
		"spell-check.png" = 'html/spell-check.png',
		"burn-exclamation.png" = 'html/burn-exclamation.png',
		"chevron.png" = 'html/chevron.png',
		"chevron-expand.png" = 'html/chevron-expand.png',
		"scales.png" = 'html/scales.png',
		"coding.png" = 'html/coding.png',
		"ban.png" = 'html/ban.png',
		"chrome-wrench.png" = 'html/chrome-wrench.png',
		"changelog.css" = 'html/changelog.css'
	)
	parents = list("changelog.html" = 'html/changelog.html')


/datum/asset/simple/jquery
	legacy = TRUE
	assets = list(
		"jquery.min.js" = 'html/jquery.min.js',
	)

/datum/asset/simple/namespaced/fontawesome
	assets = list(
		"fa-regular-400.eot"  = 'html/font-awesome/webfonts/fa-regular-400.eot',
		"fa-regular-400.woff" = 'html/font-awesome/webfonts/fa-regular-400.woff',
		"fa-solid-900.eot"    = 'html/font-awesome/webfonts/fa-solid-900.eot',
		"fa-solid-900.woff"   = 'html/font-awesome/webfonts/fa-solid-900.woff',
		"v4shim.css"          = 'html/font-awesome/css/v4-shims.min.css'
	)
	parents = list("font-awesome.css" = 'html/font-awesome/css/all.min.css')

/datum/asset/simple/namespaced/tgfont
	assets = list(
		"tgfont.eot" = file("tgui/packages/tgfont/static/tgfont.eot"),
		"tgfont.woff2" = file("tgui/packages/tgfont/static/tgfont.woff2"),
	)
	parents = list(
		"tgfont.css" = file("tgui/packages/tgfont/static/tgfont.css"),
	)

/datum/asset/spritesheet/chat
	name = "chat"

/datum/asset/spritesheet/chat/create_spritesheets()
	InsertAll("emoji", EMOJI_SET)
	// pre-loading all lanugage icons also helps to avoid meta
	InsertAll("language", 'icons/misc/language.dmi')
	// catch languages which are pulling icons from another file
	for(var/path in typesof(/datum/language))
		var/datum/language/L = path
		var/icon = initial(L.icon)
		if (icon != 'icons/misc/language.dmi')
			var/icon_state = initial(L.icon_state)
			Insert("language-[icon_state]", icon, icon_state=icon_state)

/datum/asset/simple/lobby
	assets = list(
		"playeroptions.css" = 'html/browser/playeroptions.css'
	)

/datum/asset/simple/namespaced/common
	assets = list("padlock.png"	= 'html/padlock.png')
	parents = list("common.css" = 'html/browser/common.css')

/datum/asset/simple/permissions
	assets = list(
		"search.js" = 'html/admin/search.js',
		"panels.css" = 'html/admin/panels.css'
	)

/datum/asset/group/permissions
	children = list(
		/datum/asset/simple/permissions,
		/datum/asset/simple/namespaced/common
	)

/datum/asset/simple/notes
	assets = list(
		"high_button.png" = 'html/high_button.png',
		"medium_button.png" = 'html/medium_button.png',
		"minor_button.png" = 'html/minor_button.png',
		"none_button.png" = 'html/none_button.png',
	)

/datum/asset/simple/arcade
	assets = list(
		"boss1.gif" = 'icons/UI_Icons/Arcade/boss1.gif',
		"boss2.gif" = 'icons/UI_Icons/Arcade/boss2.gif',
		"boss3.gif" = 'icons/UI_Icons/Arcade/boss3.gif',
		"boss4.gif" = 'icons/UI_Icons/Arcade/boss4.gif',
		"boss5.gif" = 'icons/UI_Icons/Arcade/boss5.gif',
		"boss6.gif" = 'icons/UI_Icons/Arcade/boss6.gif',
	)

/datum/asset/spritesheet/simple/achievements
	name ="achievements"
	assets = list(
		"default" = 'icons/UI_Icons/Achievements/default.png',
		"basemisc" = 'icons/UI_Icons/Achievements/basemisc.png',
		"baseboss" = 'icons/UI_Icons/Achievements/baseboss.png',
		"baseskill" = 'icons/UI_Icons/Achievements/baseskill.png',
		"bbgum" = 'icons/UI_Icons/Achievements/Boss/bbgum.png',
		"colossus" = 'icons/UI_Icons/Achievements/Boss/colossus.png',
		"hierophant" = 'icons/UI_Icons/Achievements/Boss/hierophant.png',
		"legion" = 'icons/UI_Icons/Achievements/Boss/legion.png',
		"miner" = 'icons/UI_Icons/Achievements/Boss/miner.png',
		"swarmer" = 'icons/UI_Icons/Achievements/Boss/swarmer.png',
		"tendril" = 'icons/UI_Icons/Achievements/Boss/tendril.png',
		"featofstrength" = 'icons/UI_Icons/Achievements/Misc/featofstrength.png',
		"helbital" = 'icons/UI_Icons/Achievements/Misc/helbital.png',
		"jackpot" = 'icons/UI_Icons/Achievements/Misc/jackpot.png',
		"meteors" = 'icons/UI_Icons/Achievements/Misc/meteors.png',
		"timewaste" = 'icons/UI_Icons/Achievements/Misc/timewaste.png',
		"upgrade" = 'icons/UI_Icons/Achievements/Misc/upgrade.png',
		"clownking" = 'icons/UI_Icons/Achievements/Misc/clownking.png',
		"clownthanks" = 'icons/UI_Icons/Achievements/Misc/clownthanks.png',
		"rule8" = 'icons/UI_Icons/Achievements/Misc/rule8.png',
		"snail" = 'icons/UI_Icons/Achievements/Misc/snail.png',
		"ascension" = 'icons/UI_Icons/Achievements/Misc/ascension.png',
		"ashascend" = 'icons/UI_Icons/Achievements/Misc/ashascend.png',
		"fleshascend" = 'icons/UI_Icons/Achievements/Misc/fleshascend.png',
		"rustascend" = 'icons/UI_Icons/Achievements/Misc/rustascend.png',
		"voidascend" = 'icons/UI_Icons/Achievements/Misc/voidascend.png',
		"mining" = 'icons/UI_Icons/Achievements/Skills/mining.png',
		"assistant" = 'icons/UI_Icons/Achievements/Mafia/assistant.png',
		"changeling" = 'icons/UI_Icons/Achievements/Mafia/changeling.png',
		"chaplain" = 'icons/UI_Icons/Achievements/Mafia/chaplain.png',
		"clown" = 'icons/UI_Icons/Achievements/Mafia/clown.png',
		"detective" = 'icons/UI_Icons/Achievements/Mafia/detective.png',
		"fugitive" = 'icons/UI_Icons/Achievements/Mafia/fugitive.png',
		"hated" = 'icons/UI_Icons/Achievements/Mafia/hated.png',
		"hop" = 'icons/UI_Icons/Achievements/Mafia/hop.png',
		"lawyer" = 'icons/UI_Icons/Achievements/Mafia/lawyer.png',
		"md" = 'icons/UI_Icons/Achievements/Mafia/md.png',
		"nightmare" = 'icons/UI_Icons/Achievements/Mafia/nightmare.png',
		"obsessed" = 'icons/UI_Icons/Achievements/Mafia/obsessed.png',
		"psychologist" = 'icons/UI_Icons/Achievements/Mafia/psychologist.png',
		"thoughtfeeder" = 'icons/UI_Icons/Achievements/Mafia/thoughtfeeder.png',
		"traitor" = 'icons/UI_Icons/Achievements/Mafia/traitor.png',
		"basemafia" ='icons/UI_Icons/Achievements/basemafia.png',
		"frenching" = 'icons/UI_Icons/Achievements/Misc/frenchingthebubble.png'
	)

/datum/asset/spritesheet/simple/pills
	name = "pills"
	assets = list(
		"pill1" = 'icons/UI_Icons/Pills/pill1.png',
		"pill2" = 'icons/UI_Icons/Pills/pill2.png',
		"pill3" = 'icons/UI_Icons/Pills/pill3.png',
		"pill4" = 'icons/UI_Icons/Pills/pill4.png',
		"pill5" = 'icons/UI_Icons/Pills/pill5.png',
		"pill6" = 'icons/UI_Icons/Pills/pill6.png',
		"pill7" = 'icons/UI_Icons/Pills/pill7.png',
		"pill8" = 'icons/UI_Icons/Pills/pill8.png',
		"pill9" = 'icons/UI_Icons/Pills/pill9.png',
		"pill10" = 'icons/UI_Icons/Pills/pill10.png',
		"pill11" = 'icons/UI_Icons/Pills/pill11.png',
		"pill12" = 'icons/UI_Icons/Pills/pill12.png',
		"pill13" = 'icons/UI_Icons/Pills/pill13.png',
		"pill14" = 'icons/UI_Icons/Pills/pill14.png',
		"pill15" = 'icons/UI_Icons/Pills/pill15.png',
		"pill16" = 'icons/UI_Icons/Pills/pill16.png',
		"pill17" = 'icons/UI_Icons/Pills/pill17.png',
		"pill18" = 'icons/UI_Icons/Pills/pill18.png',
		"pill19" = 'icons/UI_Icons/Pills/pill19.png',
		"pill20" = 'icons/UI_Icons/Pills/pill20.png',
		"pill21" = 'icons/UI_Icons/Pills/pill21.png',
		"pill22" = 'icons/UI_Icons/Pills/pill22.png',
	)

/datum/asset/spritesheet/simple/condiments
	name = "condiments"
	assets = list(
		CONDIMASTER_STYLE_FALLBACK = 'icons/UI_Icons/Condiments/emptycondiment.png',
		"enzyme" = 'icons/UI_Icons/Condiments/enzyme.png',
		"flour" = 'icons/UI_Icons/Condiments/flour.png',
		"mayonnaise" = 'icons/UI_Icons/Condiments/mayonnaise.png',
		"milk" = 'icons/UI_Icons/Condiments/milk.png',
		"blackpepper" = 'icons/UI_Icons/Condiments/peppermillsmall.png',
		"rice" = 'icons/UI_Icons/Condiments/rice.png',
		"sodiumchloride" = 'icons/UI_Icons/Condiments/saltshakersmall.png',
		"soymilk" = 'icons/UI_Icons/Condiments/soymilk.png',
		"soysauce" = 'icons/UI_Icons/Condiments/soysauce.png',
		"sugar" = 'icons/UI_Icons/Condiments/sugar.png',
		"ketchup" = 'icons/UI_Icons/Condiments/ketchup.png',
		"capsaicin" = 'icons/UI_Icons/Condiments/hotsauce.png',
		"frostoil" = 'icons/UI_Icons/Condiments/coldsauce.png',
		"bbqsauce" = 'icons/UI_Icons/Condiments/bbqsauce.png',
		"cornoil" = 'icons/UI_Icons/Condiments/oliveoil.png',
	)

//this exists purely to avoid meta by pre-loading all language icons.
/datum/asset/language/register()
	for(var/path in typesof(/datum/language))
		set waitfor = FALSE
		var/datum/language/L = new path ()
		L.get_icon()

/datum/asset/spritesheet/pipes
	name = "pipes"

/datum/asset/spritesheet/pipes/create_spritesheets()
	for (var/each in list('icons/obj/atmospherics/pipes/pipe_item.dmi', 'icons/obj/atmospherics/pipes/disposal.dmi', 'icons/obj/atmospherics/pipes/transit_tube.dmi', 'icons/obj/plumbing/fluid_ducts.dmi'))
		InsertAll("", each, GLOB.alldirs)

/datum/asset/spritesheet/supplypods
	name = "supplypods"

/datum/asset/spritesheet/supplypods/create_spritesheets()
	for (var/style in 1 to length(GLOB.podstyles))
		if (style == STYLE_SEETHROUGH)
			Insert("pod_asset[style]", icon('icons/obj/supplypods.dmi' , "seethrough-icon"))
			continue
		var/base = GLOB.podstyles[style][POD_BASE]
		if (!base)
			Insert("pod_asset[style]", icon('icons/obj/supplypods.dmi', "invisible-icon"))
			continue
		var/icon/podIcon = icon('icons/obj/supplypods.dmi', base)
		var/door = GLOB.podstyles[style][POD_DOOR]
		if (door)
			door = "[base]_door"
			podIcon.Blend(icon('icons/obj/supplypods.dmi', door), ICON_OVERLAY)
		var/shape = GLOB.podstyles[style][POD_SHAPE]
		if (shape == POD_SHAPE_NORML)
			var/decal = GLOB.podstyles[style][POD_DECAL]
			if (decal)
				podIcon.Blend(icon('icons/obj/supplypods.dmi', decal), ICON_OVERLAY)
			var/glow = GLOB.podstyles[style][POD_GLOW]
			if (glow)
				glow = "pod_glow_[glow]"
				podIcon.Blend(icon('icons/obj/supplypods.dmi', glow), ICON_OVERLAY)
		Insert("pod_asset[style]", podIcon)

// Representative icons for each research design
/datum/asset/spritesheet/research_designs
	name = "design"

/datum/asset/spritesheet/research_designs/create_spritesheets()
	for (var/path in subtypesof(/datum/design))
		var/datum/design/D = path

		var/icon_file
		var/icon_state
		var/icon/I

		if(initial(D.research_icon) && initial(D.research_icon_state)) //If the design has an icon replacement skip the rest
			icon_file = initial(D.research_icon)
			icon_state = initial(D.research_icon_state)
			if(!(icon_state in icon_states(icon_file)))
				warning("design [D] with icon '[icon_file]' missing state '[icon_state]'")
				continue
			I = icon(icon_file, icon_state, SOUTH)

		else
			// construct the icon and slap it into the resource cache
			var/atom/item = initial(D.build_path)
			if (!ispath(item, /atom))
				// biogenerator outputs to beakers by default
				if (initial(D.build_type) & BIOGENERATOR)
					item = /obj/item/reagent_containers/glass/beaker/large
				else
					continue  // shouldn't happen, but just in case

			// circuit boards become their resulting machines or computers
			if (ispath(item, /obj/item/circuitboard))
				var/obj/item/circuitboard/C = item
				var/machine = initial(C.build_path)
				if (machine)
					item = machine

			icon_file = initial(item.icon)
			icon_state = initial(item.icon_state)

			if(!(icon_state in icon_states(icon_file)))
				warning("design [D] with icon '[icon_file]' missing state '[icon_state]'")
				continue
			I = icon(icon_file, icon_state, SOUTH)

			// computers (and snowflakes) get their screen and keyboard sprites
			if (ispath(item, /obj/machinery/computer) || ispath(item, /obj/machinery/power/solar_control))
				var/obj/machinery/computer/C = item
				var/screen = initial(C.icon_screen)
				var/keyboard = initial(C.icon_keyboard)
				var/all_states = icon_states(icon_file)
				if (screen && (screen in all_states))
					I.Blend(icon(icon_file, screen, SOUTH), ICON_OVERLAY)
				if (keyboard && (keyboard in all_states))
					I.Blend(icon(icon_file, keyboard, SOUTH), ICON_OVERLAY)

		Insert(initial(D.id), I)

/datum/asset/spritesheet/vending
	name = "vending"

/datum/asset/spritesheet/vending/create_spritesheets()
	for (var/k in GLOB.vending_products)
		var/atom/item = k
		if (!ispath(item, /atom))
			continue

		var/icon_file
		if (initial(item.greyscale_colors) && initial(item.greyscale_config))
			icon_file = SSgreyscale.GetColoredIconByType(initial(item.greyscale_config), initial(item.greyscale_colors))
		else
			icon_file = initial(item.icon)
		var/icon_state = initial(item.icon_state)
		var/icon/I

		var/icon_states_list = icon_states(icon_file)
		if(icon_state in icon_states_list)
			I = icon(icon_file, icon_state, SOUTH)
			var/c = initial(item.color)
			if (!isnull(c) && c != "#FFFFFF")
				I.Blend(c, ICON_MULTIPLY)
		else
			var/icon_states_string
			for (var/an_icon_state in icon_states_list)
				if (!icon_states_string)
					icon_states_string = "[json_encode(an_icon_state)](\ref[an_icon_state])"
				else
					icon_states_string += ", [json_encode(an_icon_state)](\ref[an_icon_state])"
			stack_trace("[item] does not have a valid icon state, icon=[icon_file], icon_state=[json_encode(icon_state)](\ref[icon_state]), icon_states=[icon_states_string]")
			I = icon(DEFAULT_FLOORS_ICON, "", SOUTH)

		var/imgid = replacetext(replacetext("[item]", "/obj/item/", ""), "/", "-")

		Insert(imgid, I)

/datum/asset/simple/genetics
	assets = list(
		"dna_discovered.gif" = 'html/dna_discovered.gif',
		"dna_undiscovered.gif" = 'html/dna_undiscovered.gif',
		"dna_extra.gif" = 'html/dna_extra.gif'
	)

/datum/asset/simple/game_kit
	assets = list(
		"board_BI.png"			= 'white/valtos/icons/gk/board_BI.png',
		"board_BK.png"			= 'white/valtos/icons/gk/board_BK.png',
		"board_BN.png" 			= 'white/valtos/icons/gk/board_BN.png',
		"board_BP.png" 			= 'white/valtos/icons/gk/board_BP.png',
		"board_BQ.png" 			= 'white/valtos/icons/gk/board_BQ.png',
		"board_BR.png" 			= 'white/valtos/icons/gk/board_BR.png',
		"board_CB.png" 			= 'white/valtos/icons/gk/board_CB.png',
		"board_CR.png" 			= 'white/valtos/icons/gk/board_CR.png',
		"board_none.png" 		= 'white/valtos/icons/gk/board_none.png',
		"board_WI.png" 			= 'white/valtos/icons/gk/board_WI.png',
		"board_WK.png" 			= 'white/valtos/icons/gk/board_WK.png',
		"board_WN.png" 			= 'white/valtos/icons/gk/board_WN.png',
		"board_WP.png" 			= 'white/valtos/icons/gk/board_WP.png',
		"board_WQ.png" 			= 'white/valtos/icons/gk/board_WQ.png',
		"board_WR.png" 			= 'white/valtos/icons/gk/board_WR.png'
	)

/datum/asset/simple/white_mix
	assets = list(
		"zdoh.png"				= 'white/valtos/icons/zdoh.png'
	)

/datum/asset/simple/orbit
	assets = list(
		"ghost.png"	= 'html/ghost.png'
	)

/datum/asset/simple/vv
	assets = list(
		"view_variables.css" = 'html/admin/view_variables.css'
	)

/datum/asset/spritesheet/sheetmaterials
	name = "sheetmaterials"

/datum/asset/spritesheet/sheetmaterials/create_spritesheets()
	InsertAll("", 'icons/obj/stack_objects.dmi')

	// Special case to handle Bluespace Crystals
	Insert("polycrystal", 'icons/obj/telescience.dmi', "polycrystal")

/datum/asset/spritesheet/mafia
	name = "mafia"

/datum/asset/spritesheet/mafia/create_spritesheets()
	InsertAll("", 'icons/obj/mafia.dmi')

/datum/asset/simple/portraits
	assets = list()

/datum/asset/simple/portraits/New()
	if(!length(SSpersistent_paintings.paintings))
		return
	for(var/datum/painting/portrait as anything in SSpersistent_paintings.paintings)
		var/png = "data/paintings/images/[portrait.md5].png"
		if(fexists(png))
			var/asset_name = "paintings_[portrait.md5]"
			assets[asset_name] = png
	..() //this is where it registers all these assets we added to the list

/datum/asset/simple/safe
	assets = list(
		"safe_dial.png" = 'html/safe_dial.png'
	)

/datum/asset/simple/metacoins
	assets = list(
		"mc_32.gif"  = 'html/metacoins/32.gif',
		"mc_48.gif"  = 'html/metacoins/48.gif',
		"mc_64.gif"  = 'html/metacoins/64.gif',
		"mc_192.gif" = 'html/metacoins/192.gif',
	)

/datum/asset/simple/tutorial_advisors
	assets = list(
		"chem_help_advisor.gif" = 'icons/UI_Icons/Advisors/chem_help_advisor.gif',
	)

/datum/asset/simple/contracts
	assets = list(
		"bluespace.png" = 'icons/UI_Icons/contracts/bluespace.png',
		"destruction.png" = 'icons/UI_Icons/contracts/destruction.png',
		"healing.png" = 'icons/UI_Icons/contracts/healing.png',
		"robeless.png" = 'icons/UI_Icons/contracts/robeless.png',
	)

/datum/asset/spritesheet/fish
	name = "fish"

/datum/asset/spritesheet/fish/create_spritesheets()
	for (var/path in subtypesof(/datum/aquarium_behaviour/fish))
		var/datum/aquarium_behaviour/fish/fish_type = path
		var/fish_icon = initial(fish_type.icon)
		var/fish_icon_state = initial(fish_type.icon_state)
		var/id = sanitize_css_class_name("[fish_icon][fish_icon_state]")
		if(sprites[id]) //no dupes
			continue
		Insert(id, fish_icon, fish_icon_state)

/datum/asset/simple/adventure
	assets = list(
		"default" = 'icons/UI_Icons/adventure/default.png',
		"grue" = 'icons/UI_Icons/adventure/grue.png',
		"signal_lost" ='icons/UI_Icons/adventure/signal_lost.png',
		"trade" = 'icons/UI_Icons/adventure/trade.png',
	)

/datum/asset/simple/inventory
	assets = list(
		"inventory-glasses.png" = 'icons/UI_Icons/inventory/glasses.png',
		"inventory-head.png" = 'icons/UI_Icons/inventory/head.png',
		"inventory-neck.png" = 'icons/UI_Icons/inventory/neck.png',
		"inventory-mask.png" = 'icons/UI_Icons/inventory/mask.png',
		"inventory-ears.png" = 'icons/UI_Icons/inventory/ears.png',
		"inventory-uniform.png" = 'icons/UI_Icons/inventory/uniform.png',
		"inventory-suit.png" = 'icons/UI_Icons/inventory/suit.png',
		"inventory-gloves.png" = 'icons/UI_Icons/inventory/gloves.png',
		"inventory-hand_l.png" = 'icons/UI_Icons/inventory/hand_l.png',
		"inventory-hand_r.png" = 'icons/UI_Icons/inventory/hand_r.png',
		"inventory-shoes.png" = 'icons/UI_Icons/inventory/shoes.png',
		"inventory-suit_storage.png" = 'icons/UI_Icons/inventory/suit_storage.png',
		"inventory-id.png" = 'icons/UI_Icons/inventory/id.png',
		"inventory-belt.png" = 'icons/UI_Icons/inventory/belt.png',
		"inventory-back.png" = 'icons/UI_Icons/inventory/back.png',
		"inventory-pocket.png" = 'icons/UI_Icons/inventory/pocket.png',
		"inventory-collar.png" = 'icons/UI_Icons/inventory/collar.png',
	)

/// Removes all non-alphanumerics from the text, keep in mind this can lead to id conflicts
/proc/sanitize_css_class_name(name)
	var/static/regex/regex = new(@"[^a-zA-Z0-9]","g")
	return replacetext(name, regex, "")

/datum/asset/spritesheet/moods
	name = "moods"
	var/iconinserted = 1

/datum/asset/spritesheet/moods/create_spritesheets()
	for(var/i in 1 to 9)
		var/target_to_insert = "mood"+"[iconinserted]"
		Insert(target_to_insert, 'icons/hud/screen_gen.dmi', target_to_insert)
		iconinserted++

/datum/asset/spritesheet/moods/ModifyInserted(icon/pre_asset)
	var/blended_color
	switch(iconinserted)
		if(1)
			blended_color = "#f15d36"
		if(2 to 3)
			blended_color = "#f38943"
		if(4)
			blended_color = "#dfa65b"
		if(5)
			blended_color = "#4b96c4"
		if(6)
			blended_color = "#86d656"
		else
			blended_color = "#2eeb9a"
	pre_asset.Blend(blended_color, ICON_MULTIPLY)
	return pre_asset

/datum/asset/spritesheet/mechaarmor
	name = "mechaarmor"

/datum/asset/spritesheet/mechaarmor/create_spritesheets()
	InsertAll("", 'icons/ui_icons/mecha/armor.dmi')
