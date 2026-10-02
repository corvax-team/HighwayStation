/*!
 * Tier 1 knowledge: Stealth and general utility
 */

/datum/heretic_knowledge/void_cloak
	name = "Накидка Пустоты"
	desc = "Fashion a Void Cloak.<br>While the hood is down, protects you from space. \
		While the hood is up, the cloak is completely invisible.<br>It also provide decent armor and \
		has pockets which can hold one of your blades, various ritual components (such as organs), and small heretical trinkets."
	transmute_text = "Трансмутируйте осколок стекла, простыню и любую верхнюю одежду (например броню или костюм)."
	gain_text = "Сова хранит то, что не обрело формы в действительности, но уже существует в теории. А таких сущностей немало."
	required_atoms = list(
		/obj/item/shard = 1,
		/obj/item/clothing/suit = 1,
		/obj/item/bedsheet = 1,
	)
	result_atoms = list(/obj/item/clothing/suit/hooded/cultrobes/void)
	cost = 1
	research_tree_icon_path = 'icons/obj/clothing/suits/armor.dmi'
	research_tree_icon_state = "void_cloak"
	drafting_tier = 1

/datum/heretic_knowledge/medallion
	name = "Пепельные глаза"
	desc = "Sculpt an Eldritch Medallion.<br>\
		The Eldritch Medallion grants you thermal vision while worn."
	transmute_text = "Трансмутируйте глаза, свечу и осколок стекла."
	gain_text = "Пронзительный взгляд вёл их сквозь обыденность. Ни темнота, ни ужас не могли их остановить."
	required_atoms = list(
		/obj/item/organ/eyes = 1,
		/obj/item/shard = 1,
		/obj/item/flashlight/flare/candle = 1,
	)
	result_atoms = list(/obj/item/clothing/neck/eldritch_amulet)
	cost = 1
	research_tree_icon_path = 'icons/obj/antags/eldritch.dmi'
	research_tree_icon_state = "eye_medalion"
	drafting_tier = 1

/datum/heretic_knowledge/essence // AKA Eldritch Flask
	name = "Священный ритуал"
	desc = "Fill a flask of Eldritch Essence.<br>\
		Eldritch Essence can be consumed for potent healing, or given to heathens for deadly poisoning."
	transmute_text = "Трансмутируйте ёмкость с водой и осколок стекла."
	gain_text = "This is an old recipe. The Owl whispered it to me. \
		Created by the Priest - the Liquid that both was and is not."
	required_atoms = list(
		/obj/structure/reagent_dispensers/watertank = 1,
		/obj/item/shard = 1,
	)
	result_atoms = list(/obj/item/reagent_containers/cup/beaker/eldritch)
	cost = 1
	research_tree_icon_path = 'icons/obj/antags/eldritch.dmi'
	research_tree_icon_state = "eldritch_flask"
	drafting_tier = 1

/datum/heretic_knowledge/phylactery
	name = "Филактерия проклятия"
	desc = "Позволяет создать филактерию, способную мгновенно вытягивать кровь, даже на большой дистанции. \
		Имейте в виду, что ваша цель все еще может почувствовать укол."
	transmute_text = "Трансмутируйте лист стекла и мак."
	gain_text = "Настойка, извращённая в форму кровососущего паразита. \
		Выбрала ли она этот облик сама, или же это - шутка больного разума, породившего этот мерзкий артефакт, - вопрос, над которым лучше не задумываться."
	required_atoms = list(
		/obj/item/stack/sheet/glass = 1,
		/obj/item/food/grown/flower/poppy = 1,
	)
	result_atoms = list(/obj/item/reagent_containers/cup/phylactery)
	cost = 1
	research_tree_icon_path = 'icons/obj/antags/eldritch.dmi'
	research_tree_icon_state = "phylactery_2"
	drafting_tier = 1
	notice = "Цель филактерии может почувствовать укол."

