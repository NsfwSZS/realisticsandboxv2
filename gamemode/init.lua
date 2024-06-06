AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

-- local startTime = SysTime()

local validWeapons = {
    ["gmod_tool"] = true,
    ["weapon_physgun"] = true,
    ["weapon_hands"] = true,
    ["weapon_ak47"] = true,
    ["weapon_deagle"] = true,
    ["weapon_glock"] = true,
    ["weapon_m249"] = true,
    ["weapon_m3super"] = true,
    ["weapon_m4a1"] = true,
    ["weapon_scout"] = true,
    ["weapon_xm1014"] = true,
    --["weapon_frag"] = true,
    --["weapon_pistol"] = true,
    ["weapon_rpg"] = true,

    ["weapon_g3sg1"] = true,
    ["weapon_hg_kitknife"] = true,
    ["weapon_hg_sleagehammer"] = true,
    ["weapon_hg_shovel"] = true,
    ["weapon_hg_fubar"] = true,
    ["weapon_hg_fireaxe"] = true,
    ["weapon_hg_hatchet"] = true,
    ["weapon_hg_metalbat"] = true,
    ["weapon_hg_crowbar"] = true,
    ["weapon_hg_sleagehammer"] = true,

    ["weapon_usp"] = true,
    ["weapon_usp-s"] = true,
    ["weapon_pm"] = true, 
    ["weapon_p226"] = true,   
    ["weapon_ump45"] = true,
    ["weapon_p90"] = true,
    ["weapon_mp5"] = true,
    ["weapon_thompson"] = true,
    ["weapon_mac10"] = true,
    ["weapon_mp5"] = true,
    ["weapon_remington870"] = true,
    ["weapon_asval"] = true,
    ["weapon_famas"] = true,
    ["weapon_fal"] = true,
    ["weapon_galil"] = true,
    ["weapon_beretta"] = true,
    ["weapon_aug"] = true,

    ["weapon_jmodnade"] = true,
    ["weapon_jmodflash"] = true,
    ["weapon_jmoddynamite"] = true,
    ["weapon_jmodgas"] = true,
    ["weapon_jmodbundle"] = true,
    ["weapon_jmodsmoke"] = true,
    ["weapon_jmodsticknade"] = true,
    ["weapon_jmodstickynade"] = true,
    ["weapon_jmodcs"] = true,

    ["weapon_handcuffs"] = true,
    ["weapon_allah"] = true,
}

local validEntities = {
    ["item_ammo_357"] = true,
    ["item_ammo_pistol"] = true,
    ["item_ammo_smg1"] = true,
    ["ent_hgjack_f1nade"] = true,
}

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


local ModelList = {"models/props_junk/wood_crate001a.mdl","models/props_c17/oildrum001.mdl","models/props_c17/fence01a.mdl","models/props_c17/FurnitureChair001a.mdl","models/props_c17/FurnitureCouch001a.mdl","models/props_c17/FurnitureCouch002a.mdl","models/props_c17/FurnitureTable001a.mdl","models/props_c17/FurnitureSink001a.mdl","models/props_c17/FurnitureTable002a.mdl","models/props_c17/FurnitureTable003a.mdl","models/props_c17/FurnitureToilet001a.mdl","models/props_c17/FurnitureWashingmachine001a.mdl","models/props_c17/fence03a.mdl","models/props_c17/bench01a.mdl","models/props_c17/chair02a.mdl","models/props_c17/concrete_barrier001a.mdl","models/props_c17/display_cooler01a.mdl","models/props_c17/door01_left.mdl","models/props_c17/FurnitureCupboard001a.mdl","models/props_c17/FurnitureDrawer001a.mdl","models/props_c17/gravestone002a.mdl","models/props_c17/gravestone001a.mdl","models/props_c17/gravestone_coffinpiece001a.mdl","models/props_junk/PlasticCrate01a.mdl","models/props_c17/shelfunit01a.mdl","models/props_combine/breenchair.mdl","models/props_combine/breendesk.mdl","models/props_combine/breenglobe.mdl","models/props_interiors/BathTub01a.mdl","models/props_interiors/ElevatorShaft_Door01a.mdl","models/props_interiors/Furniture_chair01a.mdl","models/props_interiors/Furniture_chair03a.mdl","models/props_interiors/Furniture_Couch01a.mdl","models/props_interiors/Furniture_Couch02a.mdl","models/props_interiors/Furniture_Lamp01a.mdl","models/props_interiors/Furniture_shelf01a.mdl","models/props_interiors/pot01a.mdl","models/props_interiors/pot02a.mdl","models/props_interiors/Radiator01a.mdl","models/props_interiors/SinkKitchen01a.mdl","models/props_interiors/VendingMachineSoda01a.mdl","models/props_junk/cardboard_box001a.mdl","models/props_junk/cardboard_box003a.mdl","models/props_junk/CinderBlock01a.mdl","models/props_junk/metal_paintcan001a.mdl","models/props_junk/MetalBucket01a.mdl","models/props_junk/MetalBucket02a.mdl","models/props_junk/metalgascan.mdl","models/props_junk/PushCart01a.mdl","models/props_junk/TrashDumpster01a.mdl","models/props_junk/TrashDumpster02b.mdl","models/props_wasteland/cafeteria_table001a.mdl","models/props_wasteland/kitchen_shelf002a.mdl","models/props_wasteland/kitchen_shelf001a.mdl","models/props_wasteland/interior_fence002d.mdl","models/props_wasteland/interior_fence002e.mdl","models/props_wasteland/interior_fence001g.mdl","models/props_c17/cashregister01a.mdl","models/props_c17/chair_kleiner03a.mdl","models/props_combine/breenclock.mdl","models/props_c17/tv_monitor01.mdl","models/props_c17/TrapPropeller_Lever.mdl","models/props_c17/TrapPropeller_Engine.mdl","models/props_lab/workspace001.mdl","models/props_lab/workspace002.mdl","models/props_lab/workspace003.mdl","models/props_lab/workspace004.mdl",        "models/props_phx/construct/metal_plate1.mdl","models/props_phx/construct/metal_plate2x2.mdl",
        "models/props_phx/construct/plastic/plastic_panel1x1.mdl","models/props_phx/construct/plastic/plastic_panel1x2.mdl",
        "models/hunter/blocks/cube05x05x05.mdl","models/hunter/blocks/cube075x075x075.mdl","models/hunter/blocks/cube075x075x025.mdl",
        "models/hunter/plates/plate1x1.mdl","models/hunter/plates/plate2x2.mdl","models/hunter/plates/plate1x3.mdl","models/hunter/triangles/1x1x1.mdl",
        "models/hunter/triangles/3x3x2.mdl","models/props_lab/blastdoor001c.mdl",
}

