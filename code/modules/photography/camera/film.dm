/*
 * Film
 */
/obj/item/camera_film
	name = "фотопленка"
	icon = 'icons/obj/items_and_weapons.dmi'
	desc = "Используется для заправки фотокамер."
	icon_state = "film"
	inhand_icon_state = "electropack"
	lefthand_file = 'icons/mob/inhands/misc/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/devices_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	resistance_flags = FLAMMABLE
	custom_materials = list(/datum/material/iron = 10, /datum/material/glass = 10)
