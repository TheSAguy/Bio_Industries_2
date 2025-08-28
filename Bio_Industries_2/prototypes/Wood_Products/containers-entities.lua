if not BI.Settings.BI_Bigger_Wooden_Chests then
  return
end

local BioInd = require('common')('Bio_Industries_2')


BioInd.writeDebug("Creating bigger wooden chests!")


local ICONPATH = BioInd.modRoot .. "/graphics/icons/"
local ICONPATH_E = BioInd.modRoot .. "/graphics/icons/entity/"
local WOODPATH = BioInd.modRoot .. "/graphics/entities/wood_products/"

local SNDPATH = "__base__/sound/"

local sounds = {}
sounds.open_sound = { filename = "__base__/sound/wooden-chest-open.ogg" }
sounds.close_sound = { filename = SNDPATH .. "wooden-chest-close.ogg" }

sounds.walking_sound = {}
for i = 1, 11 do
  sounds.walking_sound[i] = {
    filename = SNDPATH .. "walking/concrete-" .. i ..".ogg",
    volume = 1.2
  }
end


------------------------------------------------------------------------------------
--                         Rename the vanill wooden chest!                        --
------------------------------------------------------------------------------------
data.raw.container["wooden-chest"].localised_name = {"entity-name.bi-wooden-chest"}


------------------------------------------------------------------------------------
--                        Create the bigger wooden chests!                        --
------------------------------------------------------------------------------------

------- Large Wooden Chest
data:extend({
  {
    type = "container",
    name = "bi-wooden-chest-large",
    icon = ICONPATH_E .. "large_wooden_chest_icon.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH_E .. "large_wooden_chest_icon.png",
        icon_size = 64,
      }
    },
    -- This is necessary for "Space Exploration" (if not true, the entity can only be
    -- placed on Nauvis)!
    se_allow_in_space = true,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "bi-wooden-chest-large"},
    max_health = 200,
    corpse = "small-remnants",
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-1.0, -1.0}, {1.0, 1.0}},
    fast_replaceable_group = "container",
    inventory_size = 128, -- 64
    open_sound = { filename = "__base__/sound/wooden-chest-open.ogg" },
    close_sound = { filename = "__base__/sound/wooden-chest-close.ogg" },
    impact_category = "wood",
    picture = {
      filename = WOODPATH .. "large_wooden_chest.png",
      priority = "extra-high",
      width = 184,
      height = 132,
      shift = {0.5, 0},
      scale = 0.5,
    },
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
})

------- Huge Wooden Chest
data:extend({
  {
    type = "container",
    name = "bi-wooden-chest-huge",
    icon = ICONPATH_E .. "huge_wooden_chest_icon.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH_E .. "huge_wooden_chest_icon.png",
        icon_size = 64,
      }
    },
    scale_info_icons = true,
    -- This is necessary for "Space Exploration" (if not true, the entity can only be
    -- placed on Nauvis)!
    se_allow_in_space = true,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1.5, result = "bi-wooden-chest-huge"},
    max_health = 350,
    corpse = "small-remnants",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    fast_replaceable_group = "container",
    inventory_size = 432, --144
    open_sound = { filename = "__base__/sound/wooden-chest-open.ogg" },
    close_sound = { filename = "__base__/sound/wooden-chest-close.ogg" },
        impact_category = "wood",
    picture = {
      filename = WOODPATH .. "huge_wooden_chest.png",
      priority = "extra-high",
      width = 184,
      height = 132,
      shift = {0.5, 0},
      scale = 0.75,
    },
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
})

------- Giga Wooden Chest
data:extend({
  {
    type = "container",
    name = "bi-wooden-chest-giga",
    icon = ICONPATH_E .. "giga_wooden_chest_icon.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH_E .. "giga_wooden_chest_icon.png",
        icon_size = 64,
      }
    },
    scale_info_icons = true,
    -- This is necessary for "Space Exploration" (if not true, the entity can only be
    -- placed on Nauvis)!
    se_allow_in_space = true,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 3.5, result = "bi-wooden-chest-giga"},
    max_health = 350,
    corpse = "big-remnants",
    collision_box = {{-2.8, -2.8}, {2.8, 2.8}},
    selection_box = {{-3, -3}, {3, 3}},
    fast_replaceable_group = "container",
    inventory_size = 1728, --576
    open_sound = { filename = "__base__/sound/wooden-chest-open.ogg" },
    close_sound = { filename = "__base__/sound/wooden-chest-close.ogg" },
        impact_category = "wood",
    picture = {
      filename = WOODPATH .. "giga_wooden_chest.png",
      priority = "extra-high",
      width = 501,
      height = 366,
      shift = {0.88, -0.170},
      scale = 0.5,
    },
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
})
