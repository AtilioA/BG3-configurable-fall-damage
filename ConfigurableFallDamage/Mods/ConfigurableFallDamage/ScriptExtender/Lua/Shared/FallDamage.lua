-- FallDamage module for Configurable Fall Damage
CFD.FallDamage = {}

-- Get the current values from the game and store them as defaults
function CFD.FallDamage.StoreDefaultValues()
    local statsManager = Ext.Stats.GetStatsManager()

    -- Store the current values as defaults
    CFD.Constants.DefaultValues = {
        FallDamageBaseDamage = statsManager.ExtraData.FallDamageBaseDamage,
        FallDamageDamageType = statsManager.ExtraData.FallDamageDamageType,
        FallDamageMaximumDistance = statsManager.ExtraData.FallDamageMaximumDistance,
        FallDamageMinimumDistance = statsManager.ExtraData.FallDamageMinimumDistance,
        FallDamageMultiplierHugeGargantuan = statsManager.ExtraData.FallDamageMultiplierHugeGargantuan,
        FallDamagePronePercent = statsManager.ExtraData.FallDamagePronePercent,
        FallDeadPathfindingCost = statsManager.ExtraData.FallDeadPathfindingCost,
        FallImpactConstant = statsManager.ExtraData.FallImpactConstant,
        FallImpactMinWeight = statsManager.ExtraData.FallImpactMinWeight,
        FallImpactPushDistance = statsManager.ExtraData.FallImpactPushDistance,
        FallMaxDamagePathfindingCost = statsManager.ExtraData.FallMaxDamagePathfindingCost,
        FallMinDamagePathfindingCost = statsManager.ExtraData.FallMinDamagePathfindingCost
    }

    -- Log the default values we found
    CFDPrint(1, "Stored default fall damage values from the game")
    for name, value in pairs(CFD.Constants.DefaultValues) do
        CFDPrint(2, string.format("Default %s = %s", name, tostring(value)))
    end
end

-- Convert prone percentage from MCM to decimal format (inverted: 100% -> 0.0, 0% -> 1.0)
local function ConvertPronePercentage(value)
    return 1.0 - (value / 100.0)
end

