SWEP.Base = 'nsbase' -- base

SWEP.PrintName 				= "HK-USP"
SWEP.Author 				= "Heckler & Koch"
SWEP.Instructions			= ""
SWEP.Category 				= "Оружие | Пистолеты"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false

------------------------------------------

SWEP.Primary.ClipSize		= 15
SWEP.Primary.DefaultClip	= 15
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "Pistol"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 45
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "weapons/usps/us_fire01.wav"
SWEP.Primary.FarSound = "snd_jack_hmcd_smp_far.wav"
SWEP.Primary.Force = 25
SWEP.ReloadTime = 2
SWEP.ShootWait = 0.1
SWEP.ReloadSounds = {
    [0.1] = {"weapons/usps/clipout.wav"},
    [0.8] = {"weapons/usps/clipin.wav"},
    [1.2] = {"weapons/usps/slideback.wav"},
    [1.4] = {"weapons/usps/slideforward.wav"},
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

SWEP.ViewModel = "models/weapons/w_pist_usp.mdl"
SWEP.WorldModel = "models/weapons/w_pist_usp.mdl"

SWEP.addPos = Vector(5, 0.1, 4)
SWEP.addAng = Angle(-2.5, 5.05, 0)
SWEP.sightPos = Vector(3.7, 15, 1.55)
SWEP.sightAng = Angle(4, 8, 0)
SWEP.fakeHandRight = Vector(3.5, -1.5, 2)
SWEP.Recoil = 1.1