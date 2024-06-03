local whitelistweps = {
	["weapon_physgun"] = true,
	["gmod_tool"] = true,
	["gmod_camera"] = true,
	["weapon_physcannon"] = true,
	--["weapon_hands"] = true
}


function RagdollOwner(rag)
	for k, v in ipairs(player.GetAll()) do
		local ply = v
		if ply:GetNWEntity("DeathRagdoll") == rag then return ply end
	end

	return false
end

hook.Add(
	"Think",
	"pophead",
	function()
		for i, ent in pairs(ents.FindByClass("prop_ragdoll")) do
			if not IsValid(RagdollOwner(ent)) or not RagdollOwner(ent):Alive() then
				ent:ManipulateBoneScale(6, Vector(1, 1, 1))
			end
		end

		for i, ent in pairs(player.GetAll()) do
			if ent ~= LocalPlayer() and ent:Alive() then
				ent:ManipulateBoneScale(6, Vector(1, 1, 1))
			end
		end
	end
)

local weps = {
	["akm"] = true,
	["glock"] = true,
}

local MyLerp = 0
local ViewPunching
local wep
local ang
local function scopeAiming()
	local wep = LocalPlayer():GetActiveWeapon()

	return IsValid(wep) and LocalPlayer():KeyDown(IN_ATTACK2) and not LocalPlayer():KeyDown(IN_SPEED)
end


local sightAng = Angle(0, 0, 0)
local podkid = 0
local oldFakeOrigin = Vector(0, 0, 0)
local oldFakeAng = Angle(0, 0, 0)
local oldOrigin = Vector(0, 0, 0)
local oldAng = Angle(0, 0, 0)
local lerping = 1
hook.Add("HUDDrawTargetID", "HidePlayerInfo", function() return false end)
function Immersivecam(ply, vec, ang, fov, znear, zfar)
	local hand = ply:GetAttachment(ply:LookupAttachment("anim_attachment_rh"))
	local eye = ply:GetAttachment(ply:LookupAttachment("eyes"))
	local org = eye.Pos
	local ang1 = LerpAngle(0, ply:EyeAngles(), eye.Ang)
	local org1 = eye.Pos + eye.Ang:Up() * 2 + eye.Ang:Forward() * 2.5
	if ply:Team() == 1002 then return end
	if not ply:Alive() then
		local specPly = ply:GetNWEntity("SpecPly")
		if not specPly:IsValid() then
			if not IsValid(ply:GetNWEntity("DeathRagdoll")) then return end
			local attach = ply:GetNWEntity("DeathRagdoll"):GetAttachment(1)
			ply:GetNWEntity("DeathRagdoll"):ManipulateBoneScale(ply:GetNWEntity("DeathRagdoll"):LookupBone("ValveBiped.Bip01_Head1"), vector_origin)
			local view = {
				origin = attach.Pos,
				angles = LerpAngle(0.2, ang1, attach.Ang),
				fov = 110,
				drawviewer = true
			}

			lerping = 1

			return view
		end

		return SpecCam(specPly)
	end

	if ply:GetNWBool("fake") == true and IsValid(ply:GetNWEntity("DeathRagdoll")) then
		local attach = ply:GetNWEntity("DeathRagdoll"):GetAttachment(1)
		ply:GetNWEntity("DeathRagdoll"):ManipulateBoneScale(ply:GetNWEntity("DeathRagdoll"):LookupBone("ValveBiped.Bip01_Head1"), vector_origin)
		lerping = Lerp(3 * FrameTime(), lerping, 0)
		local view = {
			origin = LerpVector(lerping, attach.Pos, oldOrigin),
			angles = LerpAngle(lerping, LerpAngle(0.35, ang1, attach.Ang), oldAng),
			fov = 110,
			drawviewer = true
		}

		oldFakeOrigin = view.origin
		oldFakeAng = view.angles

		return view
	end

	if IsValid(ply) and IsValid(ply:GetActiveWeapon()) then
		wep = ply:GetActiveWeapon()
		if whitelistweps[wep:GetClass()] and not ply:InVehicle() then return end
	end

	sightAng = sightAng or hand.Pos
	if ply:Alive() and IsValid(ply) and IsValid(ply) and IsValid(ply:GetActiveWeapon()) then
		ply:ManipulateBoneScale(ply:LookupBone("ValveBiped.Bip01_Head1"), vector_origin)
		local weaponClass = wep:GetClass()
		local guninfo = weapons.Get(weaponClass)
		if guninfo and guninfo.Base == "nsbase" then
			if scopeAiming() then
				MyLerp = Lerp(4 * FrameTime(), MyLerp, 1)
			else
				MyLerp = Lerp(6 * FrameTime(), MyLerp, 0.1)
			end

			podkid = Lerp(0.1, podkid, math.Clamp((guninfo.HoldType ~= "revolver" and ply:GetActiveWeapon():GetNWFloat("VisualRecoil") / 4) or ply:GetActiveWeapon():GetNWFloat("VisualRecoil") / 1, 0, 10))
			org = hand.Pos + hand.Ang:Up() * guninfo.sightPos.x - hand.Ang:Forward() * guninfo.sightPos.y + hand.Ang:Right() * guninfo.sightPos.z + hand.Ang:Up() * podkid
			ang = hand.Ang + guninfo.sightAng + Angle(podkid * 10, 0, 0)
		end
	end

	sightAng = LerpAngle(3 * FrameTime(), sightAng, ang)
	if ply:Alive() then
		ply:ManipulateBoneScale(ply:LookupBone("ValveBiped.Bip01_Head1"), vector_origin)
	end

	
	if ply:InVehicle() == true then
		org = eye.Pos + eye.Ang:Forward() * 0.8
		ang = eye.Ang
		MyLerp = 1
		ply:ManipulateBoneScale(ply:LookupBone("ValveBiped.Bip01_Head1"), vector_origin)
		anglerp = LerpAngle(MyLerp, ang1, ang)
	else
		anglerp = LerpAngle(MyLerp / 2, ang1, sightAng or Angle(0, 0, 0))
	end


	lerping = Lerp(3 * FrameTime(), lerping, 1)
	local view = {
		origin = LerpVector(lerping, oldFakeOrigin, LerpVector(MyLerp, org1, org)),
		angles = LerpAngle(lerping, oldFakeAng, LerpAngle(0.01, anglerp, ang1)),
		fov = 110,
		drawviewer = true,
		znear = 0.956
	}

	oldOrigin = view.origin
	oldAng = view.angles
	return view
