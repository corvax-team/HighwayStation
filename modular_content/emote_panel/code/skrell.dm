// MARK: Emotes
/datum/emote/living/carbon/human/skrell
	species_type_whitelist_typecache = list(/datum/species/skrell)

/datum/emote/living/carbon/human/skrell/warble
	name = "Трелить"
	key = "warble"
	key_third_person = "warbles"
	message = "трелит."
	message_param = "трелит на %t."
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	vary = TRUE

/datum/emote/living/carbon/human/skrell/warble/get_sound(mob/living/user)
	return pick(
		'modular_content/emote_panel/audio/skrell/warble_1.ogg',
		'modular_content/emote_panel/audio/skrell/warble_2.ogg',
	)

/datum/emote/living/carbon/human/skrell/warble/melodic
	name = "Мелодично трелить"
	key = "melodicwarble"
	key_third_person = "melodicwarble"
	message = "мелодично трелит."
	message_param = "мелодично трелит на %t."
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	vary = TRUE

/datum/emote/living/carbon/human/skrell/warble/melodic/get_sound(mob/living/user)
	return pick(
		'modular_content/emote_panel/audio/skrell/melodicwarble.ogg',
	)

/datum/emote/living/carbon/human/skrell/croak
	name = "Квакать"
	key = "croak"
	key_third_person = "croak"
	message = "квакает."
	message_param = "квакает на %t."
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	vary = TRUE

/datum/emote/living/carbon/human/skrell/croak/get_sound(mob/living/user)
	return pick(
		'modular_content/emote_panel/audio/skrell/croak_1.ogg',
		'modular_content/emote_panel/audio/skrell/croak_2.ogg',
		'modular_content/emote_panel/audio/skrell/croak_3.ogg',
	)

/datum/emote/living/carbon/human/skrell/croak/anger
	name = "Гневно квакать"
	key = "croak_anger"
	key_third_person = "croak_anger"
	message = "гневно квакает!"
	message_param = "гневно квакает на %t."
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	vary = TRUE

/datum/emote/living/carbon/human/skrell/croak/anger/get_sound(mob/living/user)
	return pick(
		'modular_content/emote_panel/audio/skrell/anger_1.ogg',
		'modular_content/emote_panel/audio/skrell/anger_2.ogg',
	)
