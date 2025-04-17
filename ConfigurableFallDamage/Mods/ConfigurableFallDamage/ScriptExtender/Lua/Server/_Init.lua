local MODVERSION = Ext.Mod.GetMod(ModuleUUID).Info.ModVersion

if MODVERSION == nil then
    CFDPrint(0, "Configurable Fall Damage loaded (version unknown)")
else
    table.remove(MODVERSION)
    local versionNumber = table.concat(MODVERSION, ".")
    CFDPrint(0, "Configurable Fall Damage version " .. versionNumber .. " loaded")
end

-- Initialize fall damage module
CFD.FallDamage.Initialize()

-- Subscribe to MCM setting changes
Ext.Events.SessionLoaded:Subscribe(function()
    Ext.ModEvents.BG3MCM["MCM_Setting_Saved"]:Subscribe(CFD.MCM.HandleSettingChange)
end)