/datum/heretic_knowledge/crucible
	name = "Зубастый тигель"
	desc = "Позволяет создать Зубастый тигель. \
		Зубастый Тигель открывает возможность варить могущественные зелья, как для боя, так и общего назначения, однако между использованиями его нужно подкармливать органами, или частями тела."
	transmute_text = "Трансмутируйте переносной бак с водой и стол."
	gain_text = "Это чистейшая агония. Мне не удалось призвать образ Аристократа, \
		но, привлёкши внимание Жреца, я наткнулся на иной рецепт…"
	required_atoms = list(
		/obj/structure/reagent_dispensers/watertank = 1,
		/obj/structure/table = 1,
	)
	result_atoms = list(/obj/structure/destructible/eldritch_crucible)
	cost = 1
	research_tree_icon_path = 'icons/obj/antags/eldritch.dmi'
	research_tree_icon_state = "crucible"
	drafting_tier = 1

/datum/heretic_knowledge/eldritch_coin
	name = "Потусторонняя монета"
	desc = "Create an Eldritch Coin.<br>\
		Flip the coin. On heads, nearby airlocks will open or close. On tails, nearby airlocks will bolt to their current state.<br>\
		If you insert the coin into an airlock, it will be consumed to fry its electronics, keeping it open or closed permanently until repaired."
	transmute_text = "Трансмутируйте лист плазмы и алмаз."
	gain_text = "Мансус - место для всех видов греха. Но алчность занимает в нём особое место."
	required_atoms = list(
		/obj/item/stack/sheet/mineral/diamond = 1,
		/obj/item/stack/sheet/mineral/plasma = 1,
	)
	result_atoms = list(/obj/item/coin/eldritch)
	cost = 1
	research_tree_icon_path = 'icons/obj/economy.dmi'
	research_tree_icon_state = "coin_heretic"
	drafting_tier = 1

/**
 * This allows heretics to choose if they want to rush all the influences and take them stealthily, or
 * Construct a codex and take what's left with more points.
 * Another downside to having the book is strip searches, which means that it's not just a free nab, at least until you get exposed - and when you do, you'll probably need the faster drawing speed.
 * Overall, it's a tradeoff between speed and stealth or power.
 */
/datum/heretic_knowledge/codex_cicatrix
	name = "Codex Cicatrix"
	desc = "Создает Codex Cicatrix.<br>\
		Codex Cicatrix можно использовать при истощении влияний для получения дополнительных знаний, но при этом возрастает риск быть замеченным.<br>\
		Его также можно использовать для того, чтобы легче рисовать и удалять руны трансмутации, а открыв его, можно восстановить заряды вашей Хватки Мансуса."
	transmute_text = "Трансмутируйте книгу, любую ручку и на выбор: любое тело (животного или человека), кожу или шкуру."
	gain_text = "Оккультизм оставляет фрагменты знаний и силы везде и всюду. Codex Cicatrix - один из таких примеров. \
		В кожаном переплете и на старых страницах открывается путь к Мансусу."
	required_atoms = list(
		list(/obj/item/toy/eldritch_book, /obj/item/book) = 1,
		/obj/item/pen = 1,
		list(/mob/living, /obj/item/stack/sheet/leather, /obj/item/stack/sheet/animalhide, /obj/item/food/deadmouse) = 1,
	)
	result_atoms = list(/obj/item/codex_cicatrix)
	cost = 1
	drafting_tier = 1
	is_shop_only = TRUE
	research_tree_icon_path = 'icons/obj/antags/eldritch.dmi'
	research_tree_icon_state = "book"

	var/static/list/non_mob_bindings = typecacheof(list(
		/obj/item/stack/sheet/leather,
		/obj/item/stack/sheet/animalhide,
		/obj/item/food/deadmouse,
	))

/datum/heretic_knowledge/codex_cicatrix/recipe_snowflake_check(mob/living/user, list/atoms, list/selected_atoms, turf/loc)
	. = ..()
	if(!.)
		return FALSE

	for(var/thingy in atoms)
		if(is_type_in_typecache(thingy, non_mob_bindings))
			selected_atoms += thingy
			return TRUE
		else if(isliving(thingy))
			var/mob/living/body = thingy
			if(body.stat != DEAD)
				continue
			selected_atoms += body
			return TRUE
	return FALSE

