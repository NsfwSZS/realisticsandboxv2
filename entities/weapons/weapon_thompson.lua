
SWEP.Base = 'nsbase' -- base

SWEP.PrintName 				= "Thompson"
SWEP.Author 				= "Auto-Ordnance Company"
SWEP.Instructions			= ""
SWEP.Category 				= "Оружие | ПП"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false

------------------------------------------

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "SMG1"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 32
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "weapons/tec9/fire.wav"
SWEP.Primary.FarSound = "weapons/tec9/distant.wav"
SWEP.Primary.Force = 1
SWEP.ReloadTime = 1.8
SWEP.ShootWait = 0.1
SWEP.ReloadSounds = {
    [0.1] = {"weapons/tec9/boltback.wav"},
    [0.8] = {"weapons/tec9/clipout.wav"},
    [1.7] = {"weapons/tec9/clipin.wav"},
}
SWEP.TwoHands = true

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

SWEP.ViewModel				= "models/weapons/w_thompson.mdl"
SWEP.WorldModel				= "models/weapons/w_thompson.mdl"

SWEP.addPos = Vector(10, -1.05, 7)
SWEP.addAng = Angle(-8.5, 0.22, 0)
SWEP.sightPos = Vector(5.2, 8, 0.83)
SWEP.sightAng = Angle(-5, -2, 0)
SWEP.fakeHandRight = Vector(6, -2, 0)
SWEP.fakeHandLeft = Vector(10, -3, -5)
SWEP.Recoil = 0.8
