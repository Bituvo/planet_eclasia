-- TODO: figure out a way to _properly_ solve this without abm and vmanip hacks!

-- airlight restoration abm
-- slowly reclaims dark spaces on eclasia
minetest.register_abm({
  label = "eclasia airlight",
  nodenames = {"air"},
  neighbors = {"planet_eclasia:airlight"},
  interval = 10,
  chance = 100,
  action = function(pos)

    -- check coordinates
    if not planet_eclasia.is_pos_on_eclasia(pos) then
      -- we are not on eclasia, no replacementsare done here
      return
    end

    -- search for soil-like nodes below the target node
    local below_pos = { x=pos.x, y=pos.y-1, z=pos.z }
    local below_nodes = minetest.find_nodes_in_area(below_pos, below_pos, {"group:soil"})
    if below_nodes then
      -- found soil beneath, don't replace air here otherwise the farming-mod is getting weird about it
      return
    end

    minetest.set_node(pos, {name = "planet_eclasia:airlight"})
  end
})

-- remove airlights near soil nodes
minetest.register_abm({
  label = "eclasia airlight remove near soil",
  nodenames = {"planet_eclasia:airlight"},
  neighbors = {"group:soil"},
  interval = 5,
  chance = 50,
  action = function(pos)
    minetest.swap_node(pos, { name="air" })
  end
})