/datum/heretic_knowledge/codex_cicatrix/cleanup_atoms(list/selected_atoms)
	var/mob/living/body = locate() in selected_atoms
	if(!body)
		return ..()
	// A golem or an android doesn't have skin!
	var/exterior_text = "skin"
	// If carbon, it's the limb. If not, it's the body.
	var/atom/movable/ripped_thing = body

	// We will check if it's a carbon's body.
	// If it is, we will damage a random bodypart, and check that bodypart for its body type, to select between 'skin' or 'exterior'.
	if(iscarbon(body))
		var/mob/living/carbon/carbody = body
		var/obj/item/bodypart/bodypart = pick(carbody.get_bodyparts())
		ripped_thing = bodypart

		carbody.apply_damage(25, BRUTE, bodypart, sharpness = SHARP_EDGED)
		if(!(bodypart.bodytype & BODYTYPE_ORGANIC))
			exterior_text = "exterior"
	else
		body.apply_damage(25, BRUTE, sharpness = SHARP_EDGED)
		// If it is not a carbon mob, we will just check biotypes and damage it directly.
		if(body.mob_biotypes & (MOB_MINERAL|MOB_ROBOTIC))
			exterior_text = "exterior"

	// Procure book for flavor text. This is why we call parent at the end.
	var/obj/item/book/le_book = locate() in selected_atoms
	if(!le_book)
		stack_trace("Somehow, no book in codex cicatrix selected atoms! [english_list(selected_atoms)]")
	playsound(body, 'sound/items/poster/poster_ripped.ogg', 100, TRUE)
	body.do_jitter_animation()
	body.visible_message(span_danger("Ужасный рвущийся звук раздается, когда [ripped_thing.declent_ru(ACCUSATIVE)] [exterior_text] вырывается наружу, обволакивая всё вокруг [le_book || "книги"], приобретая жуткий, потусторонний оттенок!"))
	return ..()

/**
 * Warren King's Welcome
 * Offers an alternative way besides stealing an ID or visiting the HoP to gain access to maintenance
 * Additionally changes all nearby airlock's access's to ACCESS_HERETIC
 */
/datum/heretic_knowledge/bookworm
	name = "Приветствие Уоррена Кинга"
	desc = "Brand all present ID cards and nearby airlocks.<br>\
		Branded ID cards will gain access to maintenance, external airlocks, as well to branded airlocks.<br>\
		Branded airlocks will only be accessible by those with a branded ID card."
	transmute_text = "Трансмутируйте 10 обрезков провода, лист бумаги и мультитул."
	gain_text = "Gnawed into vicious-stained fingerbones, my grim invitation snaps my nauseous and clouded mind towards the heavy-set door. \
		Slowly, the light dances between a crawling darkness, blanketing the fetid promenade with infinite machinations. \
		But the King will soon take his pound of flesh. Even here, the taxman takes their cut. For there are a thousands mouths to feed."
	required_atoms = list(
		/obj/item/stack/cable_coil = 10,
		/obj/item/paper = 1,
		/obj/item/multitool = 1,
	)
	cost = 1
	drafting_tier = 1
	research_tree_icon_path = 'icons/obj/card.dmi'
	research_tree_icon_state = "eldritch"

/datum/heretic_knowledge/bookworm/recipe_snowflake_check(mob/living/user, list/atoms, list/selected_atoms, turf/loc)
	. = ..()
	for(var/obj/item/card/id/used_id in atoms)
		selected_atoms += used_id
	var/obj/item/card/user_card = user.get_idcard(hand_first = TRUE)
	if(user_card)
		selected_atoms += user_card

