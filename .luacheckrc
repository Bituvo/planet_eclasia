
globals = {
	"planet_eclasia",
	"planetoids",
	"vacuum",
	"skybox"
}

read_globals = {
	-- Stdlib
	string = {fields = {"split"}},
	table = {fields = {"copy", "getn"}},

	-- Minetest
	"minetest",
	"vector", "ItemStack",
	"dump", "VoxelArea",

	-- Deps
	"default", "gravity_manager", "bamboo", "stairsplus"
}
