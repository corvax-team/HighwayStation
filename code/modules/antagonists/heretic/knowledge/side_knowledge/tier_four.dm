/*!
 * Tier 4 knowledge: Combat related knowledge
 */

/datum/heretic_knowledge/spell/space_phase
	name = "Космическая фаза"
	desc = "Grants you Space Phase, a spell that allows you to move freely through space.<br>\
		You can only phase in and out when you are on a space or misc turf."
	gain_text = "Вы ощущаете, что ваше тело может перемещаться по космосу так, словно вы стали космической пылью."

	action_to_add = /datum/action/cooldown/spell/jaunt/space_crawl
	cost = 2
	research_tree_icon_frame = 6
	drafting_tier = 4
	max_charges = 2
	path_recharge_amount = 0.0
	holywater_drain_amount = 0.5
	transmute_text = "Для перезарядки раздавите блюспейс-кристалл, стоя над руной."
	/// Tracks tim ein EVA
	var/seconds_in_eva = 0

/datum/heretic_knowledge/spell/space_phase/has_charges(mob/living/user)
	return HAS_TRAIT(user, TRAIT_MAGICALLY_PHASED) || ..()

/datum/heretic_knowledge/spell/space_phase/should_deduct_charge(mob/living/user)
	return !HAS_TRAIT(user, TRAIT_MAGICALLY_PHASED)

/datum/heretic_knowledge/spell/space_phase/on_gain(mob/user, datum/antagonist/heretic/our_heretic)
	. = ..()
	RegisterSignal(user, COMSIG_MOB_CRUSHED_BLUESPACE_CRYSTAL, PROC_REF(on_crystal_crushed))

/datum/heretic_knowledge/spell/space_phase/on_lose(mob/user, datum/antagonist/heretic/our_heretic)
	. = ..()
	UnregisterSignal(user, COMSIG_MOB_CRUSHED_BLUESPACE_CRYSTAL)

/datum/heretic_knowledge/spell/space_phase/proc/on_crystal_crushed(mob/living/source, obj/item/crystal)
	SIGNAL_HANDLER

	var/obj/effect/heretic_rune/rune = locate() in view(1, source)
	if(isnull(rune))
		return

	rune.ritual_animation()
	add_charges(1)

/datum/heretic_knowledge/unfathomable_curio
	name = "Непостижимая реликвия"
	desc = "Fashion an Unfathomable Curio - \
		a belt that can hold blades and items for rituals.<br>Whilst worn it will veil you, \
		blocking one blow of incoming damage, at the cost of the veil. The veil will recharge itself out of combat."
	transmute_text = "Трансмутируйте 3 железных прута, лёгкие и любой пояс."
	gain_text = "Мансус хранит множество реликвий, некоторые не предназначены для глаз смертных."

	required_atoms = list(
		/obj/item/organ/lungs = 1,
		/obj/item/stack/rods = 3,
		/obj/item/storage/belt = 1,
	)
	result_atoms = list(/obj/item/storage/belt/unfathomable_curio)
	cost = 2
	research_tree_icon_path = 'icons/obj/clothing/belts.dmi'
	research_tree_icon_state = "unfathomable_curio"
	drafting_tier = 4

/datum/heretic_knowledge/rust_sower
	name = "Сеятель ржавчины"
	desc = "Позволяет создать проклятую гранату, заполненную паранормальной ржавчиной. При взрыве граната выпускает огромное облако, ослепляющее органиков, покрывая поверхности ржавчиной, уничтожая синтетиков и мехов."
	transmute_text = "Трансмутируйте гильзу от химической гранаты и немного заплесневелой еды."
	gain_text = "Засохшие виноградные лозы на Ржавых Холмах отягощены подобными, перезрелыми плодами. Они уничтожают признаки прогресса, оставляя чистый лист для создания новых форм."
	required_atoms = list(
		list(
			/obj/item/food/breadslice/moldy,
			/obj/item/food/badrecipe/moldy,
			/obj/item/food/deadmouse/moldy,
			/obj/item/food/pizzaslice/moldy,
			/obj/item/food/boiledegg/rotten,
			/obj/item/food/egg/rotten
		) = 1,
		/obj/item/grenade/chem_grenade = 1
	)
	result_atoms = list(/obj/item/grenade/chem_grenade/rust_sower)
	cost = 2
	research_tree_icon_path = 'icons/obj/weapons/grenade.dmi'
	research_tree_icon_state = "rustgrenade"
	drafting_tier = 4

/datum/heretic_knowledge/crimson_cleave
	name = "Багровый тесак"
	desc = "Allows you to forge a Crimson Cleaver, a terrifying weapon that thirsts for blood.<br>\
		Its strikes heal you for the damage it inflicts, and it can cleave through multiple enemies at once. \
		It is also a moderately effective thrown weapon, returning to the wielder after being thrown."
	gain_text = "At first I didn't understand these instruments of war, but the Priest \
		told me to use them regardless. Soon, he said, I would know them well."
	transmute_text = "Transmute a butcher's cleaver and some blood - \
		either a pool or droplets, bloodied rags or bandages, a beaker or vial, or even the cleaver itself stained in blood."
	required_atoms = list(
		/obj/item/knife/butcher = 1,
	)
	result_atoms = list(/obj/item/knife/butcher/heretic)
	banned_atom_types = list(/obj/item/knife/butcher/heretic)
	cost = 2
	drafting_tier = 4
	research_tree_icon_path = /obj/item/knife/butcher/heretic::icon
	research_tree_icon_state = /obj/item/knife/butcher/heretic::icon_state

