

/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////// DRINKS BELOW, Beer is up there though, along with cola. Cap'n Pete's Cuban Spiced Rum////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/reagent/consumable/orangejuice
	name = "Апельсиновый Сок"
	description = "Both delicious AND rich in Vitamin C, what more do you need?"
	color = "#E78108" // rgb: 231, 129, 8
	taste_description = "апельсины"
	glass_icon_state = "glass_orange"
	glass_name = "стакан orange juice"
	glass_desc = "Vitamins! Yay!"
	ph = 3.3
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_MEDIUM

/datum/reagent/consumable/orangejuice/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	if(M.getOxyLoss() && DT_PROB(16, delta_time))
		M.adjustOxyLoss(-1, 0)
		. = TRUE
	..()

/datum/reagent/consumable/tomatojuice
	name = "Томатный Сок"
	description = "Tomatoes made into juice. What a waste of big, juicy tomatoes, huh?"
	color = "#731008" // rgb: 115, 16, 8
	taste_description = "томаты"
	glass_icon_state = "glass_red"
	glass_name = "стакан tomato juice"
	glass_desc = "Are you sure this is tomato juice?"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_LOW

/datum/reagent/consumable/tomatojuice/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	if(M.getFireLoss() && DT_PROB(10, delta_time))
		M.heal_bodypart_damage(0, 1, 0)
		. = TRUE
	..()

/datum/reagent/consumable/limejuice
	name = "Сок Лайма"
	description = "The sweet-sour juice of limes."
	color = "#365E30" // rgb: 54, 94, 48
	taste_description = "невыносимая кислинка"
	glass_icon_state = "glass_green"
	glass_name = "стакан lime juice"
	glass_desc = "A glass of sweet-sour lime juice."
	ph = 2.2
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_LOW

/datum/reagent/consumable/limejuice/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	if(M.getToxLoss() && DT_PROB(10, delta_time))
		M.adjustToxLoss(-1, 0)
		. = TRUE
	..()

/datum/reagent/consumable/carrotjuice
	name = "Морковный Сок"
	description = "It is just like a carrot but without crunching."
	color = "#973800" // rgb: 151, 56, 0
	taste_description = "морковки"
	glass_icon_state = "carrotjuice"
	glass_name = "стакан  carrot juice"
	glass_desc = "It's just like a carrot but without crunching."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_MEDIUM

/datum/reagent/consumable/carrotjuice/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.adjust_blurriness(-1 * REM * delta_time)
	M.adjust_blindness(-1 * REM * delta_time)
	switch(current_cycle)
		if(1 to 20)
			//nothing
		if(21 to 110)
			if(DT_PROB(100 * (1 - (sqrt(110 - current_cycle) / 10)), delta_time))
				M.cure_nearsighted(list(EYE_DAMAGE))
		if(110 to INFINITY)
			M.cure_nearsighted(list(EYE_DAMAGE))
	..()
	return

/datum/reagent/consumable/berryjuice
	name = "Сок Ягод"
	description = "A delicious blend of several different kinds of berries."
	color = "#863333" // rgb: 134, 51, 51
	taste_description = "ягоды"
	glass_icon_state = "berryjuice"
	glass_name = "стакан berry juice"
	glass_desc = "Berry juice. Or maybe it's jam. Who cares?"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_MEDIUM

/datum/reagent/consumable/applejuice
	name = "Яблочный Сок"
	description = "The sweet juice of an apple, fit for all ages."
	color = "#ECFF56" // rgb: 236, 255, 86
	taste_description = "яблоки"
	ph = 3.2 // ~ 2.7 -> 3.7
	hydration_factor = DRINK_HYDRATION_FACTOR_MEDIUM

/datum/reagent/consumable/poisonberryjuice
	name = "Сок Ядовитых Ягод"
	description = "A tasty juice blended from various kinds of very deadly and toxic berries."
	color = "#863353" // rgb: 134, 51, 83
	taste_description = "ягоды"
	glass_icon_state = "poisonberryjuice"
	glass_name = "стакан berry juice"
	glass_desc = "Berry juice. Or maybe it's poison. Who cares?"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_SALTY

/datum/reagent/consumable/poisonberryjuice/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.adjustToxLoss(1 * REM * delta_time, 0)
	. = TRUE
	..()

/datum/reagent/consumable/watermelonjuice
	name = "Арбуз"
	description = "Delicious juice made from watermelon."
	color = "#863333" // rgb: 134, 51, 51
	taste_description = "сочный арбуз"
	glass_icon_state = "glass_red"
	glass_name = "стакан watermelon juice"
	glass_desc = "A glass of watermelon juice."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_HIGH

/datum/reagent/consumable/lemonjuice
	name = "Лимонный Сок"
	description = "This juice is VERY sour."
	color = "#863333" // rgb: 175, 175, 0
	taste_description = "кислотность"
	glass_icon_state  = "lemonglass"
	glass_name = "стакан lemon juice"
	glass_desc = "Sour..."
	ph = 2
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_LOW

/datum/reagent/consumable/banana
	name = "Банановый Сок"
	description = "The raw essence of a banana. HONK"
	color = "#863333" // rgb: 175, 175, 0
	taste_description = "банан"
	glass_icon_state = "banana"
	glass_name = "стакан banana juice"
	glass_desc = "The raw essence of a banana. HONK."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_LOW

/datum/reagent/consumable/banana/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	var/obj/item/organ/liver/liver = M.getorganslot(ORGAN_SLOT_LIVER)
	if((liver && HAS_TRAIT(liver, TRAIT_COMEDY_METABOLISM)) || ismonkey(M))
		M.heal_bodypart_damage(1 * REM * delta_time, 1 * REM * delta_time, 0)
		. = TRUE
	..()

