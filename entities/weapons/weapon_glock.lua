SWEP.Base = "nsbase" -- base 
SWEP.PrintName = "Glock-17"
SWEP.Author = ""
SWEP.Instructions = ""
SWEP.Category = "Оружие | Пистолеты"
SWEP.Spawnable = true
SWEP.AdminOnly = false
------------------------------------------
SWEP.Primary.ClipSize = 17
SWEP.Primary.DefaultClip = SWEP.Primary.ClipSize * 2
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "pistol"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 21
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "weapons/glock/glock18-1.wav"
SWEP.Primary.Force = 25
SWEP.ReloadTime = 1.4
SWEP.ShootWait = 0.1
SWEP.ReloadSounds = {
    [0.1] = {"weapons/glock18/clipout.wav"},
    [0.8] = {"weapons/glock18/clipin.wav"},
    [1.2] = {"weapons/glock18/slideback.wav"},
    [1.4] = {"weapons/glock18/slideforward.wav"},
}
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "pistol"
------------------------------------------
SWEP.Weight = 1
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.HoldType = "revolver"
------------------------------------------
SWEP.Slot = 1
SWEP.SlotPos = 2
SWEP.DrawAmmo = true
SWEP.DrawCrosshair = false
SWEP.ViewModel = "models/weapons/nsbase/w_pist_glock18.mdl"
SWEP.WorldModel = "models/weapons/nsbase/w_pist_glock18.mdl"
SWEP.addPos = Vector(1, 0.1, 0)
SWEP.addAng = Angle(0, 4, 0)
SWEP.sightPos = Vector(5.2, 13, 1.4)
SWEP.sightAng = Angle(4, 8, 0)
SWEP.fakeHandRight = Vector(3.5, -1.5, 2)
SWEP.Recoil = 1.1