/datum/heretic_knowledge/bookworm/on_finished_recipe(mob/living/user, list/selected_atoms, turf/loc)
	. = ..()
	for(var/obj/item/card/id/improved_id in selected_atoms)
		improved_id.add_access(list(ACCESS_MAINT_TUNNELS, ACCESS_EXTERNAL_AIRLOCKS, ACCESS_HERETIC), mode = FORCE_ADD_ALL)
		selected_atoms -= improved_id
	for(var/obj/machinery/door/airlock/door in view(7, loc))
		door.req_one_access = null
		door.req_access = list(ACCESS_HERETIC)
		door.wires?.cut(WIRE_AI)
		new /obj/effect/temp_visual/eldritch_sparks(door.loc)
		var/obj/effect/light_emitter/light = new(door.loc)
		light.set_light(1.75, 1.5, COLOR_PUCE)
		QDEL_IN(light, 1 SECONDS)
		playsound(door, 'sound/effects/magic.ogg', 20, vary = TRUE, extrarange = SILENCED_SOUND_EXTRARANGE, ignore_walls = FALSE)
		playsound(door, SFX_SPARKS, 33, vary = TRUE, extrarange = SILENCED_SOUND_EXTRARANGE, ignore_walls = FALSE)

	return TRUE

/**
 * Allows the heretic to craft a spell focus, which passively regenerates some spell charges
 */
/datum/heretic_knowledge/amber_focus
	name = "Amber Focus"
	desc = "Создает Янтарную фокусировку.<br>\
		При ношении раз в несколько минут восстанавливает часть зарядов заклинаний, за исключением некоторых особых заклинаний."
	transmute_text = "Трансмутируйте лист стекла и пару глаз."
	gain_text = "I felt lost and directionless. Everything that I tried to grasp, slipped through my fingers. \
		I needed something to hold onto, something to focus on, to keep me from straying too far from the path."
	required_atoms = list(
		/obj/item/organ/eyes = 1,
		/obj/item/stack/sheet/glass = 1,
	)
	result_atoms = list(/obj/item/clothing/neck/heretic_focus)
	cost = 1
	drafting_tier = 1
	research_tree_icon_path = 'icons/obj/clothing/neck.dmi'
	research_tree_icon_state = "eldritch_necklace"

/datum/heretic_knowledge/miraculous_mirror
	name = "Чудесное зеркало"
	desc = "Craft a Miraculous Mirror.<br>\
		The Miraculous Mirror allows you to freely change any aspect of your appearance. \
		You can also use it to change your species, but doing so will cause the mirror to shatter in the process."
	transmute_text = "Трансмутируйте пять слитков серебра и пару органических глаз."
	gain_text = "I was imperfect, weak. How could I achieve such great things in such a sorry state? \
		Every window I passed by, I saw a reflection of myself, and every time I did, I felt a burning desire to change, to be better, to start anew."
	required_atoms = list(
		/obj/item/organ/eyes = 1,
		/obj/item/stack/sheet/mineral/silver = 5,
	)
	result_atoms = list(/obj/item/wallframe/mirror/heretic)
	cost = 1
	drafting_tier = 1
	research_tree_icon_path = 'icons/obj/watercloset.dmi'
	research_tree_icon_state = "magic_mirror"
	research_tree_icon_frame = 2
	is_shop_only = TRUE

/datum/heretic_knowledge/miraculous_mirror/recipe_snowflake_check(mob/living/user, list/atoms, list/selected_atoms, turf/loc)
	. = ..()
	for(var/obj/item/organ/eyes/eye in atoms)
		if(!IS_ORGANIC_ORGAN(eye))
			atoms -= eye

/datum/heretic_knowledge/spell/cloak_of_shadows
	name = "Cloak of Shadow"
	desc = "Дарует вам заклинание Cloak of Shadow.<br>\
		Это заклинание полностью скрывает вашу личность в фиолетовой дымке на три минуты, помогая вам сохранять секретность."
	notice = "Can only be cast if you have a Living Heart."
	action_to_add = /datum/action/cooldown/spell/shadow_cloak
	cost = 1
	drafting_tier = 1
	max_charges = INFINITY
	is_shop_only = TRUE // not actually but it's got special requirements

/datum/heretic_knowledge/spell/cloak_of_shadows/spell_check(datum/action/the_spell, feedback)
	var/datum/antagonist/heretic/heretic_datum = GET_HERETIC(the_spell.owner)
	if(heretic_datum?.has_living_heart())
		return ..()

	if(feedback)
		to_chat(the_spell.owner, span_mansus("Вам нужно Живое сердце, чтобы произнести [the_spell]!"))
	return SPELL_CANCEL_CAST

