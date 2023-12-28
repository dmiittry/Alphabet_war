RED_COLOR = vmath.vector4(1,0,0,1)
WHITE_COLOR = vmath.vector4(1,1,1,1)
BLACK_COLOR = vmath.vector4(0,0,0,1)
GREEN_COLOR = vmath.vector4(0,1,0,1)
BLUE_COLOR = vmath.vector4(0,0,1,1)
GREY_COLOR = vmath.vector4(0.4,0.4,0.4,1)

SPEED_WORD = 9 -- 4 min / 9 max
TIME_SPAWN_WORD = 0.8 -- 0.3 min / 0.8 max

ENDLESS_TIME_SPAWN_WORD = 0.8
ENDLESS_SPEED_WORD = 9

LEVEL_TIME_GAME = {10, 20, 30, 40, 50, 60, 70, 75, 80, 85, 90, 95, 100, 105, 110, 115, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120}
LEVEL_TIME_SPAWN_WORD = {1.2,1.2,1.2,1.2,1.2,1.1,1.1,1.1,1.1,1.1,1,1,1,1,1,0.95,0.95,0.95,0.95,0.95,0.9,0.9,0.9,0.9,0.9,0.9,0.85,0.85,0.85,0.85,0.85,0.8,0.8,0.8,0.8,0.8,0.7,0.7,0.7,0.7,0.6,0.6,0.6,0.6,0.6,0.5,0.5,0.5,0.5,0.5}
LEVEL_SPEED_WORD = {12,12,12,12,12,11,11,11,11,11,10,10,10,10,10,9,9,9,9,9,8,8,8,8,8,7,7,7,7,7,6,6,6,6,6,5,5,5,5,5,4.5,4.5,4.5,4.5,4.5,4,4,4,4,4}

LEVEL = 1

GAME_MODE = "endless"
FREE_BOOST = true
BOOST = false
KILL_ALL = false
TOUCH_WORD = ""
ALL_SPAWN_WORD = 0
ALL_WORD = 0
ALL_TOUCH = 0
ACCURACY = 0
RECORD = 0
SCORE = 0
PLAY_TIME = 0

WORD_LIST = {}
STANDART_LIST = { "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "A", "S", "D", "F", "G", "H", "J", "K", "L", "Z", "X", "C", "V", "B", "N", "M" }

POSITION_WORD = {}
POSITION_LIST = {20,60,100,140,180,220,260,300,340,380,420,460,500,540,580,620,660,700}

LIFE = 0
MAX_LIFE = 3

function set_record(value)
	if value > RECORD then
		RECORD = value
		msg.post("menu:/go#yandex", "leaderboard", {value = RECORD})
	end
end

function reset_settings()
	FREE_BOOST = true
	LIFE = MAX_LIFE
	KILL_ALL = false
	TOUCH_WORD = ""
	ALL_WORD = 0
	ALL_SPAWN_WORD = 0
	ALL_TOUCH = 0
	ACCURACY = 0
	SCORE = 0
	PLAY_TIME = 0
	BOOST = false
	ENDLESS_TIME_SPAWN_WORD = 0.8
	ENDLESS_SPEED_WORD = 9
	LEVEL_TIME_GAME = {10, 20, 30, 40, 50, 60, 70, 75, 80, 85, 90, 95, 100, 105, 110, 115, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120, 120}
	LEVEL_TIME_SPAWN_WORD = {1.2,1.2,1.2,1.2,1.2,1.1,1.1,1.1,1.1,1.1,1,1,1,1,1,0.95,0.95,0.95,0.95,0.95,0.9,0.9,0.9,0.9,0.9,0.9,0.85,0.85,0.85,0.85,0.85,0.8,0.8,0.8,0.8,0.8,0.7,0.7,0.7,0.7,0.6,0.6,0.6,0.6,0.6,0.5,0.5,0.5,0.5,0.5}
	LEVEL_SPEED_WORD = {12,12,12,12,12,11,11,11,11,11,10,10,10,10,10,9,9,9,9,9,8,8,8,8,8,7,7,7,7,7,6,6,6,6,6,5,5,5,5,5,4.5,4.5,4.5,4.5,4.5,4,4,4,4,1}
end
	
function set_accuracy()
	ACCURACY = ALL_WORD * 100 / ALL_TOUCH
end
function set_score(value)
	SCORE = SCORE + value
	msg.post("main:/go#guigame", "score")
end
function set_life(value)
	if value == 0 then
		LIFE = MAX_LIFE
	elseif value > 0 then
		LIFE = LIFE - value
		msg.post("main:/go#guigame", "minus_life")
	elseif value < 0 then
		if LIFE < MAX_LIFE then
			LIFE = LIFE - value
		end
	end
	if LIFE <= 0 then
		msg.post("main:/go#guigame", "dead")
		msg.post("menu:/go#menu", "dead")
	end
	msg.post("main:/go#guigame", "set_life", {value = LIFE})
end

function new_list_word()
	for key,value in pairs(STANDART_LIST) do 
		WORD_LIST[key] = value
	end
end

function remove_word(key)
	table.remove(WORD_LIST, key)
	if #WORD_LIST < #STANDART_LIST/2 then
		new_list_word()
	end
end

function new_list_pos()
	for key,value in pairs(POSITION_LIST) do 
		POSITION_WORD[key] = value
	end
end

function remove_pos_word(key)
	table.remove(POSITION_WORD, key)
	if #POSITION_WORD < #POSITION_LIST/4 then
		new_list_pos()
	end
end