/datum/reagent/consumable/nothing
	name = "Ничего"
	description = "Absolutely nothing."
	taste_description = "ничего"
	glass_icon_state = "nothing"
	glass_name = "nothing"
	glass_desc = "Absolutely nothing."
	shot_glass_icon_state = "shotglass"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_HIGH

/datum/reagent/consumable/nothing/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	if(ishuman(M) && M.mind?.miming)
		M.silent = max(M.silent, MIMEDRINK_SILENCE_DURATION)
		M.heal_bodypart_damage(1 * REM * delta_time, 1 * REM * delta_time)
		. = TRUE
	..()

/datum/reagent/consumable/laughter
	name = "Хохотач"
	description = "Some say that this is the best medicine, but recent studies have proven that to be untrue."
	metabolization_rate = INFINITY
	color = "#FF4DD2"
	taste_description = "ржака"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_HIGH

/datum/reagent/consumable/laughter/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.emote("laugh")
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "chemical_laughter", /datum/mood_event/chemical_laughter)
	..()

/datum/reagent/consumable/superlaughter
	name = "Полный Хохотач"
	description = "Funny until you're the one laughing."
	metabolization_rate = 1.5 * REAGENTS_METABOLISM
	color = "#FF4DD2"
	taste_description = "ржака"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_HIGH

/datum/reagent/consumable/superlaughter/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	if(DT_PROB(16, delta_time))
		M.visible_message(span_danger("[M] разразился приступом неконтролируемого смеха!") , span_userdanger("Зашелся в приступе неконтролируемого смеха!"))
		M.Stun(5)
		SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "chemical_laughter", /datum/mood_event/chemical_superlaughter)
	..()

/datum/reagent/consumable/potato_juice
	name = "Картофельный Сок"
	description = "Juice of the potato. Bleh."
	nutriment_factor = 2 * REAGENTS_METABOLISM
	color = "#302000" // rgb: 48, 32, 0
	taste_description = "ирландская грусть"
	glass_icon_state = "glass_brown"
	glass_name = "стакан potato juice"
	glass_desc = "Bleh..."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_SALTY

/datum/reagent/consumable/grapejuice
	name = "Виноградный Сок"
	description = "The juice of a bunch of grapes. Guaranteed non-alcoholic."
	color = "#290029" // dark purple
	taste_description = "виноградная сода"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_MEDIUM

/datum/reagent/consumable/milk
	name = "Молоко"
	description = "An opaque white liquid produced by the mammary glands of mammals."
	color = "#DFDFDF" // rgb: 223, 223, 223
	taste_description = "молоко"
	glass_icon_state = "glass_white"
	glass_name = "стакан milk"
	glass_desc = "White and nutritious goodness!"
	ph = 6.5
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_MEDIUM

	// Milk is good for humans, but bad for plants. The sugars cannot be used by plants, and the milk fat harms growth. Not shrooms though. I can't deal with this now...
/datum/reagent/consumable/milk/on_hydroponics_apply(obj/item/seeds/myseed, datum/reagents/chems, obj/machinery/hydroponics/mytray, mob/user)
	. = ..()
	if(chems.has_reagent(type, 1))
		mytray.adjustWater(round(chems.get_reagent_amount(type) * 0.3))
		if(myseed)
			myseed.adjust_potency(-chems.get_reagent_amount(type) * 0.5)

/datum/reagent/consumable/milk/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	if(M.getBruteLoss() && DT_PROB(10, delta_time))
		M.heal_bodypart_damage(1,0, 0)
		. = TRUE
	if(holder.has_reagent(/datum/reagent/consumable/capsaicin))
		holder.remove_reagent(/datum/reagent/consumable/capsaicin, 1 * delta_time)
	..()

/datum/reagent/consumable/soymilk
	name = "Соевое Молоко"
	description = "An opaque white liquid made from soybeans."
	color = "#DFDFC7" // rgb: 223, 223, 199
	taste_description = "соевое молоко"
	glass_icon_state = "glass_white"
	glass_name = "стакан soy milk"
	glass_desc = "White and nutritious soy goodness!"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_MEDIUM

/datum/reagent/consumable/soymilk/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	if(M.getBruteLoss() && DT_PROB(10, delta_time))
		M.heal_bodypart_damage(1, 0, 0)
		. = TRUE
	..()

/datum/reagent/consumable/cream
	name = "Сливки"
	description = "The fatty, still liquid part of milk. Why don't you mix this with sum scotch, eh?"
	color = "#DFD7AF" // rgb: 223, 215, 175
	taste_description = "сливочное молоко"
	glass_icon_state  = "glass_white"
	glass_name = "стакан cream"
	glass_desc = "Ewwww..."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_LOW

/datum/reagent/consumable/cream/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	if(M.getBruteLoss() && DT_PROB(10, delta_time))
		M.heal_bodypart_damage(1, 0, 0)
		. = TRUE
	..()

/datum/reagent/consumable/coffee
	name = "Кофе"
	description = "Coffee is a brewed drink prepared from roasted seeds, commonly called coffee beans, of the coffee plant."
	color = "#482000" // rgb: 72, 32, 0
	nutriment_factor = 0
	overdose_threshold = 80
	taste_description = "горечь"
	glass_icon_state = "glass_brown"
	glass_name = "стакан coffee"
	glass_desc = "Don't drop it, or you'll send scalding liquid and glass shards everywhere."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	glass_price = DRINK_PRICE_STOCK
	hydration_factor = DRINK_HYDRATION_FACTOR_HIGH

/datum/reagent/consumable/coffee/overdose_process(mob/living/M, delta_time, times_fired)
	M.Jitter(5 * REM * delta_time)
	..()

