SWEP.Base = 'nsbase' -- base

SWEP.PrintName 				= "Steyr AUG"
SWEP.Author 				= "Steyr Arms"
SWEP.Instructions			= "The Steyr AUG (German: Armee-Universal-Gewehr, lit. 'army universal rifle') is an Austrian bullpup assault rifle chambered for the 5.56×45mm NATO intermediate cartridge, designed in the 1960s by Steyr-Daimler-Puch, and now manufactured by Steyr Arms GmbH & Co KG."
SWEP.Category 				= "Оружие | Автоматы"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false

------------------------------------------

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "SMG1"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 33
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "weapons/aug/fire01.wav"
SWEP.Primary.FarSound = "weapons/aug/distant.wav"
SWEP.Primary.Force = 15
SWEP.ReloadTime = 2.5
SWEP.ShootWait = 0.1
SWEP.ReloadSounds = {
    [0.1] = {"weapons/m4a4/clipout.wav"},
    [1.3] = {"weapons/m4a4/clipin.wav"},
    [2] = {"weapons/m4a4/cliphit.wav"},
}
SWEP.TwoHands = true
SWEP.Shell = "EjectBrass_556"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

------------------------------------------

SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.HoldType = "smg"

------------------------------------------

SWEP.Slot					= 2
SWEP.SlotPos				= 0
SWEP.DrawAmmo				= true
SWEP.DrawCrosshair			= false

SWEP.ViewModel				= "models/weapons/nsbase/w_rif_aug.mdl"
SWEP.WorldModel				= "models/weapons/nsbase/w_rif_aug.mdl"

SWEP.addAng = Angle(-0.85,-0.59,1) -- Barrel pos adjust
SWEP.addPos = Vector(0,0,50) -- Barrel ang adjust
SWEP.sightPos = Vector(5.5, 6.5, 0.63)
SWEP.sightAng = Angle(-5, -2.5, 0)

SWEP.Recoil = 1.3

SWEP.Sight = true
SWEP.DrawScope = true
SWEP.ScopeAdjustAng = Angle(0, 0, 180)
--SWEP.ScopeAdjustPos = Vector(0, 0, 0)
SWEP.ScopeAdjustPos = Vector(10.5,0.67,5.7)
SWEP.ScopeFov = 10
SWEP.ScopeMat = Material("decals/kibarms3x.png")
SWEP.ScopeRot = 0
SWEP.UVAdjust = {0, 0}
SWEP.UVScale = {1.5, 1.2}
SWEP.ScopeRot = -90
if CLIENT then
    function SWEP:Initialize()
        self:SetHoldType(self.HoldType)
        slbweps[self] = true
        if SERVER then return end
        self.rtmat = GetRenderTarget("huy-glass", 512, 512, false)  
        self.mat = Material("models/weapons/nsbase/w_models/w_rif_aug/433_glass")
        self.mat:SetTexture("$basetexture",self.rtmat)
    
        local texture_matrix = self.mat:GetMatrix("$basetexturetransform")
        texture_matrix:SetAngles( Angle(0,180,0) )
        self.mat:SetMatrix("$basetexturetransform",texture_matrix)

    end 
end