// Closets for specific jobs

/obj/structure/closet/gmcloset
	name = "шкаф с формальной одеждой"
	desc = "Хранилище для формальной одежды."
	icon_door = "black"

/obj/structure/closet/gmcloset/PopulateContents()
	..()
	var/static/items_inside = list(
		/obj/item/clothing/head/that = 2,
		/obj/item/radio/headset/headset_srv = 2,
		/obj/item/clothing/under/suit/sl = 2,
		/obj/item/clothing/under/rank/civilian/bartender = 2,
		/obj/item/clothing/accessory/waistcoat = 2,
		/obj/item/clothing/head/soft/black = 2,
		/obj/item/clothing/shoes/sneakers/black = 2,
		/obj/item/reagent_containers/glass/rag = 2,
		/obj/item/storage/box/beanbag = 1,
		/obj/item/clothing/suit/armor/vest/alt = 1,
		/obj/item/circuitboard/machine/dish_drive = 1,
		/obj/item/clothing/glasses/sunglasses/reagent = 1,
		/obj/item/clothing/neck/petcollar = 1,
		/obj/item/storage/belt/bandolier = 1)
	generate_items_inside(items_inside,src)

/obj/structure/closet/chefcloset
	name = "\proper шкаф шеф-повара"
	desc = "Хранилище для продуктов питания и мышеловок."
	icon_door = "black"

/obj/structure/closet/chefcloset/PopulateContents()
	..()
	var/static/items_inside = list(
		/obj/item/clothing/under/suit/waiter = 2,
		/obj/item/radio/headset/headset_srv = 2,
		/obj/item/clothing/accessory/waistcoat = 2,
		/obj/item/clothing/suit/apron/chef = 3,
		/obj/item/clothing/head/soft/mime = 2,
		/obj/item/storage/box/mousetraps = 2,
		/obj/item/circuitboard/machine/dish_drive = 1,
		/obj/item/clothing/suit/toggle/chef = 1,
		/obj/item/clothing/under/rank/civilian/chef = 1,
		/obj/item/clothing/head/chefhat = 1,
		/obj/item/reagent_containers/glass/rag = 1)
	generate_items_inside(items_inside,src)

/obj/structure/closet/jcloset
	name = "кладовка"
	desc = "Хранилище для одежды и инструментов уборщиков."
	icon_door = "mixed"

/obj/structure/closet/jcloset/PopulateContents()
	..()
	new /obj/item/clothing/under/rank/civilian/janitor(src)
	new /obj/item/clothing/gloves/color/black(src)
	new /obj/item/clothing/head/soft/purple(src)
	new /obj/item/paint/paint_remover(src)
	new /obj/item/melee/flyswatter(src)
	new /obj/item/flashlight(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/suit/caution(src)
	new /obj/item/holosign_creator(src)
	new /obj/item/lightreplacer(src)
	new /obj/item/soap(src)
	new /obj/item/storage/bag/trash(src)
	new /obj/item/clothing/shoes/galoshes(src)
	new /obj/item/watertank/janitor(src)
	new /obj/item/storage/belt/janitor(src)


/obj/structure/closet/lawcloset
	name = "шкаф законника"
	desc = "Хранилище для одежды и предметов для зала суда."
	icon_door = "blue"

/obj/structure/closet/lawcloset/PopulateContents()
	..()
	new /obj/item/clothing/under/suit/blacktwopiece(src)
	new /obj/item/clothing/under/rank/civilian/lawyer/female(src)
	new /obj/item/clothing/under/rank/civilian/lawyer/black(src)
	new /obj/item/clothing/under/rank/civilian/lawyer/red(src)
	new /obj/item/clothing/under/rank/civilian/lawyer/bluesuit(src)
	new /obj/item/clothing/suit/toggle/lawyer(src)
	new /obj/item/clothing/under/rank/civilian/lawyer/purpsuit(src)
	new /obj/item/clothing/suit/toggle/lawyer/purple(src)
	new /obj/item/clothing/under/suit/black(src)
	new /obj/item/clothing/suit/toggle/lawyer/black(src)
	new /obj/item/clothing/shoes/laceup(src)
	new /obj/item/clothing/shoes/laceup(src)
	new /obj/item/clothing/accessory/lawyers_badge(src)
	new /obj/item/clothing/accessory/lawyers_badge(src)

/obj/structure/closet/wardrobe/chaplain_black
	name = "гардероб часовни"
	desc = "Хранилище, для одобренной NanoTrasen религиозной одежды."
	icon_door = "black"

/obj/structure/closet/wardrobe/chaplain_black/PopulateContents()
	new /obj/item/choice_beacon/holy(src)
	new /obj/item/clothing/accessory/pocketprotector/cosmetology(src)
	new /obj/item/clothing/under/rank/civilian/chaplain(src)
	new /obj/item/clothing/shoes/sneakers/black(src)
	new /obj/item/clothing/suit/chaplainsuit/nun(src)
	new /obj/item/clothing/head/nun_hood(src)
	new /obj/item/clothing/suit/hooded/chaplainsuit/monkhabit(src)
	new /obj/item/clothing/suit/chaplainsuit/holidaypriest(src)
	new /obj/item/storage/backpack/cultpack(src)
	new /obj/item/storage/fancy/candle_box(src)
	new /obj/item/storage/fancy/candle_box(src)
	return

/obj/structure/closet/wardrobe/red
	name = "гардероб охраны"
	icon_door = "red"

/obj/structure/closet/wardrobe/red/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/suit/hooded/wintercoat/security = 1,
		/obj/item/storage/backpack/security = 1,
		/obj/item/storage/backpack/satchel/sec = 1,
		/obj/item/storage/backpack/duffelbag/sec = 2,
		/obj/item/clothing/under/rank/security/officer = 3,
		/obj/item/clothing/under/rank/security/officer/skirt = 2,
		/obj/item/clothing/shoes/jackboots = 3,
		/obj/item/clothing/head/beret/sec = 3,
		/obj/item/clothing/head/soft/sec = 3,
		/obj/item/clothing/mask/bandana/red = 2)
	generate_items_inside(items_inside,src)
	return