/datum/heretic_knowledge/crimson_cleave/prepare_atom_for_ritual_test(atom/what)
	. = ..()
	what.add_blood_DNA(list("Test DNA" = get_blood_type(/datum/blood_type/human/o_minus)))

/datum/heretic_knowledge/crimson_cleave/get_extra_requirements()
	return "немного крови — лужа или капли, окровавленные тряпки или бинты, мензурка или флакон, или даже сам окровавленный тесак"

/datum/heretic_knowledge/crimson_cleave/recipe_snowflake_check(mob/living/user, list/atoms, list/selected_atoms, turf/loc)
	for(var/obj/item/knife/butcher/cleaver in atoms)
		selected_atoms += cleaver
		if(GET_ATOM_BLOOD_DNA_LENGTH(cleaver))
			return TRUE // two for one deal
		break

	for(var/obj/effect/decal/cleanable/blood/blood in atoms)
		selected_atoms += blood // blood is blood
		return TRUE

	for(var/obj/item/rag/rag in atoms)
		if(GET_ATOM_BLOOD_DNA_LENGTH(rag))
			selected_atoms += rag
			return TRUE

	for(var/obj/item/stack/medical/wrap/gauze/medwrap in atoms)
		if(GET_ATOM_BLOOD_DNA_LENGTH(medwrap))
			selected_atoms += medwrap
			return TRUE

	for(var/obj/item/reagent_containers/container in atoms)
		for(var/datum/reagent/reagent_content as anything in container.reagents.reagent_list)
			if(LAZYACCESS(reagent_content.data, BLOOD_DATA_DNA))
				selected_atoms += container
				return TRUE

	loc.balloon_alert(user, "Ритуал не удался — нет крови!")
	to_chat(user, span_mansus("Вам не хватает крови для завершения ритуала \"[name]\"."))
	return FALSE

/datum/heretic_knowledge/crimson_cleave/cleanup_atoms(list/selected_atoms)
	for(var/obj/item/reagent_containers/container in selected_atoms)
		for(var/datum/reagent/reagent_content as anything in container.reagents.reagent_list)
			if(LAZYACCESS(reagent_content.data, BLOOD_DATA_DNA))
				container.reagents.del_reagent(reagent_content.type)
		selected_atoms -= container

	for(var/obj/item/stack/medical/wrap/gauze/medwrap in selected_atoms)
		medwrap.use(1)
		selected_atoms -= medwrap

	return ..()

/datum/heretic_knowledge/rifle
	name = "Винтовка Охотника на Львов"
	desc = "Unleash the Lionhunter's rifle.<br>\
		The Lionhunter's Rifle is a long ranged ballistic weapon with three shots. \
		These shots function as normal, albeit weak high-caliber munitions when fired from \
		close range or at inanimate objects. You can aim the rifle at distant foes, \
		causing the shot to mark your victim with your grasp and teleport you directly to them."
	transmute_text = "Трансмутируйте кусок дерева, шкуру любого животного и камеру."
	gain_text = "I met an old man in an antique shop who wielded a very unusual weapon. \
		I could not purchase it at the time, but they showed me how they made it ages ago."
	required_atoms = list(
		/obj/item/stack/sheet/mineral/wood = 1,
		/obj/item/stack/sheet/animalhide = 1,
		/obj/item/camera = 1,
	)
	result_atoms = list(/obj/item/gun/ballistic/rifle/lionhunter)
	cost = 2
	research_tree_icon_path = 'icons/obj/weapons/guns/ballistic.dmi'
	research_tree_icon_state = "goldrevolver"
	drafting_tier = 2

/datum/heretic_knowledge/rifle_ammo
	name = "Боеприпасы для винтовки Охотника на Львов"
	desc = "Позволяет создать дополнительную обойму патронов для винтовки Охотника на Львов."
	transmute_text = "Трансмутируйте 3 гильзы (использованные или неиспользованные) любого калибра, в том числе патроны для дробовика."
	gain_text = "The weapon came with three rough iron balls, intended to be used as ammunition. \
		They were very effective, for simple iron, but used up quickly. I soon ran out. \
		No replacement munitions worked in their stead. It was peculiar in what it wanted."
	required_atoms = list(
		/obj/item/ammo_casing = 3,
	)
	result_atoms = list(/obj/item/ammo_box/speedloader/strilka310/lionhunter)
	cost = 0
	research_tree_icon_path = 'icons/obj/weapons/guns/ammo.dmi'
	research_tree_icon_state = "310_strip"

	/// A list of calibers that the ritual will deny. Only ballistic calibers are allowed.
	var/static/list/caliber_blacklist = list(
		CALIBER_LASER,
		CALIBER_ENERGY,
		CALIBER_FOAM,
		CALIBER_ARROW,
		CALIBER_HARPOON,
		CALIBER_HOOK,
	)

/datum/heretic_knowledge/rifle_ammo/pre_research(mob/user, datum/antagonist/heretic/our_heretic)
	if(!our_heretic.get_knowledge(/datum/heretic_knowledge/rifle))
		tgui_alert(user, "Сначала необходимо изучить знание винтовки Охотника на Львов, и только потом - боеприпасы к ней.")
		return FALSE

	return TRUE

/datum/heretic_knowledge/rifle_ammo/recipe_snowflake_check(mob/living/user, list/atoms, list/selected_atoms, turf/loc)
	for(var/obj/item/ammo_casing/casing in atoms)
		if(!(casing.caliber in caliber_blacklist))
			continue

		// Remove any casings in the caliber_blacklist list from atoms
		atoms -= casing
	// We removed any invalid casings from the atoms list,
	// return to allow the ritual to fill out selected atoms with the new list
	return TRUE
