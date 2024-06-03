
SWEP.Base = 'nsbase' -- base

SWEP.PrintName 				= "HK-MP5"
SWEP.Author 				= "Heckler & Koch"
SWEP.Instructions			= ""
SWEP.Category 				= "Оружие | ПП"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false

------------------------------------------

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "Pistol"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 27
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "weapons/mp9/fire01.wav"
SWEP.Primary.FarSound = "snd_jack_hmcd_smp_far.wav"
SWEP.Primary.Force = 15
SWEP.ReloadTime = 2.2
SWEP.ShootWait = 0.08
SWEP.ReloadSounds = {
    [0.1] = {"weapons/mp5sd/boltback.wav"},
    [0.5] = {"weapons/mp5sd/clipout.wav"},
    [1.3] = {"weapons/mp5sd/clipin.wav"},
    [2] = {"weapons/mp5sd/boltforward.wav"},
}
SWEP.TwoHands = true
SWEP.ShellRotate = false

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

SWEP.ViewModel				= "models/weapons/w_smg_mp5.mdl"
SWEP.WorldModel				= "models/weapons/w_smg_mp5.mdl"

SWEP.addPos = Vector(10, -1.05, 7)
SWEP.addAng = Angle(-8.5, 2.2, 0)
SWEP.sightPos = Vector(7, 6, 1.33)
SWEP.sightAng = Angle(-2, 2, 0)
SWEP.fakeHandRight = Vector(6, -2, 0)
SWEP.fakeHandLeft = Vector(13, -4, -7)
SWEP.Recoil = 0.4