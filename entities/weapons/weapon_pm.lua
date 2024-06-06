SWEP.Base = 'nsbase' -- base

SWEP.PrintName 				= "Makarov-PM"
SWEP.Author 				= "Makarov"
SWEP.Instructions			= ""
SWEP.Category 				= "Оружие | Пистолеты"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false

------------------------------------------

SWEP.Primary.ClipSize		= 8
SWEP.Primary.DefaultClip	= 8
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "Pistol"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 24
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "weapons/tec9/fire.wav"
SWEP.Primary.FarSound = "snd_jack_hmcd_smp_far.wav"
SWEP.Primary.Force = 5
SWEP.ReloadTime = 2
SWEP.ShootWait = 0.1
SWEP.ReloadSounds = {
    [0.1] = {"weapons/tec9/clipout.wav"},
    [0.8] = {"weapons/tec9/clipin.wav"},
    [1.2] = {"weapons/tec9/boltback.wav"},
    [1.4] = {"weapons/tec9/boltforward.wav"},
}

------------------------------------------

SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.HoldType = "revolver"

------------------------------------------

SWEP.Slot					= 1
SWEP.SlotPos				= 2
SWEP.DrawAmmo				= true
SWEP.DrawCrosshair			= false

SWEP.ViewModel				= "models/weapons/nsbase/w_pist_pmt.mdl"
SWEP.WorldModel				= "models/weapons/nsbase/w_pist_pmt.mdl"

SWEP.addPos = Vector(5, 0.1, 4)
SWEP.addAng = Angle(-2.5, 5.05, 0)
SWEP.sightPos = Vector(3.7, 15, 1.55)
SWEP.sightAng = Angle(4, 8, 0)
SWEP.fakeHandRight = Vector(3.5, -1.5, 2)
SWEP.Recoil = 1.1