/obj/structure/closet/wardrobe/cargotech
	name = "гардероб карго"
	icon_door = "orange"

/obj/structure/closet/wardrobe/cargotech/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/suit/hooded/wintercoat/cargo = 1,
		/obj/item/clothing/under/rank/cargo/tech = 3,
		/obj/item/clothing/shoes/sneakers/black = 3,
		/obj/item/clothing/gloves/fingerless = 3,
		/obj/item/clothing/head/soft = 3,
		/obj/item/radio/headset/headset_cargo = 1)
	generate_items_inside(items_inside,src)

/obj/structure/closet/wardrobe/atmospherics_yellow
	name = "атмосферный гардероб"
	icon_door = "atmos_wardrobe"

/obj/structure/closet/wardrobe/atmospherics_yellow/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/accessory/pocketprotector = 1,
		/obj/item/storage/backpack/duffelbag/engineering = 1,
		/obj/item/storage/backpack/satchel/eng = 1,
		/obj/item/storage/backpack/industrial = 1,
		/obj/item/clothing/suit/hooded/wintercoat/engineering/atmos = 3,
		/obj/item/clothing/under/rank/engineering/atmospheric_technician = 3,
		/obj/item/clothing/shoes/sneakers/black = 3)
	generate_items_inside(items_inside,src)
	return

/obj/structure/closet/wardrobe/engineering_yellow
	name = "инженерный гардероб"
	icon_door = "yellow"

/obj/structure/closet/wardrobe/engineering_yellow/Initialize(mapload)
	. = ..()
	if(prob(10))
		name = "гардероб инженегров"

/obj/structure/closet/wardrobe/engineering_yellow/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/accessory/pocketprotector = 1,
		/obj/item/storage/backpack/duffelbag/engineering = 1,
		/obj/item/storage/backpack/industrial = 1,
		/obj/item/storage/backpack/satchel/eng = 1,
		/obj/item/clothing/suit/hooded/wintercoat/engineering = 1,
		/obj/item/clothing/under/rank/engineering/engineer = 3,
		/obj/item/clothing/suit/hazardvest = 3,
		/obj/item/clothing/shoes/workboots = 3,
		/obj/item/clothing/head/hardhat = 3)
	generate_items_inside(items_inside,src)
	return

/obj/structure/closet/wardrobe/white/medical
	name = "медицинский гардероб"

/obj/structure/closet/wardrobe/white/medical/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/accessory/pocketprotector = 1,
		/obj/item/storage/backpack/duffelbag/med = 1,
		/obj/item/storage/backpack/medic = 1,
		/obj/item/storage/backpack/satchel/med = 1,
		/obj/item/clothing/suit/hooded/wintercoat/medical = 1,
		/obj/item/clothing/under/rank/medical/doctor/nurse = 1,
		/obj/item/clothing/head/nursehat = 1,
		/obj/item/clothing/under/rank/medical/doctor/blue = 1,
		/obj/item/clothing/under/rank/medical/doctor/green = 1,
		/obj/item/clothing/under/rank/medical/doctor/purple = 1,
		/obj/item/clothing/under/rank/medical/doctor = 3,
		/obj/item/clothing/suit/toggle/labcoat = 3,
		/obj/item/clothing/suit/toggle/labcoat/paramedic = 3,
		/obj/item/clothing/shoes/sneakers/white = 3,
		/obj/item/clothing/head/soft/paramedic = 3)
	generate_items_inside(items_inside,src)
	return

