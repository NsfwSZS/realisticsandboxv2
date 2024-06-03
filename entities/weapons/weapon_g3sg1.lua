SWEP.Base = "nsbase" -- base 
SWEP.PrintName = "G3SG1"
SWEP.Instructions = ""
SWEP.Category = "Оружие | Снайперки"
SWEP.Spawnable = true
SWEP.AdminOnly = false
------------------------------------------
SWEP.Primary.ClipSize = 20
SWEP.Primary.DefaultClip = SWEP.Primary.ClipSize * 2
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "smg1"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 70
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "weapons/g3sg1/g3sg1-1.wav"
SWEP.Primary.Force = 80
SWEP.ReloadTime = 2.5
SWEP.ShootWait = 0.2
SWEP.ReloadSounds = {
    [0.1] = {"weapons/g3sg1/clipout.wav"},
    [1.3] = {"weapons/g3sg1/clipin.wav"},
    [2] = {"weapons/g3sg1/clipin.wav"},
}
SWEP.TwoHands = true
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"
------------------------------------------
SWEP.Weight = 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.HoldType = "ar2"
------------------------------------------
SWEP.Slot = 2
SWEP.SlotPos = 2
SWEP.DrawAmmo = true
SWEP.DrawCrosshair = false
SWEP.ViewModel = "models/weapons/w_snip_g3sg1.mdl"
SWEP.WorldModel = "models/weapons/w_snip_g3sg1.mdl"
SWEP.addPos = Vector(12, -1.05, 9.5)
SWEP.addAng = Angle(-11, 0.8, 0)
SWEP.sightPos = Vector(6.5, 6.5, 1.03)
SWEP.sightAng = Angle(-5, -2.5, 0)
SWEP.fakeHandRight = Vector(14, -2, 2)
SWEP.fakeHandLeft = Vector(13, -4, -4)
-------------------------------------------
SWEP.Sight = true
SWEP.DrawScope = true
SWEP.ScopeAdjustAng = Angle(0, 0, 90)
SWEP.ScopeAdjustPos = Vector(0, 0, 0)
SWEP.ScopeFov = 10
SWEP.ScopeMat = Material("decals/kibarms3x.png")
SWEP.ScopeRot = 0
SWEP.UVAdjust = {0, 0}
SWEP.UVScale = {1.5, 1.2}
-----------------------------------------
SWEP.ScopeRot = -90

SWEP.Recoil = 1.5

function SWEP:Initialize()
    self:SetHoldType(self.HoldType)
    slbweps[self] = true
    if SERVER then return end
    self.rtmat = GetRenderTarget("huy-glass", 512, 512, false)  
    self.mat = Material("models/weapons/w_models/w_snip_g3sg1/g3_scope_sg1_lens")
    self.mat:SetTexture("$basetexture",self.rtmat)

    local texture_matrix = self.mat:GetMatrix("$basetexturetransform")
    texture_matrix:SetAngles( Angle(0,180,0) )
    self.mat:SetMatrix("$basetexturetransform",texture_matrix)
end