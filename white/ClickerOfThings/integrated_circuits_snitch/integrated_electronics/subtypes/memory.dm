/obj/item/integrated_circuit_old/memory
	name = "memory chip"
	desc = "This tiny chip can store one piece of data."
	icon_state = "memory"
	complexity = 1
	inputs = list()
	outputs = list()
	activators = list("set" = IC_PINTYPE_PULSE_IN, "on set" = IC_PINTYPE_PULSE_OUT)
	category_text = "Memory"
	spawn_flags = IC_SPAWN_DEFAULT|IC_SPAWN_RESEARCH
	power_draw_per_use = 1
	var/number_of_pins = 1

/obj/item/integrated_circuit_old/memory/Initialize()
	for(var/i = 1 to number_of_pins)
		inputs["input [i]"] = IC_PINTYPE_ANY // This is just a string since pins don't get built until ..() is called.
		outputs["output [i]"] = IC_PINTYPE_ANY
	complexity = number_of_pins
	. = ..()

/obj/item/integrated_circuit_old/memory/examine(mob/user)
	..()
	var/i
	for(i = 1, i <= outputs.len, i++)
		var/datum/integrated_io/O = outputs[i]
		var/data = "nothing"
		if(isweakref(O.data))
			var/datum/d = O.data_as_type(/datum)
			if(d)
				data = "[d]"
		else if(!isnull(O.data))
			data = O.data
		to_chat(user, "<b>[src.name]</b> has [data] saved to address [i].")

/obj/item/integrated_circuit_old/memory/do_work()
	for(var/i = 1 to inputs.len)
		var/datum/integrated_io/I = inputs[i]
		var/datum/integrated_io/O = outputs[i]
		O.data = I.data
		O.push_data()
	activate_pin(2)

/obj/item/integrated_circuit_old/memory/tiny
	name = "small memory circuit"
	desc = "This circuit can store two pieces of data."
	icon_state = "memory4"
	power_draw_per_use = 2
	number_of_pins = 2

/obj/item/integrated_circuit_old/memory/medium
	name = "medium memory circuit"
	desc = "This circuit can store four pieces of data."
	icon_state = "memory4"
	power_draw_per_use = 2
	number_of_pins = 4

/obj/item/integrated_circuit_old/memory/large
	name = "large memory circuit"
	desc = "This big circuit can store eight pieces of data."
	icon_state = "memory8"
	power_draw_per_use = 4
	number_of_pins = 8

/obj/item/integrated_circuit_old/memory/huge
	name = "large memory stick"
	desc = "This stick of memory can store up up to sixteen pieces of data."
	icon_state = "memory16"
	w_class = WEIGHT_CLASS_SMALL
	spawn_flags = IC_SPAWN_RESEARCH
	power_draw_per_use = 8
	number_of_pins = 16

/obj/item/integrated_circuit_old/memory/constant
	name = "constant chip"
	desc = "This tiny chip can store one piece of data, which cannot be overwritten without disassembly."
	icon_state = "memory"
	inputs = list()
	outputs = list("output pin" = IC_PINTYPE_ANY)
	activators = list("push data" = IC_PINTYPE_PULSE_IN)
	var/accepting_refs = FALSE
	spawn_flags = IC_SPAWN_DEFAULT|IC_SPAWN_RESEARCH
	number_of_pins = 0

/obj/item/integrated_circuit_old/memory/constant/do_work()
	var/datum/integrated_io/O = outputs[1]
	O.push_data()

/obj/item/integrated_circuit_old/memory/constant/emp_act()
	for(var/i in 1 to activators.len)
		var/datum/integrated_io/activate/A = activators[i]
		A.scramble()

/obj/item/integrated_circuit_old/memory/constant/save_special()
	var/datum/integrated_io/O = outputs[1]
	if(istext(O.data) || isnum(O.data))
		return O.data

/obj/item/integrated_circuit_old/memory/constant/load_special(special_data)
	var/datum/integrated_io/O = outputs[1]
	if(istext(special_data) || isnum(special_data))
		O.data = special_data

/obj/item/integrated_circuit_old/memory/constant/attack_self(mob/user)
	var/datum/integrated_io/O = outputs[1]
	if(!ISADVANCEDTOOLUSER(user))
		return
	var/type_to_use = tgui_input_list(user, "Please choose a type to use.", "[src] type setting", list("string","number","ref", "null"))

	var/new_data = null
	switch(type_to_use)
		if("string")
			accepting_refs = FALSE
			new_data = tgui_input_text(usr, "Now type in a string.","[src] string writing")
			if(istext(new_data) && ISADVANCEDTOOLUSER(user))
				O.data = new_data
				to_chat(user, span_notice("You set <b>[src.name]</b>'s memory to [O.display_data(O.data)]."))
		if("number")
			accepting_refs = FALSE
			new_data = input("Now type in a number.","[src] number writing") as null|num
			if(isnum(new_data) && ISADVANCEDTOOLUSER(user))
				O.data = new_data
				to_chat(user, span_notice("You set <b>[src.name]</b>'s memory to [O.display_data(O.data)]."))
		if("ref")
			accepting_refs = TRUE
			to_chat(user, "<span class='notice'>You turn <b>[src.name]</b>'s ref scanner on.  Slide it across \
			an object for a ref of that object to save it in memory.</span>")
		if("null")
			O.data = null
			to_chat(user, span_notice("You set <b>[src.name]</b>'s memory to absolutely nothing."))

/obj/item/integrated_circuit_old/memory/constant/afterattack(atom/target, mob/living/user, proximity)
	. = ..()
	if(accepting_refs && proximity)
		var/datum/integrated_io/O = outputs[1]
		O.data = WEAKREF(target)
		visible_message(span_notice("[user] slides <b>[src.name]</b>'s over [target]."))
		to_chat(user, "<span class='notice'>You set <b>[src.name]</b>'s memory to a reference to [O.display_data(O.data)].  The ref scanner is \
		now off.</span>")
		accepting_refs = FALSE

