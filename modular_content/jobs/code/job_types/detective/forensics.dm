// Check for fiberless flag to skip adding fibers
/datum/forensics/add_fibers(mob/living/carbon/human/suspect)
	var/obj/item/clothing/gloves/suspect_gloves = suspect.gloves
	if(istype(suspect_gloves) && (suspect_gloves.clothing_flags & FIBERLESS_GLOVES))
		return FALSE
	. = ..()
