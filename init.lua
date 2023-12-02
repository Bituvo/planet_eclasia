planet_eclasia = {
    start_y = tonumber(minetest.settings:get("planet_eclasia.start_y")) or 20000,
    height = tonumber(minetest.settings:get("planet_eclasia.height")) or 5000,
    crust_height = tonumber(minetest.settings:get("planet_eclasia.crust_height")) or 30,
    terrain_height = tonumber(minetest.settings:get("planet_eclasia.terrain_height")) or 30,
    water_height = tonumber(minetest.settings:get("planet_eclasia.water_height")) or 20
}

local MP = minetest.get_modpath("planet_eclasia")
dofile(MP.."/vacuum.lua")
dofile(MP.."/mapgen.lua")
dofile(MP.."/skybox.lua")

print("[OK] Planet: Eclasia (start: " .. planet_eclasia.start_y .. ", height:" .. planet_eclasia.height .. ")")
