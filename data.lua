--[[Slurry]]
local slurry = {
    type = "fluid",
    name = "nutrient-slurry",
    icon = "__Nutrient-Slurry__/nutrient-slurry.png",
    --auto_barrel = false,--defaults to true
    icons = {
        {
            icon = "__Nutrient-Slurry__/nutrient-slurry.png",
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
local slurryRecipe = {
    type = "recipe",
    name = slurry.name,
    category = slurryRecipeCategory.name,
    ingredients = {
        {type="fluid", name="water", amount=100},
        {type="item", name="nutrients", amount=100},
        {type="item", name="ice", amount=50}
    },
    results = {{type="fluid", name=slurry.name, amount=100}},
    energy_required = 2,
    enabled = false,
    hide_from_player_crafting = true
}
data:extend{slurry, slurryRecipeCategory, slurryRecipe}

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
        },--//pipe_covers
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
        },--//pipe_picture
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
        },--//pipe_picture_frozen
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

--local slurryBiochamberRecipe = table.deepcopy(data.raw["recipe"]["biochamber"])
slurryBiochamberRecipe = {
    type = "recipe",
    name = slurryBiochamber.name,
    category = slurryRecipeCategory.name,
    ingredients = {
        {type="item", name="electronic-circuit", amount=5},
        {type="item", name="iron-plate", amount=20},
        {type="item", name="landfill", amount=1},
        {type="fluid", name=slurry.name, amount=5},
        {type="item", name="pentapod-egg", amount=1}
    },
    results = {{type="item", name=slurryBiochamber.name, amount=1}},
    energy_required = 20,
    enabled = false,
    hide_from_player_crafting = true
}
data:extend{slurryBiochamber, slurryBiochamberItem, slurryBiochamberRecipe}

--[[The Engineer discovers how to freeze water!!]]
local freezeWaterRecipe = {
    type = "recipe",
    name = "freeze-water",
    category = "cryogenics",
    ingredients = {{type="fluid", name="water", amount=10000}},
    results = {{type="item", name="ice", amount=500}},
    energy_required = 20,
    enabled = false,
    hide_from_player_crafting = true
}
--table.insert(data.raw["technology"]["cryogenic-plant"].effects, {type="unlock-recipe", recipe=freezeWaterRecipe.name})
data:extend{freezeWaterRecipe}

--[[Modified Gleba Recipies to use Slurry]]
local slurryPentapodEggRecipe = table.deepcopy(data.raw["recipe"]["pentapod-egg"])
slurryPentapodEggRecipe.name = "slurry-".. slurryPentapodEggRecipe.name
slurryPentapodEggRecipe.category = slurryRecipeCategory.name
slurryPentapodEggRecipe.ingredients = {
    {type="fluid", name=slurry.name, amount=12},
    {type="item", name="pentapod-egg", amount=1}
}

local slurryAgriSciRecipe = table.deepcopy(data.raw["recipe"]["agricultural-science-pack"])
slurryAgriSciRecipe.name = "slurry-".. slurryAgriSciRecipe.name
slurryAgriSciRecipe.category = slurryRecipeCategory.name
slurryAgriSciRecipe.ingredients = {
    {type="fluid", name=slurry.name, amount=16},
    {type="item", name="pentapod-egg", amount=1}
}

local slurryFeCultRecipe = table.deepcopy(data.raw["recipe"]["iron-bacteria-cultivation"])
slurryFeCultRecipe.name = "slurry-".. slurryFeCultRecipe.name
slurryFeCultRecipe.category = slurryRecipeCategory.name
slurryFeCultRecipe.ingredients = {
    {type="fluid", name=slurry.name, amount=16},
    {type="item", name="iron-bacteria", amount=1}
}

local slurryCuCultRecipe = table.deepcopy(data.raw["recipe"]["copper-bacteria-cultivation"])
slurryCuCultRecipe.name = "slurry-".. slurryCuCultRecipe.name
slurryCuCultRecipe.category = slurryRecipeCategory.name
slurryCuCultRecipe.ingredients = {
    {type="fluid", name=slurry.name, amount=16},
    {type="item", name="copper-bacteria", amount=1}
}

local slurryFishRecipe = table.deepcopy(data.raw["recipe"]["fish-breeding"])
slurryFishRecipe.name = "slurry-".. slurryFishRecipe.name
slurryFishRecipe.category = slurryRecipeCategory.name
slurryFishRecipe.ingredients = {
    {type="item", name="raw-fish", amount=2}
}

local slurryRocketFuelRecipe = table.deepcopy(data.raw["recipe"]["rocket-fuel-from-jelly"])
slurryRocketFuelRecipe.name = "slurry".. slurryRocketFuelRecipe.name
slurryRocketFuelRecipe.category = slurryRecipeCategory.name
slurryRocketFuelRecipe.ingredients = {
    {type="fluid", name=slurry.name, amount=32},
    {type="item", name="jelly", amount=30}
}

local slurryBioplasticRecipe = table.deepcopy(data.raw["recipe"]["bioplastic"])
slurryBioplasticRecipe.name = "slurry".. slurryBioplasticRecipe.name
slurryBioplasticRecipe.category = slurryRecipeCategory.name
slurryBioplasticRecipe.ingredients = {
    {type="fluid", name=slurry.name, amount=16},
    {type="item", name="yumako-mash", amount=4}
}

local slurryBiosulfurRecipe = table.deepcopy(data.raw["recipe"]["biosulfur"])
slurryBiosulfurRecipe.name = "slurry".. slurryBiosulfurRecipe.name
slurryBiosulfurRecipe.category = slurryRecipeCategory.name
slurryBiosulfurRecipe.ingredients = {
    {type="fluid", name=slurry.name, amount=16},
    {type="item", name="spoilage", amount=5}
}
data:extend{slurryPentapodEggRecipe, slurryAgriSciRecipe, slurryFeCultRecipe, slurryCuCultRecipe, slurryFishRecipe, slurryRocketFuelRecipe, slurryBioplasticRecipe, slurryBiosulfurRecipe}

--[[The Engineer discovers how to make nutrient slurry!!]]
local slurryTechnology = {
    type = "technology",
    name = "slurry-processing",
    icon = "__Nutrient-Slurry__/nutrient-slurry.png",
    icon_size = 64,
    unit = {
        count = 50,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"production-science-pack", 1},
            {"agricultural-science-pack", 1}
        },
        time = 30
    },
    prerequisites = {"biochamber"},
    effects = {
        {type="unlock-recipe", recipe=slurryRecipe.name},
        {type="unlock-recipe", recipe=slurryBiochamberRecipe.name},
        {type="unlock-recipe", recipe=freezeWaterRecipe.name},
        {type="unlock-recipe", recipe=slurryPentapodEggRecipe.name},
        {type="unlock-recipe", recipe=slurryAgriSciRecipe.name},
        {type="unlock-recipe", recipe=slurryFeCultRecipe.name},
        {type="unlock-recipe", recipe=slurryCuCultRecipe.name},
        {type="unlock-recipe", recipe=slurryFishRecipe.name},
        {type="unlock-recipe", recipe=slurryRocketFuelRecipe.name},
        {type="unlock-recipe", recipe=slurryBioplasticRecipe.name},
        {type="unlock-recipe", recipe=slurryBiosulfurRecipe.name}
    }
}
data:extend{slurryTechnology}