/datum/heretic_knowledge_tree_column/ash
	route = PATH_ASH
	ui_bgr = "node_ash"
	complexity = "Easy"
	complexity_color = COLOR_GREEN
	icon = list(
		"icon" = 'icons/obj/weapons/khopesh.dmi',
		"state" = "ash_blade",
		"frame" = 1,
		"dir" = SOUTH,
		"moving" = FALSE,
	)
	description = list(
		"The Path of Ash revolves around fire, mobility and brutal crowd control against single opponents.",
		"Play this path if you are new to Heretic, or really enjoy hit and run playstyles.",
	)
	pros = list(
		"Very potent even from the beginning of the path.",
		"Easy access to a mobility spells and expanded vision.",
		"Very powerful mark effect.",
	)
	cons = list(
		"Has less power than most heretics beyond their starting abilities.",
		"Lacks durability in long conflicts.",
		"Reliant on hitting fast and hard before their opponents can mount proper countermeasures.",
	)
	tips = list(
		"Your Mansus Grasp applies a short blind and a mark that puts your opponent into stamina crit when triggered by your blade. The mark can spread to nearby opponents.",
		"Selecting this path makes you immune to high temperature damage. Remember, however, that your clothes can still burn! If you want to protect yourself from your own fire, wear a Scorched Mantle.",
		"Your Scorched Mantle will keep you on fire while protecting you from the ill effects of it. Use this to your advantage by running into groups of enemies, spreading fire far and wide.",
		"Do not neglect the Mask of Madness. It will slowly sap the stamina of your enemies and make them hallucinate.",
		"Make sure to set as many enemies on fire as you possibly can! Nightwatcher's Rebirth will heal you and have its cooldown reduced based on how many mobs you siphon.",
		"Your ascension grants you complete immunity to environmental hazards, including bombs! But you are still vulnerable to more conventional weaponry. Do not become overconfident.",
	)

	start = /datum/heretic_knowledge/limited_amount/starting/base_ash
	knowledge_tier1 = /datum/heretic_knowledge/spell/ash_passage
	guaranteed_side_tier1 = /datum/heretic_knowledge/medallion
	knowledge_tier2 = /datum/heretic_knowledge/spell/fire_blast
	guaranteed_side_tier2 = /datum/heretic_knowledge/rifle
	robes = /datum/heretic_knowledge/armor/ash
	knowledge_tier3 = /datum/heretic_knowledge/nightwatchers_lantern
	guaranteed_side_tier3 = /datum/heretic_knowledge/summon/ashy
	blade = /datum/heretic_knowledge/blade_upgrade/ash
	knowledge_tier4 = /datum/heretic_knowledge/spell/flame_birth
	ascension = /datum/heretic_knowledge/ultimate/ash_final

/datum/heretic_knowledge/limited_amount/starting/base_ash
	name = "Nightwatcher's Secret"
	desc = "Открывает перед вами путь пепла.<br>\
		Позволяет создавать Пепельные клинки. \
		Одновременно можно иметь только два."
	transmute_text = "Трансмутируйте спичку и нож."
	gain_text = "Городская стража знает своих дозорных. Если вы спросите их ночью, они могут рассказать вам о пепельном фонаре."
	required_atoms = list(
		/obj/item/knife = 1,
		/obj/item/match = 1,
	)
	result_atoms = list(/obj/item/melee/sickly_blade/ash)
	research_tree_icon_path = 'icons/obj/weapons/khopesh.dmi'
	research_tree_icon_state = "ash_blade"
	mark_type = /datum/status_effect/eldritch/ash
	eldritch_passive = /datum/status_effect/heretic_passive/ash

/datum/heretic_knowledge/limited_amount/starting/base_ash/on_mansus_grasp(mob/living/source, mob/living/target)
	. = ..()

	if(target.is_blind())
		return

	if(!target.get_organ_slot(ORGAN_SLOT_EYES))
		return

	to_chat(target, span_danger("Яркий зеленый свет ужасно жжет глаза!"))
	target.adjust_organ_loss(ORGAN_SLOT_EYES, 15)
	target.set_eye_blur_if_lower(20 SECONDS)

/datum/heretic_knowledge/limited_amount/starting/base_ash/trigger_mark(mob/living/source, mob/living/target)
	. = ..()
	if(!.)
		return

	// Also refunds 75% of charge!
	var/datum/action/cooldown/spell/touch/mansus_grasp/grasp = locate() in source.actions
	if(grasp)
		grasp.next_use_time -= round(grasp.cooldown_time*0.75)
		grasp.build_all_button_icons()

