SWEP.Base = "nsbase" -- base 
SWEP.PrintName = "M4A4"
SWEP.Author = ""
SWEP.Instructions = ""
SWEP.Category = "Оружие | Автоматы"
SWEP.Spawnable = true
SWEP.AdminOnly = false
------------------------------------------
SWEP.Primary.ClipSize = 30
SWEP.Primary.DefaultClip = SWEP.Primary.ClipSize * 2
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "smg1"
SWEP.Primary.Cone = 0.01
SWEP.Primary.Damage = 33
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "weapons/m4a4/fire04.wav"
SWEP.Primary.Force = 65
SWEP.ReloadTime = 2.5
SWEP.ShootWait = 0.1
SWEP.ReloadSounds = {
    [0.1] = {"weapons/m4a4/clipout.wav"},
    [1.3] = {"weapons/m4a4/clipin.wav"},
    [2] = {"weapons/m4a4/cliphit.wav"},
}
SWEP.TwoHands = true
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "SMG1"
------------------------------------------
SWEP.Weight = 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.HoldType = "ar2"
------------------------------------------
SWEP.Slot = 2
SWEP.SlotPos = 2
SWEP.DrawAmmo = true
SWEP.DrawCrosshair = false
SWEP.ViewModel = "models/weapons/nsbase/w_rif_m4a1.mdl"
SWEP.WorldModel = "models/weapons/nsbase/w_rif_m4a1.mdl"
SWEP.addPos = Vector(10, -1.05, 5)
SWEP.addAng = Angle(-11, -0.05, 0)
SWEP.sightPos = Vector(5.9, 6, 1.03)
SWEP.sightAng = Angle(-5, -2.5, 0)
SWEP.fakeHandRight = Vector(12, -2, 0)
SWEP.fakeHandLeft = Vector(13, -3, -7)
SWEP.Recoil = 0.5