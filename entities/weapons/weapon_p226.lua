SWEP.Base = 'nsbase' -- base

SWEP.PrintName 				= "P226"
SWEP.Author 				= "SIG Sauer"
SWEP.Instructions			= "The SIG Sauer P226 is a full-sized service pistol made by SIG Sauer. The 9×19mm Parabellum pistol. It has the same mechanism of operation as the SIG Sauer P220, but is developed to use higher capacity, double stack magazines in place of the single stack magazines of the P220."
SWEP.Category 				= "Оружие | Пистолеты"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false

------------------------------------------

SWEP.Primary.ClipSize		= 18
SWEP.Primary.DefaultClip	= 18
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "Pistol"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 21
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "weapons/p250/fire.wav"
SWEP.Primary.FarSound = "snd_jack_hmcd_smp_far.wav"
SWEP.Primary.Force = 10
SWEP.ReloadTime = 1.4
SWEP.ShootWait = 0.1
SWEP.ReloadSounds = {
    [0.1] = {"weapons/p250/clipout.wav"},
    [0.8] = {"weapons/p250/clipin.wav"},
    [1.2] = {"weapons/p250/slideback.wav"},
    [1.4] = {"weapons/p250/slideforward.wav"},
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

SWEP.ViewModel				= "models/weapons/nsbase/w_pist_p228.mdl"
SWEP.WorldModel				= "models/weapons/nsbase/w_pist_p228.mdl"

SWEP.addPos = Vector(5, 0.1, 4)
SWEP.addAng = Angle(-2.5, 5.05, 0)
SWEP.sightPos = Vector(3.7, 15, 1.55)
SWEP.sightAng = Angle(4, 8, 0)
SWEP.fakeHandRight = Vector(3.5, -1.5, 2)
SWEP.Recoil = 1.1