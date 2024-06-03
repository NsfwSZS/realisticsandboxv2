hook.Add("HUDPaint", "healthhud", function()
    local client = LocalPlayer()
    if !IsValid(client) then return end
    local health = client:Health()
    pcall(function ()
        if (health < -1) then
            health = 150
        elseif (health > 150) then
            health = 150
        end
    end)
    local alpha = math.Clamp(health, 0, 100) * 2.55
    local saturation = health / 90
    DrawColorModify({
        ["$pp_colour_addr"] = 0,
        ["$pp_colour_addg"] = 0,
        ["$pp_colour_addb"] = 0,
        ["$pp_colour_brightness"] = 0,
        ["$pp_colour_contrast"] = 1,
        ["$pp_colour_colour"] = saturation,
        ["$pp_colour_mulr"] = 0,
        ["$pp_colour_mulg"] = 0,
        ["$pp_colour_mulb"] = 0
    })
end)