/datum/heretic_knowledge_tree_column/moon
	route = PATH_MOON
	ui_bgr = "node_moon"
	complexity = "Hard"
	complexity_color = COLOR_RED
	icon = list(
		"icon" = 'icons/obj/weapons/khopesh.dmi',
		"state" = "moon_blade",
		"frame" = 1,
		"dir" = SOUTH,
		"moving" = FALSE,
	)
	description = list(
		"The Path of Moon revolves around sanity, sowing confusion and discord, and skirting the conventional rules of combat.",
		"Play this path if you are already experienced with Heretic and want to try something highly unconventional, or simply if you desire to play a pacifist Heretic (Yes, really!)."
	)
	pros = list(
		"High amount of tools to confound foes.",
		"Sows chaos through the station via lunatics.",
		"Practically immune to disabling effects while wearing the Resplendent Regalia."
	)
	cons = list(
		"No mobility.",
		"No direct tools to damage your opponents.",
		"Reliant on misdirection and confusion.",
		"Lunatics can become liabilities.",
		"Fairly fragile despite their unique protection mechanics.",
		"Death while wearing the Resplendent Regalia results in a gorey end.",
	)
	tips = list(
		"Your Mansus Grasp will make your victim briefly hallucinate and apply a mark that, when triggered by your moon blade, will apply confusion and pacify them (the latter will get removed if the victim receives too much damage at once).",
		"Your moon blade is special compared to the other heretic blades. It can be used even if you are pacified.",
		"Your passive makes you completely impervious to brain traumas and slowly regenerates your brain health. Makes sure to upgrade it to bolster the regeneration effect.",
		"Your Resplendent Regalia utterly changes the rules of combat for you and your opponents; You become fully immune to disabling effect, and all damage received (lethal or non lethal) will be converted into brain damage. However. the robes themselves have no armor, and prevent you from using guns as well as pacifying you (you can still use your moon blade).",
		"Your moon amulette allows you to channel its effects through your moon blade. When toggled on, your Moon blade will no longer do lethal damage, but do sanity damage and become unblockable, this also allows you to use it while wearing your robes!",
		"Your moon amulette is a vital part of your kit, as it allows your passive to regenerate double the brain health while worn.",
		"If the sanity of your opponents goes below  a certain threshold, they'll become a lunatic. Lunatics are prompted to start attacking everyone (including you). Should you want to sacrifice them (or to get them to leave you be), hit them again with your moon blade to put them to sleep.",
		"Ringleader's Rise summons an army of clones. They do barely any damage, but should they be attacked by non-heretics, they will explode and cause sanity and brain damage to those around them.",
		"Your ascension will grant you an aura that converts nearby people to loyal lunatics. However, if they have a mindshield implant, their heads will instead detonate after a time.",
	)

	start = /datum/heretic_knowledge/limited_amount/starting/base_moon
	knowledge_tier1 = /datum/heretic_knowledge/spell/mind_gate
	guaranteed_side_tier1 = /datum/heretic_knowledge/phylactery
	knowledge_tier2 = /datum/heretic_knowledge/moon_amulet
	guaranteed_side_tier2 = /datum/heretic_knowledge/codex_morbus
	robes = /datum/heretic_knowledge/armor/moon
	knowledge_tier3 = /datum/heretic_knowledge/spell/moon_parade
	guaranteed_side_tier3 = /datum/heretic_knowledge/unfathomable_curio
	blade = /datum/heretic_knowledge/blade_upgrade/moon
	knowledge_tier4 = /datum/heretic_knowledge/spell/moon_ringleader
	ascension = /datum/heretic_knowledge/ultimate/moon_final

