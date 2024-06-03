local chudhide = {
    ["CHudHealth"] = true,
    ["CHudBattery"] = true,
    ["CHudAmmo"] = true,
    ["CHudSecondaryAmmo"] = true,
    ["CHudCrosshair"] = true,
    ["CHudWeaponSelection"] = true,
}

hook.Add("HUDShouldDraw", "HideDefaultHUD", function(name)
    if chudhide[name] then
        return false
    end
end)

hook.Add("HUDDrawPickupHistory", "NUC_FUCK_PICKUP_HISTORY", function()
	return true 
end)

hook.Add( "HUDItemPickedUp", "NUC_FUCK_PICKUP_SOUND_HISTORY", function()
    return true
end )

hook.Add('ChatText', 'removejoinmessage', function(_, _, _, mode)
	if mode == 'joinleave' then return true end
end)

function notification.AddLegacy() return end

hook.Add("PlayerDeathSound", "DeFlatline", function() return false end)

hook.Add( "HUDDrawTargetID", "NUC_VANILLA_PLAYER_TARGETID", function()
	return false
end)

hook.Add("DrawDeathNotice", "nodn", function()
	return 0,0
end)

hook.Add("Initialize", "nodn", function()
	GM = GM or GAMEMODE
	function GM:AddDeathNotice()
		return
	end
end)