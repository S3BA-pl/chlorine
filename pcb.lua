local util = require("data-util");

data:extend({
  {
    type = "item",
    name = "pcb-substrate",
    icon = "__bzchlorine__/graphics/icons/pcb-substrate.png",
    icon_size = 128,
    subgroup = "intermediate-product",
    order = "f[advanced-circuit][pcb-substrate]",
    stack_size = util.get_stack_size(200),
  },
  {
    type = "item",
    name = "pcb",
    icon = "__bzchlorine__/graphics/icons/pcb.png",
    icon_size = 128,
    subgroup = "intermediate-product",
    order = "f[advanced-circuit][pcb]",
    stack_size = util.get_stack_size(200),
  },

})

local amount = mods.Krastorio2 and 2 or 1
data:extend({
  {
    type = "recipe",
    name = "pcb-substrate",
    results = {
      {"pcb-substrate", 6},
    },
    ingredients = {
      {type="fluid", name="epoxy", amount=30},
      {"plastic-bar", 3},
    },
    enabled = false,
    category = "chemistry",
    energy_required = 6,
  },
  {
    type = "recipe",
    name = "pcb",
    results = {
      {"pcb", amount},
    },
    ingredients = {
      {"pcb-substrate", amount},
      {"copper-plate", 1},
      util.me.more() and {"ferric-chloride", 1} or {type="fluid", name="hydrogen-chloride", amount=10},
      {type="fluid", name="water", amount=10},
    },
    enabled = false,
    category = "crafting-with-fluid",
    energy_required = amount,
  },
})

util.add_unlock("advanced-electronics", "pcb-substrate")
util.add_unlock("advanced-electronics", "pcb")

-- These updates should be in data phase
util.replace_some_ingredient("pcb-substrate", "plastic-bar", 1, "silica", 3)
util.replace_some_ingredient("pcb-substrate", "plastic-bar", 1, "bakelite", 1)
