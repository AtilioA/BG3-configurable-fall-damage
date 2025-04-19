CFD = CFD or {}

-- Empty defaults that will be populated from the game
CFD.Constants = {
    DefaultValues = {}
}

---Ext.Require files at the path
---@param path string
---@param files string[]
function RequireFiles(path, files)
    for _, file in pairs(files) do
        Ext.Require(string.format("%s%s.lua", path, file))
    end
end

RequireFiles("Shared/", {
    "MCMHandler",
    "Helpers/_Init",
    "FallDamage"
})
