local main_height_params = {
	offset = planet_eclasia.start_y + planet_eclasia.crust_height * 2,
	scale = 10,
	spread = {x=280, y=280, z=280},
    seed = 1
}

local hill_height_params = {
	offset = planet_eclasia.start_y + planet_eclasia.crust_height * 2,
	scale = planet_eclasia.terrain_height / 2,
	spread = {x=150, y=150, z=150},
    octaves = 4,
    persistence = 0.7,
    flags = "eased",
    seed = 2
}

local C_STONE = minetest.get_content_id("default:stone")
local C_WATER = minetest.get_content_id("default:water_source")
local C_BEDROCK = C_STONE

if minetest.get_modpath("bedrock") then
	C_BEDROCK = minetest.get_content_id("bedrock:bedrock")
end

local main_height_perlin_map = {}
local hill_height_perlin_map = {}

minetest.register_on_generated(function(minp, maxp)
    if minp.y > planet_eclasia.start_y + planet_eclasia.crust_height + planet_eclasia.terrain_height or maxp.y < planet_eclasia.start_y then
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

            for y = minp.y, maxp.y do
                if y >= planet_eclasia.start_y then
                    local index = area:index(x, y, z)

                    if y <= planet_eclasia.start_y then
                        data[index] = C_BEDROCK
                    
                    elseif y <= terrain_y then
                        data[index] = C_STONE
                    end
                end
            end

            index = index + 1
        end
    end

    vm:set_data(data)
    vm:set_lighting({day=15, night=0})
    vm:write_to_map()
end)

minetest.register_on_punchnode(function(pos)
    minetest.chat_send_all(minetest.pos_to_string(pos))
end)