CFD = CFD or {}
CFD.MCM = {}

local FALL_DAMAGE_SETTINGS = {
    -- General settings
    "mod_enabled",

    -- Fall Damage settings
    "fall_damage_base_damage",
    "fall_damage_damage_type",
    "fall_damage_maximum_distance",
    "fall_damage_minimum_distance",
    "fall_damage_multiplier_huge_gargantuan",
    "fall_damage_prone_percent",

    -- Fall Pathfinding settings
    "fall_dead_pathfinding_cost",
    "fall_impact_constant",
    "fall_impact_min_weight",
    "fall_impact_push_distance",
    "fall_max_damage_pathfinding_cost",
    "fall_min_damage_pathfinding_cost"
}

function CFD.MCM.HandleSettingChange(payload)
    if not payload or payload.modUUID ~= ModuleUUID then
        return
    end

    -- Check if the changed setting is one of our fall damage settings
    for _, settingId in ipairs(FALL_DAMAGE_SETTINGS) do
        if payload.settingId == settingId then
            -- Apply only the changed setting
            CFD.FallDamage.ApplyFallDamageSettings(payload.settingId)
            return
        end
    end
end