/datum/reagent/consumable/coffee/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.dizziness = max(M.dizziness - (5 * REM * delta_time), 0)
	M.drowsyness = max(M.drowsyness - (3 * REM * delta_time), 0)
	M.AdjustSleeping(-40 * REM * delta_time)
	//310.15 is the normal bodytemp.
	M.adjust_bodytemperature(25 * REM * TEMPERATURE_DAMAGE_COEFFICIENT * delta_time, 0, M.get_body_temp_normal())
	if(holder.has_reagent(/datum/reagent/consumable/frostoil))
		holder.remove_reagent(/datum/reagent/consumable/frostoil, 5 * REM * delta_time)
	..()
	. = TRUE

/datum/reagent/consumable/tea
	name = "Чай"
	description = "Tasty black tea, it has antioxidants, it's good for you!"
	color = "#101000" // rgb: 16, 16, 0
	nutriment_factor = 0
	taste_description = "пирог и черный чай"
	glass_icon_state = "teaglass"
	glass_name = "стакан tea"
	glass_desc = "Drinking it from here would not seem right."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	glass_price = DRINK_PRICE_STOCK
	hydration_factor = DRINK_HYDRATION_FACTOR_HIGH

/datum/reagent/consumable/tea/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.dizziness = max(M.dizziness - (2 * REM * delta_time), 0)
	M.drowsyness = max(M.drowsyness - (1 * REM * delta_time), 0)
	M.jitteriness = max(M.jitteriness - (3 * REM * delta_time), 0)
	M.AdjustSleeping(-20 * REM * delta_time)
	if(M.getToxLoss() && DT_PROB(10, delta_time))
		M.adjustToxLoss(-1, 0)
	M.adjust_bodytemperature(20 * REM * TEMPERATURE_DAMAGE_COEFFICIENT * delta_time, 0, M.get_body_temp_normal())
	..()
	. = TRUE

/datum/reagent/consumable/lemonade
	name = "Лимонад"
	description = "Sweet, tangy lemonade. Good for the soul."
	color = "#FFE978"
	quality = DRINK_NICE
	taste_description = "солнце и лето"
	glass_icon_state = "lemonpitcher"
	glass_name = "pitcher of lemonade"
	glass_desc = "This drink leaves you feeling nostalgic for some reason."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	glass_price = DRINK_PRICE_EASY
	hydration_factor = DRINK_HYDRATION_FACTOR_HIGH

/datum/reagent/consumable/tea/arnold_palmer
	name = "Арнольд Палмер"
	description = "Encourages the patient to go golfing."
	color = "#FFB766"
	quality = DRINK_NICE
	nutriment_factor = 2
	taste_description = "горький чай"
	glass_icon_state = "arnold_palmer"
	glass_name = "Arnold Palmer"
	glass_desc = "You feel like taking a few golf swings after a few swigs of this."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED

/datum/reagent/consumable/tea/arnold_palmer/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	if(DT_PROB(2.5, delta_time))
		to_chat(M, span_notice("[pick("Вспомнил что нужно расправить плечи.","Вспомнил что нужно опустить голову.","Не могу решить что делать, расправить плечи или опустить голову.","Вспомнил что нужно расслабиться.","Думаю, однажды, я улучшу свой счет в гольфе, снизив его на два удара.")]"))
	..()
	. = TRUE

/datum/reagent/consumable/icecoffee
	name = "Холодный Кофе"
	description = "Coffee and ice, refreshing and cool."
	color = "#102838" // rgb: 16, 40, 56
	nutriment_factor = 0
	taste_description = "горький холод"
	glass_icon_state = "icedcoffeeglass"
	glass_name = "iced coffee"
	glass_desc = "A drink to perk you up and refresh you!"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_HIGH

/datum/reagent/consumable/icecoffee/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.dizziness = max(M.dizziness - (5 * REM * delta_time), 0)
	M.drowsyness = max(M.drowsyness - (3 * REM * delta_time), 0)
	M.AdjustSleeping(-40 * REM * delta_time)
	M.adjust_bodytemperature(-5 * REM * TEMPERATURE_DAMAGE_COEFFICIENT * delta_time, M.get_body_temp_normal())
	M.Jitter(5 * REM * delta_time)
	..()
	. = TRUE

/datum/reagent/consumable/hot_ice_coffee
	name = "Горячий Кофе со льдом"
	description = "Coffee with pulsing ice shards"
	color = "#102838" // rgb: 16, 40, 56
	nutriment_factor = 0
	taste_description = "горечь и намёк на дым"
	glass_icon_state = "hoticecoffee"
	glass_name = "hot ice coffee"
	glass_desc = "A sharp drink, this can't have come cheap"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_HIGH

/datum/reagent/consumable/hot_ice_coffee/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.dizziness = max(M.dizziness - (5 * REM * delta_time), 0)
	M.drowsyness = max(M.drowsyness - (3 * REM * delta_time), 0)
	M.AdjustSleeping(-60 * REM * delta_time)
	M.adjust_bodytemperature(-7 * REM * TEMPERATURE_DAMAGE_COEFFICIENT * delta_time, M.get_body_temp_normal())
	M.Jitter(5 * REM * delta_time)
	M.adjustToxLoss(1 * REM * delta_time, 0)
	..()
	. = TRUE

/datum/reagent/consumable/icetea
	name = "Холодный Чай"
	description = "No relation to a certain rap artist/actor."
	color = "#104038" // rgb: 16, 64, 56
	nutriment_factor = 0
	taste_description = "сладкий чай"
	glass_icon_state = "icedteaglass"
	glass_name = "iced tea"
	glass_desc = "All natural, antioxidant-rich flavour sensation."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_HIGH

