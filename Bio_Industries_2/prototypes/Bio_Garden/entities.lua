local BioInd = require('common')('Bio_Industries_2')

local ICONPATH = BioInd.modRoot .. "/graphics/icons/"
local ICONPATH_E = BioInd.modRoot .. "/graphics/icons/entity/"

require("util")


--- Bio Garden
data:extend({
    {
        type = "assembling-machine",
        name = "bi-bio-garden",
        icon = ICONPATH_E .. "bio_garden_icon.png",
        icon_size = 64,
        icons = {
            {
                icon = ICONPATH_E .. "bio_garden_icon.png",
                icon_size = 64,
            }
        },
        flags = { "placeable-neutral", "placeable-player", "player-creation" },
        minable = { hardness = 0.2, mining_time = 0.5, result = "bi-bio-garden" },
        fast_replaceable_group = "bi-bio-garden",
        max_health = 150,
        corpse = "medium-remnants",
        collision_box = { { -1.2, -1.2 }, { 1.2, 1.2 } },
        selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
        fluid_boxes = {
            {
                production_type = "input",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                volume = 1000,
                base_level = -1,
                pipe_connections = { { flow_direction = "input", direction = defines.direction.north, position = { 0, -1 } } }
            },
        },
        fluid_boxes_off_when_no_fluid_recipe = true,
        graphics_set = {
            animation = {
                filename = "__Bio_Industries_2__/graphics/entities/biogarden/bio_garden_x.png",
                width = 160,
                height = 160,
                frame_count = 12,
                line_length = 4,
                animation_speed = 0.025,
                shift = { 0.45, 0 }
            },
        },
        open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
        close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
        working_sound = {
            sound = { { filename = "__Bio_Industries_2__/sound/rainforest_ambience.ogg", volume = 0.8 } },
            idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
            apparent_volume = 1.5,
        },
        crafting_categories = { "clean-air" },
        source_inventory_size = 1,
        result_inventory_size = 1,
        crafting_speed = 1.0,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            emissions_per_minute = { pollution = -45 }, -- Negative value: pollution is absorbed!
        },
        energy_usage = "200kW",
        ingredient_count = 1,
        -- Changed for 0.18.34/1.1.4 -- Modules don't make sense for the gardens!
        -- (Efficiency modules are also meant to reduce pollution, but as the base value
        -- is negative, the resulting value is greater than the base value! )
        module_specification = {
            module_slots = 1
        },
        -- Changed for 0.18.34/1.1.4 -- We need to use an empty table here, so the gardens
        -- won't be affected by beacons!
        allowed_effects = { "consumption", "speed" },
    },
})
