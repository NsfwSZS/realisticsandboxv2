
SWEP.Base = 'nsbase' -- base

SWEP.PrintName 				= "MAC-10"
SWEP.Author 				= "Military Armament Corporation"
SWEP.Instructions			= "The Military Armament Corporation Model 10 and more commonly known as the MAC-10, is a compact, blowback operated machine pistol/submachine gun that was developed by Gordon B. Ingram in 1964. It is chambered in either .45 ACP or 9mm."
SWEP.Category 				= "Оружие | ПП"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false

------------------------------------------

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "Pistol"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 29
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "weapons/mac10/fire01.wav"
SWEP.Primary.FarSound = "snd_jack_hmcd_sht_far.wav"
SWEP.Primary.Force = 30
SWEP.ReloadTime = 2.2
SWEP.ShootWait = 0.05
SWEP.ReloadSounds = {
    [0.1] = {"weapons/mac10/clipout.wav"},
    [0.8] = {"weapons/mac10/clipin.wav"},
    [1.2] = {"weapons/mac10/boltforward.wav"},
    [1.4] = {"weapons/mac10/boltback.wav"},
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

SWEP.HoldType = "revolver"

------------------------------------------

SWEP.Slot					= 2
SWEP.SlotPos				= 0
SWEP.DrawAmmo				= true
SWEP.DrawCrosshair			= false

SWEP.ViewModel				= "models/weapons/nsbase/w_smg_mac10.mdl"
SWEP.WorldModel				= "models/weapons/nsbase/w_smg_mac10.mdl"

SWEP.addAng = Angle(0.04,3,0.06) -- Barrel pos adjust
SWEP.addPos = Vector(0,0,0) -- Barrel ang adjust
SWEP.sightPos = Vector(6, 13, 1.23)
SWEP.sightAng = Angle(-2, 2, 0)
SWEP.Recoil = 0.44