/datum/reagent/consumable/icetea/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.dizziness = max(M.dizziness - (2 * REM * delta_time), 0)
	M.drowsyness = max(M.drowsyness - (1 * REM * delta_time), 0)
	M.AdjustSleeping(-40 * REM * delta_time)
	if(M.getToxLoss() && DT_PROB(10, delta_time))
		M.adjustToxLoss(-1, 0)
	M.adjust_bodytemperature(-5 * REM * TEMPERATURE_DAMAGE_COEFFICIENT * delta_time, M.get_body_temp_normal())
	..()
	. = TRUE

/datum/reagent/consumable/space_cola
	name = "Кола"
	description = "A refreshing beverage."
	color = "#100800" // rgb: 16, 8, 0
	taste_description = "кола"
	glass_icon_state  = "spacecola"
	glass_name = "стакан Space Cola"
	glass_desc = "A glass of refreshing Space Cola."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_MEDIUM

/datum/reagent/consumable/space_cola/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.drowsyness = max(M.drowsyness - (5 * REM * delta_time), 0)
	M.adjust_bodytemperature(-5 * REM * TEMPERATURE_DAMAGE_COEFFICIENT * delta_time, M.get_body_temp_normal())
	..()

/datum/reagent/consumable/nuka_cola
	name = "Нюка Кола"
	description = "Cola, cola never changes."
	special_sound = 'white/valtos/sounds/drink/fallout_3.ogg'
	color = "#100800" // rgb: 16, 8, 0
	quality = DRINK_VERYGOOD
	taste_description = "будущее"
	glass_icon_state = "nuka_colaglass"
	glass_name = "стакан Nuka Cola"
	glass_desc = "Don't cry, Don't raise your eye, It's only nuclear wasteland."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_MEDIUM

/datum/reagent/consumable/nuka_cola/on_mob_metabolize(mob/living/L)
	..()
	L.add_movespeed_modifier(/datum/movespeed_modifier/reagent/nuka_cola)

/datum/reagent/consumable/nuka_cola/on_mob_end_metabolize(mob/living/L)
	L.remove_movespeed_modifier(/datum/movespeed_modifier/reagent/nuka_cola)
	..()

/datum/reagent/consumable/nuka_cola/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.Jitter(20 * REM * delta_time)
	M.set_drugginess(30 * REM * delta_time)
	M.dizziness += 1.5 * REM * delta_time
	M.drowsyness = 0
	M.AdjustSleeping(-40 * REM * delta_time)
	M.adjust_bodytemperature(-5 * REM * TEMPERATURE_DAMAGE_COEFFICIENT * delta_time, M.get_body_temp_normal())
	..()
	. = TRUE

/datum/reagent/consumable/grey_bull
	name = "Grey Bull"
	description = "Grey Bull, it gives you gloves!"
	color = "#EEFF00" // rgb: 238, 255, 0
	quality = DRINK_VERYGOOD
	taste_description = "газированное масло"
	glass_icon_state = "grey_bull_glass"
	glass_name = "стакан Grey Bull"
	glass_desc = "Surprisingly it isn't grey."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_LOW

/datum/reagent/consumable/grey_bull/on_mob_metabolize(mob/living/L)
	..()
	ADD_TRAIT(L, TRAIT_SHOCKIMMUNE, type)

/datum/reagent/consumable/grey_bull/on_mob_end_metabolize(mob/living/L)
	REMOVE_TRAIT(L, TRAIT_SHOCKIMMUNE, type)
	..()

/datum/reagent/consumable/grey_bull/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.Jitter(20 * REM * delta_time)
	M.dizziness += 1 * REM * delta_time
	M.drowsyness = 0
	M.AdjustSleeping(-40 * REM * delta_time)
	M.adjust_bodytemperature(-5 * REM * TEMPERATURE_DAMAGE_COEFFICIENT * delta_time, M.get_body_temp_normal())
	..()

/datum/reagent/consumable/spacemountainwind
	name = "SM Wind"
	description = "Blows right through you like a space wind."
	color = "#102000" // rgb: 16, 32, 0
	taste_description = "сладкая цитрусовая сода"
	glass_icon_state = "Space_mountain_wind_glass"
	glass_name = "стакан Space Mountain Wind"
	glass_desc = "Space Mountain Wind. As you know, there are no mountains in space, only wind."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_LOW

/datum/reagent/consumable/spacemountainwind/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.drowsyness = max(M.drowsyness - (7 * REM * delta_time), 0)
	M.AdjustSleeping(-20 * REM * delta_time)
	M.adjust_bodytemperature(-5 * REM * TEMPERATURE_DAMAGE_COEFFICIENT * delta_time, M.get_body_temp_normal())
	M.Jitter(5 * REM * delta_time)
	..()
	. = TRUE

/datum/reagent/consumable/dr_gibb
	name = "Dr. Gibb"
	description = "A delicious blend of 42 different flavours."
	color = "#102000" // rgb: 16, 32, 0
	taste_description = "вишневая сода" // FALSE ADVERTISING
	glass_icon_state = "dr_gibb_glass"
	glass_name = "стакан Dr. Gibb"
	glass_desc = "Dr. Gibb. Not as dangerous as the glass_name might imply."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_LOW

/datum/reagent/consumable/dr_gibb/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.drowsyness = max(M.drowsyness - (6 * REM * delta_time), 0)
	M.adjust_bodytemperature(-5 * REM * TEMPERATURE_DAMAGE_COEFFICIENT * delta_time, M.get_body_temp_normal())
	..()

/datum/reagent/consumable/space_up
	name = "Space-Up"
	description = "Tastes like a hull breach in your mouth."
	color = "#00FF00" // rgb: 0, 255, 0
	taste_description = "вишневая сода"
	glass_icon_state = "space-up_glass"
	glass_name = "стакан Space-Up"
	glass_desc = "Space-up. It helps you keep your cool."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_LOW


