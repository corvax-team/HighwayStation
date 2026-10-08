/**
 * Dextrous just refers to anything that uses hands,
 * which is generally carbons but can also be silicons and some basics.
 */
/datum/keybinding/dextrous
	category = CATEGORY_DEXTROUS
	weight = WEIGHT_MOB

/datum/keybinding/dextrous/swap_hands
	var/dir
	var/climb = FALSE

/datum/keybinding/dextrous/swap_hands/down(client/user, turf/target, mousepos_x, mousepos_y)
	. = ..()
	if(.)
		return
	var/mob/user_mob = user.mob
	user_mob.cycle_hand(dir, climb)
	return TRUE

/datum/keybinding/dextrous/swap_hands/row
	hotkey_keys = list("X")
	name = "swap_hands"
	full_name = "Поменять руки (горизонтально)"
	description = ""
	keybind_signal = COMSIG_KB_MOB_SWAPHANDS_DOWN

	dir = WEST

/datum/keybinding/dextrous/swap_hands/column
	hotkey_keys = list("ShiftX")
	name = "swap_hands_column"
	full_name = "Поменять руки (вертикально)"
	description = ""
	keybind_signal = COMSIG_KB_MOB_SWAPHANDSCOLUMN_DOWN

	dir = NORTH

/datum/keybinding/dextrous/swap_hands/cycle
	hotkey_keys = list(UNBOUND_KEY)
	name = "swap_hands_cycle"
	full_name = "Поменять руки (переключение)"
	description = ""
	keybind_signal = COMSIG_KB_MOB_SWAPHANDSCYCLE_DOWN

	dir = WEST
	climb = TRUE

/datum/keybinding/dextrous/select_hand
	var/hand_index = NONE

/datum/keybinding/dextrous/select_hand/right
	hotkey_keys = list(UNBOUND_KEY)
	name = "select_right_hand"
	full_name = "Поменять на правую руку"
	keybind_signal = COMSIG_KB_MOB_SELECTRIGHTHAND_DOWN
	hand_index = RIGHT_HANDS

/datum/keybinding/dextrous/select_hand/left
	hotkey_keys = list(UNBOUND_KEY)
	name = "select_left_hand"
	full_name = "Поменять на левую руку"
	keybind_signal = COMSIG_KB_MOB_SELECTLEFTHAND_DOWN
	hand_index = LEFT_HANDS

/datum/keybinding/dextrous/select_hand/down(client/user, turf/target, mousepos_x, mousepos_y)
	. = ..()
	if(.)
		return

	var/mob/user_mob = user.mob
	if(user_mob.active_hand_index % RIGHT_HANDS == hand_index % RIGHT_HANDS) // we're just cycling rows
		user_mob.cycle_hand(NORTH, climb = FALSE)
	else // we have to swap columns
		var/working_index
		var/inactive_hand_index = user_mob.get_inactive_hand_index()
		if(inactive_hand_index == hand_index)
			working_index = user_mob.get_num_hand_slots() - (RIGHT_HANDS - hand_index)
		else
			working_index = inactive_hand_index - 2
		user_mob.cycle_hand(NORTH, climb = FALSE, initial_index = working_index)

	return TRUE

/datum/keybinding/dextrous/activate_inhand
	hotkey_keys = list("Z")
	name = "activate_inhand"
	full_name = "Использовать предмет в руке"
	description = "Использует предмет в вашей активной руке"
	keybind_signal = COMSIG_KB_MOB_ACTIVATEINHAND_DOWN

/datum/keybinding/dextrous/activate_inhand/down(client/user, turf/target, mousepos_x, mousepos_y)
	. = ..()
	if(.)
		return
	var/mob/M = user.mob
	M.mode()
	return TRUE

/datum/keybinding/dextrous/drop_item
	hotkey_keys = list("Q")
	name = "drop_item"
	full_name = "Выложить предмет в руке"
	description = "Ложит предмет из активной руки на поверхность."
	keybind_signal = COMSIG_KB_MOB_DROPITEM_DOWN

/datum/keybinding/dextrous/drop_item/down(client/user, turf/target, mousepos_x, mousepos_y)
	. = ..()
	if(.)
		return
	if(iscyborg(user.mob)) //cyborgs can't drop items
		return FALSE
	var/mob/user_mob = user.mob
	var/obj/item/item_dropped = user_mob.get_active_held_item()
	if(!item_dropped)
		to_chat(user, span_warning("Вам нечего выбрасывать из руки!"))
		return TRUE
	user.mob.dropItemToGround(item_dropped)
	return TRUE

/datum/keybinding/dextrous/drop_item_specific
	hotkey_keys = list("CtrlX")
	name = "drop_item_specific"
	full_name = "Положить предмет (курсор мыши)"
	description = "Ложит элемент в вашем активном месте туда, где находится курсор мыши, если он находится в пределах досягаемости."
	keybind_signal = COMSIG_KB_MOB_DROPITEM_DOWN

/datum/keybinding/dextrous/drop_item_specific/down(client/user, turf/target, mousepos_x, mousepos_y)
	. = ..()
	if(.)
		return
	if(iscyborg(user.mob)) //cyborgs can't drop items
		return FALSE
	var/mob/user_mob = user.mob
	var/obj/item/item_dropped = user_mob.get_active_held_item()
	if(!item_dropped)
		to_chat(user, span_warning("Вам нечего выбрасывать из руки!"))
		return TRUE
	if(!user_mob.Adjacent(target) || target.is_blocked_turf(source_atom = item_dropped))
		return TRUE
	var/x_value = (mousepos_x >= 0) ? mousepos_x - ICON_SIZE_X / 2 : mousepos_x + ICON_SIZE_X / 2
	var/y_value = (mousepos_y >= 0) ? mousepos_y - ICON_SIZE_Y / 2 : mousepos_y + ICON_SIZE_Y / 2
	user_mob.transfer_item_to_turf(item_dropped, target, x_value, y_value)
	return TRUE
