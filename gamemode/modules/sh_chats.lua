local convars = {
	showDead = {"chatrankprefix_showdead", "1", FCVAR_REPLICATED, "Show the *DEAD* text?"},
	showRank = {"chatrankprefix_showrank", "1", FCVAR_REPLICATED, "Show teams?"},
	useTeamColor = {"chatrankprefix_userankcolor", "1", FCVAR_REPLICATED, "Use team colors for the player name?"},
	enabled = {"chatrankprefix_enabled", "1", FCVAR_REPLICATED, "Enable chat rank prefixes?"}
}

if SERVER then
	AddCSLuaFile()
	for _, convar in pairs(convars) do
		CreateConVar(unpack(convar))
	end
	return
end

local clr = {
	RPColorG = Color(150, 180, 70),
	RPColorY = Color(200, 180, 70),
	RPColorW = Color(200, 180, 255),
	white = Color(255, 255, 255),
	gray = Color(170,170,170),
	bezevii = Color(255,150,150),
	yellow = Color(255,170,0),
	red = Color(255, 50, 100),
	blue = Color(100,150,255),
	green = Color(50, 255, 100)
}

hook.Add("OnPlayerChat", "RPChatsAddon", function(ply, t, isTeam, isDead)

local ooc   = string.sub(string.lower(t), 1, 3) == "// "
local looc  = string.sub(string.lower(t), 1, 2) == "/ "
local me   = string.sub(string.lower(t), 1, 4) == "/me "
local okr   = string.sub(string.lower(t), 1, 4) == "/do "
local ms    = string.sub(string.lower(t), 1, 5) == "/msg "
local racia = string.sub(string.lower(t), 1, 3) == "/r "
local y     = string.sub(string.lower(t), 1, 3) == "/y "
local w     = string.sub(string.lower(t), 1, 3) == "/w "
local r1    = string.sub(string.lower(t), 1, 5) == "/roll"
local r2    = string.sub(string.lower(t), 1, 6) == "/roll2"

local roll  = math.floor(math.random(0,300))
local sroll = math.floor(math.random(0,100))
local plus  = math.floor(math.random(-100,200))

local rl    = math.Round(((roll * 100) / 500))
local srl   = math.Round(((sroll * 100) / 100))
local pl    = math.Round(((plus * 100) / 500))
local otvd  = rl + pl

	local msg = {}

	local function insert(value)
		msg[#msg + 1] = value
	end

	if (isDead) then
        insert(clr.yellow)
		insert("[OOC] ")
	end
	
	if (isTeam) and !(isDead) then
        insert(clr.yellow)
		insert("[OOC] ")
	end

	if (looc) and (isTeam) and !(isDead) then
        insert(clr.yellow)
		insert("[LOOC] ")
	end
	
	if (ooc) and !(isDead) and !(isTeam) then
        insert(clr.yellow)
		insert("[OOC] ")
	end

	if (me) and !(isDead) and !(isTeam) then
        insert(clr.bezevii)
        insert("[Действие] ")
	end

	if (me2) and !(isDead) and !(isTeam) then
        insert(clr.bezevii)
        insert("[Действие] ")
	end

	if (okr) and !(isDead) and !(isTeam) then
        insert(clr.green)
        insert("[Окружение] ")
	end
    
    if (ms) and !(isDead) and !(isTeam) then
        insert(clr.red)
        insert("[Глобальное РП]: ")
	end

	if (racia) and !(isDead) and !(isTeam) then
        ply:EmitSound("garrysmod/content_downloaded.wav", 70, 100, 1, CHAN_AUTO )
        insert(clr.blue)
        insert("[Рация] ")
	end

	if (r1) and !(r2) and !(isDead) and !(isTeam) then
        insert(clr.red)
		insert("[ROLL] ")
	end

	if (r2) and !(isDead) and !(isTeam) then
        insert(clr.red)
		insert("[ROLL] ")
	end

    if !(ooc) and !(me) and !(okr) and !(ms) and !(racia) and !(w) and !(y) and !(r1) and !(r2) and !(isTeam) and !(isDead) and !(looc) then
	insert(clr.gray)
	insert(ply:Name())
	insert(clr.RPColorG)
	insert(" говорит")
	insert(": ")
	insert("'")
	insert(clr.white)
	insert(t)
	insert(clr.RPColorG)
	insert("'")
    end  

    if (ooc) and !(isDead) and !(isTeam) then
    insert(clr.gray)
	insert(ply:Name())
	insert(": ")
	insert(clr.white)
	insert(string.sub(t, 4))
    end

    if (looc) and !(isDead) and !(isTeam) then
    insert(clr.yellow)
    insert("[LOOC] ")
	insert(clr.gray)
	insert(ply:Name())
	insert(": ")
	insert(clr.bezevii)
	insert("(( ")
	insert(clr.white)
	insert(string.sub(t, 3))
	insert(clr.bezevii)
	insert(" ))")
    end

    if (w) and !(isDead) and !(isTeam) then
	insert(clr.gray)
	insert(ply:Name())
	insert(clr.RPColorW)
	insert(" шепчет")
	insert(": ")
	insert("'")
	insert(clr.white)
	insert(string.sub(t, 4))
	insert(clr.RPColorW)
	insert("'")
    end

    if (y) and !(isDead) and !(isTeam) then
	insert(clr.gray)
	insert(ply:Name())
	insert(clr.RPColorY)
	insert(" кричит")
	insert(": ")
	insert("'")
	insert(clr.white)
	insert(string.sub(t, 4))
	insert(clr.RPColorY)
	insert("'")
    end

    if (isTeam) and !(isDead) then
	insert(clr.gray)
	insert(ply:Name())
	insert(": ")
	insert(clr.white)
	insert(t)
    end

    if (isDead) then
	insert(clr.gray)
	insert(ply:Name())
	insert(": ")
	insert(clr.white)
	insert(t)
    end

    if (me) and !(isDead) and !(isTeam) then
	insert(clr.gray)
	insert(ply:Name())
	insert(": ")
	insert(clr.bezevii)
	insert("*")
	insert(clr.white)
	insert(string.sub(t, 5))
	insert(clr.bezevii)
	insert("*")
    end

    if (okr) and !(isDead) and !(isTeam) then
	insert(clr.gray)
	insert(ply:Name())
	insert(": ")
	insert(clr.green)
	insert("«")
	insert(clr.white)
	insert(string.sub(t, 5))
	insert(clr.green)
	insert("»")
    end

    if (racia) and !(isDead) and !(isTeam) then
	insert(clr.gray)
	insert(ply:Name())
	insert(": ")
	insert(clr.blue)
	insert("{")
	insert(clr.white)
	insert(string.sub(t, 4))
	insert(clr.blue)
	insert("}")
    end

    if (ms) and !(isDead) and !(isTeam) then
	insert(clr.white)
	insert(string.sub(t, 6))
    end

-- ==========================================================================
-- SIMPLE-ROLL
-- ==========================================================================
    
    if (r1) and !(r2) and !(racia) and !(isDead) and !(isTeam) then
    insert(clr.gray)
	insert(ply:Name())
	insert(": ")
	insert(clr.white)
	insert("Выпало число: ")
    
    if (srl < 25) then
	insert(clr.red)
    elseif (srl >= 25) and (srl <= 50) then
    insert(clr.yellow)
    elseif (srl > 50) and (srl <= 75) then
    insert(clr.green)
    elseif (srl > 75) then
    insert(clr.blue)
    end

	insert("[" .. srl .. "]")
    end

-- ==========================================================================
-- DOUBLE-ROLL
-- ==========================================================================

    if (r2) and !(racia) and !(isDead) and !(isTeam) then
    insert(clr.gray)
	insert(ply:Name())
	insert(": ")
	insert(clr.white)
	insert("Выпало число: ")
	
	if (rl < 25) then
	insert(clr.red)
    elseif (rl >= 25) and (rl <= 50) then
    insert(clr.yellow)
    elseif (rl > 50) and (rl <= 75) then
    insert(clr.green)
    elseif (rl > 75) then
    insert(clr.blue)
    end

	insert("[" .. rl .. "]")
	insert(clr.white)

	if (pl > 0) then
	insert(". Ваша прибавка: ")
    elseif (pl == 0) then
	insert(". Прибавки нет: ")
    elseif (pl < 0) then
	insert(". Ваша отбавка: ")
    end
	
	if (pl < 25) then
	insert(clr.red)
    elseif (pl >= 25) and (pl <= 50) then
    insert(clr.yellow)
    elseif (pl > 50) and (pl <= 75) then
    insert(clr.green)
    elseif (pl > 75) then
    insert(clr.blue)
    end
	
	insert("[" .. pl .. "]")
	insert(clr.white)
	insert(". Итог: ")
	
	if (otvd < 25) then
	insert(clr.red)
    elseif (otvd >= 25) and (otvd <= 50) then
    insert(clr.yellow)
    elseif (otvd > 50) and (otvd <= 75) then
    insert(clr.green)
    elseif (otvd > 75) then
    insert(clr.blue)
    end

	insert("[" .. otvd .. "]")
    end


	chat.AddText(unpack(msg))

	return true
end)
