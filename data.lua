--[[Slurry]]
local lithiumbrine = data.raw["fluid"]["lithium-brine"]
local slurry = {
    type = "fluid",
    name = "nutrient-slurry",
    icon = "__Nutrient-Slurry__/nutrient-slurry.png",
    --auto_barrel = false,--defaults to true
    icons = {
        {
            icon = "__Nutrient-Slurry__/nutrient-slurry.png",
            --icon_size = lithiumbrine.icon_size,
            icon_size = 64,
            tint = {1, 1, 1, 0.9}
        },
    },
    default_temperature = 15.0,
    base_color = {1, 1, 1, 0.9},
    flow_color = {1, 1, 1, 0.9},
    fuel_value = "5MJ",--Nutrients Yummy Value: 2MJ
    subgroup = "fluid"
}
local slurryRecipeCategory = {
    type = "recipe-category",
    name = "slurry-organic"
}

data:extend{slurry, slurryRecipeCategory}

--[[Slurry Biochamber]]
local biochamber = data.raw["assembling-machine"]["biochamber"]
table.insert(biochamber.crafting_categories, slurryRecipeCategory.name)
local slurryBiochamber = table.deepcopy(biochamber)
slurryBiochamber.name = "slurry-".. slurryBiochamber.name
slurryBiochamber.minable.result = slurryBiochamber.name
slurryBiochamber.energy_source = {
    type = "fluid",
    fluid_box = {
        volume = 100,
        pipe_connections = {
            {
                direction = defines.direction.north,
                flow_direction = "input",
                position = {0, -1}
            }
        },
        pipe_covers = {
            east = {
              layers = {
                {
                  filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east.png",
                  height = 128,
                  priority = "extra-high",
                  scale = 0.5,
                  width = 128
                },
                {
                  draw_as_shadow = true,
                  filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east-shadow.png",
                  height = 128,
                  priority = "extra-high",
                  scale = 0.5,
                  width = 128
                }
              }
            },
            north = {
              layers = {
                {
                  filename = "__base__/graphics/entity/pipe-covers/pipe-cover-north.png",
                  height = 128,
                  priority = "extra-high",
                  scale = 0.5,
                  width = 128
                },
                {
                  draw_as_shadow = true,
                  filename = "__base__/graphics/entity/pipe-covers/pipe-cover-north-shadow.png",
                  height = 128,
                  priority = "extra-high",
                  scale = 0.5,
                  width = 128
                }
              }
            },
            south = {
              layers = {
                {
                  filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south.png",
                  height = 128,
                  priority = "extra-high",
                  scale = 0.5,
                  width = 128
                },
                {
                  draw_as_shadow = true,
                  filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south-shadow.png",
                  height = 128,
                  priority = "extra-high",
                  scale = 0.5,
                  width = 128
                }
              }
            },
            west = {
              layers = {
                {
                  filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west.png",
                  height = 128,
                  priority = "extra-high",
                  scale = 0.5,
                  width = 128
                },
                {
                  draw_as_shadow = true,
                  filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west-shadow.png",
                  height = 128,
                  priority = "extra-high",
                  scale = 0.5,
                  width = 128
                }
              }
            }
        },
        pipe_picture = {
            east = {
              layers = {
                {
                  filename = "__space-age__/graphics/entity/biochamber/biochamber-pipes-east-1.png",
                  height = 56,
                  line_length = 1,
                  scale = 0.5,
                  shift = {
                    -1.140625,
                    0.015625
                  },
                  width = 88
                },
                {
                  draw_as_shadow = true,
                  filename = "__space-age__/graphics/entity/biochamber/biochamber-pipes-east-shadow.png",
                  height = 168,
                  line_length = 1,
                  scale = 0.5,
                  shift = {
                    -0.28125,
                    1.25
                  },
                  width = 50
                }
              }
            },
            north = {
              layers = {
                {
                  filename = "__space-age__/graphics/entity/biochamber/biochamber-pipes-north-1.png",
                  height = 34,
                  line_length = 1,
                  scale = 0.5,
                  shift = {
                    0,
                    0.40625
                  },
                  width = 52
                },
                {
                  draw_as_shadow = true,
                  filename = "__space-age__/graphics/entity/biochamber/biochamber-pipes-north-shadow.png",
                  height = 62,
                  line_length = 1,
                  scale = 0.5,
                  shift = {
                    1.234375,
                    0.734375
                  },
                  width = 200
                }
              }
            },
            south = {
              layers = {
                {
                  filename = "__space-age__/graphics/entity/biochamber/biochamber-pipes-south-1.png",
                  height = 64,
                  line_length = 1,
                  scale = 0.5,
                  shift = {
                    0,
                    -0.671875
                  },
                  width = 52
                },
                {
                  draw_as_shadow = true,
                  filename = "__space-age__/graphics/entity/biochamber/biochamber-pipes-south-shadow.png",
                  height = 62,
                  line_length = 1,
                  scale = 0.5,
                  shift = {
                    -0.8125,
                    -0.71875
                  },
                  width = 206
                }
              }
            },
            west = {
              layers = {
                {
                  filename = "__space-age__/graphics/entity/biochamber/biochamber-pipes-west-1.png",
                  height = 64,
                  line_length = 1,
                  scale = 0.5,
                  shift = {
                    0.828125,
                    -0.09375
                  },
                  width = 44
                }
              }
            }
        },
        pipe_picture_frozen = {
            east = {
              filename = "__space-age__/graphics/entity/biochamber/biochamber-pipes-east-1-frozen.png",
              height = 56,
              line_length = 1,
              scale = 0.5,
              shift = {
                -1.140625,
                0.015625
              },
              width = 88
            },
            north = {
              filename = "__space-age__/graphics/entity/biochamber/biochamber-pipes-north-1-frozen.png",
              height = 34,
              line_length = 1,
              scale = 0.5,
              shift = {
                0,
                0.40625
              },
              width = 52
            },
            south = {
              filename = "__space-age__/graphics/entity/biochamber/biochamber-pipes-south-1-frozen.png",
              height = 64,
              line_length = 1,
              scale = 0.5,
              shift = {
                0,
                -0.671875
              },
              width = 52
            },
            west = {
              filename = "__space-age__/graphics/entity/biochamber/biochamber-pipes-west-1-frozen.png",
              height = 64,
              line_length = 1,
              scale = 0.5,
              shift = {
                0.828125,
                -0.09375
              },
              width = 44
            }
        },
    },--//fluid_box
    burns_fluid = true,
    scale_fluid_usage = true
}

