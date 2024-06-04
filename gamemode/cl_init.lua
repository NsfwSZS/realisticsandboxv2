include("shared.lua")

local function IncludeFiles(folder)
    local files, folders = file.Find(folder .. "/*", "LUA")
    
    for _, f in ipairs(files) do
        local fullPath = folder .. "/" .. f
        if string.StartWith(f, "cl_") or string.StartWith(f, "sh_") then
            include(fullPath)
        end
    end

    for _, f in ipairs(folders) do
        IncludeFiles(folder .. "/" .. f)
    end
end
-- test
IncludeFiles("realisticsandboxv2/gamemode/modules")