/datum/heretic_knowledge/limited_amount/starting/base_moon
	name = "Moonlight Troupe"
	desc = "Открывает перед вами Путь луны.<br>\
		Позволяет создавать Лунные клинки. \
		Одновременно можно иметь только два."
	transmute_text = "Трансмутируйте 2 листа стекла и нож."
	gain_text = "Под лунным светом смех отдается эхом."
	required_atoms = list(
		/obj/item/knife = 1,
		/obj/item/stack/sheet/glass = 2,
	)
	result_atoms = list(/obj/item/melee/sickly_blade/moon)
	research_tree_icon_path = 'icons/obj/weapons/khopesh.dmi'
	research_tree_icon_state = "moon_blade"
	mark_type = /datum/status_effect/eldritch/moon
	eldritch_passive = /datum/status_effect/heretic_passive/moon

/datum/heretic_knowledge/limited_amount/starting/base_moon/on_gain(mob/user, datum/antagonist/heretic/our_heretic)
	. = ..()
	user.AddComponentFrom(REF(src), /datum/component/empathy, seen_it = TRUE, visible_info = ALL, self_empath = FALSE, sense_dead = FALSE, sense_whisper = TRUE, smite_target = FALSE)

/datum/heretic_knowledge/limited_amount/starting/base_moon/on_mansus_grasp(mob/living/source, mob/living/target)
	. = ..()

	if(target.can_block_magic(MAGIC_RESISTANCE_MOON))
		to_chat(target, span_danger("You hear echoing laughter from above..but it is dull and distant."))
		return

	source.apply_status_effect(/datum/status_effect/moon_grasp_hide)

	if(!iscarbon(target))
		return
	var/mob/living/carbon/carbon_target = target
	to_chat(carbon_target, span_danger("Сверху доносится смех, отдающийся эхом."))
	carbon_target.cause_hallucination(/datum/hallucination/delusion/preset/moon, "delusion/preset/moon hallucination caused by mansus grasp")
	carbon_target.mob_mood.adjust_sanity(-30)

/datum/heretic_knowledge/spell/mind_gate
	name = "Mind Gate"
	desc = "Grants you Mind Gate, a spell which mutes, deafens, blinds, inflicts hallucinations, \
		confusion, oxygen loss and brain damage to its target over 10 seconds.<br>\
		Casting the spell causes brain damage."
	gain_text = "My mind swings open like a gate, and its insight will let me perceive the truth."
	action_to_add = /datum/action/cooldown/spell/pointed/mind_gate
	cost = 2
	max_charges = 6
	path_recharge_amount = 0.33
	focus_recharge_amount = 0.33
	holywater_drain_amount = 0.33

/datum/heretic_knowledge/moon_amulet
	name = "Moonlight Amulet"
	desc = "Создает Moonlight Amulet.<br>\
		Если предмет использован на том, у кого слабый рассудок, они становятся берсерком, нападая на всех подряд. \
		Если рассудок не достаточно низок, то уменьшается их настроение.<br>\
		Ношение этого предмета исцеляет повреждения вашего мозга и дарует вам способность видеть язычников сквозь стены, \
		но делает ваши клинки безвредными - вместо этого они будут калечить разум жертв."
	transmute_text = "Трансмутируйте 2 листа стекла, сердце и галстук."
	gain_text = "Во главе парада стоял он, луна сгустилась в единную массу, отражение души."

	required_atoms = list(
		/obj/item/organ/heart = 1,
		/obj/item/stack/sheet/glass = 2,
		/obj/item/clothing/neck/tie = 1,
	)
	result_atoms = list(/obj/item/clothing/neck/moon_amulet)
	cost = 2

	research_tree_icon_path = 'icons/obj/antags/eldritch.dmi'
	research_tree_icon_state = "moon_amulette"
	research_tree_icon_frame = 9

/datum/heretic_knowledge/armor/moon
	desc = "Create a Resplendant Regalia.<br>While worn, renders you fully immune to disabling effects \
			While worn, pacifies you, while also rendering you fully immune to disabling effects and converting all forms of damage into brain damage."
	gain_text = "Trails of light and mirth flowed from every arm of this magnificent attire. \
			The troupe twirled in irridescent cascades, dazzling onlookers with the truth they sought. \
			I observed, basking in the light, to find my self."
	notice = "Despite the robe's pacifying effect, you can still use your Moon Blades, provided you ALSO wear a Moonlight Amulet."
	transmute_text = "Transmute a table (or a suit), a mask and two sheets of glass."
	result_atoms = list(/obj/item/clothing/suit/hooded/cultrobes/eldritch/moon)
	research_tree_icon_state = "moon_armor"
	required_atoms = list(
		list(/obj/structure/table, /obj/item/clothing/suit) = 1,
		/obj/item/clothing/mask = 1,
		/obj/item/stack/sheet/glass = 2,
	)

