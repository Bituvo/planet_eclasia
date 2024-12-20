planet_eclasia = {
    start_y = tonumber(minetest.settings:get("planet_eclasia.start_y")) or 20000,
    height = tonumber(minetest.settings:get("planet_eclasia.height")) or 1000
}

local MP = minetest.get_modpath("planet_eclasia")
dofile(MP.."/api.lua")
dofile(MP.."/vacuum.lua")
dofile(MP.."/decorations.lua")
dofile(MP.."/mapgen.lua")
dofile(MP.."/skybox.lua")

print("[OK] Planet: Eclasia (start: " .. planet_eclasia.start_y .. ", height:" .. planet_eclasia.height .. ")")
