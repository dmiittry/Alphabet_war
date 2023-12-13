LANG_TEXT = {}

RUS_TEXT = {
	score = "Cчёт: ",
	menu = "||",
	exit = "Сдаться!",
	pause = "Пауза",
	continue = "Продолжить",
	continue_ads = "Продолжить за просмотр рекламы",
	dead = "Вы проиграли!",
	play_time = "Время игры: ",
	word = "Общее кол-во букв: ",
	accuracy = "Aккуратность: ",
	record = "Ваш рекорд: ",
	select_mode = "Выберите режим:",
	level_mode = " Уровень",
	endless_mode = "Бесконечный режим",
	lang = "Язык: Русский",
}
ENG_TEXT = {
	score = "Score: ",
	menu = "||",
	exit = "Surrender!",
	pause = "Pause",
	continue = "Continue",
	continue_ads = "Continue for adverts",
	dead = "You lose!",
	play_time = "Play time: ",
	word = "Total letters: ",
	accuracy = "Accuracy: ",
	record = "Your record: ",
	select_mode = "Select mode:",
	level_mode = " Level",
	endless_mode = "Endless mode",
	lang = "Language: English",
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