/datum/heretic_knowledge/spell/moon_parade
	name = "Lunar Parade"
	desc = "Grants you Lunar Parade, a spell that - after a short charge - fires a projectile.<br>\
		Anyone hit by it is forced to join the parade, following the projectile while suffering hallucinations."
	gain_text = "The music like a reflection of the soul compelled them, like moths to a flame they followed"
	action_to_add = /datum/action/cooldown/spell/pointed/projectile/moon_parade
	notice = "There is no cap to the number of charges on the spell from applying Moonlight Amulets."
	cost = 2
	drafting_tier = 5
	max_charges = 4
	path_recharge_amount = 0.25
	focus_recharge_amount = 0.25
	holywater_drain_amount = 0.25
	path_recharge_can_surpass_cap = TRUE

/datum/heretic_knowledge/blade_upgrade/moon
	name = "Moonlight Blade"
	desc = "Ваш клинок теперь наносит урон мозгу и рассудку, а также вызывает случайные галлюцинации.<br>\
		Наносит больше урона мозгу если жертва в безумии или спит."
	gain_text = "Его остроумие было острым, как клинок, оно прорезало ложь, чтобы принести нам радость."

	research_tree_icon_path = 'icons/ui_icons/antags/heretic/knowledge.dmi'
	research_tree_icon_state = "blade_upgrade_moon"

/datum/heretic_knowledge/blade_upgrade/moon/do_melee_effects(mob/living/source, mob/living/target, obj/item/melee/sickly_blade/blade)
	if(source == target || !isliving(target))
		return

	if(target.can_block_magic(MAGIC_RESISTANCE_MOON))
		return

	target.cause_hallucination( \
			get_random_valid_hallucination_subtype(/datum/hallucination/body), \
			"upgraded path of moon blades", \
		)
	target.emote(pick("giggle", "laugh"))
	target.mob_mood?.adjust_sanity(-10)
	if(!IS_UNCONSCIOUS_OR_CRIT(target) && target.mob_mood?.sanity >= SANITY_NEUTRAL)
		target.adjust_organ_loss(ORGAN_SLOT_BRAIN, 10)
		return
	target.adjust_organ_loss(ORGAN_SLOT_BRAIN, 25)

/datum/heretic_knowledge/spell/moon_ringleader
	name = "Ringleaders Rise"
	desc = "Дает вам Ringleaders Rise, заклинание по области, которое наносит урон мозгу и вызывает галлюцинации в зависимости от рассудка целей."
	gain_text = "Взял его за руку, мы поднялись, и те, кто видел правду, поднялись вместе с нами. \
		Шпрехшталмейстер указал вверх, и тусклый свет правды осветил нас еще больше."
	notice = "There is no cap to the number of charges on the spell from applying Moonlight Amulets."
	action_to_add = /datum/action/cooldown/spell/aoe/moon_ringleader
	cost = 2
	research_tree_icon_frame = 5
	is_final_knowledge = TRUE
	max_charges = 2
	path_recharge_amount = 0.25
	focus_recharge_amount = 0.25
	holywater_drain_amount = 0.25
	path_recharge_can_surpass_cap = TRUE

