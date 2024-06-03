
--
hook.Add("HUDPaint", "ShowPlayerName", function()
    local trace = LocalPlayer():GetEyeTrace()
    if trace.Entity:IsPlayer() then
        if not trace.Entity.StartLooking then
            trace.Entity.StartLooking = CurTime()
        end
        if CurTime() - trace.Entity.StartLooking >= 0.7 then
            local alpha = math.min((CurTime() - trace.Entity.StartLooking - 0.7) * 255, 255)
            draw.SimpleTextOutlined(trace.Entity:Nick(), "NSFONTMINI", ScrW() / 2, ScrH() / 2, Color(255, 255, 255, alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0, 0, 0, alpha))
        end
    else
        for _, v in ipairs(player.GetAll()) do
            v.StartLooking = nil
        end
    end
end)