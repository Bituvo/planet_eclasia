local y_start = planet_eclasia.y_start
local y_height = planet_eclasia.y_height

-- returns true if the pos is on the eclasia layer
function planet_eclasia.is_pos_on_eclasia(pos)
  return pos.y > y_start and pos.y < (y_start + y_height)
end
