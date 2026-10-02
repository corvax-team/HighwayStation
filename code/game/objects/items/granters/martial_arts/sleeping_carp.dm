/obj/item/book/granter/martial/carp
	martial = /datum/martial_art/the_sleeping_carp
	name = "mysterious scroll"
	martial_name = "основы Спящего карпа"
	desc = "Свиток, испещрённый странными знаками. Похоже, это зарисовки какого-то боевого искусства."
	greet = span_sciradio("You have learned the ancient martial art of the Sleeping Carp! Your hand-to-hand combat has become much more effective, and you are now able to deflect any projectiles \
		directed toward you while in Combat Mode. You are also able to sometimes dodge melee and unarmed attacks against you, but only as long as you dress in appropriate martial arts clothing. Or \
		carp-themed clothing. Your body has also hardened itself, granting extra protection against lasting wounds that would otherwise mount during extended combat. However, you are also unable to \
		use any ranged weaponry. You can learn more about your newfound art by using the Recall Teachings verb in the Sleeping Carp tab.")
	icon = 'icons/obj/scrolls.dmi'
	icon_state = "sleepingcarp"
	worn_icon_state = "scroll"
	remarks = list(
		"Подождите, диета с высоким содержанием белка - это действительно всё, что нужно, чтобы стать устойчивым к колото-ножевым ранениям...?",
		"Непреодолимая сила, неподвижный объект...",
		"Сфокусируйтесь... И вы сможете вывести из строя любого противника за считанные секунды...",
		"Я должен пробить броню, чтобы нанести максимальный урон...",
		"Я не думаю, что это будет сочетаться с другими боевыми искусствами...",
		"Стать единым с карпом...",
		"Бульк...",
	)

/obj/item/book/granter/martial/carp/on_reading_finished(mob/living/carbon/user)
	. = ..()
	update_appearance()

/obj/item/book/granter/martial/carp/update_appearance(updates)
	. = ..()
	if(uses <= 0)
		name = "empty scroll"
		desc = "Свиток абсолютно пуст."
		icon_state = "blankscroll"
	else
		name = initial(name)
		desc = initial(desc)
		icon_state = initial(icon_state)