/datum/heretic_knowledge/ultimate/moon_final
	name = "The Last Act"
	desc = "Ритуал вознесения Пути луны.<br>\
		При завершении, вы становитесь предвестником безумия и получаете ауру пассивного снижения рассудка, \
		а члены экипажа с достаточно низким рассудком станут аколитами.<br>\
		Одна пятая экипажа превратится в аколитов и будет следовать вашим приказам, также они получат Moonlight Amulet"
	transmute_text = "Трансмутируйте 3 трупа с более чем 50 урона мозгу."
	gain_text = "Мы нырнули вниз, к толпе, его душа отделилась в поисках более великой авантюры, \
		туда, откуда Шпрехшталмейстер начал парад, и я продолжу его до самой кончины солнца \
		УЗРИТЕ МОЕ ВОЗНЕСЕНИЕ, ЛУНА УЛЫБНЕТСЯ РАЗ И НАВСЕГДА!"

	ascension_achievement = /datum/award/achievement/misc/moon_ascension
	announcement_text = "%SPOOKY% Смейтесь, ибо Шпрехшталмейстер %NAME% вознесся! \
						Правда наконец поглотит ложь! %SPOOKY%"
	announcement_sound = 'sound/music/antag/heretic/ascend_moon.ogg'

/datum/heretic_knowledge/ultimate/moon_final/is_valid_sacrifice(mob/living/sacrifice)

	var/brain_damage = sacrifice.get_organ_loss(ORGAN_SLOT_BRAIN)
	// Checks if our target has enough brain damage
	if(brain_damage < 50)
		return FALSE

	return ..()

/datum/heretic_knowledge/ultimate/moon_final/on_finished_recipe(mob/living/user, list/selected_atoms, turf/loc)
	. = ..()
	ADD_TRAIT(user, TRAIT_MADNESS_IMMUNE, type)
	user.mind.add_antag_datum(/datum/antagonist/lunatic/master)
	RegisterSignal(user, COMSIG_LIVING_LIFE, PROC_REF(on_life))

	var/amount_of_lunatics = 0
	var/list/lunatic_candidates = list()
	for(var/mob/living/carbon/human/crewmate as anything in shuffle(GLOB.human_list))
		if(QDELETED(crewmate) || isnull(crewmate.client) || isnull(crewmate.mind) || IS_UNCONSCIOUS_OR_CRIT(crewmate) || crewmate.can_block_magic(MAGIC_RESISTANCE_MIND))
			continue
		var/turf/crewmate_turf = get_turf(crewmate)
		var/crewmate_z = crewmate_turf?.z
		if(!is_station_level(crewmate_z))
			continue
		lunatic_candidates += crewmate

	// Roughly 1/5th of the station will rise up as lunatics to the heretic.
	// We use either the (locked) manifest for the maximum, or the amount of candidates, whichever is larger.
	// If there's more eligible humans than crew, more power to them I guess.
	var/max_lunatics = ceil(max(length(GLOB.manifest.locked), length(lunatic_candidates)) * 0.2)

	for(var/mob/living/carbon/human/crewmate as anything in lunatic_candidates)
		if(amount_of_lunatics > max_lunatics)
			to_chat(crewmate, span_boldwarning("Вы чувствуете неспокойство, как будто на мгновение что-то смотрело на вас."))
			continue
		if(attempt_conversion(crewmate, user))
			amount_of_lunatics++

/datum/heretic_knowledge/ultimate/moon_final/proc/attempt_conversion(mob/living/carbon/convertee, mob/user)
	// Heretics, lunatics and monsters shouldn't become lunatics because they either have a master or have a mansus grasp
	if(IS_HERETIC_OR_MONSTER(convertee))
		to_chat(convertee, span_boldwarning("[user]'s rise is influencing those who are weak willed. Their minds shall rend." ))
		return FALSE
	// Mindshielded and anti-magic folks are immune against this effect because this is a magical mind effect
	if(HAS_MIND_TRAIT(convertee, TRAIT_UNCONVERTABLE) || convertee.can_block_magic(MAGIC_RESISTANCE))
		to_chat(convertee, span_boldwarning("You feel shielded from something." ))
		return FALSE

	if(!convertee.mind)
		return FALSE

	var/datum/antagonist/lunatic/lunatic = convertee.mind.add_antag_datum(/datum/antagonist/lunatic)
	lunatic.set_master(user.mind, user)
	var/obj/item/clothing/neck/moon_amulet/amulet = new(convertee.drop_location())
	var/static/list/slots = list(
		LOCATION_NECK,
		LOCATION_HANDS,
		LOCATION_RPOCKET,
		LOCATION_LPOCKET,
		LOCATION_BACKPACK,
	)
	convertee.equip_in_one_of_slots(amulet, slots, qdel_on_fail = FALSE)
	INVOKE_ASYNC(convertee, TYPE_PROC_REF(/mob, emote), "laugh")
	return TRUE

