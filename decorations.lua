local default_schematics = minetest.get_modpath("default") .. "/schematics/"
local y_min = planet_eclasia.start_y
local y_max = y_min + planet_eclasia.height

-- Crystal biome

minetest.register_decoration({
    deco_type = "schematic",
    place_on = "ethereal:crystal_dirt",
    rotation = "random",
    flags = "place_center_x, place_center_z",
    fill_ratio = 1 / 2000,
    y_min = y_min,
    y_max = y_max,
    schematic = ethereal.yellowtree
})

minetest.register_decoration({
    deco_type = "schematic",
    place_on = "ethereal:crystal_dirt",
    rotation = "random",
    flags = "place_center_x, place_center_z",
    fill_ratio = 1 / 1500,
    y_min = y_min,
    y_max = y_max,
    schematic = ethereal.frosttrees
})

minetest.register_decoration({
    deco_type = "simple",
    place_on = "ethereal:crystal_dirt",
    decoration = "ethereal:crystalgrass",
    fill_ratio = 1 / 50,
    y_min = y_min,
    y_max = y_max,
})

minetest.register_decoration({
    deco_type = "simple",
    place_on = "ethereal:crystal_dirt",
    decoration = "ethereal:crystal_spike",
    fill_ratio = 1 / 350,
    y_min = y_min,
    y_max = y_max,
})

-- Grass biome

minetest.register_decoration({
    deco_type = "schematic",
    place_on = "default:dirt_with_grass",
    rotation = "random",
    flags = "place_center_x, place_center_z",
    fill_ratio = 1 / 500,
    y_min = y_min,
    y_max = y_max,
    schematic = default_schematics .. "apple_tree_from_sapling.mts"
})

for i = 1, 4 do
    minetest.register_decoration({
        deco_type = "simple",
        place_on = "default:dirt_with_grass",
        decoration = "default:grass_" .. i,
        fill_ratio = 1 / 20,
        y_min = y_min,
        y_max = y_max,
    })
end