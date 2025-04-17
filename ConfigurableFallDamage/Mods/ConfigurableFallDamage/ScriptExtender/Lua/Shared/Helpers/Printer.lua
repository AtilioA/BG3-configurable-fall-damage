CFDPrinter = Printer:New { Prefix = "Configurable Fall Damage", ApplyColor = true, DebugLevel = MCM.Get("debug_level") }

-- Update the Printer debug level when the setting is changed, since the value is only used during the object's creation
Ext.ModEvents.BG3MCM['MCM_Setting_Saved']:Subscribe(function(payload)
    if not payload or payload.modUUID ~= ModuleUUID or not payload.settingId then
        return
    end

    if payload.settingId == "debug_level" then
        CFDDebug(0, "Setting debug level to " .. payload.value)
        CFDPrinter.DebugLevel = payload.value
    end
end)

function CFDPrint(debugLevel, ...)
    CFDPrinter:SetFontColor(0, 255, 255)
    CFDPrinter:Print(debugLevel, ...)
end

function CFDTest(debugLevel, ...)
    CFDPrinter:SetFontColor(100, 200, 150)
    CFDPrinter:PrintTest(debugLevel, ...)
end

function CFDDebug(debugLevel, ...)
    CFDPrinter:SetFontColor(200, 200, 0)
    CFDPrinter:PrintDebug(debugLevel, ...)
end

function CFDWarn(debugLevel, ...)
    CFDPrinter:SetFontColor(255, 100, 50)
    CFDPrinter:PrintWarning(debugLevel, ...)
end

function CFDDump(debugLevel, ...)
    CFDPrinter:SetFontColor(190, 150, 225)
    CFDPrinter:Dump(debugLevel, ...)
end

function CFDDumpArray(debugLevel, ...)
    CFDPrinter:DumpArray(debugLevel, ...)
end
