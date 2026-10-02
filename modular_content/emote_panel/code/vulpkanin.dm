// MARK: Emotes
/datum/emote/living/carbon/human/vulpkanin
	species_type_whitelist_typecache = list(/datum/species/vulpkanin)

/datum/emote/living/carbon/human/vulpkanin/howl
	name = "Выть"
	key = "howl"
	key_third_person = "howls"
	message = "воет."
	message_mime = "делает вид, что воет."
	message_param = "воет на %t."
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	cooldown = 6 SECONDS
	sound = 'modular_content/emote_panel/audio/vulpkanin/howl.ogg'

/datum/emote/living/carbon/human/vulpkanin/growl
	name = "Рычать"
	key = "growl"
	key_third_person = "growls"
	message = "рычит."
	message_mime = "бусшумно рычит."
	message_param = "рычит на %t."
	cooldown = 2 SECONDS
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE

/datum/emote/living/carbon/human/vulpkanin/growl/get_sound(mob/living/user)
	return pick(
		'modular_content/emote_panel/audio/vulpkanin/growl1.ogg',
		'modular_content/emote_panel/audio/vulpkanin/growl2.ogg',
		'modular_content/emote_panel/audio/vulpkanin/growl3.ogg',
	)

/datum/emote/living/carbon/human/vulpkanin/purr
	name = "Урчать"
	key = "purr"
	key_third_person = "purrs"
	message = "урчит."
	message_param = "урчит на %t."
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	cooldown = 2 SECONDS
	sound = 'modular_content/emote_panel/audio/vulpkanin/purr.ogg'

/datum/emote/living/carbon/human/vulpkanin/bark
	name = "Гавкнуть"
	key = "bark"
	key_third_person = "bark"
	message = "гавкает."
	message_param = "гавкает на %t."
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	vary = TRUE
	cooldown = 2 SECONDS
	sound = 'modular_content/emote_panel/audio/vulpkanin/bark.ogg'

/datum/emote/living/carbon/human/vulpkanin/wbark
	name = "Гавкнуть дважды"
	key = "wbark"
	key_third_person = "wbark"
	message = "дважды гавкает."
	message_param = "дважды гавкает на %t."
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	vary = TRUE
	cooldown = 2 SECONDS
	sound = 'modular_content/emote_panel/audio/vulpkanin/wbark.ogg'
