
SWEP.Base = 'nsbase' -- base

SWEP.PrintName 				= "FN P90"
SWEP.Author 				= "FN Herstal"
SWEP.Instructions			= "The FN P90 is a submachine gun chambered for the 5.7×28mm cartridge, also classified as a personal defense weapon, designed and manufactured by FN Herstal in Belgium.[9][10][11] Created in response to NATO requests for a replacement for 9×19mm Parabellum firearms, the P90 was designed as a compact but powerful firearm for vehicle crews, operators of crew-served weapons, support personnel, special forces, and counter-terrorist groups."
SWEP.Category 				= "Оружие | ПП"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false

------------------------------------------

SWEP.Primary.ClipSize		= 50
SWEP.Primary.DefaultClip	= 50
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "SMG1"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 26
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "weapons/p90/fire01.wav"
SWEP.Primary.FarSound = "snd_jack_hmcd_smp_far.wav"
SWEP.Primary.Force = 25
SWEP.ReloadTime = 1.8
SWEP.ShootWait = 0.1
SWEP.ReloadSounds = {
    [0.1] = {"weapons/p90/clipout.wav"},
    [0.7] = {"weapons/p90/clipin.wav"},
    [1] = {"weapons/p90/cliphit.wav"},
    [1.6] = {"weapons/p90/boltback.wav"},
    [1.8] = {"weapons/p90/boltforward.wav"}
}
SWEP.TwoHands = true
SWEP.Shell = "EjectBrass_57"

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

SWEP.ViewModel				= "models/weapons/nsbase/w_smg_p90.mdl"
SWEP.WorldModel				= "models/weapons/nsbase/w_smg_p90.mdl"

SWEP.addPos = Vector(14, -0.2, 7)
SWEP.addAng = Angle(-8, 2.4, 0)
SWEP.sightPos = Vector(9.2, -1, 0.73)
SWEP.sightAng = Angle(0, 4, 0)
SWEP.fakeHandRight = Vector(2, -2, 2)
SWEP.fakeHandLeft = Vector(4, -5, -4)
SWEP.Recoil = 0.75