/datum/reagent/consumable/space_up/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.adjust_bodytemperature(-8 * REM * TEMPERATURE_DAMAGE_COEFFICIENT * delta_time, M.get_body_temp_normal())
	..()

/datum/reagent/consumable/lemon_lime
	name = "Lemon Lime"
	description = "A tangy substance made of 0.5% natural citrus!"
	color = "#8CFF00" // rgb: 135, 255, 0
	taste_description = "острый лайм и лимонная сода"
	glass_icon_state = "lemonlime"
	glass_name = "стакан lemon-lime"
	glass_desc = "You're pretty certain a real fruit has never actually touched this."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_LOW


/datum/reagent/consumable/lemon_lime/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.adjust_bodytemperature(-8 * REM * TEMPERATURE_DAMAGE_COEFFICIENT * delta_time, M.get_body_temp_normal())
	..()


/datum/reagent/consumable/pwr_game
	name = "Pwr Game"
	description = "The only drink with the PWR that true gamers crave."
	color = "#9385bf" // rgb: 58, 52, 75
	taste_description = "сладкий и соленый запах"
	glass_icon_state = "pwrggame"
	glass_name = "стакан Pwr Game"
	glass_desc = "Goes well with a Vlad's salad."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED

/datum/reagent/consumable/pwr_game/expose_mob(mob/living/exposed_mob, methods=TOUCH, reac_volume)
	. = ..()
	if(exposed_mob?.mind?.get_skill_level(/datum/skill/gaming) >= SKILL_LEVEL_LEGENDARY && (methods & INGEST) && !HAS_TRAIT(exposed_mob, TRAIT_GAMERGOD))
		ADD_TRAIT(exposed_mob, TRAIT_GAMERGOD, "pwr_game")
		to_chat(exposed_mob, "<span class='nicegreen'>Выпив Pwr Game, я распахнул геймерский третий глаз... \
		Чувствую, будто мне открылась великая загадка вселенной...</span>")

/datum/reagent/consumable/pwr_game/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.adjust_bodytemperature(-8 * REM * TEMPERATURE_DAMAGE_COEFFICIENT * delta_time, M.get_body_temp_normal())
	if(DT_PROB(5, delta_time))
		M.mind?.adjust_experience(/datum/skill/gaming, 5)
	..()

/datum/reagent/consumable/shamblers
	name = "Shambler's Juice"
	description = "~Shake me up some of that Shambler's Juice!~"
	color = "#f00060" // rgb: 94, 0, 38
	taste_description = "газированная металлическая сода"
	glass_icon_state = "shamblerjuice"
	glass_name = "стакан Shambler's juice"
	glass_desc = "Mmm mm, shambly."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_LOW

/datum/reagent/consumable/shamblers/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.adjust_bodytemperature(-8 * REM * TEMPERATURE_DAMAGE_COEFFICIENT * delta_time, M.get_body_temp_normal())
	..()

/datum/reagent/consumable/sodawater
	name = "Газированная Вода"
	description = "A can of club soda. Why not make a scotch and soda?"
	color = "#619494" // rgb: 97, 148, 148
	taste_description = "газировка"
	glass_icon_state = "glass_clearcarb"
	glass_name = "стакан soda water"
	glass_desc = "Soda water. Why not make a scotch and soda?"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_HIGH


	// A variety of nutrients are dissolved in club soda, without sugar.
	// These nutrients include carbon, oxygen, hydrogen, phosphorous, potassium, sulfur and sodium, all of which are needed for healthy plant growth.
/datum/reagent/consumable/sodawater/on_hydroponics_apply(obj/item/seeds/myseed, datum/reagents/chems, obj/machinery/hydroponics/mytray, mob/user)
	. = ..()
	if(chems.has_reagent(type, 1))
		mytray.adjustWater(round(chems.get_reagent_amount(type) * 1))
		mytray.adjustHealth(round(chems.get_reagent_amount(type) * 0.1))

/datum/reagent/consumable/sodawater/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.dizziness = max(M.dizziness - (5 * REM * delta_time), 0)
	M.drowsyness = max(M.drowsyness - (3 * REM * delta_time), 0)
	M.adjust_bodytemperature(-5 * REM * TEMPERATURE_DAMAGE_COEFFICIENT * delta_time, M.get_body_temp_normal())
	..()

/datum/reagent/consumable/tonic
	name = "Тонизирующая Вода"
	description = "It tastes strange but at least the quinine keeps the Space Malaria at bay."
	color = "#0064C8" // rgb: 0, 100, 200
	taste_description = "терпкий и свежий"
	glass_icon_state = "glass_clearcarb"
	glass_name = "стакан tonic water"
	glass_desc = "Quinine tastes funny, but at least it'll keep that Space Malaria away."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_HIGH

/datum/reagent/consumable/tonic/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.dizziness = max(M.dizziness - (5 * REM * delta_time), 0)
	M.drowsyness = max(M.drowsyness - (3 * REM * delta_time), 0)
	M.AdjustSleeping(-40 * REM * delta_time)
	M.adjust_bodytemperature(-5 * REM * TEMPERATURE_DAMAGE_COEFFICIENT * delta_time, M.get_body_temp_normal())
	..()
	. = TRUE

/datum/reagent/consumable/monkey_energy
	name = "Monkey Energy"
	description = "The only drink that will make you unleash the ape."
	color = "#f39b03" // rgb: 243, 155, 3
	overdose_threshold = 60
	taste_description = "барбекю и ностальгия"
	glass_icon_state = "monkey_energy_glass"
	glass_name = "стакан Monkey Energy"
	glass_desc = "You can unleash the ape, but without the pop of the can?"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_LOW

