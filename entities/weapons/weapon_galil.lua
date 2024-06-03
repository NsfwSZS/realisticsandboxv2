SWEP.Base = 'nsbase' -- base

SWEP.PrintName 				= "IMI Galil"
SWEP.Author 				= "Israel Military Industries"
SWEP.Instructions			= "The IMI Galil (Hebrew: גליל) is a family of Israeli-made automatic rifles chambered for the 5.56×45mm NATO and 7.62×51mm NATO cartridges. Originally designed by Yisrael Galili and Yakov Lior in the late 1960s, the Galil was first produced by the state-owned Israel Military Industries and is now exported by the privatized Israel Weapon Industries."
SWEP.Category 				= "Оружие | Автоматы"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false

------------------------------------------

SWEP.Primary.ClipSize		= 35
SWEP.Primary.DefaultClip	= 35
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.56x45 mm"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 35
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "weapons/galil/fire01.wav"
SWEP.Primary.FarSound = "weapons/galil/distant.wav"
SWEP.Primary.Force = 20
SWEP.ReloadTime = 2.8
SWEP.ShootWait = 0.1
SWEP.ReloadSounds = {
    [0.3] = {"weapons/galil/clipout.wav"},
    [1.3] = {"weapons/galil/clipin.wav"},
    [1.8] = {"weapons/galil/boltforward.wav"},
    [2] = {"weapons/galil/boltback.wav"},
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

SWEP.HoldType = "ar2"

------------------------------------------

SWEP.Slot					= 2
SWEP.SlotPos				= 0
SWEP.DrawAmmo				= true
SWEP.DrawCrosshair			= false

SWEP.ViewModel				= "models/weapons/w_rif_galil.mdl"
SWEP.WorldModel				= "models/weapons/w_rif_galil.mdl"

SWEP.addPos = Vector(10, -1.05, 5)
SWEP.addAng = Angle(-9.5, -0.1, 0)
SWEP.sightPos = Vector(9.0, 3, 0.89)
SWEP.sightAng = Angle(-5, -2.5, 0)
SWEP.fakeHandRight = Vector(12, -2, 0)
SWEP.fakeHandLeft = Vector(13, -3, -5)
SWEP.Recoil = 0.88

function SWEP:DrawWorldModel()
    self:DrawModel()
end