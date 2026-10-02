// MARK: Crocodile
/mob/living/basic/lizard/big/crocodile
	name = "crocodile"
	desc = "Клац, клац, клац. Острые зубки, толстая кожа - страшно!"
	icon = 'modular_content/mobs/icons/crocodile.dmi'
	icon_state = "crocodile"
	icon_living = "crocodile"
	icon_dead = "crocodile_dead"
	pixel_x = -8
	pixel_y = -4
	base_pixel_x = -8
	base_pixel_y = -4
	gender = MALE
	butcher_results = list(/obj/item/food/meat/slab/human/mutant/lizard = 5)

	maxHealth = 250
	health = 250

	melee_damage_lower = 15
	melee_damage_upper = 15

	ai_controller = /datum/ai_controller/basic_controller/crocodile

/mob/living/basic/lizard/big/crocodile/Login()
	. = ..()
	if(!. || !client)
		return FALSE
	AddElement(/datum/element/ridable, /datum/component/riding/creature/crocodile)

// Croco AI
/datum/ai_controller/basic_controller/crocodile
	behavior_tree_json = "code/modules/mob/living/basic/vermin/crocodile.bt.json"
	blackboard = list(
		BB_TARGETING_STRATEGY = /datum/targeting_strategy/basic,
		BB_BASIC_MOB_SPEAK_LINES = list(
			BB_EMOTE_HEAR = list("рычит.", "хрипит.", "шипит."),
			BB_EMOTE_SEE = list("машет хвостом.", "широко раскрывает пасть."),
			BB_EMOTE_SOUND = list('sound/mobs/humanoids/lizard/lizard_hiss.ogg'),
			BB_SPEAK_CHANCE = 5,
		),
	)

	ai_movement = /datum/ai_movement/basic_avoidance

// Croco rideable
/datum/component/riding/creature/crocodile

/datum/component/riding/creature/crocodile/get_rider_offsets_and_layers(pass_index, mob/offsetter)
	return list(
		TEXT_NORTH = list( 0, 8),
		TEXT_SOUTH = list( 0, 8),
		TEXT_EAST =  list(-2, 8),
		TEXT_WEST =  list( 2, 8),
	)

/datum/component/riding/creature/crocodile/get_parent_offsets_and_layers()
	return list(
		TEXT_NORTH = list(0, 0, MOB_BELOW_PIGGYBACK_LAYER),
		TEXT_SOUTH = list(0, 0, MOB_BELOW_PIGGYBACK_LAYER),
		TEXT_EAST =  list(0, 0, MOB_BELOW_PIGGYBACK_LAYER),
		TEXT_WEST =  list(0, 0, MOB_BELOW_PIGGYBACK_LAYER),
	)