/datum/heretic_knowledge/spell/ash_passage
	name = "Ashen Passage"
	desc = "Grants you Ashen Passage, a spell that lets you phase out of reality, \
		allowing you to traverse a short distance, passing though any walls."
	gain_text = "Он знал, как ходить между мирами."
	action_to_add = /datum/action/cooldown/spell/jaunt/ethereal_jaunt/ash
	cost = 2
	drafting_tier = 5
	max_charges = 6
	focus_recharge_amount = 0.15
	holywater_drain_amount = 0.15

/datum/heretic_knowledge/spell/fire_blast
	name = "Volcano Blast"
	desc = "Дает вам Volcano Blast - заклинание, которое после короткой зарядки выстреливает лучом энергии \
		в ближайшего врага, поджигая и обжигая его. Если они не потушат себя, \
		луч продолжит движение к другой цели."
	gain_text = "Ни один огонь не был достаточно горячим, чтобы разжечь их. Ни один огонь не был достаточно ярким, чтобы спасти их. Ни один огонь не вечен."
	action_to_add = /datum/action/cooldown/spell/charged/beam/fire_blast
	cost = 2
	research_tree_icon_frame = 7
	max_charges = 3
	focus_recharge_amount = 0.33
	holywater_drain_amount = 0.16

/datum/heretic_knowledge/armor/ash
	desc = "Create a Scorched Mantle.<br>\
		It provides completes protection from fire, and is able to produce more flames passively."
	transmute_text = "Transmute a table (or a suit), a mask and a match."
	gain_text = "The Watch remain as they fell, crumbling away from sight. \
		Yet the winds blowing through the city call them back to service, dust kicked into the air, a drifting silhouette of the fallen."
	result_atoms = list(/obj/item/clothing/suit/hooded/cultrobes/eldritch/ash)
	research_tree_icon_state = "ash_armor"
	required_atoms = list(
		list(/obj/structure/table, /obj/item/clothing/suit) = 1,
		/obj/item/clothing/mask = 1,
		/obj/item/match = 1,
	)

/datum/heretic_knowledge/nightwatchers_lantern
	name = "Nightwatcher's Lantern"
	desc = "Create a burning lantern.<br>\
		A burning lantern is a bright light that damages the eyes and eventually confuses those who witness it for too long. \
		The effect is reduced for those with protective eyewear, and strengthened if the burning lantern is the only nearby source of light."
	transmute_text = "Transmute a lamp, lantern, or seclight, a pair of eyes, a flash, and four lit candles."
	gain_text = "The Nightwatcher did not venture out in the dark. That was foolish, even the Watch knew that. \
		Their lantern burned with a light that could burn the sun."
	cost = 2
	result_atoms = list(/obj/item/flashlight/lantern/heretic)
	required_atoms = list(
		list(/obj/item/flashlight/lamp, /obj/item/flashlight/lantern, /obj/item/flashlight/seclite) = 1,
		/obj/item/organ/eyes = 1,
		/obj/item/assembly/flash = 1,
		/obj/item/flashlight/flare/candle = 4,
	)
	research_tree_icon_path = 'icons/obj/lighting.dmi'
	research_tree_icon_state = "lantern"

/datum/heretic_knowledge/nightwatchers_lantern/recipe_snowflake_check(mob/living/user, list/atoms, list/selected_atoms, turf/loc)
	. = ..()
	for(var/obj/item/flashlight/flare/candle/candle in atoms)
		if(!candle.light_on)
			atoms -= candle

/datum/heretic_knowledge/nightwatchers_lantern/prepare_atom_for_ritual_test(atom/what)
	. = ..()
	if(istype(what, /obj/item/flashlight/flare/candle))
		what.set_light_on(TRUE)

/datum/heretic_knowledge/blade_upgrade/ash
	name = "Fiery Blade"
	desc = "Ваш клинок теперь поджигает врагов при атаке."
	gain_text = "Он вернулся, с клинком в руке, он размахивал и размахивал, когда пепел падал с неба. \
		Его город, люди, за которыми он поклялся наблюдать... и он наблюдал, пока все они сгорали дотла."

	research_tree_icon_path = 'icons/ui_icons/antags/heretic/knowledge.dmi'
	research_tree_icon_state = "blade_upgrade_ash"

