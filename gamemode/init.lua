AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

-- local startTime = SysTime()

local function ProcessFiles(folder, isServer)
    local files, folders = file.Find(folder .. "/*", "LUA")
    local AddCSLuaFile = AddCSLuaFile
    local include = include
    local StartWith = string.StartWith
    local MsgC = MsgC
    local Color = Color
    local print = print

    for _, f in ipairs(files) do
        local fullPath = folder .. "/" .. f
        if StartWith(f, "cl_") or StartWith(f, "sh_") then
            AddCSLuaFile(fullPath)
            -- MsgC(Color(0, 150, 255), ("[Клиент] Загруженно на клент: " .. fullPath .. "\n"))
        end
        if isServer and (StartWith(f, "sv_") or StartWith(f, "sh_")) then
            include(fullPath)
            -- MsgC(Color(255,0,0), ("[Сервер] Загруженно на сервер: " .. fullPath .. "\n"))
        end
    end

    for _, f in ipairs(folders) do
        ProcessFiles(folder .. "/" .. f, isServer)
    end
end

-- local endTime = SysTime()

ProcessFiles("realisticsandboxv2/gamemode/modules", SERVER)

-- MsgC(Color(0,255,0), string.format("Загрузка завершена за %.1f секунд.\n", endTime - startTime))