/datum/heretic_knowledge/ultimate/moon_final/proc/on_life(mob/living/source, seconds_per_tick)
	SIGNAL_HANDLER
	visible_hallucination_pulse(
		center = get_turf(source),
		radius = 7,
		hallucination_duration = 60 SECONDS
	)

	for(var/mob/living/carbon/carbon_view in range(7, source))
		var/carbon_sanity = carbon_view.mob_mood.sanity
		if(IS_UNCONSCIOUS_OR_CRIT(carbon_view))
			continue
		if(IS_HERETIC_OR_MONSTER(carbon_view))
			continue
		if(carbon_view.can_block_magic(MAGIC_RESISTANCE_MOON)) //Somehow a shitty piece of tinfoil is STILL able to hold out against the power of an ascended heretic.
			continue
		new /obj/effect/temp_visual/moon_ringleader(get_turf(carbon_view))
		if(carbon_view.has_status_effect(/datum/status_effect/confusion))
			to_chat(carbon_view, span_big(span_hypnophrase("ВАШ РАЗУМ ТРЕЩИТ ОТ ТЫСЯЧИ ГОЛОСОВ, СЛИТЫХ В БЕЗУМНУЮ КАКОФОНИЮ ЗВУКОВ И МУЗЫКИ. КАЖДАЯ ЩЕПКА ВАШЕГО СУЩЕСТВА КРИЧИТ: «БЕГИ».")))
		carbon_view.adjust_confusion(2 SECONDS)
		carbon_view.mob_mood.adjust_sanity(-20)

		if(carbon_sanity >= 10)
			continue
		// So our sanity is dead, time to fuck em up
		if(SPT_PROB(20, seconds_per_tick))
			to_chat(carbon_view, span_warning("оно эхом отдаётся в вас!"))
		visible_hallucination_pulse(
			center = get_turf(carbon_view),
			radius = 7,
			hallucination_duration = 50 SECONDS
		)
		carbon_view.adjust_temp_blindness(5 SECONDS)
		if(should_mind_explode(carbon_view))
			to_chat(carbon_view, span_boldbig(span_red(\
				"ВАШИ ЧУВСТВА ОХВАЧЕНЫ УЖАСОМ, КОГДА В ВАШ РАЗУМ ВТОРГАЕТСЯ ПОТУСТОРОННЯЯ СИЛА, ПЫТАЮЩАЯСЯ ПЕРЕПИСЫВАТЬ ВАШЕ СУЩЕСТВО. \
				ВЫ ДАЖЕ НЕ УСПЕВАЕТЕ КРИКНУТЬ, КАК ВАШ ИМПЛАНТ АКТИВИРУЕТ СВОЮ СИСТЕМУ АВАРИЙНОЙ ПСИОНИЧЕСКОЙ ЗАЩИТЫ, СНОСЯ ВАМ ГОЛОВУ.")))
			var/obj/item/bodypart/head/head = carbon_view.get_bodypart(BODY_ZONE_HEAD)
			if(!head?.dismember())
				carbon_view.gib(DROP_ALL_REMAINS)
			var/datum/effect_system/reagents_explosion/explosion = new(get_turf(carbon_view), 1, 1, 1)
			explosion.start(src)
		else
			attempt_conversion(carbon_view, source)


/datum/heretic_knowledge/ultimate/moon_final/proc/should_mind_explode(mob/living/carbon/target)
	if(HAS_TRAIT(target, TRAIT_MINDSHIELD))
		return TRUE
	if(IS_CULTIST_OR_CULTIST_MOB(target))
		return TRUE
	return FALSE
