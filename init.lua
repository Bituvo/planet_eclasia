planet_eclasia = {
	-- starting height of eclasia terrain
	y_start = tonumber(minetest.settings:get("planet_eclasia.y_start")) or 11000,

	-- end height of terrain (relative to start)
	y_height = tonumber(minetest.settings:get("planet_eclasia.y_height")) or 5000,

	-- height of clouds (relative to start)
	y_cloud_height = tonumber(minetest.settings:get("planet_eclasia.y_skybox_height")) or 5300,

	-- end height of skybox (relative to start)
	y_skybox_height = tonumber(minetest.settings:get("planet_eclasia.y_skybox_height")) or 6000,

}

local MP = minetest.get_modpath("planet_eclasia")
dofile(MP.."/api.lua")
dofile(MP.."/decorations.lua")
dofile(MP.."/airlight.lua")
dofile(MP.."/nodes.lua")
dofile(MP.."/ores.lua")
dofile(MP.."/mapgen.lua")
dofile(MP.."/skybox.lua")
dofile(MP.."/vacuum.lua")
dofile(MP.."/marble.lua")
dofile(MP.."/light_restore.lua")
dofile(MP.."/light_restore_command.lua")

print("[OK] Planet: eclasia (start: " .. planet_eclasia.y_start .. ", height:" .. planet_eclasia.y_height .. ")")
