/obj/machinery/dish_drive
	name = "утилизатор тарелок"
	desc = "Кулинарное чудо, которое использует преобразование вещества в энергию для хранения посуды и осколков. Удобно! \
		Дополнительные функции включают функцию вакуумирования для всасывания близлежащей посуды и автоматическую передаточную балку, которая время от времени высыпает ее содержимое в близлежащие мусорные баки. \
		Или вы можете просто бросить свои тарелки на пол, как цивилизованные люди."
	icon = 'goon/icons/obj/kitchen.dmi'
	icon_state = "synthesizer"
	active_power_usage = BASE_MACHINE_ACTIVE_CONSUMPTION * 0.04
	density = FALSE
	circuit = /obj/item/circuitboard/machine/dish_drive
	pass_flags = PASSTABLE
	var/static/list/collectable_items = list(/obj/item/trash/waffles,
		/obj/item/trash/plate,
		/obj/item/trash/tray,
		/obj/item/reagent_containers/glass/bowl,
		/obj/item/reagent_containers/food/drinks/drinkingglass,
		/obj/item/kitchen/fork,
		/obj/item/shard,
		/obj/item/broken_bottle)
	var/static/list/disposable_items = list(/obj/item/trash/waffles,
		/obj/item/trash/plate,
		/obj/item/trash/tray,
		/obj/item/shard,
		/obj/item/broken_bottle)
	var/time_since_dishes = 0
	var/suction_enabled = TRUE
	var/transmit_enabled = TRUE
	var/list/dish_drive_contents

/obj/machinery/dish_drive/Initialize()
	. = ..()
	RefreshParts()

/obj/machinery/dish_drive/examine(mob/user)
	. = ..()
	if(user.Adjacent(src))
		. += "<hr><span class='notice'>ПКМ it to beam its contents to any nearby disposal bins.</span>"

/obj/machinery/dish_drive/attack_hand(mob/living/user)
	if(!LAZYLEN(dish_drive_contents))
		to_chat(user, span_warning("There's nothing in [src]!"))
		return
	var/obj/item/I = LAZYACCESS(dish_drive_contents, LAZYLEN(dish_drive_contents)) //the most recently-added item
	LAZYREMOVE(dish_drive_contents, I)
	user.put_in_hands(I)
	to_chat(user, span_notice("You take out [I] from [src]."))
	playsound(src, 'sound/items/pshoom.ogg', 50, TRUE)
	flick("synthesizer_beam", src)

/obj/machinery/dish_drive/attackby(obj/item/I, mob/living/user, params)
	if(is_type_in_list(I, collectable_items) && user.a_intent != INTENT_HARM)
		if(!user.transferItemToLoc(I, src))
			return
		LAZYADD(dish_drive_contents, I)
		to_chat(user, span_notice("You put [I] in [src], and it's beamed into energy!"))
		playsound(src, 'sound/items/pshoom.ogg', 50, TRUE)
		flick("synthesizer_beam", src)
		return
	else if(default_deconstruction_screwdriver(user, "[initial(icon_state)]-o", initial(icon_state), I))
		return
	else if(default_unfasten_wrench(user, I))
		return
	else if(default_deconstruction_crowbar(I, FALSE))
		return
	..()

/obj/machinery/dish_drive/RefreshParts()
	. = ..()
	var/total_rating = 0
	for(var/obj/item/stock_parts/S in component_parts)
		total_rating += S.rating
	if(total_rating >= 9)
		update_mode_power_usage(ACTIVE_POWER_USE, 0)
	else
		update_mode_power_usage(IDLE_POWER_USE, max(0, initial(idle_power_usage) - total_rating))
		update_mode_power_usage(ACTIVE_POWER_USE, max(0, initial(active_power_usage) - total_rating))
	var/obj/item/circuitboard/machine/dish_drive/board = locate() in component_parts
	if(board)
		suction_enabled = board.suction
		transmit_enabled = board.transmit


/obj/machinery/dish_drive/process()
	if(time_since_dishes <= world.time && transmit_enabled)
		do_the_dishes()
	if(!suction_enabled)
		return
	for(var/obj/item/I in view(4, src))
		if(is_type_in_list(I, collectable_items) && I.loc != src && (!I.reagents || !I.reagents.total_volume))
			if(I.Adjacent(src))
				LAZYADD(dish_drive_contents, I)
				visible_message(span_notice("[capitalize(src.name)] beams up [I]!"))
				I.forceMove(src)
				playsound(src, 'sound/items/pshoom.ogg', 50, TRUE)
				flick("synthesizer_beam", src)
			else
				step_towards(I, src)

/obj/machinery/dish_drive/attack_ai(mob/living/user)
	if(machine_stat)
		return
	to_chat(user, span_notice("You send a disposal transmission signal to [src]."))
	do_the_dishes(TRUE)

/obj/machinery/dish_drive/AltClick(mob/living/user)
	if(user.canUseTopic(src, !issilicon(user)))
		do_the_dishes(TRUE)

/obj/machinery/dish_drive/proc/do_the_dishes(manual)
	if(!LAZYLEN(dish_drive_contents))
		if(manual)
			visible_message(span_notice("[src] is empty!"))
		return
	var/obj/machinery/disposal/bin/bin = locate() in view(7, src)
	if(!bin)
		if(manual)
			visible_message(span_warning("[capitalize(src.name)] buzzes. There are no disposal bins in range!"))
			playsound(src, 'white/valtos/sounds/error1.ogg', 50, TRUE)
		return
	var/disposed = 0
	for(var/obj/item/I in dish_drive_contents)
		if(is_type_in_list(I, disposable_items))
			LAZYREMOVE(dish_drive_contents, I)
			I.forceMove(bin)
			use_power(active_power_usage)
			disposed++
	if (disposed)
		visible_message(span_notice("[capitalize(src.name)] [pick("whooshes", "bwooms", "fwooms", "pshooms")] and beams [disposed] stored item\s into the nearby [bin.name]."))
		playsound(src, 'sound/items/pshoom.ogg', 50, TRUE)
		playsound(bin, 'sound/items/pshoom.ogg', 50, TRUE)
		Beam(bin, icon_state = "rped_upgrade", time = 5)
		bin.update_icon()
		flick("synthesizer_beam", src)
	else
		visible_message(span_notice("There are no disposable items in [src]!"))
	time_since_dishes = world.time + 600
