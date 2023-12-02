local start_y = planet_eclasia.start_y
local height = planet_eclasia.height

local old_is_pos_in_space = vacuum.is_pos_in_space
vacuum.is_pos_in_space = function(pos)
	if pos.y >= planet_eclasia.start_y and pos.y <= planet_eclasia.start_y + planet_eclasia.height then
		return false
	end
	
	return old_is_pos_in_space(pos)
end