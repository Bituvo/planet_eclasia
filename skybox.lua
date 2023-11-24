local has_skybox_mod = minetest.get_modpath("skybox")
local has_gravity_manager_mod = minetest.get_modpath("gravity_manager")

local min_y = planet_eclasia.y_start
local cave_end_y = planet_eclasia.y_start + (planet_eclasia.y_height * 0.97)
local max_y = planet_eclasia.y_start + planet_eclasia.y_skybox_height

if has_gravity_manager_mod then
	gravity_manager.register({
		miny = min_y,
		maxy = max_y,
		gravity = 0.37
	})
end

if has_skybox_mod then
	skybox.register({
		-- http://www.custommapmakers.org/skyboxes.php
		name = "eclasia",
		miny = cave_end_y,
		maxy = max_y,
		always_day = true,
		clouds = {
			thickness=64,
			color={r=244, g=189, b=114, a=229},
			ambient={r=0, g=0, b=0, a=255},
			density=0.4,
			height=planet_eclasia.y_start + planet_eclasia.y_skybox_height - 200,
			speed={y=-2,x=-2}
		},
		textures = {
			"eclasia_up.jpg^[transformR270",
			"eclasia_dn.jpg^[transformR90",
			"eclasia_ft.jpg",
			"eclasia_bk.jpg",
			"eclasia_lf.jpg",
			"eclasia_rt.jpg"
		}
	})

	skybox.register({
		name = "eclasia_cave",
		miny = min_y,
		maxy = cave_end_y,
		always_day = true,
		sky_type = "plain",
		sky_color = {r=244, g=189, b=114}
	})
end
