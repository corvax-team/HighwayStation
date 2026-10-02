/datum/hud
	var/atom/movable/screen/gunhud_screen

/datum/hud/human/initialize_screen_objects()
	. = ..()
	gunhud_screen = add_screen_object(/atom/movable/screen/gunhud_screen, HUD_MOB_GUNHUD, HUD_GROUP_INFO)

/datum/hud/human/Destroy(force)
	gunhud_screen = null
	return ..()
