hook.Add("PlayerCanSeePlayersChat", "chatdistance", function(t, isTeam, l, s)
local GM                   = gmod.GetGamemode()
 function GM:PlayerCanSeePlayersChat(t, team, l, s)

local strw                 = string.sub(string.lower(t), 1, 3) == "/w "
local stry                 = string.sub(string.lower(t), 1, 3) == "/y "
local strr                 = string.sub(string.lower(t), 1, 3) == "/r "
local strms                = string.sub(string.lower(t), 1, 5) == "/msg "
local strm                 = string.sub(string.lower(t), 1, 4) == "/me "
local strd                 = string.sub(string.lower(t), 1, 4) == "/do "
local stro                 = string.sub(string.lower(t), 1, 3) == "// "
local stra                 = string.sub(string.lower(t), 1, 2) == "/ "
local roll1                = string.sub(string.lower(t), 1, 5) == "/roll"
local roll2                = string.sub(string.lower(t), 1, 6) == "/roll2"
local isDead               = !(s:Alive())

local d                    = l:GetPos():Distance(s:GetPos())

	 if (strw) and !(isTeam) and !(isDead) and (d <= 60) then
	 	print("ИГРОК " .. "[" .. l:Name() .. "]" .. " УСЛЫШАЛ ШЕПОТ [" .. t .. "] ОТ ИГРОКА [" .. s:Name() .. "] НА ДИСТАНЦИИ " .. "[" .. math.Round(d) / 100 .. "м." .. "]")
		return true
	end

	 if !(stra) and !(strw) and !(stry) and !(stro) and !(strr) and !(strms) and !(strm) and !(strd) and !(roll1) and !(roll2) and !(isTeam) and !(isDead) and (d <= 300) then
	    print("ИГРОК " .. "[" .. l:Name() .. "]" .. " УСЛЫШАЛ РАЗГОВОР [" .. t .. "] ОТ ИГРОКА [" .. s:Name() .. "] НА ДИСТАНЦИИ " .. "[" .. math.Round(d) / 100 .. "м." .. "]")
	    return true
	end

	 if (stry) and !(isTeam) and !(isDead) and (d <= 1000) then
	 	print("ИГРОК " .. "[" .. l:Name() .. "]" .. " УСЛЫШАЛ КРИК [" .. t .. "] ОТ ИГРОКА [" .. s:Name() .. "] НА ДИСТАНЦИИ " .. "[" .. math.Round(d) / 100 .. "М." .. "]")
		return true
	end

	 if (strr) and !(isTeam) and !(isDead) then
		return true
	end

	 if (strm) and !(isTeam) and !(isDead) and (d <= 500) then
	 	print("ИГРОК " .. "[" .. l:Name() .. "]" .. " УВИДЕЛ ДЕЙСТВИЕ [" .. t .. "] ОТ ИГРОКА [" .. s:Name() .. "] НА ДИСТАНЦИИ " .. "[" .. math.Round(d) / 100 .. "М." .. "]")
		return true
	end

     if (strd) and !(isTeam) and !(isDead) and (d <= 500) then
     	print("ИГРОК " .. "[" .. l:Name() .. "]" .. " УВИДЕЛ ОКРУЖЕНИЕ [" .. t .. "] ОТ ИГРОКА [" .. s:Name() .. "] НА ДИСТАНЦИИ " .. "[" .. math.Round(d) / 100 .. "М." .. "]")
		return true
	end

	 if (roll1) and !(isTeam) and !(isDead) and (d <= 500) then
     	print("ИГРОК " .. "[" .. l:Name() .. "]" .. " УВИДЕЛ РОЛЛ [" .. t .. "] ОТ ИГРОКА [" .. s:Name() .. "] НА ДИСТАНЦИИ " .. "[" .. math.Round(d) / 100 .. "М." .. "]")
		return true
	end

	 if (roll2) and !(isTeam) and !(isDead) and (d <= 500) then
     	print("ИГРОК " .. "[" .. l:Name() .. "]" .. " УВИДЕЛ ДАБЛ-РОЛЛ [" .. t .. "] ОТ ИГРОКА [" .. s:Name() .. "] НА ДИСТАНЦИИ " .. "[" .. math.Round(d) / 100 .. "М." .. "]")
		return true
	end

	 if (strms) and !(isTeam) and !(isDead) then
		return true
    end

	 if (stro) then
		return true
	end

	 if (stra) and !(isTeam) and !(isDead) and (d <= 500) then
     	print("ИГРОК " .. "[" .. l:Name() .. "]" .. " ПОДУМАЛ О ИГРЕ [" .. t .. "] ОТ ИГРОКА [" .. s:Name() .. "] НА ДИСТАНЦИИ " .. "[" .. math.Round(d) / 100 .. "М." .. "]")
		return true
	end

	 if (isTeam) then
		return true
	end

	 if (isDead) then
		return true
	end


  end
 end)