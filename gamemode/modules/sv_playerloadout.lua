hook.Add("PlayerLoadout", "streapweapon", function(ply)
    ply:StripWeapons()
    ply:Give("weapon_hands")
    return true
end)