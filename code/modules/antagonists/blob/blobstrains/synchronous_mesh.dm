//does brute damage, bonus damage for each nearby blob, and spreads damage out
/datum/blobstrain/reagent/synchronous_mesh
	name = "Синхронная сетка"
	description = "нанесет значительно увеличенный грубый урон за каждую массу рядом с целью."
	effectdesc = "также распределяет урон между каждой массой рядом с атакованной массой."
	analyzerdescdamage = "Наносит грубый урон, увеличивающийся за каждую массу рядом с целью."
	analyzerdesceffect = "При атаке распределяет урон между всеми массами рядом с атакованной массой."
	color = "#65ADA2"
	complementary_color = "#AD6570"
	blobbernaut_message = "синхронно ударяет"
	message = "Масса ударяет меня"
	reagent = /datum/reagent/blob/synchronous_mesh

/datum/blobstrain/reagent/synchronous_mesh/damage_reaction(obj/structure/blob/B, damage, damage_type, damage_flag)
	if(damage_flag == MELEE || damage_flag == BULLET || damage_flag == LASER) //the cause isn't fire or bombs, so split the damage
		var/damagesplit = 1 //maximum split is 9, reducing the damage each blob takes to 11% but doing that damage to 9 blobs
		for(var/obj/structure/blob/C in orange(1, B))
			if(!C.ignore_syncmesh_share && C.overmind && C.overmind.blobstrain.type == B.overmind.blobstrain.type) //if it doesn't have the same chemical or is a core or node, don't split damage to it
				damagesplit += 1
		for(var/obj/structure/blob/C in orange(1, B))
			if(!C.ignore_syncmesh_share && C.overmind && C.overmind.blobstrain.type == B.overmind.blobstrain.type) //only hurt blobs that have the same overmind chemical and aren't cores or nodes
				C.take_damage(damage/damagesplit, CLONE, 0, 0)
		return damage / damagesplit
	else
		return damage * 1.25

/datum/reagent/blob/synchronous_mesh
	name = "Синхронная сетка"
	enname = "Synchronous Mesh"
	taste_description = "токсичная плесень"
	color = "#65ADA2"

/datum/reagent/blob/synchronous_mesh/expose_mob(mob/living/exposed_mob, methods=TOUCH, reac_volume, show_message, touch_protection, mob/camera/blob/overmind)
	. = ..()
	reac_volume = return_mob_expose_reac_volume(exposed_mob, methods, reac_volume, show_message, touch_protection, overmind)
	exposed_mob.apply_damage(0.2*reac_volume, BRUTE, wound_bonus=CANT_WOUND)
	if(exposed_mob && reac_volume)
		for(var/obj/structure/blob/nearby_blob in range(1, exposed_mob)) //if the target is completely surrounded, this is 2.4*reac_volume bonus damage, total of 2.6*reac_volume
			if(exposed_mob)
				nearby_blob.blob_attack_animation(exposed_mob) //show them they're getting a bad time
				exposed_mob.apply_damage(0.3*reac_volume, BRUTE, wound_bonus=CANT_WOUND)
