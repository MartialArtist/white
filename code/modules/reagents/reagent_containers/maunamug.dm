/obj/item/reagent_containers/glass/maunamug
	name = "кружка с подогревом"
	desc = "Напиток становится намного вкуснее когда подается в стильной кружке. А эта еще и с подогревом!"
	icon = 'icons/obj/mauna_mug.dmi'
	icon_state = "maunamug"
	spillable = TRUE
	reagent_flags = OPENCONTAINER
	fill_icon_state = "maunafilling"
	fill_icon_thresholds = list(25)
	var/obj/item/stock_parts/cell/cell
	var/open = FALSE
	var/on = FALSE

/obj/item/reagent_containers/glass/maunamug/Initialize(mapload, vol)
	. = ..()
	cell = new /obj/item/stock_parts/cell(src)

/obj/item/reagent_containers/glass/maunamug/get_cell()
	return cell

/obj/item/reagent_containers/glass/maunamug/examine(mob/user)
	. = ..()
	. += "<hr><span class='notice'>Дисплей: Current temperature: <b>[reagents.chem_temp]K</b> Current Charge:[cell ? "[cell.charge / cell.maxcharge * 100]%" : "No cell found"].</span>"
	if(open)
		. += span_notice("\nThe battery case is open.")

/obj/item/reagent_containers/glass/maunamug/process(delta_time)
	..()
	if(on && (!cell || cell.charge <= 0)) //Check if we ran out of power
		change_power_status(FALSE)
		return FALSE
	cell.use(5 * delta_time) //Basic cell goes for like 200 seconds, bluespace for 8000
	if(!reagents.total_volume)
		return FALSE
	var/max_temp = min(500 + (500 * (0.2 * cell.rating)), 1000) // 373 to 1000
	reagents.adjust_thermal_energy(0.4 * cell.maxcharge * reagents.total_volume * delta_time, max_temp = max_temp) // 4 kelvin every tick on a basic cell. 160k on bluespace
	reagents.handle_reactions()
	update_icon()
	if(reagents.chem_temp >= max_temp)
		change_power_status(FALSE)
		audible_message(span_notice("The Mauna Mug lets out a happy beep and turns off!"))
		playsound(src, 'sound/machines/chime.ogg', 50)

/obj/item/reagent_containers/glass/maunamug/Destroy()
	if(cell)
		QDEL_NULL(cell)
	STOP_PROCESSING(SSobj, src)
	. = ..()


/obj/item/reagent_containers/glass/maunamug/attack_self(mob/user)
	if(on)
		change_power_status(FALSE)
	else
		if(!cell || cell.charge <= 0)
			return FALSE //No power, so don't turn on
		change_power_status(TRUE)

/obj/item/reagent_containers/glass/maunamug/proc/change_power_status(status)
	on = status
	if(on)
		START_PROCESSING(SSobj, src)
	else
		STOP_PROCESSING(SSobj, src)
	update_icon()

/obj/item/reagent_containers/glass/maunamug/screwdriver_act(mob/living/user, obj/item/I)
	. = ..()
	open = !open
	to_chat(user, span_notice("You screw the battery case on [src] [open ? "open" : "closed"] ."))
	update_icon()

/obj/item/reagent_containers/glass/maunamug/attackby(obj/item/I, mob/user, params)
	add_fingerprint(user)
	if(!istype(I, /obj/item/stock_parts/cell))
		return ..()
	if(!open)
		to_chat(user, span_warning("The battery case must be open to insert a power cell!"))
		return FALSE
	if(cell)
		to_chat(user, span_warning("Внутри уже есть батарейка!"))
		return FALSE
	else if(!user.transferItemToLoc(I, src))
		return
	cell = I
	user.visible_message(span_notice("[user] inserts a power cell into [src].") , span_notice("Вставляю батарейку внутрь [src]."))
	update_icon()

/obj/item/reagent_containers/glass/maunamug/attack_hand(mob/living/user)
	if(cell && open)
		cell.update_icon()
		user.put_in_hands(cell)
		cell = null
		to_chat(user, span_notice("You remove the power cell from [src]."))
		on = FALSE
		update_icon()
		return TRUE
	return ..()

/obj/item/reagent_containers/glass/maunamug/update_icon()
	..()
	if(open)
		if(cell)
			icon_state = "maunamug_bat"
		else
			icon_state = "maunamug_no_bat"
	else if(on)
		icon_state = "maunamug_on"
	else
		icon_state = "maunamug"
	if(reagents.total_volume && reagents.chem_temp >= 400)
		var/intensity = (reagents.chem_temp - 400) * 1 / 600 //Get the opacity of the incandescent overlay. Ranging from 400 to 1000
		var/mutable_appearance/mug_glow = mutable_appearance(icon, "maunamug_incand")
		mug_glow.alpha = 255 * intensity
		add_overlay(mug_glow)
