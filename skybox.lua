local has_skybox_mod = minetest.get_modpath("skybox")
local has_gravity_manager_mod = minetest.get_modpath("gravity_manager")

local min_y = planet_eclasia.start_y
local max_y = planet_eclasia.start_y + planet_eclasia.height

if has_gravity_manager_mod then
	gravity_manager.register({
		miny = min_y,
		maxy = max_y,
		gravity = 0.7
	})
end

if has_skybox_mod then
	skybox.register({
		-- http://www.custommapmakers.org/skyboxes.php
		name = "eclasia",
		miny = min_y,
		maxy = max_y,
		always_day = true,
		clouds = {
			thickness = 64,
			color = {r=244, g=189, b=114, a=229},
			ambient = {r=0, g=0, b=0, a=255},
			density = 0.4,
			height = max_y - 200,
			speed = {y=-2, x=-2}
		},
		textures = {
			"top.png",--^[transformR270",
			"bottom.png",--^[transformR90",
			"front.png",
			"back.png",
			"left.png",
			"right.png"
		}
	})
end
