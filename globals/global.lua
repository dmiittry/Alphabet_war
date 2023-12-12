RED_COLOR = vmath.vector4(1,0,0,1)
WHITE_COLOR = vmath.vector4(1,1,1,1)
BLACK_COLOR = vmath.vector4(0,0,0,1)
GREEN_COLOR = vmath.vector4(0,1,0,1)
BLUE_COLOR = vmath.vector4(0,0,1,1)
GREY_COLOR = vmath.vector4(0.4,0.4,0.4,1)

SPEED_WORD = 9 -- 4 min / 9 max
TIME_SPAWN_WORD = 0.8 -- 0.3 min / 0.8 max

KILL_ALL = false
TOUCH_WORD = ""
GAME_MODE = "endless"
ALL_WORD = 0
SCORE = 0
PLAY_TIME = 0

WORD_LIST = {}
STANDART_LIST = { "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "A", "S", "D", "F", "G", "H", "J", "K", "L", "Z", "X", "C", "V", "B", "N", "M" }

POSITION_WORD = {}
POSITION_LIST = {20,40,60,80,100,120,140,160,180,200,220,240,260,280,300,320,340,360,380,400,420,440,460,480,500,520,540,560,580,600,620,640,660,680,700}

LIFE = 0

function set_life(value)
	LIFE = LIFE - value
	if LIFE <= 0 then
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