/datum/heretic_knowledge/lodestone
	name = "Rhythmic Lodestone"
	desc = "Imbue an object with a Lodestone.<br>\
		The Lodestone pulses in rhythm with your Living Heart, allowing you to track it from any distance - so long as it is not destroyed."
	transmute_text = "Transmute a GPS and up to three of any object."
	gain_text = "I was lost. No one had claimed navigating the Mansus was a simple task. \
		I needed to recenter myself. Focus. Listen to my heartbeat."
	notice = "Up to three items can be imbued at once. Weapons, equipment, and valuables are prioritized."
	required_atoms = list(
		/obj/item/gps = 1,
	)
	cost = 1
	drafting_tier = 1
	is_shop_only = TRUE
	research_tree_icon_path = /obj/item/gps::icon
	research_tree_icon_state = /obj/item/gps::icon_state

/datum/heretic_knowledge/lodestone/recipe_snowflake_check(mob/living/user, list/atoms, list/selected_atoms, turf/loc)
	for(var/obj/whatever in atoms)
		if(istype(whatever, /obj/item/gps) || whatever.anchored)
			continue
		selected_atoms += whatever

	if(!length(selected_atoms))
		loc.balloon_alert(user, "no items to imbue!")
		return FALSE
	return TRUE

/datum/heretic_knowledge/lodestone/on_finished_recipe(mob/living/user, list/selected_atoms, turf/loc)
	var/lodestones_created = 0

	var/list/valuable_pool = list()
	var/list/equipment_pool = list()
	var/list/weapon_pool = list()
	var/list/item_pool = list()
	var/list/leftover_pool = list()
	for(var/obj/new_trackable in selected_atoms)
		if(istype(new_trackable, /obj/item/gps))
			continue

		if(new_trackable.resistance_flags & INDESTRUCTIBLE)
			valuable_pool += new_trackable
		if(isclothing(new_trackable) || astype(new_trackable, /obj/item)?.slot_flags)
			equipment_pool += new_trackable
		if(new_trackable.force >= 15 || isgun(new_trackable))
			weapon_pool += new_trackable
		if(isitem(new_trackable))
			item_pool += new_trackable
		leftover_pool += new_trackable

	// Valuable items first, then clothing items (so you can track people wearing them), then weapons (stuff you probably want), then random items
	for(var/obj/item/new_trackable as anything in valuable_pool | equipment_pool | weapon_pool | item_pool | leftover_pool)
		var/datum/antagonist/heretic/heretic_datum = GET_HERETIC(user)
		LAZYADD(heretic_datum.tracked_items, new_trackable)
		to_chat(user, span_mansus("You feel the new lodestone in [new_trackable] start to beat in rhythm with your heart."))
		lodestones_created += 1
		if(lodestones_created >= 3)
			break

	return lodestones_created >= 1

/datum/heretic_knowledge/lodestone/cleanup_atoms(list/selected_atoms)
	qdel(locate(/obj/item/gps) in selected_atoms)
	selected_atoms.Cut() // ASSUMING DIRECT CONTROL
	return ..()

/datum/heretic_knowledge/blessed_poppy
	name = "Blessed Poppy"
	desc = "Sprout a Blessed Poppy.<br>\
		Blessed Poppies can be applied to wounded limbs to heal them over time. \
		While worn on the head, they will also stabilize those in critical condition. \
		Either usage will eventually sap the poppy of its power, and it will wither away."
	transmute_text = "Transmute a poppy and a sling of at least four gauze."
	gain_text = "\"In Flanders fields, the poppies grow \
		/ Between the crosses, row on row. \
		/ That mark our place; and in the sky, \
		/ The larks, still bravely singing, fly \
		/ Scarce heard amid the guns below.\"\
	"
	required_atoms = list(
		/obj/item/food/grown/flower/poppy = 1,
		/obj/item/stack/medical/wrap/gauze = 4,
	)
	result_atoms = list(/obj/item/food/grown/flower/poppy/blessed)
	cost = 1
	drafting_tier = 1
	is_shop_only = TRUE
	research_tree_icon_path = /obj/item/food/grown/flower/poppy::icon
	research_tree_icon_state = /obj/item/food/grown/flower/poppy::icon
