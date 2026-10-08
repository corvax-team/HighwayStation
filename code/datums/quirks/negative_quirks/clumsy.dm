/datum/quirk/clumsy
	name = "Clumsy"
	desc = "Ты неуклюжий, глупый чувак. Ты большой и всеми любимый недотепа! Надеюсь, ты не собирался использовать свои руки для чего-либо, требующего хоть малейшей ловкости рук."
	icon = FA_ICON_FACE_DIZZY
	value = -8
	mob_trait = TRAIT_CLUMSY
	gain_text = span_danger("Вы чувствуете, как ваш IQ опускается, словно ваш мозг становится жидким.")
	lose_text = span_notice("Вы чувствуете, что ваш IQ вырос как минимум до среднего уровня.")
	medical_record_text = "Пациент демонстрирует крайние трудности с моторикой в сочетании с неспособностью к критическому мышлению."
	medical_symptom_text = "Exhibits poor coordination and frequent accidents, along with difficulty in problem-solving and decision-making tasks."
	quirk_flags = QUIRK_TRAUMALIKE
