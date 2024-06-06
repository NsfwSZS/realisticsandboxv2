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

-- damage

local a = 0
local b = 0
hook.Add("RenderScreenspaceEffects", "grayscr", function()
        a = math.Clamp(LocalPlayer():Health()/LocalPlayer():GetMaxHealth(),0,1)
        b = math.Clamp(LocalPlayer():GetNWInt("pain")/250,0,1)
        DrawColorModify( {
            [ "$pp_colour_brightness" ] = 0,
            [ "$pp_colour_contrast" ] = 1,
            [ "$pp_colour_colour" ] = a,
        } )
end)

-- context

hook.Add("OnContextMenuOpen", "ActionMenu", function(ply)
    local ply = LocalPlayer()
    if IsValid(ply) then
        ply:ConCommand("cad_menu")
    end
end)

-- chat
hook.Add("AddToolMenuTabs", "LRPChatbox", function()
	spawnmenu.AddToolTab('LocalRP', '#LocalRP', 'icon16/brick.png')
	spawnmenu.AddToolMenuOption("LocalRP", "Client Options", "LocalRP Chatbox", "Chatbox", "", "", function(pnl)
		pnl:ClearControls()

		pnl:AddControl("Label", {Text = "Настройки чата"})

		pnl:AddControl("slider", {
			label = "Ширина чата",
			command = "lrp_chatsize_w",
			min = 10,
			max = 90,
			decimals = 0
		})
		
		pnl:AddControl("slider", {
			label = "Высота чата",
			command = "lrp_chatsize_h",
			min = 10,
			max = 50,
			decimals = 0
		})

		pnl:AddControl("CheckBox", {Label = "Заголовок 'LocalRP' над чатом", Command = "lrp_chattitle"})

		pnl:AddControl("Button", {Label = "Обновить чат", Command = "lrp_updatechat"})

		pnl:AddControl("Button", {Label = "Сбросить настройки", Command = "lrp_defaultchat"})
	end)
end)

lrp = {}

CreateClientConVar("lrp_chatsize_w", "65", true, false)
CreateClientConVar("lrp_chatsize_h", "35", true, false)
CreateClientConVar("lrp_chattitle", "1", true, false)

surface.CreateFont("ChatFontTitle",{
	size = 27,
	weight = 400,
	font = "Calibri",
	extended = true
})

surface.CreateFont("ChatFontType",{
	size = 20,
	weight = 400,
	font = "Calibri",
	extended = true
})

surface.CreateFont("ChatFontEntry",{
	size = 24,
	weight = 400,
	font = "Calibri",
	extended = true
})

surface.CreateFont("ChatFontSh",{
	size = 24,
	weight = 400,
	font = "Calibri",
	extended = true,
	shadow = true
})

concommand.Add( "lrp_updatechat", function()
	chatsize_w = GetConVarNumber("lrp_chatsize_w") * 10
	chatsize_h = GetConVarNumber("lrp_chatsize_h") * 10
	lrp.buildBox()
end)

concommand.Add( "lrp_defaultchat", function()
	GetConVar("lrp_chatsize_w"):SetInt( 65 )
	GetConVar("lrp_chatsize_h"):SetInt( 35 )
	GetConVar("lrp_chattitle"):SetInt( 1 )
	chatsize_w = GetConVarNumber("lrp_chatsize_w") * 10
	chatsize_h = GetConVarNumber("lrp_chatsize_h") * 10
	lrp.buildBox()
end)

chatsize_w = GetConVarNumber("lrp_chatsize_w") * 10
chatsize_h = GetConVarNumber("lrp_chatsize_h") * 10

