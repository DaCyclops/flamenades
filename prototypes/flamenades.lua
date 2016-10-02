data:extend(
{
  {
    type = "capsule",
    name = "flame-grenade",
    icon = "__flamenades__/graphics/flame-grenade.png",
    flags = {"goes-to-quickbar"},
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
        type = "projectile",
        ammo_category = "grenade",
        cooldown = 30,
        projectile_creation_distance = 0.6,
        range = 30,
        ammo_type =
        {
          category = "grenade",
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "projectile",
              projectile = "flame-grenade",
              starting_speed = 0.3
            }
          }
        }
      }
    },
    subgroup = "capsule",
    order = "a[grenade]-b[flame]",
    stack_size = 100
  },



  {
    type = "projectile",
    name = "flame-grenade-proj",
    flags = {"not-on-map"},
    acceleration = 0.005,
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-fire",
              entity_name = "fire-flame"
            },
            {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true
            }
          }
        }
      }
    },
    light = {intensity = 0.7, size = 8},
    animation = 
    {
    filename = "__base__/graphics/entity/fire-flame/fire-flame-04.png",
      line_length = 8,
      width = 67,
      height = 130,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = "additive",
      animation_speed = 0.5,
      scale = 1,
      tint = {r=1,g=0.8,b=0.8,a=1},
      flags = { "compressed" },
      shift = { 0.015625, -1.109375 },
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/grenade/grenade-shadow.png",
      frame_count = 1,
      width = 24,
      height = 32,
      priority = "high"
    }
  },

  
  
  {
    type = "projectile",
    name = "flame-grenade",
    flags = {"not-on-map"},
    acceleration = 0.005,
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = "explosion"
            },
            {
              type = "create-entity",
              entity_name = "small-scorchmark",
              check_buildability = true
            }
          }
        }
      },
      {
        type = "cluster",
        cluster_count = 12,
        distance = 7,
        distance_deviation = 4,
        action_delivery =
        {
          type = "projectile",
          projectile = "flame-grenade-proj",
          direction_deviation = 0.3,
          starting_speed = 0.65,
          starting_speed_deviation = 0.3
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__flamenades__/graphics/flame-grenade.png",
      frame_count = 1,
      width = 24,
      height = 24,
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/grenade/grenade-shadow.png",
      frame_count = 1,
      width = 24,
      height = 32,
      priority = "high"
    }
  },

  {
    type = "recipe",
    name = "flame-grenade",
    enabled = false,
    energy_required = 8,
    ingredients =
    {
      {"grenade", 2},
      {"flame-thrower-ammo", 6},
    },
    result = "flame-grenade"
  }
  
})

table.insert(data.raw["technology"]["flame-thrower"].effects,{type="unlock-recipe",recipe="flame-grenade"})