/datum/heretic_knowledge/blade_upgrade/ash/do_melee_effects(mob/living/source, mob/living/target, obj/item/melee/sickly_blade/blade)
	if(source == target || !isliving(target))
		return

	target.adjust_fire_stacks(1)
	target.ignite_mob()

/datum/heretic_knowledge/spell/flame_birth
	name = "Nightwatcher's Rebirth"
	desc = "Дарует вам Nightwatcher's Rebirth, заклинание, которое потушит вас \
		и обжигает всех ближайших язычников, которые в данный момент горят, исцеляя вас за каждую пораженную цель.<br>\
		Если цель находится в критическом состоянии, она мгновенно умрёт."
	gain_text = "Огонь был неизбежным, и все же жизнь оставалась в его обугленном теле. \
		Ночной дозорный был конкретным человеком, всегда бдительным."
	action_to_add = /datum/action/cooldown/spell/aoe/fiery_rebirth
	cost = 2
	research_tree_icon_frame = 5
	is_final_knowledge = TRUE
	max_charges = 3
	focus_recharge_amount = 0.33
	holywater_drain_amount = 0.16

/datum/heretic_knowledge/ultimate/ash_final
	name = "Ashlord's Rite"
	desc = "Ритуал вознесения Пути пепла.<br>\
		После завершения вы становитесь предвестником пламени и получаете две способности.<br>\
		Cascade, который вызывает массивное, растущее огненное кольцо вокруг вас, \
		и Oath of Flame, заставляя вас пассивно создавать кольцо пламени, когда вы идете.<br>\
		У вас также появится иммунитет к огню, космосу и подобным опасностям окружающей среды."
	transmute_text = "Трансмутируйте 3 горящих трупа или хаска."
	gain_text = "Дозор мертв, и Ночной дозорный сгорел вместе с ним. И все же его огонь горит вечно, \
		ибо он принес человечеству обряд! Его взгляд продолжается, и теперь я един с пламенем, \
		УЗРИТЕ МОЕ ВОЗНЕСЕНИЕ, ПЕПЕЛЬНЫЙ ФОНАРЬ ВОСПЛАМЕНИТСЯ ВНОВЬ!"

	ascension_achievement = /datum/award/achievement/misc/ash_ascension
	announcement_text = "%SPOOKY% Бойтесь пламени, ибо Пепельный Лорд, %NAME%, вознесся! Пламя поглотит всех! %SPOOKY%"
	announcement_sound = 'sound/music/antag/heretic/ascend_ash.ogg'
	/// A static list of all traits we apply on ascension.
	var/static/list/traits_to_apply = list(
		TRAIT_BOMBIMMUNE,
		TRAIT_NOBREATH,
		TRAIT_NOFIRE,
		TRAIT_RESISTCOLD,
		TRAIT_RESISTHEAT,
		TRAIT_RESISTHIGHPRESSURE,
		TRAIT_RESISTLOWPRESSURE,
	)

/datum/heretic_knowledge/ultimate/ash_final/is_valid_sacrifice(mob/living/carbon/human/sacrifice)
	. = ..()
	if(!.)
		return

	if(sacrifice.on_fire)
		return TRUE
	if(HAS_TRAIT_FROM(sacrifice, TRAIT_HUSK, BURN))
		return TRUE
	return FALSE

/datum/heretic_knowledge/ultimate/ash_final/on_finished_recipe(mob/living/user, list/selected_atoms, turf/loc)
	. = ..()
	var/datum/action/cooldown/spell/fire_sworn/circle_spell = new(user.mind)
	circle_spell.Grant(user)

	var/datum/action/cooldown/spell/fire_cascade/big/screen_wide_fire_spell = new(user.mind)
	screen_wide_fire_spell.Grant(user)

	var/datum/action/cooldown/spell/charged/beam/fire_blast/existing_beam_spell = locate() in user.actions
	if(existing_beam_spell)
		existing_beam_spell.max_beam_bounces *= 2 // Double beams
		existing_beam_spell.beam_duration *= 0.66 // Faster beams
		existing_beam_spell.cooldown_time *= 0.66 // Lower cooldown

	var/datum/action/cooldown/spell/aoe/fiery_rebirth/fiery_rebirth = locate() in user.actions
	fiery_rebirth?.cooldown_time *= 0.16

	user.add_traits(traits_to_apply, type)
