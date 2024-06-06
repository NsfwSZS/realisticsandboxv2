SWEP.Base = "nsbase" -- base 
SWEP.PrintName = "M249"
SWEP.Instructions = ""
SWEP.Category = "Оружие | Пулеметы"
SWEP.Spawnable = true
SWEP.AdminOnly = false
------------------------------------------
SWEP.Primary.ClipSize = 100
SWEP.Primary.DefaultClip = SWEP.Primary.ClipSize * 2
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "smg1"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 32
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "weapons/m249/m249-1.wav"
SWEP.Primary.Force = 20
SWEP.ReloadTime = 5
SWEP.ShootWait = 0.08
SWEP.ReloadSounds = {
    [0.1] = {"weapons/m249/boxout.wav"},
    [1] = {"weapons/m249/boxin.wav"},
    [1.5] = {"weapons/m249/coverdown.wav"},
}
SWEP.TwoHands = true
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"
------------------------------------------
SWEP.Weight = 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.HoldType = "smg"
------------------------------------------
SWEP.Slot = 2
SWEP.SlotPos = 2
SWEP.DrawAmmo = true
SWEP.DrawCrosshair = false
SWEP.ViewModel = "models/weapons/nsbase/w_mach_m249para.mdl"
SWEP.WorldModel = "models/weapons/nsbase/w_mach_m249para.mdl"
SWEP.addPos = Vector(0, 2, -1.3)
SWEP.addAng = Angle(0.5, 0, 0)
SWEP.sightPos = Vector(7.7, 5, 0.63)
SWEP.sightAng = Angle(-5, -2.5, 0)
SWEP.fakeHandRight = Vector(12, -2, 0)
SWEP.fakeHandLeft = Vector(13, -3, -5)
SWEP.Recoil = 0.65