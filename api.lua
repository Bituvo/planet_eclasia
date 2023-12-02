function planet_eclasia.get_biome(x, z)
    local pos = {x=x, y=0, z=z}
    local heat = minetest.get_heat(pos)

    if heat <= 15 then
        return "crystal"
    elseif heat <= 30 then
        return "ice"
    elseif heat <= 50 then
        return "stone"
    elseif heat <= 70 then
        return "grass"
    end

    return "stone"
end