// Как выставлять контроллер:
//	ai_controller = /datum/ai_controller/basic_controller/base_animal

// =========== Базовый контроллер животного ===========
/datum/ai_controller/basic_controller/base_animal
	behavior_tree_json = "code/datums/ai/basic_mobs/base_animal.bt.json"
	blackboard = list(
		BB_TARGETING_STRATEGY = /datum/targeting_strategy/basic,
		BB_BASIC_MOB_SPEAK_LINES = list(	// - что будет говорить и показывает в качестве эмоций
			BB_EMOTE_SAY = list("Вэх!", "Вэх."), // Что говорит
			BB_EMOTE_HEAR = list("говорит."), // Что показывается когда говорит
			BB_EMOTE_SEE = list("трясет головой.", "гонится за хвостом.", "пялится.", "озирается."), // Случайная эмоция
			BB_SPEAK_CHANCE = 3,
		),
	)

	ai_traits = PASSIVE_AI_FLAGS
	ai_movement = /datum/ai_movement/basic_avoidance

// =========== Петух ===========
/datum/ai_controller/basic_controller/chicken/cock
	behavior_tree_json = "code/modules/mob/living/basic/farm_animals/chicken/chicken_cock.bt.json"

// =========== Опоссум ===========
/datum/ai_controller/basic_controller/possum
	behavior_tree_json = "code/modules/mob/living/basic/vermin/possum.bt.json"
	blackboard = list(
		BB_TARGETING_STRATEGY = /datum/targeting_strategy/basic,
		BB_BASIC_MOB_SPEAK_LINES = list(
			BB_EMOTE_SAY = list("Хссс...", "Хиссс..."),
			BB_EMOTE_HEAR = list("Хсаааа!", "Хссс!"),
			BB_EMOTE_SEE = list("трясет головой.", "гонится за хвостом.", "пялится.", "озирается."),
			BB_SPEAK_CHANCE = 3,
		),
	)

	ai_traits = DEFAULT_AI_FLAGS | STOP_MOVING_WHEN_PULLED
	ai_movement = /datum/ai_movement/basic_avoidance

// =========== Большие ящерицы ===========
/datum/ai_controller/basic_controller/lizard/big
	behavior_tree_json = "code/modules/mob/living/basic/vermin/lizard_big.bt.json"
	blackboard = list(
		BB_TARGETING_STRATEGY = /datum/targeting_strategy/basic,
		BB_BASIC_MOB_SPEAK_LINES = list(
			BB_EMOTE_SAY = list("ГРРР!", "Гррр!", "Рыр!", "Грх!"),
			BB_EMOTE_HEAR = list("рычит.", "ворчит.", "грохочет."),
			BB_EMOTE_SEE = list("топает.", "свирепо пялится."),
			BB_EMOTE_SOUND = list('modular_content/mobs/sound/lizard_angry1.ogg', 'modular_content/mobs/sound/lizard_angry2.ogg', 'modular_content/mobs/sound/lizard_angry3.ogg'),
			BB_SPEAK_CHANCE = 1,
		),
	)

	ai_traits = DEFAULT_AI_FLAGS | STOP_MOVING_WHEN_PULLED
	ai_movement = /datum/ai_movement/basic_avoidance

// =========== Крысы ===========
/datum/ai_controller/basic_controller/mouse/rat/syndi
	blackboard = list(
		BB_TARGETING_STRATEGY = /datum/targeting_strategy/basic,
		BB_PET_TARGETING_STRATEGY = /datum/targeting_strategy/basic/not_friends,
		BB_CURRENT_TARGET = null,
		BB_CURRENT_HUNTING_TARGET = null,
		BB_LOW_PRIORITY_HUNTING_TARGET = null,
		BB_OWNER_SELF_HARM_RESPONSES = list(
			"*me cleans its whiskers in disapproval.",
			"*me squeaks sadly.",
			"*me sheds a single small tear."
		),
		BB_BASIC_MOB_SPEAK_LINES = list(
			BB_EMOTE_SAY = list("Слава Синдикату!", "Смерть НаноТрейзен!", "Отдавайте сыр!", "Слава Сыркату!", "Смерть за сыр!"),
			BB_EMOTE_HEAR = list("пищит."),
			BB_EMOTE_SEE = list("бегает по кругу.", "встряхивается."),
			BB_EMOTE_SOUND = list('modular_content/mobs/sound/rat_talk.ogg'),
			BB_SPEAK_CHANCE = 2,
		),
	)

// =========== Хряки ===========
/datum/ai_controller/basic_controller/pig/big
	behavior_tree_json = "code/modules/mob/living/basic/farm_animals/pig_big.bt.json"
	blackboard = list(
		BB_TARGETING_STRATEGY = /datum/targeting_strategy/basic,
		BB_BASIC_MOB_SPEAK_LINES = list(
			BB_EMOTE_SAY = list("хрю?", "хрю", "хрюк"),
			BB_EMOTE_HEAR = list("хрюкает."),
			BB_EMOTE_SEE = list("обнюхивается."),
			BB_EMOTE_SOUND = list('modular_content/mobs/sound/pig_talk1.ogg', 'modular_content/mobs/sound/pig_talk2.ogg'),
			BB_SPEAK_CHANCE = 3,
		),
	)

// =========== ... ===========
