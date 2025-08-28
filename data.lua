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
local pipe_gfx = biochamber.fluid_boxes[1]
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
        pipe_covers = pipe_gfx.pipe_covers,
        pipe_picture = pipe_gfx.pipe_picture,
        pipe_picture_frozen = pipe_gfx.pipe_picture_frozen
    },
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
local slurryBiochamberRecipe = {
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
data:extend{freezeWaterRecipe}

--[[Slurry Technologies]]
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
    prerequisites = {"agricultural-science-pack"},
    effects = {
        {type="unlock-recipe", recipe=slurryRecipe.name},
        {type="unlock-recipe", recipe=slurryBiochamberRecipe.name},
        {type="unlock-recipe", recipe=freezeWaterRecipe.name}
    }
}
local slurryCraftingTechnology = {
    type = "technology",
    name = "slurry-crafting",
    icon = "__Nutrient-Slurry__/nutrient-slurry.png",
    icon_size = 64,
    unit = {
        count = 250,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"production-science-pack", 1},
            {"agricultural-science-pack", 1}
        },
        time = 30
    },
    prerequisites = {slurryTechnology.name},
    effects = {}
}
data:extend{slurryTechnology}--slurryCraftingTechnology is deferred for alt recipes

--[[Modified Gleba Recipies to use Slurry]]
local recipesToModify = {
    "pentapod-egg",
    "agricultural-science-pack",
    "iron-bacteria-cultivation",
    "copper-bacteria-cultivation",
    "fish-breeding",
    --"rocket-fuel-from-jelly",
    "bioplastic",
    "biosulfur"
}
--Failed to load mods: Error while loading recipe prototype "slurry-rocket-fuel-from-jelly" (recipe):
--Value must be a list in property tree at ROOT.recipe.slurry-rocket-fuel-from-jelly.ingredients
for _,r in pairs(recipesToModify) do
    altRecipe = table.deepcopy(data.raw["recipe"][r])
    altRecipe.name = "slurry-".. altRecipe.name
    altRecipe.category = slurryRecipeCategory.name
    for k,v in pairs(altRecipe.ingredients) do
        if v.name == "nutrients" then
            v.type = "fluid"
            v.name = slurry.name
            v.amount = v.amount * 2 / 5
        end
        if v.name == "bioflux" then
            v.type = "fluid"
            v.name = slurry.name
            v.amount = v.amount * 16
        end
        if v.name == "water" then
            altRecipe.ingredients[k] = nil
        end
    end
    data:extend{altRecipe}
    table.insert(slurryCraftingTechnology.effects, {type="unlock-recipe", recipe=altRecipe.name})
end
--Manual workaround. Why tf am i getting the above error?
local altRktFuelRecipe = table.deepcopy(data.raw["recipe"]["rocket-fuel-from-jelly"])
altRktFuelRecipe.name = "slurry-".. altRktFuelRecipe.name
altRktFuelRecipe.category = slurryRecipeCategory.name
altRktFuelRecipe.ingredients = {
    {type="fluid", name=slurry.name, amount=32},
    {type="item", name="jelly", amount=30}
}
data:extend{altRktFuelRecipe}
table.insert(slurryCraftingTechnology.effects, {type="unlock-recipe", recipe=altRktFuelRecipe.name})
data:extend{slurryCraftingTechnology}