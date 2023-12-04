LANG_TEXT = {}

RUS_TEXT = {
	score = "счёт: ",
	menu = "меню"
}
ENG_TEXT = {
	score = "score: ",
	menu = "menu"
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

