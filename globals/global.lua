WORD_LIST = {}

STANDART_LIST = { "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "A", "S", "D", "F", "G", "H", "J", "K", "L", "Z", "X", "C", "V", "B", "N", "M"}

function new_list()
	for key,value in pairs(STANDART_LIST) do 
		WORD_LIST[key] = value
	end
end

function remove_word(key)
	table.remove(WORD_LIST, key)
	if #WORD_LIST < #STANDART_LIST/2 then
		new_list()
	end
end