end

hook.Add("CalcView", "salat.ahuel.view", Immersivecam)
hook.Add(
	"RenderScene",
	"fwep-viewbobfix",
	function(pos, angle, fov)
		local view = hook.Run("CalcView", LocalPlayer(), pos, angle, fov)
		local view = {
			x = 0,
			y = 0,
			drawhud = true,
			drawviewmodel = false,
			dopostprocess = true,
			drawmonitors = true
		}

		
		local calcView = Immersivecam(LocalPlayer(), pos, angle, fov)
		if not calcView then return end
		view.fov = calcView.fov
		view.origin = calcView.origin
		view.angles = calcView.angles
		view.drawviewmodel = not calcView.drawviewer
		render.Clear(0, 0, 0, 255, true, true, true)
		render.RenderView(view)

		return true
	end
)



--[[прицелчики
hook.Add("PostDrawOpaqueRenderables", "example", function()
    local hand = LocalPlayer():GetAttachment(ply:LookupAttachment("anim_attachment_rh"))
    local eye = LocalPlayer():GetAttachment(ply:LookupAttachment("eyes"))
    possight = hand.Pos + hand.Ang:Up() * 4.4 - hand.Ang:Forward() * -1 + hand.Ang:Right() * -0.15
    angle = hand.Ang + Angle(-90,0,0)
                        
    
    cam.Start3D2D( possight, angle, 1 )
        surface.SetDrawColor( 255, 0, 0, 200)
        draw.NoTexture()
        draw.Circle(0,0,0.05,25 )
    cam.End3D2D()
end )
]]
--