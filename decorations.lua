local default_schematics = minetest.get_modpath("default") .. "/schematics/"
local y_min = planet_eclasia.start_y
local y_max = y_min + planet_eclasia.height

local function register(is_schematic, on, chance, decoration)
    local definition = {
        place_on = on,
        rotation = "random",
        flags = "place_center_x, place_center_z",
        fill_ratio = chance,
        y_min = y_min,
        y_max = y_max
    }

    if is_schematic then
        definition.deco_type = "schematic"
        definition.schematic = decoration
    else
        definition.deco_type = "simple"
        definition.decoration = decoration
    end

    minetest.register_decoration(definition)
end

-- Crystal biome

register(true, "ethereal:crystal_dirt", 1 / 2000, ethereal.yellowtree)
register(true, "ethereal:crystal_dirt", 1 / 1500, ethereal.frosttrees)

register(false, "ethereal:crystal_dirt", 1 / 50, "ethereal:crystalgrass")
register(false, "ethereal:crystal_spike", 1 / 350, "ethereal:crystalgrass")
register(false, "ethereal:crystal_block", 1 / 4000, "ethereal:crystalgrass")

-- Grass biome

register(true, "default:dirt_with_grass", 1 / 500, default_schematics .. "apple_tree_from_sapling.mts")

for i = 1, 4 do
    register(false, "default_dirt_with_grass", 1 / 20, "default:grass_" .. i)
end