SWEP.Base = 'nsbase' -- base

SWEP.PrintName 				= "FN FAL"
SWEP.Author 				= "FN Herstal"
SWEP.Instructions			= "During the Cold War the FAL was adopted by many countries of the North Atlantic Treaty Organization (NATO), with the notable exception of the United States. It is one of the most widely used rifles in history, having been used by more than 90 countries. It received the title the 'right arm of the free world' from its adoption by many countries of self-proclaimed free world countries. It is chambered in 7.62×51mm NATO, although originally designed for the intermediate .280 British. The British Commonwealth variant of the FAL was redesigned from FN's metric FAL into British imperial units and was produced under license as the L1A1 Self-Loading Rifle."
SWEP.Category 				= "Оружие | Автоматы"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false

------------------------------------------

SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 20
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "SMG1"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 40
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "weapons/sg553/fire01.wav"
SWEP.Primary.FarSound = "weapons/sg553/distant.wav"
SWEP.Primary.Force = 30
SWEP.ReloadTime = 2.8
SWEP.ShootWait = 0.1
SWEP.ReloadSounds = {
    [0.3] = {"weapons/m4a1s/clipout.wav"},
    [1.3] = {"weapons/m4a1s/clipin.wav"},
    [1.8] = {"weapons/ak47/bolt.wav"},
}
SWEP.TwoHands = true
SWEP.Shell = "EjectBrass_338Mag"
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

SWEP.ViewModel				= "models/weapons/nsbase/w_rif_fal.mdl"
SWEP.WorldModel				= "models/weapons/nsbase/w_rif_fal.mdl"

SWEP.addPos = Vector(10, -1.05, 5)
SWEP.addAng = Angle(-9.5, -0.1, 0)
SWEP.sightPos = Vector(9.0, 3, 0.89)
SWEP.sightAng = Angle(-5, -2.5, 0)
SWEP.fakeHandRight = Vector(12, -2, 0)
SWEP.fakeHandLeft = Vector(13, -3, -5)
SWEP.Recoil = 0.7