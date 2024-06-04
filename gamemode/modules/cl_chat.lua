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