function lrp.buildBox()
	local mainclr = Color(16, 16, 16, 200)
	local sideclr = Color(0, 0, 0, 125)
	lrp.frame = vgui.Create("DFrame")
	lrp.frame:SetSize( chatsize_w, chatsize_h ) --GetConVarNumber("lrp_chatsize_w"), GetConVarNumber("lrp_chatsize_h")
	lrp.frame:SetTitle("")
	lrp.frame:SetSizable(false)
	lrp.frame:ShowCloseButton( false )
	lrp.frame:SetDraggable( true )
	lrp.frame:SetPos( 10, (ScrH() - lrp.frame:GetTall()) - 1)
	lrp.frame.Paint = function( self, w, h )
		draw.RoundedBox( 8, 0, 0, w, h, mainclr )
		if GetConVarNumber("lrp_chattitle") == 1 then
			draw.SimpleText("Classic Sandbox","ChatFontTitle", 8, 2, Color(255, 255, 255)) --GetHostName() / lrp.frame:GetSize() * .45
		end
	end
	lrp.oldPaint = lrp.frame.Paint
	lrp.btn = vgui.Create( "DImageButton", lrp.frame )
	lrp.btn:SetPos( chatsize_w - 28, 3 )
	lrp.btn:SetColor(Color(0, 100, 80, 250))
	lrp.btn:SetImage( "icon16/cross.png" )
	lrp.btn:SetSize(24, 24)
	lrp.btn.DoClick = function()
		lrp.hideBox()
	end
	lrp.entry = vgui.Create("DTextEntry", lrp.frame)
	lrp.entry:SetTextColor( color_white )
	lrp.entry:SetPos( 45, lrp.frame:GetTall() - lrp.entry:GetTall() - 5 )
	lrp.entry:SetFont("ChatFontEntry")
	lrp.entry:SetDrawBorder( false )
	lrp.entry:SetDrawBackground( false )
	lrp.entry:SetCursorColor( color_white )
	lrp.entry:SetHighlightColor( Color(15, 95, 145) )
	lrp.entry:SetSize( lrp.frame:GetWide() - 50, 20 )
	lrp.entry.Paint = function( self, w, h )
		draw.RoundedBoxEx( 8, 0, 0, w, h, sideclr, false, false, false, true )
		derma.SkinHook( "Paint", "TextEntry", self, w, h )
	end

	lrp.entry.OnTextChanged = function( self )
		if self and self.GetText then 
			gamemode.Call( "ChatTextChanged", self:GetText() or "" )
		end
	end

	lrp.entry.OnKeyCodeTyped = function( self, code )
		local types = {"", "teamchat", "console",/*"ooc"*/}

		if code == KEY_ESCAPE then

			lrp.hideBox()
			gui.HideGameUI()

		elseif code == KEY_TAB then
			
			lrp.TypeSelector = (lrp.TypeSelector and lrp.TypeSelector + 1) or 1
			
			if lrp.TypeSelector > 3 then lrp.TypeSelector = 1 end
			if lrp.TypeSelector < 1 then lrp.TypeSelector = 3 end
			
			lrp.ChatType = types[lrp.TypeSelector]

			timer.Simple(0.001, function() lrp.entry:RequestFocus() end)

		elseif code == KEY_ENTER then
			-- Replicate the client pressing enter
			
			if string.Trim( self:GetText() ) != "" then
				if lrp.ChatType == types[2] then
					LocalPlayer():ConCommand("say_team \"" .. (self:GetText() or "") .. "\"")
				elseif lrp.ChatType == types[3] then
					LocalPlayer():ConCommand(self:GetText() or "")
				elseif lrp.ChatType == types[4] then
					LocalPlayer():ConCommand("say \"/// " .. self:GetText() .. "\"")
				else
					LocalPlayer():ConCommand("say \"" .. self:GetText() .. "\"")
				end
			end

			lrp.TypeSelector = 1
			lrp.hideBox()
		end
	end

	lrp.chatLog = vgui.Create("RichText", lrp.frame) 
	lrp.chatLog:SetSize( lrp.frame:GetWide() - 10, lrp.frame:GetTall() - 60 )
	lrp.chatLog:SetPos( 5, 30 )
	lrp.chatLog.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, sideclr )
	end
	lrp.chatLog.Think = function( self )
		if lrp.lastMessage then
			if CurTime() - lrp.lastMessage > 12 then
				self:SetVisible( false )
			else
				self:SetVisible( true )
			end
		end
	end
	lrp.chatLog.PerformLayout = function( self )
		self:SetFontInternal("ChatFontSh")
		self:SetFGColor( color_white )
	end
	lrp.oldPaint2 = lrp.chatLog.Paint
	
	local text = "Чат :"

	local say = vgui.Create("DLabel", lrp.frame)
	say:SetText("")
	surface.SetFont( "ChatFontType")
	local w, h = surface.GetTextSize( text )
	say:SetSize( w + 5, 20 )
	say:SetPos( 5, lrp.frame:GetTall() - lrp.entry:GetTall() - 5 )
	
	say.Paint = function( self, w, h )
		draw.RoundedBoxEx( 8, 0, 0, w, h, sideclr, false, false, true, false )
		draw.DrawText( text, "ChatFontType", 2, -1, color_white )
	end

	say.Think = function( self )
		local types = {"", "teamchat", "console",/*"ooc"*/}
		local s = {}

		if lrp.ChatType == types[2] then 
			text = "Чат (Команда) :"
		elseif lrp.ChatType == types[3] then
			text = "Console :"
		//elseif lrp.ChatType == types[4] then
		//	text = "OOC :"
		else
			text = "Чат :"
			s.pw = 45
			s.sw = lrp.frame:GetWide() - 50
		end

		if s then
			if not s.pw then s.pw = self:GetWide() + 10 end
			if not s.sw then s.sw = lrp.frame:GetWide() - self:GetWide() - 15 end
		end

		local w, h = surface.GetTextSize( text )
		self:SetSize( w + 5, 20 )
		self:SetPos( 5, lrp.frame:GetTall() - lrp.entry:GetTall() - 5 )

		lrp.entry:SetSize( s.sw, 20 )
		lrp.entry:SetPos( s.pw, lrp.frame:GetTall() - lrp.entry:GetTall() - 5 )
	end	
	
	lrp.hideBox()
