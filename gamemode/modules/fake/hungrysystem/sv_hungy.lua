local math_Clamp = math.Clamp

hook.Add("Player Think","homigrad-hungry",function(ply,time)
	if not ply:Alive() or ply:HasGodMode() then return end

	if (ply.hungryNext or time) > time then return end
	ply.hungryNext = time + 1

	ply.hungryregen = math_Clamp((ply.hungryregen or 0) -0.06, -0.05, 50)
	ply.hungry = math_Clamp((ply.hungry or 0) + ply.hungryregen, 0, 100)

	if ply.hungry < 5 then
		ply:SetHealth(ply:Health() - 1)
		if ply:Health() <= 0 then
			ply.KillReason = "hungry"
			ply:Kill()
			return
		end
	end

	if ply.hungry < 80 then
		if ply.hungry < 40 and ply.hungryMessage ~= 1 then
			ply.hungryMessage = 1

			ply:ChatPrint("Ты голоден")
		end

		if ply.hungry > 40 and ply.hungry < 65 and ply.hungryMessage ~= 2 then
			ply.hungryMessage = 2

			ply:ChatPrint("Ты проголодался")
		end
	elseif ply.hungry < 40 and ply.hungryMessage ~= 0 then
		ply.hungryMessage = 0
	end

	ply:SetHealth(not ply.heartstop and (math.min(ply:Health() + math.max(math.ceil(ply.hungryregen),0.1),150)) or ply:Health())
end)


hook.Add("PlayerSpawn","homigrad-hungry",function(ply)
	ply.hungry = 89
	ply.hungryregen = 0
	ply.hungryNext = 0
	ply.hungryMessage = nil
end)

concommand.Add("hg_hungryinfo",function(ply)

	ply:ChatPrint("hungry: " .. ply.hungry)
	ply:ChatPrint("hungryregen: " .. ply.hungryregen)
end)