-- Apply fall damage settings from MCM to the game
-- @param settingId (optional) Specific setting to apply, or nil to apply all settings
function CFD.FallDamage.ApplyFallDamageSettings(settingId)
    -- Check if mod is enabled
    if MCM.Get("mod_enabled") then
        CFDPrint(1, "Applying fall damage settings from MCM" .. (settingId and (": " .. settingId) or ""))

        local statsManager = Ext.Stats.GetStatsManager()

        -- Apply base damage setting if requested or applying all
        if settingId == nil or settingId == "fall_damage_base_damage" then
            statsManager.ExtraData.FallDamageBaseDamage = MCM.Get("fall_damage_base_damage")
            CFDPrint(2, "Applied base damage: " .. tostring(MCM.Get("fall_damage_base_damage")))
        end

        -- Apply damage type setting if requested or applying all
        if settingId == nil or settingId == "fall_damage_damage_type" then
            statsManager.ExtraData.FallDamageDamageType = MCM.Get("fall_damage_damage_type")
            CFDPrint(2, "Applied damage type: " .. tostring(MCM.Get("fall_damage_damage_type")))
        end

        -- Apply maximum distance setting if requested or applying all
        if settingId == nil or settingId == "fall_damage_maximum_distance" then
            statsManager.ExtraData.FallDamageMaximumDistance = MCM.Get("fall_damage_maximum_distance")
            CFDPrint(2, "Applied maximum distance: " .. tostring(MCM.Get("fall_damage_maximum_distance")))
        end

        -- Apply minimum distance setting if requested or applying all
        if settingId == nil or settingId == "fall_damage_minimum_distance" then
            statsManager.ExtraData.FallDamageMinimumDistance = MCM.Get("fall_damage_minimum_distance")
            CFDPrint(2, "Applied minimum distance: " .. tostring(MCM.Get("fall_damage_minimum_distance")))
        end

        -- Apply huge/gargantuan multiplier setting if requested or applying all
        if settingId == nil or settingId == "fall_damage_multiplier_huge_gargantuan" then
            statsManager.ExtraData.FallDamageMultiplierHugeGargantuan = MCM.Get("fall_damage_multiplier_huge_gargantuan")
            CFDPrint(2,
                "Applied huge/gargantuan multiplier: " .. tostring(MCM.Get("fall_damage_multiplier_huge_gargantuan")))
        end

        -- Apply prone percentage setting if requested or applying all
        if settingId == nil or settingId == "fall_damage_prone_percent" then
            local proneValue = ConvertPronePercentage(MCM.Get("fall_damage_prone_percent"))
            statsManager.ExtraData.FallDamagePronePercent = proneValue
            CFDPrint(2, "Applied prone percentage: " .. tostring(proneValue))
        end

        -- Apply dead pathfinding cost setting if requested or applying all
        if settingId == nil or settingId == "fall_dead_pathfinding_cost" then
            statsManager.ExtraData.FallDeadPathfindingCost = MCM.Get("fall_dead_pathfinding_cost")
            CFDPrint(2, "Applied dead pathfinding cost: " .. tostring(MCM.Get("fall_dead_pathfinding_cost")))
        end

        -- Apply impact constant setting if requested or applying all
        if settingId == nil or settingId == "fall_impact_constant" then
            statsManager.ExtraData.FallImpactConstant = MCM.Get("fall_impact_constant")
            CFDPrint(2, "Applied impact constant: " .. tostring(MCM.Get("fall_impact_constant")))
        end

        -- Apply impact minimum weight setting if requested or applying all
        if settingId == nil or settingId == "fall_impact_min_weight" then
            statsManager.ExtraData.FallImpactMinWeight = MCM.Get("fall_impact_min_weight")
            CFDPrint(2, "Applied impact minimum weight: " .. tostring(MCM.Get("fall_impact_min_weight")))
        end

        -- Apply impact push distance setting if requested or applying all
        if settingId == nil or settingId == "fall_impact_push_distance" then
            statsManager.ExtraData.FallImpactPushDistance = MCM.Get("fall_impact_push_distance")
            CFDPrint(2, "Applied impact push distance: " .. tostring(MCM.Get("fall_impact_push_distance")))
        end

        -- Apply max damage pathfinding cost setting if requested or applying all
        if settingId == nil or settingId == "fall_max_damage_pathfinding_cost" then
            statsManager.ExtraData.FallMaxDamagePathfindingCost = MCM.Get("fall_max_damage_pathfinding_cost")
            CFDPrint(2, "Applied max damage pathfinding cost: " .. tostring(MCM.Get("fall_max_damage_pathfinding_cost")))
        end

        -- Apply min damage pathfinding cost setting if requested or applying all
        if settingId == nil or settingId == "fall_min_damage_pathfinding_cost" then
            statsManager.ExtraData.FallMinDamagePathfindingCost = MCM.Get("fall_min_damage_pathfinding_cost")
            CFDPrint(2, "Applied min damage pathfinding cost: " .. tostring(MCM.Get("fall_min_damage_pathfinding_cost")))
        end
    else
        CFD.FallDamage.ApplyDefaultSettings()
    end
end

-- Apply default settings
function CFD.FallDamage.ApplyDefaultSettings()
    local statsManager = Ext.Stats.GetStatsManager()
    local defaults = CFD.Constants.DefaultValues

    CFDPrint(1, "Applying default fall damage settings")

    -- Apply default settings
    statsManager.ExtraData.FallDamageBaseDamage = defaults.FallDamageBaseDamage
    statsManager.ExtraData.FallDamageDamageType = defaults.FallDamageDamageType
    statsManager.ExtraData.FallDamageMaximumDistance = defaults.FallDamageMaximumDistance
    statsManager.ExtraData.FallDamageMinimumDistance = defaults.FallDamageMinimumDistance
    statsManager.ExtraData.FallDamageMultiplierHugeGargantuan = defaults.FallDamageMultiplierHugeGargantuan
    statsManager.ExtraData.FallDamagePronePercent = defaults.FallDamagePronePercent
    statsManager.ExtraData.FallDeadPathfindingCost = defaults.FallDeadPathfindingCost
    statsManager.ExtraData.FallImpactConstant = defaults.FallImpactConstant
    statsManager.ExtraData.FallImpactMinWeight = defaults.FallImpactMinWeight
    statsManager.ExtraData.FallImpactPushDistance = defaults.FallImpactPushDistance
    statsManager.ExtraData.FallMaxDamagePathfindingCost = defaults.FallMaxDamagePathfindingCost
    statsManager.ExtraData.FallMinDamagePathfindingCost = defaults.FallMinDamagePathfindingCost

    CFDPrint(2, "Applied default fall damage settings")
end

-- Initialize the FallDamage module
function CFD.FallDamage.Initialize()
    -- Register for StatsLoaded event to set initial values
    Ext.Events.StatsLoaded:Subscribe(function()
        -- First, store the default values from the game
        CFD.FallDamage.StoreDefaultValues()

        -- Then apply settings from MCM
        CFD.FallDamage.ApplyFallDamageSettings()
    end)
end
