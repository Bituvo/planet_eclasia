local ground_height = planet_eclasia.start_y + 60
local water_height = planet_eclasia.start_y + 55

local main_height_params = {
    offset = ground_height,
    scale = 10,
    spread = {x=280, y=280, z=280},
    seed = 1
}

local hill_height_params = {
    offset = ground_height,
    scale = 15,
    spread = {x=150, y=150, z=150},
    octaves = 4,
    persistence = 0.7,
    flags = "eased",
    seed = 2
}

local C_BEDROCK = C_STONE
if minetest.get_modpath("bedrock") then
    C_BEDROCK = minetest.get_content_id("bedrock:bedrock")
end

local C_STONE = minetest.get_content_id("default:stone")
local C_SAND = minetest.get_content_id("default:sand")
local C_WATER = minetest.get_content_id("default:water_source")
local C_DIRT = minetest.get_content_id("default:dirt")
local C_GRASS = minetest.get_content_id("default:dirt_with_grass")
local C_CRYSTAL_DIRT = minetest.get_content_id("ethereal:crystal_dirt")
local C_ICE = minetest.get_content_id("default:ice")

local main_height_perlin_map = {}
local hill_height_perlin_map = {}

minetest.register_on_generated(function(minp, maxp)
    if minp.y > ground_height or maxp.y < planet_eclasia.start_y then
        return
    end

    local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
    local area = VoxelArea:new{MinEdge=emin, MaxEdge=emax}
    local data = vm:get_data()

    local side_length = maxp.x - minp.x + 1
    local map_lengths_xyz = {x=side_length, y=side_length, z=side_length}

    main_height_perlin = minetest.get_perlin_map(main_height_params, map_lengths_xyz)
    hill_height_perlin = minetest.get_perlin_map(hill_height_params, map_lengths_xyz)
    main_height_perlin:get_2d_map_flat({x=minp.x, y=minp.z}, main_height_perlin_map)
    hill_height_perlin:get_2d_map_flat({x=minp.x, y=minp.z}, hill_height_perlin_map)

    local index = 1

    for z = minp.z, maxp.z do
        for x = minp.x, maxp.x do
            local terrain_y = math.max(main_height_perlin_map[index], hill_height_perlin_map[index])
            local biome = planet_eclasia.get_biome(x, z)

            local top_layer
            local filler = C_DIRT

            if biome == "ice" then
                top_layer = C_ICE
                filler = C_ICE
            elseif biome == "stone" then
                top_layer = C_STONE
                filler = C_STONE
            elseif biome == "crystal" then
                top_layer = C_CRYSTAL_DIRT
            else
                top_layer = C_GRASS
            end

            for y = minp.y, maxp.y do
                if y >= planet_eclasia.start_y then
                    local index = area:index(x, y, z)

                    if y == planet_eclasia.start_y then
                        data[index] = C_BEDROCK

                    elseif y <= terrain_y then
                        if y <= terrain_y - 3 then
                            data[index] = C_STONE
                        elseif y > terrain_y - 3 and terrain_y < water_height then
                            data[index] = C_SAND
                        else
                            if y == math.floor(terrain_y) then data[index] = top_layer
                            elseif y > terrain_y - 3 then data[index] = filler end
                        end

                    elseif y <= water_height then
                        data[index] = C_WATER
                    end
                end
            end

            index = index + 1
        end
    end

    vm:set_data(data)
    minetest.generate_decorations(vm)
    vm:set_lighting({day=15, night=0})
    vm:write_to_map()
end)