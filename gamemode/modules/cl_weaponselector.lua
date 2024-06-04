surface.CreateFont("NSFONT", {
    font = "Roboto",
    size = ScrW() * (26 / 1000),
    weight = 300,
    antialias = true,
    shadow = false,
    extended = true,
})

surface.CreateFont("NSFONTMINI", {
    font = "Roboto",
    size = ScrW() * (26 / 2500),
    weight = 300,
    antialias = true,
    shadow = false,
    extended = true,
})

surface.CreateFont( "EZO_Font_Police", {
    font = "Times New Roman",    
    size = 21,
    weight = 100,
    blursize = 0,
    scanlines = 0,
    antialias = true,
    underline = false,
    italic = false,
    strikeout = false,
    symbol = false,
    rotary = false,
    shadow = false,
    additive = false,
    outline = false,
})

local weaponSelectorIndex = 1
local weaponSelectorDeltaIndex = 1
local weaponSelectorInfoAlpha = 0
local weaponSelectorAlpha = 0
local weaponSelectorAlphaDelta = 0
local weaponSelectorFadeTime = 0
local weaponSelectorMarkUp = nil

hook.Add("HUDShouldDraw", "HideHUD", function(name)
    if name == "CHudWeaponSelection" then return false end
end)

local function onIndexChanged()
    weaponSelectorAlpha = 1
    weaponSelectorFadeTime = CurTime() + 2 -- Изменено на 2 секунды

    local ply = LocalPlayer()
    local weapon = ply:GetWeapons()[weaponSelectorIndex]

    weaponSelectorMarkUp = nil

    if IsValid(weapon) then
        local text = ""

        if text ~= "" then
            weaponSelectorMarkUp = markup.Parse("<font=NSFONT>" .. text, ScrW() * 0.3)
            weaponSelectorInfoAlpha = 0
        end

        ply:EmitSound("common/talk.wav")
    end
end

hook.Add("HUDPaint", "HUDPaintWeaponselectr", function()
    local frameTime = FrameTime()
    weaponSelectorAlphaDelta = Lerp(frameTime * 10, weaponSelectorAlphaDelta, weaponSelectorAlpha)
    local fraction = weaponSelectorAlphaDelta

    if fraction > 0 then
        local ply = LocalPlayer()
        local weapons = ply:GetWeapons()
        local total = table.Count(weapons)
        local x, y = ScrW() * 0.5, ScrH() * 0.5
        local spacing = math.pi * 0.85
        local radius = 240 * weaponSelectorAlphaDelta

        weaponSelectorDeltaIndex = Lerp(frameTime * 12, weaponSelectorDeltaIndex, weaponSelectorIndex)
        local index = weaponSelectorDeltaIndex

        for k, v in ipairs(weapons) do
            if not weapons[weaponSelectorIndex] then
                weaponSelectorIndex = total
            end

            local theta = (k - index) * 0.1
            local color = ColorAlpha(Color(225, 225, 225, 255), (255 - math.abs(theta * 3) * 255) * fraction)
            if k == weaponSelectorIndex then
                color = ColorAlpha(Color(155, 55, 55, 255), (255 - math.abs(theta * 3) * 255) * fraction)
            end

            local lastY = 0
            local shiftX = ScrW() * 0.02

            if weaponSelectorMarkUp and k < weaponSelectorIndex then
                local w, h = weaponSelectorMarkUp:Size()
                lastY = (h * fraction)

                if k == weaponSelectorIndex - 1 then
                    weaponSelectorInfoAlpha = Lerp(frameTime * 3, weaponSelectorInfoAlpha, 255)
                    weaponSelectorMarkUp:Draw(x + 6 + shiftX, y + 30, 0, 0, weaponSelectorInfoAlpha * fraction)
                end
            end

            surface.SetFont("NSFONT")
            local tx, ty = surface.GetTextSize(v:GetPrintName():upper())
            local scale = (1 - math.abs(theta * 2))

            local matrix = Matrix()
            matrix:Translate(Vector(
                shiftX + x + math.cos(theta * spacing + math.pi) * radius + radius,
                y + lastY + math.sin(theta * spacing + math.pi) * radius - ty / 2,
                1))
            matrix:Rotate(angle or Angle(0, 0, 0))
            matrix:Scale(Vector(1, 1, 0) * scale)

            cam.PushModelMatrix(matrix)
            draw.DrawText(v:GetPrintName():upper(), "NSFONT", 2, ty / 2, color, TEXT_ALIGN_LEFT)

            if k == weaponSelectorIndex then
                local clip1 = v:Clip1()
                local ammo1 = ply:GetAmmoCount(v:GetPrimaryAmmoType())
                if clip1 > -1 then
                    local ammoText = "AMMO: " .. clip1 .. " / " .. ammo1
                    draw.DrawText(ammoText, "NSFONTMINI", 2, ty + 14, color, TEXT_ALIGN_LEFT)
                end
            end

            cam.PopModelMatrix()
        end

        if weaponSelectorFadeTime < CurTime() and weaponSelectorAlpha > 0 then
            weaponSelectorAlpha = 0
        end
    end
end)

hook.Add("PlayerBindPress", "Mojito.WS.PlayerBindPress", function(ply, bind, pressed)
    local weapon = ply:GetActiveWeapon()

    if not ply:InVehicle() and (not IsValid(weapon) or not ply:KeyDown(IN_ATTACK)) then
        bind = bind:lower()

        if bind:find("invprev") and pressed then
            weaponSelectorIndex = weaponSelectorIndex + 1

            if weaponSelectorIndex > table.Count(ply:GetWeapons()) then
                weaponSelectorIndex = 1
            end

            onIndexChanged()
            return true

        elseif bind:find("invnext") and pressed then
            weaponSelectorIndex = weaponSelectorIndex - 1

            if weaponSelectorIndex < 1 then
                weaponSelectorIndex = table.Count(ply:GetWeapons())
            end

            onIndexChanged()
            return true

        elseif bind:find("slot") then
            weaponSelectorIndex = math.Clamp(tonumber(bind:match("slot(%d)")) or 1, 1, table.Count(ply:GetWeapons()))
            onIndexChanged()
            return true

        elseif bind:find("attack") and pressed and weaponSelectorAlpha > 0 then
            ply:EmitSound("buttons/button16.wav")
            RunConsoleCommand('use', ply:GetWeapons()[weaponSelectorIndex]:GetClass())
            weaponSelectorAlpha = 0
            return true
        end
    end
end)