/obj/structure/closet/wardrobe/robotics_black
	name = "гардероб робототехники"
	icon_door = "black"

/obj/structure/closet/wardrobe/robotics_black/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/glasses/hud/diagnostic = 2,
		/obj/item/clothing/under/rank/rnd/roboticist = 2,
		/obj/item/clothing/suit/toggle/labcoat = 2,
		/obj/item/clothing/shoes/sneakers/black = 2,
		/obj/item/clothing/gloves/fingerless = 2,
		/obj/item/clothing/head/soft/black = 2)
	generate_items_inside(items_inside,src)
	if(prob(40))
		new /obj/item/clothing/mask/bandana/skull(src)
	if(prob(40))
		new /obj/item/clothing/mask/bandana/skull(src)
	return


/obj/structure/closet/wardrobe/chemistry_white
	name = "гардероб химии"
	icon_door = "white"

/obj/structure/closet/wardrobe/chemistry_white/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/under/rank/medical/chemist = 2,
		/obj/item/clothing/shoes/sneakers/white = 2,
		/obj/item/clothing/suit/toggle/labcoat/chemist = 2,
		/obj/item/storage/backpack/chemistry = 2,
		/obj/item/storage/backpack/satchel/chem = 2,
		/obj/item/storage/bag/chemistry = 2)
	generate_items_inside(items_inside,src)
	return


/obj/structure/closet/wardrobe/genetics_white
	name = "гардероб генетики"
	icon_door = "white"

/obj/structure/closet/wardrobe/genetics_white/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/under/rank/rnd/geneticist = 2,
		/obj/item/clothing/shoes/sneakers/white = 2,
		/obj/item/clothing/suit/toggle/labcoat/genetics = 2,
		/obj/item/storage/backpack/genetics = 2,
		/obj/item/storage/backpack/satchel/gen = 2)
	generate_items_inside(items_inside,src)
	return


/obj/structure/closet/wardrobe/virology_white
	name = "гардероб вирусологии"
	icon_door = "white"

/obj/structure/closet/wardrobe/virology_white/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/under/rank/medical/virologist = 2,
		/obj/item/clothing/shoes/sneakers/white = 2,
		/obj/item/clothing/suit/toggle/labcoat/virologist = 2,
		/obj/item/clothing/mask/surgical = 2,
		/obj/item/storage/backpack/virology = 2,
		/obj/item/storage/backpack/satchel/vir = 2)
	generate_items_inside(items_inside,src)
	return

/obj/structure/closet/wardrobe/science_white
	name = "гардероб ученых"
	icon_door = "white"

/obj/structure/closet/wardrobe/science_white/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/accessory/pocketprotector = 1,
		/obj/item/storage/backpack/science = 2,
		/obj/item/storage/backpack/satchel/tox = 2,
		/obj/item/clothing/suit/hooded/wintercoat/science = 1,
		/obj/item/clothing/under/rank/rnd/scientist = 3,
		/obj/item/clothing/suit/toggle/labcoat/science = 3,
		/obj/item/clothing/shoes/sneakers/white = 3,
		/obj/item/radio/headset/headset_sci = 2,
		/obj/item/clothing/mask/gas = 3)
	generate_items_inside(items_inside,src)
	return

/obj/structure/closet/wardrobe/botanist
	name = "гардероб ботаники"
	icon_door = "green"

/obj/structure/closet/wardrobe/botanist/PopulateContents()
	var/static/items_inside = list(
		/obj/item/storage/backpack/botany = 2,
		/obj/item/storage/backpack/satchel/hyd = 2,
		/obj/item/clothing/suit/hooded/wintercoat/hydro = 1,
		/obj/item/clothing/suit/apron = 2,
		/obj/item/clothing/suit/apron/overalls = 2,
		/obj/item/clothing/under/rank/civilian/hydroponics = 3,
		/obj/item/clothing/mask/bandana = 3)
	generate_items_inside(items_inside,src)

/obj/structure/closet/wardrobe/curator
	name = "гардероб охотников за сокровищами"
	icon_door = "black"

/obj/structure/closet/wardrobe/curator/PopulateContents()
	new /obj/item/clothing/head/fedora/curator(src)
	new /obj/item/clothing/suit/curator(src)
	new /obj/item/clothing/under/rank/civilian/curator/treasure_hunter(src)
	new /obj/item/clothing/shoes/workboots/mining(src)
	new /obj/item/storage/backpack/satchel/explorer(src)