/datum/reagent/consumable/monkey_energy/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.Jitter(40 * REM * delta_time)
	M.dizziness += 1 * REM * delta_time
	M.drowsyness = 0
	M.AdjustSleeping(-40 * REM * delta_time)
	M.adjust_bodytemperature(-5 * REM * TEMPERATURE_DAMAGE_COEFFICIENT * delta_time, M.get_body_temp_normal())
	..()

/datum/reagent/consumable/monkey_energy/on_mob_metabolize(mob/living/L)
	..()
	if(ismonkey(L))
		L.add_movespeed_modifier(/datum/movespeed_modifier/reagent/monkey_energy)

/datum/reagent/consumable/monkey_energy/on_mob_end_metabolize(mob/living/L)
	L.remove_movespeed_modifier(/datum/movespeed_modifier/reagent/monkey_energy)
	..()

/datum/reagent/consumable/monkey_energy/overdose_process(mob/living/M, delta_time, times_fired)
	if(DT_PROB(7.5, delta_time))
		M.say(pick_list_replacements(BOOMER_FILE, "boomer"), forced = /datum/reagent/consumable/monkey_energy)
	..()

/datum/reagent/consumable/ice
	name = "Лед"
	description = "Frozen water, your dentist wouldn't like you chewing this."
	reagent_state = SOLID
	color = "#619494" // rgb: 97, 148, 148
	taste_description = "лёд"
	glass_icon_state = "iceglass"
	glass_name = "стакан ice"
	glass_desc = "Generally, you're supposed to put something else in there too..."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED

/datum/reagent/consumable/ice/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.adjust_bodytemperature(-5 * REM * TEMPERATURE_DAMAGE_COEFFICIENT * delta_time, M.get_body_temp_normal())
	..()

/datum/reagent/consumable/soy_latte
	name = "Соевое Латте"
	description = "A nice and tasty beverage while you are reading your hippie books."
	color = "#664300" // rgb: 102, 67, 0
	quality = DRINK_NICE
	taste_description = "сливочное кофе"
	glass_icon_state = "soy_latte"
	glass_name = "soy latte"
	glass_desc = "A nice and refreshing beverage while you're reading."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	glass_price = DRINK_PRICE_EASY
	hydration_factor = DRINK_HYDRATION_FACTOR_MEDIUM

/datum/reagent/consumable/soy_latte/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.dizziness = max(M.dizziness - (5 * REM * delta_time), 0)
	M.drowsyness = max(M.drowsyness - (3 *REM * delta_time), 0)
	M.SetSleeping(0)
	M.adjust_bodytemperature(5 * REM * TEMPERATURE_DAMAGE_COEFFICIENT * delta_time, 0, M.get_body_temp_normal())
	M.Jitter(5 * REM * delta_time)
	if(M.getBruteLoss() && DT_PROB(10, delta_time))
		M.heal_bodypart_damage(1,0, 0)
	..()
	. = TRUE

/datum/reagent/consumable/cafe_latte
	name = "Латте"
	description = "A nice, strong and tasty beverage while you are reading."
	color = "#664300" // rgb: 102, 67, 0
	quality = DRINK_NICE
	taste_description = "горький крем"
	glass_icon_state = "cafe_latte"
	glass_name = "cafe latte"
	glass_desc = "A nice, strong and refreshing beverage while you're reading."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	glass_price = DRINK_PRICE_EASY
	hydration_factor = DRINK_HYDRATION_FACTOR_MEDIUM

/datum/reagent/consumable/cafe_latte/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.dizziness = max(M.dizziness - (5 * REM * delta_time), 0)
	M.drowsyness = max(M.drowsyness - (6 * REM * delta_time), 0)
	M.SetSleeping(0)
	M.adjust_bodytemperature(5 * REM * TEMPERATURE_DAMAGE_COEFFICIENT * delta_time, 0, M.get_body_temp_normal())
	M.Jitter(5 * REM * delta_time)
	if(M.getBruteLoss() && DT_PROB(10, delta_time))
		M.heal_bodypart_damage(1, 0, 0)
	..()
	. = TRUE

/datum/reagent/consumable/doctor_delight
	name = "Докторский Восторг"
	description = "A gulp a day keeps the Medibot away! A mixture of juices that heals most damage types fairly quickly at the cost of hunger."
	color = "#FF8CFF" // rgb: 255, 140, 255
	quality = DRINK_VERYGOOD
	taste_description = "домашний фрукт"
	glass_icon_state = "doctorsdelightglass"
	glass_name = "Doctor's Delight"
	glass_desc = "The space doctor's favorite. Guaranteed to restore bodily injury; side effects include cravings and hunger."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_HIGH

/datum/reagent/consumable/doctor_delight/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.adjustBruteLoss(-0.5 * REM * delta_time, 0)
	M.adjustFireLoss(-0.5 * REM * delta_time, 0)
	M.adjustToxLoss(-0.5 * REM * delta_time, 0)
	M.adjustOxyLoss(-0.5 * REM * delta_time, 0)
	if(M.nutrition && (M.nutrition - 2 > 0))
		var/obj/item/organ/liver/liver = M.getorganslot(ORGAN_SLOT_LIVER)
		if(!(HAS_TRAIT(liver, TRAIT_MEDICAL_METABOLISM)))
			// Drains the nutrition of the holder. Not medical doctors though, since it's the Doctor's Delight!
			M.adjust_nutrition(-2 * REM * delta_time)
	..()
	. = TRUE

/datum/reagent/consumable/cherryshake
	name = "Вишневый шейк"
	description = "A cherry flavored milkshake."
	color = "#FFB6C1"
	quality = DRINK_VERYGOOD
	nutriment_factor = 4 * REAGENTS_METABOLISM
	taste_description = "сливочная вишня"
	glass_icon_state = "cherryshake"
	glass_name = "cherry shake"
	glass_desc = "A cherry flavored milkshake."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	glass_price = DRINK_PRICE_MEDIUM
	hydration_factor = DRINK_HYDRATION_FACTOR_MEDIUM

