
SWEP.Base = 'nsbase' -- base

SWEP.PrintName 				= "HK-UMP-45"
SWEP.Author 				= "Heckler & Koch"
SWEP.Instructions			= "The Heckler & Koch UMP is a submachine gun developed and manufactured by Heckler & Koch. Heckler & Koch developed the UMP as a lighter and cheaper successor to the MP5, though both remain in production."
SWEP.Category 				= "Оружие | ПП"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false

------------------------------------------

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "SMG1"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 35
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "weapons/ump45/fire01.wav"
SWEP.Primary.FarSound = "snd_jack_hmcd_smp_far.wav"
SWEP.Primary.Force = 22
SWEP.ReloadTime = 2.2
SWEP.ShootWait = 0.1
SWEP.ReloadSounds = {
    [0.1] = {"weapons/ump45/boltback.wav"},
    [0.3] = {"weapons/ump45/clipout.wav"},
    [1] = {"weapons/ump45/clipin.wav"},
    [1.5] = {"weapons/ump45/boltforward.wav"},
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

SWEP.HoldType = "smg"

------------------------------------------

SWEP.Slot					= 2
SWEP.SlotPos				= 0
SWEP.DrawAmmo				= true
SWEP.DrawCrosshair			= false

SWEP.ViewModel				= "models/weapons/w_smg_ump45.mdl"
SWEP.WorldModel				= "models/weapons/w_smg_ump45.mdl"

SWEP.addPos = Vector(10, -0.9, 5)
SWEP.addAng = Angle(-9.8, -0.1, 0)
SWEP.sightPos = Vector(5.2, 8, 0.83)
SWEP.sightAng = Angle(-5, -2, 0)
SWEP.fakeHandRight = Vector(6, -2, 0)
SWEP.fakeHandLeft = Vector(10, -3, -5)
SWEP.Recoil = 0.5
