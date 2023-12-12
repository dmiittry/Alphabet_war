LANG_TEXT = {}

RUS_TEXT = {
	score = "счёт: ",
	menu = "||",
	exit = "Сдаться!",
	continue = "Продолжить за просмотр рекламы",
	dead = "Вы проиграли!",
	play_time = "Время игры: ",
	word = "Общее кол-во букв: ",
}
ENG_TEXT = {
	score = "score: ",
	menu = "||",
	exit = "Surrender!",
	continue = "Continue for adverts",
	dead = "You lose!",
	play_time = "Play time: ",
	word = "Total letters: ",
}

function change_lang(lang)
	LANG_TEXT = {}
	if lang == "ru" then
		for key, value in pairs(RUS_TEXT) do
			LANG_TEXT[key] = value
		end
	elseif lang == "en" then
		for key, value in pairs(ENG_TEXT) do
			LANG_TEXT[key] = value
		end
	end
	-- for key, value in pairs(LANG_TEXT) do
	-- 	print(key, value)
	-- end
end