local allowedprops = {}
for _, model in ipairs(ModelList) do
    allowedprops[model] = true
end
local function IsPropAllowed(model)
    return allowedprops[model] or false
end

function GM:PlayerSpawnProp( ply, model )
    if not allowedprops[model] then
        net.Start("CustomNotification")
        net.WriteString("У вас нет прав.")
        net.WriteString("icon16/user_red.png") 
        net.WriteInt(5, 32) 
        net.Send(ply)
        return false 
    else
        return true 
    end

end

util.AddNetworkString("CustomNotification")

function GM:PlayerSpawnNPC( ply, model )
    net.Start("CustomNotification")
    net.WriteString("У вас нет прав.") 
    net.WriteString("icon16/user_red.png") 
    net.WriteInt(5, 32) 
    net.Send(ply)
    return false
end

function GM:PlayerSpawnRagdoll(ply, model)
    net.Start("CustomNotification")
    net.WriteString("У вас нет прав.")
    net.WriteString("icon16/user_red.png") 
    net.WriteInt(5, 32) 
    net.Send(ply)
    return false
end


function GM:PlayerSpawnVehicle( ply, model )
    net.Start("CustomNotification")
    net.WriteString("У вас нет прав.")
    net.WriteString("icon16/user_red.png") 
    net.WriteInt(5, 32) 
    net.Send(ply)
    return false
end

function GM:PlayerSpawnVehicle( ply, model )
    net.Start("CustomNotification")
    net.WriteString("У вас нет прав.")
    net.WriteString("icon16/user_red.png") 
    net.WriteInt(5, 32) 
    net.Send(ply)
    return false
end

function GM:PlayerSpawnSENT(ply, entClass)
    if validEntities[entClass] then
        return true
    else
        if SERVER then
            net.Start("CustomNotification")
            net.WriteString("У вас нет прав.")
            net.WriteString("icon16/user_red.png")
            net.WriteInt(5, 32)
            net.Send(ply)
        end
        return false
    end
end

function GM:PlayerCanPickupWeapon(ply, weapon)
    local weaponClass = weapon:GetClass()
    if validWeapons[weaponClass] then
        return true
    else
        if SERVER then
            net.Start("CustomNotification")
            net.WriteString("У вас нет прав.")
            net.WriteString("icon16/user_red.png")
            net.WriteInt(5, 32)
            net.Send(ply)
        end
        return false
    end
end

hook.Add("CanTool", "RestrictCreatorTool", function(ply, tr, tool)
    if tool == "creator" then
        if SERVER then
            net.Start("CustomNotification")
            net.WriteString("У вас нет прав.")
            net.WriteString("icon16/user_red.png")
            net.WriteInt(5, 32)
            net.Send(ply)
        end
        return false
    end
end)

function GM:PlayerLoadout( ply )
    ply:StripWeapons() 
    ply:Give("weapon_hands")
    return true
end