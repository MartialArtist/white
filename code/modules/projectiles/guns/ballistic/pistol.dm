/obj/item/gun/ballistic/automatic/pistol
	name = "пистолет Макарова"
	desc = "Небольшой, легко скрываемый 9-мм пистолет. Имеет вырезной ствол для установки глушителя."
	icon_state = "pistol"
	w_class = WEIGHT_CLASS_SMALL
	mag_type = /obj/item/ammo_box/magazine/m9mm
	can_suppress = TRUE
	burst_size = 1
	fire_delay = 0
	actions_types = list()
	auto_fire = FALSE
	bolt_type = BOLT_TYPE_LOCKING
	fire_sound = 'sound/weapons/gun/pistol/shot.ogg'
	dry_fire_sound = 'sound/weapons/gun/pistol/dry_fire.ogg'
	suppressed_sound = 'sound/weapons/gun/pistol/shot_suppressed.ogg'
	load_sound = 'sound/weapons/gun/pistol/mag_insert.ogg'
	load_empty_sound = 'sound/weapons/gun/pistol/mag_insert.ogg'
	eject_sound = 'sound/weapons/gun/pistol/mag_release.ogg'
	eject_empty_sound = 'sound/weapons/gun/pistol/mag_release.ogg'
	vary_fire_sound = FALSE
	rack_sound = 'sound/weapons/gun/pistol/rack_small.ogg'
	lock_back_sound = 'sound/weapons/gun/pistol/lock_small.ogg'
	bolt_drop_sound = 'sound/weapons/gun/pistol/drop_small.ogg'
	fire_sound_volume = 90
	bolt_wording = "затвор"
	suppressor_x_offset = 4

/obj/item/gun/ballistic/automatic/pistol/no_mag
	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/pistol/suppressed/Initialize(mapload)
	. = ..()
	var/obj/item/suppressor/S = new(src)
	install_suppressor(S)

/obj/item/gun/ballistic/automatic/pistol/m1911
	name = "M1911"
	desc = "Классический пистолет 45-го калибра с небольшой емкостью магазина."
	icon_state = "m1911"
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/m45
	can_suppress = FALSE
	fire_sound = 'sound/weapons/gun/pistol/shot_alt.ogg'
	rack_sound = 'sound/weapons/gun/pistol/rack.ogg'
	lock_back_sound = 'sound/weapons/gun/pistol/slide_lock.ogg'
	bolt_drop_sound = 'sound/weapons/gun/pistol/slide_drop.ogg'

/obj/item/gun/ballistic/automatic/pistol/m1911/no_mag
	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/pistol/deagle
	name = "Desert Eagle"
	desc = "Мощный пистолет .50 АЕ калибра."
	icon_state = "deagle"
	force = 14
	mag_type = /obj/item/ammo_box/magazine/m50
	can_suppress = FALSE
	mag_display = TRUE
	fire_sound = 'sound/weapons/gun/rifle/shot.ogg'
	rack_sound = 'sound/weapons/gun/pistol/rack.ogg'
	lock_back_sound = 'sound/weapons/gun/pistol/slide_lock.ogg'
	bolt_drop_sound = 'sound/weapons/gun/pistol/slide_drop.ogg'

/obj/item/gun/ballistic/automatic/pistol/deagle/gold
	desc = "Позолоченный Desert Eagle, сложенный миллион раз лучшими марсианскими оружейниками. Использует патроны .50 AE."
	icon_state = "deagleg"
	inhand_icon_state = "deagleg"

/obj/item/gun/ballistic/automatic/pistol/deagle/camo
	desc = "A Deagle brand Deagle for operators operating operationally. Uses .50 AE ammo."
	icon_state = "deaglecamo"
	inhand_icon_state = "deagleg"

/obj/item/gun/ballistic/automatic/pistol/aps
	name = "автоматический пистолет Стечкина"
	desc = "Старый советский автоматический пистолет. Стреляет быстро, но бьет как мул. Использует патроны калибра 9-мм. Имеет специальный ствол для установки глушителя."
	icon_state = "aps"
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/m9mm_aps
	can_suppress = TRUE
	auto_fire = TRUE
	fire_delay = 1
	spread = 10
	actions_types = list(/datum/action/item_action/toggle_firemode)
	suppressor_x_offset = 6

/obj/item/gun/ballistic/automatic/pistol/stickman
	name = "плоский пистолет"
	desc = "Двухпространственный пистолет... что?"
	icon_state = "flatgun"

/obj/item/gun/ballistic/automatic/pistol/stickman/pickup(mob/living/user)
	SHOULD_CALL_PARENT(FALSE)
	to_chat(user, span_notice("Пытаюсь поднять [src], но оно выскользывает из рук.."))
	if(prob(50))
		to_chat(user, span_notice("..и исчезает из видения! Куда, черт возьми, это пошло?"))
		qdel(src)
		user.update_icons()
	else
		to_chat(user, span_notice("..и попадает в поле зрения. Уфф, это было близко."))
		user.dropItemToGround(src)

