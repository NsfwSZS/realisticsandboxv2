local notificationQueue = {}
local maxNotifications = 3
local notificationHeight = 35
local margin = 2 

local function CreateNotification(text, duration, icon)
    local textWidth, textHeight = surface.GetTextSize(text)
    local panelWidth = textWidth + 80 
    local panel = vgui.Create("DPanel")
    if not IsValid(panel) then return end
    panel:SetSize(panelWidth, notificationHeight)
    panel:SetPos(ScrW() - panelWidth - margin, -notificationHeight) 
    panel.Paint = function(self, w, h)
        local iconMat = Material(icon)
        draw.RoundedBox(8, 0, 0, w, h, Color(0, 0, 0, 150))
        surface.SetDrawColor(255, 255, 255, 255)
        surface.SetMaterial(iconMat)
        surface.DrawTexturedRect(5, (h - 16) / 2, 16, 16)
        draw.SimpleText(text, "NSFONTMINI", 26, h / 2, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end


    panel:MoveTo(ScrW() - 170, 0, 0.3, 0, -1, function()
        if not IsValid(panel) then return end
        timer.Simple(duration, function()
            if not IsValid(panel) then return end
            panel:AlphaTo(0, 0.5, 0, function()
                if not IsValid(panel) then return end
                panel:Remove()
            end)
        end)
    end)

    table.insert(notificationQueue, panel)
    if #notificationQueue > maxNotifications then
        local toRemove = table.remove(notificationQueue, 1)
        toRemove:Remove()
    end

    for i, panel in ipairs(notificationQueue) do
        if not IsValid(panel) then return end
        panel:MoveTo(ScrW() - 170, (i - 1) * (notificationHeight + margin), 0.3, 0, -1)
    end
end

net.Receive("CustomNotification", function()
    local text = net.ReadString()
    local icon = net.ReadString()
    local duration = net.ReadInt(32)
    CreateNotification(text, duration, icon)
end)