local slurryBiochamberItem = table.deepcopy(data.raw["item"]["biochamber"])
slurryBiochamberItem.name = slurryBiochamber.name
slurryBiochamberItem.icons = {
    {
        icon = slurryBiochamberItem.icon,
        icon_size = slurryBiochamberItem.icon_size,
        tint = {0, 1, 0, 1}
    },
}
slurryBiochamberItem.place_result = slurryBiochamber.name
slurryBiochamberItem.order = slurryBiochamberItem.order.. "a"

local slurryBiochamberRecipe = table.deepcopy(data.raw["recipe"]["biochamber"])
slurryBiochamberRecipe.name = slurryBiochamber.name
slurryBiochamberRecipe.category = slurryRecipeCategory.name
slurryBiochamberRecipe.results = {{type="item", name=slurryBiochamber.name, amount=1}}
slurryBiochamberRecipe.enabled = true

data:extend{slurryBiochamber, slurryBiochamberItem, slurryBiochamberRecipe}

--[[Slurry Recipe]]
local slurryRecipe = {
    type = "recipe",
    name = slurry.name,
    category = slurryRecipeCategory.name,
    ingredients = {
        {type="fluid", name="water", amount=100},
        {type="item", name="nutrients", amount=100},
        {type="item", name="ice", amount=50}
    },
    results = {
        {type="fluid", name=slurry.name, amount=100}
    },
    energy_required = 2,
    enabled = true,
    hide_from_player_crafting = true--not handcraftable
}

data:extend{slurryRecipe}