end

--// Hides the chat box but not the messages
function lrp.hideBox()
	lrp.frame.Paint = function() end
	lrp.chatLog.Paint = function() end
	
	lrp.chatLog:SetVerticalScrollbarEnabled( false )
	lrp.chatLog:GotoTextEnd()
	
	lrp.lastMessage = lrp.lastMessage or CurTime() - 12
	
	-- Hide the chatbox except the log
	local children = lrp.frame:GetChildren()
	for _, pnl in pairs( children ) do
		if pnl == lrp.frame.btnMaxim or pnl == lrp.frame.btnClose or pnl == lrp.frame.btnMinim then continue end
		
		if pnl != lrp.chatLog then
			pnl:SetVisible( false )
		end
	end
	
	-- Give the player control again
	lrp.frame:SetMouseInputEnabled( false )
	lrp.frame:SetKeyboardInputEnabled( false )
	gui.EnableScreenClicker( false )
	gamemode.Call("FinishChat")
	lrp.entry:SetText( "" )
	gamemode.Call( "ChatTextChanged", "" )
end
function lrp.showBox()
	lrp.frame.Paint = lrp.oldPaint
	lrp.chatLog.Paint = lrp.oldPaint2
	
	lrp.chatLog:SetVerticalScrollbarEnabled( true )
	lrp.lastMessage = nil
	local children = lrp.frame:GetChildren()
	for _, pnl in pairs( children ) do
		if pnl == lrp.frame.btnMaxim or pnl == lrp.frame.btnClose or pnl == lrp.frame.btnMinim then continue end
		
		pnl:SetVisible( true )
	end
	lrp.frame:MakePopup()
	lrp.entry:RequestFocus()
	gamemode.Call("StartChat")
end
local oldAddText = chat.AddText
function chat.AddText(...)
	if not lrp.chatLog then
		lrp.buildBox()
	end
	
	local msg = {}
	
	-- Iterate through the strings and colors
	for _, obj in pairs( {...} ) do
		if type(obj) == "table" then
			lrp.chatLog:InsertColorChange( obj.r, obj.g, obj.b, obj.a ) --lrp.chatLog:InsertColorChange( obj.r, obj.g, obj.b, obj.a )
			table.insert( msg, Color(obj.r, obj.g, obj.b, obj.a) )
		elseif type(obj) == "string"  then
			lrp.chatLog:AppendText( obj )
			table.insert( msg, obj )
		elseif obj:IsPlayer() then
			local ply = obj
			local col = GAMEMODE:GetTeamColor( obj )
			lrp.chatLog:InsertColorChange( col.r, col.g, col.b, 255 )
			lrp.chatLog:AppendText( obj:Nick() )
			table.insert( msg, obj:Nick() )
		end
	end
	lrp.chatLog:AppendText("\n")
	
	lrp.chatLog:SetVisible( true )
	lrp.lastMessage = CurTime()
--	oldAddText(unpack(msg))
end
hook.Remove( "ChatText", "lrp_joinleave")
hook.Add( "ChatText", "lrp_joinleave", function( index, name, text, type )
	if not lrp.chatLog then
		lrp.buildBox()
	end
	
	if type != "chat" then
		lrp.chatLog:InsertColorChange( 255, 200, 40, 255 )
		lrp.chatLog:AppendText( text.."\n" )
		lrp.chatLog:SetVisible( true )
		lrp.lastMessage = CurTime()
		return true
	end
end)
hook.Remove("PlayerBindPress", "lrp_hijackbind")
hook.Add("PlayerBindPress", "lrp_hijackbind", function(ply, bind, pressed)
	if string.sub( bind, 1, 11 ) == "messagemode" then
		if bind == "messagemode2" then 
			lrp.ChatType = "teamchat"
		else
			lrp.ChatType = ""
		end
		
		if IsValid( lrp.frame ) then
			lrp.showBox()
		else
			lrp.buildBox()
			lrp.showBox()
		end
		return true
	end
end)
hook.Remove("HUDShouldDraw", "lrp_hidedefault")
hook.Add("HUDShouldDraw", "lrp_hidedefault", function( name )
	if name == "CHudChat" then
		return false
	end
end)
local oldGetChatBoxPos = chat.GetChatBoxPos
function chat.GetChatBoxPos()
	return lrp.frame:GetPos()
end

function chat.GetChatBoxSize()
	return lrp.frame:GetSize()
end

chat.Open = lrp.showBox
function chat.Close(...) 
	if IsValid( lrp.frame ) then 
		lrp.hideBox(...)
	else
		lrp.buildBox()
		lrp.showBox()
	end
end


-- player info

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

-- weapon selector

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

-- notifi

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
