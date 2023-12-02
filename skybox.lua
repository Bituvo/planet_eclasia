gravity_manager.register({
	miny = planet_eclasia.start_y,
	maxy = planet_eclasia.start_y + planet_eclasia.height,
	gravity = 0.7
})

skybox.register({
	name = "eclasia",
	miny = planet_eclasia.start_y,
	maxy = planet_eclasia.start_y + planet_eclasia.height,
	clouds = {
		thickness = 5,
		color = {r=204, g=224, b=255, a=128},
		ambient = {r=0, g=0, b=0, a=255},
		density = 0.4,
		height = planet_eclasia.start_y + planet_eclasia.height - 800,
		speed = {x=5, y=0}
	},
	textures = {
		"top.png", "bottom.png",
		"front.png", "back.png",
		"left.png", "right.png"
	}
})