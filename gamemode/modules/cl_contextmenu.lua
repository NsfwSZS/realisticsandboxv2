hook.Add("OnContextMenuOpen", "ActionMenu", function(ply)
    local ply = LocalPlayer()
    if IsValid(ply) then
        ply:ConCommand("cad_menu")
    end
end)