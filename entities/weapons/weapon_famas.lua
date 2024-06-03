
SWEP.Base = 'nsbase' -- base

SWEP.PrintName 				= "FAMAS"
SWEP.Author 				= ""
SWEP.Instructions			= ""
SWEP.Category 				= "Оружие | Автоматы"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false

------------------------------------------

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "SMG1"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 30
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "weapons/famas/fire01.wav"
SWEP.Primary.FarSound = "weapons/famas/distant.wav"
SWEP.Primary.Force = 10
SWEP.ReloadTime = 2
SWEP.ShootWait = 0.1
SWEP.ReloadSounds = {
    [0.1] = {"weapons/famas/boltback.wav"},
    [0.2] = {"weapons/famas/clipout.wav"},
    [1.4] = {"weapons/famas/clipin.wav"},
    [1.7] = {"weapons/famas/cliphit.wav"},
    [2] = {"weapons/famas/boltforward.wav"},
}
SWEP.TwoHands = true
SWEP.Shell = "EjectBrass_556"
SWEP.ShellRotate = false

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

SWEP.ViewModel				= "models/weapons/w_rif_famas.mdl"
SWEP.WorldModel				= "models/weapons/w_rif_famas.mdl"

SWEP.addPos = Vector(10, -1.05, 5)
SWEP.addAng = Angle(-9.5, -0.1, 0)
SWEP.sightPos = Vector(9.0, 3, 0.89)
SWEP.sightAng = Angle(-5, -2.5, 0)
SWEP.fakeHandRight = Vector(12, -2, 0)
SWEP.fakeHandLeft = Vector(13, -3, -5)

SWEP.Recoil = 1.6