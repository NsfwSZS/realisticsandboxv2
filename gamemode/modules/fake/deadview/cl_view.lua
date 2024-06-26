
CreateClientConVar("hg_deathsound","1",true,false,nil,0,1)
CreateClientConVar("hg_deathscreen","1",true,false,nil,0,1)

surface.CreateFont("HomigradFontBig",{
	font = "Coolvetica Rg",
	size = 25,
	weight = 1100,
	outline = false,
	shadow = true
})

surface.CreateFont("BodyCamFont",{
	font = "Coolvetica Rg",
	size = 40,
	weight = 1100,
	outline = false,
	shadow = true
})

surface.CreateFont("HomigradFont",{
	font = "Coolvetica Rg",
	size = 18,
	weight = 1100,
	outline = false
})

surface.CreateFont("HomigradFontBig",{
	font = "Coolvetica Rg",
	size = 25,
	weight = 1100,
	outline = false,
	shadow = true
})

surface.CreateFont("HomigradFontLarge",{
	font = "Coolvetica Rg",
	size = ScreenScale(30),
	weight = 1100,
	outline = false
})

surface.CreateFont("HomigradFontSmall",{
	font = "Coolvetica Rg",
	size = ScreenScale(10),
	weight = 1100,
	outline = false
})


local deathtrack = {
	"https://cdn.discordapp.com/attachments/1248484908188303452/1248485116741812288/death.mp3?ex=6663d5df&is=6662845f&hm=a84c35c0de6cbac0193c1f098a74ac11a1f1f3c961e62495437b8dfeef98d2366&"
}
local g_station = nil
local playing = false
local deathtexts = {
	"ТЫ МЁРТВ",
	"ПОХОЖЕ, ТЫ СДОХ",
	"ПОТРАЧЕНО",
	"ВАУ, ТЫ УМЕР",
	"ЖИЗНЬ ЗАКОНЧЕНА",
	"КРЫСЬКА ЭФНУЛАСЬ"
}
net.Receive("pophead",function(len)
	local rag = net.ReadEntity()
	if GetConVar("hg_deathscreen"):GetBool() then
	deathrag = rag
	deathtext = table.Random(deathtexts)
	LocalPlayer():ScreenFade( SCREENFADE.IN, Color( 0, 0, 0, 255 ), 0.5, 1 )
	if !playing and GetConVar("hg_deathsound"):GetBool() then
		playing = true
		sound.PlayURL ( table.Random(deathtrack), "mono", function( station )
			if ( IsValid( station ) ) then
				station:SetPos( LocalPlayer():GetPos() )
				station:Play()
				station:SetVolume(3)

				-- Keep a reference to the audio object, so it doesn't get garbage collected which will stop the sound
				g_station = station
		
			else end
		end )
	end
		timer.Create("DeathCam",25,1,function()
			LocalPlayer():ScreenFade( SCREENFADE.IN, Color( 0, 0, 0, 255 ), 1, 1 )
			playing = false
		end)
	end
end)
local blurMat2, Dynamic2 = Material("pp/blurscreen"), 0

local function BlurScreen(den,alp)
	local layers, density, alpha = 1, den, alph
	surface.SetDrawColor(255, 255, 255, alpha)
	surface.SetMaterial(blurMat2)
	local FrameRate, Num, Dark = 1 / FrameTime(), 3, 150

	for i = 1, Num do
		blurMat2:SetFloat("$blur", (i / layers) * density * Dynamic2)
		blurMat2:Recompute()
		render.UpdateScreenEffectTexture()
		surface.DrawTexturedRect(0, 0, ScrW(), ScrH())
	end

	Dynamic2 = math.Clamp(Dynamic2 + (1 / FrameRate) * 7, 0, 1)
end
local addmat_r = Material("CA/add_r")
local addmat_g = Material("CA/add_g")
local addmat_b = Material("CA/add_b")
local vgbm = Material("vgui/black")

local function DrawCA(rx, gx, bx, ry, gy, by)
    render.UpdateScreenEffectTexture()
    addmat_r:SetTexture("$basetexture", render.GetScreenEffectTexture())
    addmat_g:SetTexture("$basetexture", render.GetScreenEffectTexture())
    addmat_b:SetTexture("$basetexture", render.GetScreenEffectTexture())
    render.SetMaterial(vgbm)
    render.DrawScreenQuad()
    render.SetMaterial(addmat_r)
    render.DrawScreenQuadEx(-rx / 2, -ry / 2, ScrW() + rx, ScrH() + ry)
    render.SetMaterial(addmat_g)
    render.DrawScreenQuadEx(-gx / 2, -gy / 2, ScrW() + gx, ScrH() + gy)
    render.SetMaterial(addmat_b)
    render.DrawScreenQuadEx(-bx / 2, -by / 2, ScrW() + bx, ScrH() + by)
end

local tab = {
	[ "$pp_colour_addr" ] = 0,
	[ "$pp_colour_addg" ] = 0,
	[ "$pp_colour_addb" ] = 0.1,
	[ "$pp_colour_brightness" ] = -0.05,
	[ "$pp_colour_contrast" ] = 1.5,
	[ "$pp_colour_colour" ] = 0.3,
	[ "$pp_colour_mulr" ] = 0,
	[ "$pp_colour_mulg" ] = 0,
	[ "$pp_colour_mulb" ] = 0.5
}

local tab2 = {
	[ "$pp_colour_addr" ] = 0,
	[ "$pp_colour_addg" ] = 0,
	[ "$pp_colour_addb" ] = 0,
	[ "$pp_colour_brightness" ] = 0,
	[ "$pp_colour_contrast" ] = 1,
	[ "$pp_colour_colour" ] = 1,
	[ "$pp_colour_mulr" ] = 0,
	[ "$pp_colour_mulg" ] = 0,
	[ "$pp_colour_mulb" ] = 0
}

function RagdollOwner(rag) --функция, определяет хозяина регдолла
	if not IsValid(rag) then return end

	local ent = rag:GetNWEntity("RagdollController")
	return IsValid(ent) and ent
end

hook.Add("RenderScreenspaceEffects","BloomEffect-homigrad",function()

	if LocalPlayer():Alive() then
		tab2["$pp_colour_colour"] = LocalPlayer():Health() / 150
		DrawColorModify(tab2)
	end

	if !LocalPlayer():Alive() and timer.Exists("DeathCam") then
		--DrawMotionBlur(0.5,0.3,0.02)
		DrawSharpen( 1, 0.2 )
		local k3 = 15
		DrawCA(4 * k3, 2 * k3, 0, 2 * k3, 1 * k3, 0)
		tab2["$pp_colour_colour"] = 0.2
		tab2[ "$pp_colour_mulb" ] = 0.5
		DrawColorModify(tab2)
		BlurScreen(1,155)
		draw.Text( {
			text = deathtext,
			font = "BodyCamFont",
			pos = { ScrW()/2, ScrH()/1.2 },
			xalign = TEXT_ALIGN_CENTER,
			yalign = TEXT_ALIGN_CENTER,
			color = Color(255,35,35,220)
		} )
	elseif not LocalPlayer():Alive() then
	end
end)



hook.Add( "HUDDrawTargetID", "HidePlayerInfo", function()

	return false

end )

RunConsoleCommand('hud_deathnotice_time', '0')
