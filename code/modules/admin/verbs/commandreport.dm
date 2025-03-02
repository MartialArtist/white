/// The default command report announcement sound.
#define DEFAULT_ANNOUNCEMENT_SOUND "default_announcement"

/// Preset central command names to chose from for centcom reports.
#define CENTCOM_PRESET "Центральное Командование"
#define SYNDICATE_PRESET "Синдикат"
#define WIZARD_PRESET "Федерация Магов"
#define CUSTOM_PRESET "Общество по правам негров"

/// Verb to change the global command name.
/client/proc/cmd_change_command_name()
	set category = "Адм.События"
	set name = "Change Command Name"

	if(!check_rights(R_ADMIN))
		return

	var/input = tgui_input_text(usr, "Please input a new name for Central Command.", "What?", "")
	if(!input)
		return
	change_command_name(input)
	message_admins("[key_name_admin(src)] has changed Central Command's name to [input]")
	log_admin("[key_name(src)] has changed the Central Command name to: [input]")

/// Verb to open the create command report window and send command reports.
/client/proc/cmd_admin_create_centcom_report()
	set category = "Адм.События"
	set name = "Create Command Report"

	if(!check_rights(R_ADMIN))
		return

	SSblackbox.record_feedback("tally", "admin_verb", 1, "Create Command Report") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	var/datum/command_report_menu/tgui = new(usr)
	tgui.ui_interact(usr)

/// Datum for holding the TGUI window for command reports.
/datum/command_report_menu
	/// The mob using the UI.
	var/mob/ui_user
	/// The name of central command that will accompany our report
	var/command_name = CENTCOM_PRESET
	/// Whether we are using a custom name instead of a preset.
	var/custom_name
	/// The actual contents of the report we're going to send.
	var/command_report_content
	/// Whether the report's contents are announced.
	var/announce_contents = TRUE
	/// The sound that's going to accompany our message.
	var/played_sound = ANNOUNCER_COMMANDREPORT
	/// A static list of preset names that can be chosen.
	var/static/list/preset_names = list(CENTCOM_PRESET, SYNDICATE_PRESET, WIZARD_PRESET, CUSTOM_PRESET)

/datum/command_report_menu/New(mob/user)
	ui_user = user

/datum/command_report_menu/ui_state(mob/user)
	return GLOB.admin_state

/datum/command_report_menu/ui_close()
	qdel(src)

/datum/command_report_menu/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "CommandReport")
		ui.open()

/datum/command_report_menu/ui_data(mob/user)
	var/list/data = list()
	data["command_name"] = command_name
	data["custom_name"] = custom_name
	data["command_report_content"] = command_report_content
	data["announce_contents"] = announce_contents
	data["played_sound"] = played_sound

	return data

/datum/command_report_menu/ui_static_data(mob/user)
	var/list/data = list()
	data["command_name_presets"] = preset_names
	data["announcer_sounds"] = list(DEFAULT_ANNOUNCEMENT_SOUND) + GLOB.announcer_keys

	return data

/datum/command_report_menu/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("update_command_name")
			if(params["updated_name"] == CUSTOM_PRESET)
				custom_name = TRUE
			else if (params["updated_name"] in preset_names)
				custom_name = FALSE

			command_name = params["updated_name"]
		if("update_report_contents")
			command_report_content = params["updated_contents"]
		if("set_report_sound")
			played_sound = params["picked_sound"]
		if("toggle_announce")
			announce_contents = !announce_contents
		if("submit_report")
			if(!command_name)
				to_chat(ui_user, span_danger("You can't send a report with no command name."))
				return
			if(!command_report_content)
				to_chat(ui_user, span_danger("You can't send a report with no contents."))
				return
			send_announcement()

	return TRUE

/*
 * The actual proc that sends the priority announcement and reports
 *
 * Uses the variables set by the user on our datum as the arguments for the report.
 */
/datum/command_report_menu/proc/send_announcement()
	/// Our current command name to swap back to after sending the report.
	var/original_command_name = command_name()
	change_command_name(command_name)

	/// The sound we're going to play on report.
	var/report_sound = played_sound
	if(played_sound == DEFAULT_ANNOUNCEMENT_SOUND)
		report_sound = SSstation.announcer.get_rand_report_sound()

	if(announce_contents)
		priority_announce(command_report_content, null, report_sound, has_important_message = TRUE)
	print_command_report(command_report_content, "[announce_contents ? "" : "Секретный "] Отчёт [command_name]", !announce_contents)

	change_command_name(original_command_name)

	log_admin("[key_name(ui_user)] has created a command report: \"[command_report_content]\", sent from \"[command_name]\" with the sound \"[played_sound]\".")
	message_admins("[key_name_admin(ui_user)] has created a command report, sent from \"[command_name]\" with the sound \"[played_sound]\"")


#undef DEFAULT_ANNOUNCEMENT_SOUND

#undef CENTCOM_PRESET
#undef SYNDICATE_PRESET
#undef WIZARD_PRESET
#undef CUSTOM_PRESET