/datum/reagent/consumable/bluecherryshake
	name = "Шейк с синей вишней"
	description = "An exotic milkshake."
	color = "#00F1FF"
	quality = DRINK_VERYGOOD
	nutriment_factor = 4 * REAGENTS_METABOLISM
	taste_description = "сливочно-голубая вишня"
	glass_icon_state = "bluecherryshake"
	glass_name = "синий cherry shake"
	glass_desc = "An exotic blue milkshake."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_MEDIUM

/datum/reagent/consumable/pumpkin_latte
	name = "Тыквенное Латте"
	description = "A mix of pumpkin juice and coffee."
	color = "#F4A460"
	quality = DRINK_VERYGOOD
	nutriment_factor = 3 * REAGENTS_METABOLISM
	taste_description = "сливочная тыква"
	glass_icon_state = "pumpkin_latte"
	glass_name = "pumpkin latte"
	glass_desc = "A mix of coffee and pumpkin juice."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_MEDIUM

/datum/reagent/consumable/gibbfloats
	name = "Хороший Пловец"
	description = "Ice cream on top of a Dr. Gibb glass."
	color = "#B22222"
	quality = DRINK_NICE
	nutriment_factor = 3 * REAGENTS_METABOLISM
	taste_description = "сливочная вишня"
	glass_icon_state = "gibbfloats"
	glass_name = "Gibbfloat"
	glass_desc = "Dr. Gibb with ice cream on top."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_LOW

/datum/reagent/consumable/pumpkinjuice
	name = "Тыквенный Сок"
	description = "Juiced from real pumpkin."
	color = "#FFA500"
	taste_description = "тыква"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_LOW

/datum/reagent/consumable/blumpkinjuice
	name = "Синетыквенный Сок"
	description = "Juiced from real blumpkin."
	color = "#00BFFF"
	taste_description = "глоток воды в бассейне"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_LOW

/datum/reagent/consumable/triple_citrus
	name = "Тройной Цитрус"
	description = "A solution."
	color = "#EEFF00"
	quality = DRINK_NICE
	taste_description = "крайняя горечь"
	glass_icon_state = "triplecitrus" //needs own sprite mine are trash //your sprite is great tho
	glass_name = "стакан triple citrus"
	glass_desc = "A mixture of citrus juices. Tangy, yet smooth."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_SALTY

/datum/reagent/consumable/grape_soda
	name = "Виноградная Газировка"
	description = "Beloved by children and teetotalers."
	color = "#E6CDFF"
	taste_description = "виноградная сода"
	glass_name = "стакан grape juice"
	glass_desc = "It's grape (soda)!"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_MEDIUM

/datum/reagent/consumable/grape_soda/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.adjust_bodytemperature(-5 * REM * TEMPERATURE_DAMAGE_COEFFICIENT * delta_time, M.get_body_temp_normal())
	..()

/datum/reagent/consumable/milk/chocolate_milk
	name = "Шоколадное Молоко"
	description = "Milk for cool kids."
	color = "#7D4E29"
	quality = DRINK_NICE
	taste_description = "шоколадное молоко"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_LOW

/datum/reagent/consumable/hot_coco
	name = "Горячее Какао"
	description = "Made with love! And coco beans."
	nutriment_factor = 3 * REAGENTS_METABOLISM
	color = "#403010" // rgb: 64, 48, 16
	taste_description = "сливочный шоколад"
	glass_icon_state  = "chocolateglass"
	glass_name = "стакан hot coco"
	glass_desc = "A favorite winter drink to warm you up."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_LOW

/datum/reagent/consumable/hot_coco/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.adjust_bodytemperature(5 * REM * TEMPERATURE_DAMAGE_COEFFICIENT * delta_time, 0, M.get_body_temp_normal())
	if(M.getBruteLoss() && DT_PROB(10, delta_time))
		M.heal_bodypart_damage(1, 0, 0)
		. = TRUE
	if(holder.has_reagent(/datum/reagent/consumable/capsaicin))
		holder.remove_reagent(/datum/reagent/consumable/capsaicin, 2 * REM * delta_time)
	..()

/datum/reagent/consumable/menthol
	name = "Ментол"
	description = "Alleviates coughing symptoms one might have."
	color = "#80AF9C"
	taste_description = "мята"
	glass_icon_state = "glass_green"
	glass_name = "стакан menthol"
	glass_desc = "Tastes naturally minty, and imparts a very mild numbing sensation."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_MEDIUM

/datum/reagent/consumable/menthol/on_mob_life(mob/living/L, delta_time, times_fired)
	L.apply_status_effect(/datum/status_effect/throat_soothed)
	..()

/datum/reagent/consumable/grenadine
	name = "Гренадин"
	description = "Not cherry flavored!"
	color = "#EA1D26"
	taste_description = "сладкие гранаты"
	glass_name = "стакан grenadine"
	glass_desc = "Delicious flavored syrup."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED

/datum/reagent/consumable/parsnipjuice
	name = "Сок Пастернака"
	description = "Why..."
	color = "#FFA500"
	taste_description = "пастернак"
	glass_name = "стакан parsnip juice"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_LOW

/datum/reagent/consumable/pineapplejuice
	name = "Ананасовый Сок"
	description = "Tart, tropical, and hotly debated."
	special_sound = 'white/valtos/sounds/drink/pineapple_apple_pen.ogg'
	color = "#F7D435"
	taste_description = "ананас"
	glass_name = "стакан pineapple juice"
	glass_desc = "Tart, tropical, and hotly debated."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_MEDIUM

/datum/reagent/consumable/peachjuice //Intended to be extremely rare due to being the limiting ingredients in the blazaam drink
	name = "Персиковый Сок"
	description = "Just peachy."
	color = "#E78108"
	taste_description = "персики"
	glass_name = "стакан peach juice"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_MEDIUM

/datum/reagent/consumable/cream_soda
	name = "Крем Сода"
	description = "A classic space-American vanilla flavored soft drink."
	color = "#dcb137"
	quality = DRINK_VERYGOOD
	taste_description = "шипучая ваниль"
	glass_icon_state = "cream_soda"
	glass_name = "Cream Soda"
	glass_desc = "A classic space-American vanilla flavored soft drink."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_MEDIUM

/datum/reagent/consumable/cream_soda/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.adjust_bodytemperature(-5 * REM * TEMPERATURE_DAMAGE_COEFFICIENT * delta_time, M.get_body_temp_normal())
	..()

/datum/reagent/consumable/sol_dry
	name = "Sol Dry"
	description = "A soothing, mellow drink made from ginger."
	color = "#f7d26a"
	quality = DRINK_NICE
	taste_description = "сладкая имбирная специя"
	glass_name = "Sol Dry"
	glass_desc = "A soothing, mellow drink made from ginger."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_LOW

/datum/reagent/consumable/sol_dry/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.adjust_disgust(-5 * REM * delta_time)
	..()

/datum/reagent/consumable/red_queen
	name = "Красная Королева"
	description = "DRINK ME."
	color = "#e6ddc3"
	quality = DRINK_GOOD
	taste_description = "чудо"
	glass_icon_state = "red_queen"
	glass_name = "Red Queen"
	glass_desc = "DRINK ME."
	var/current_size = RESIZE_DEFAULT_SIZE
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_MEDIUM

/datum/reagent/consumable/red_queen/on_mob_life(mob/living/carbon/H, delta_time, times_fired)
	if(DT_PROB(50, delta_time))
		return ..()

	var/newsize = pick(0.5, 0.75, 1, 1.50, 2)
	newsize *= RESIZE_DEFAULT_SIZE
	H.resize = newsize/current_size
	current_size = newsize
	H.update_transform()
	if(DT_PROB(23, delta_time))
		H.emote("sneeze")
	..()

/datum/reagent/consumable/red_queen/on_mob_end_metabolize(mob/living/M)
	M.resize = RESIZE_DEFAULT_SIZE/current_size
	current_size = RESIZE_DEFAULT_SIZE
	M.update_transform()
	..()

/datum/reagent/consumable/bungojuice
	name = "Сок Бунго"
	color = "#F9E43D"
	description = "Exotic! You feel like you are on vacation already."
	taste_description = "сочный бунго"
	glass_icon_state = "glass_yellow"
	glass_name = "стакан bungo juice"
	glass_desc = "Exotic! You feel like you are on vacation already."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_LOW

/datum/reagent/consumable/prunomix
	name = "пруно смесь"
	color = "#E78108"
	description = "Fruit, sugar, yeast, and water pulped together into a pungent slurry."
	taste_description = "мусор"
	glass_icon_state = "glass_orange"
	glass_name = "стакан pruno mixture"
	glass_desc = "Fruit, sugar, yeast, and water pulped together into a pungent slurry."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_LOW

/datum/reagent/consumable/aloejuice
	name = "Сок Алоэ"
	color = "#A3C48B"
	description = "A healthy and refreshing juice."
	taste_description = "овощи"
	glass_icon_state = "glass_yellow"
	glass_name = "стакан aloe juice"
	glass_desc = "A healthy and refreshing juice."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_MEDIUM

/datum/reagent/consumable/aloejuice/on_mob_life(mob/living/M, delta_time, times_fired)
	if(M.getToxLoss() && DT_PROB(16, delta_time))
		M.adjustToxLoss(-1, 0)
	..()
	. = TRUE

/datum/reagent/consumable/lean
	name = "Лин"
	description = "The drank that makes you go wheezy."
	color = "#DE55ED"
	quality = DRINK_NICE
	taste_description = "фиолетовый намек на опиоид."
	glass_icon_state = "lean"
	glass_name = "Lean"
	glass_desc = "A drink that makes your life less miserable."
	addiction_types = list(/datum/addiction/opiods = 6)
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	hydration_factor = DRINK_HYDRATION_FACTOR_LOW

/datum/reagent/consumable/lean/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	if(M.slurring < 3)
		M.slurring += 2 * REM * delta_time
	if(M.druggy < 3)
		M.adjust_drugginess(1 * REM * delta_time)
	if(M.drowsyness < 3)
		M.drowsyness += 1 * REM * delta_time
	return ..()

//Moth Stuff
/datum/reagent/consumable/toechtauese_juice
	name = "Töchtaüse Juice"
	description = "An unpleasant juice made from töchtaüse berries. Best made into a syrup, unless you enjoy pain."
	color = "#554862"
	nutriment_factor = 0
	taste_description = "fiery itchy pain"
	glass_icon_state = "toechtauese_syrup"
	glass_name = "стакан töchtaüse juice"
	glass_desc = "Raw, unadulterated töchtaüse juice. One swig will fill you with regrets."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED

/datum/reagent/consumable/toechtauese_syrup
	name = "Töchtaüse Syrup"
	description = "A harsh spicy and bitter syrup, made from töchtaüse berries. Useful as an ingredient, both for food and cocktails."
	color = "#554862"
	nutriment_factor = 0
	taste_description = "sugar, spice, and nothing nice"
	glass_icon_state = "toechtauese_syrup"
	glass_name = "стакан töchtaüse syrup"
	glass_desc = "Not for drinking on its own."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
