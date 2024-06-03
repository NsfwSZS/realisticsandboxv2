SWEP.Base = "nsbase" -- base 
SWEP.PrintName = "Desert Eagle"
SWEP.Author = "Desert Eagle"
SWEP.Instructions = ""
SWEP.Category = "Оружие | Пистолеты"
SWEP.Spawnable = true
SWEP.AdminOnly = false
------------------------------------------
SWEP.Primary.ClipSize = 7
SWEP.Primary.DefaultClip = SWEP.Primary.ClipSize * 2
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "357"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 61
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "weapons/deagle/deagle-1.wav"
SWEP.Primary.Force = 35
SWEP.ReloadTime = 2
SWEP.ReloadSounds = {
    [0.1] = {"weapons/deagle/clipout.wav"},
    [0.8] = {"weapons/deagle/clipin.wav"},
    [1.2] = {"weapons/deagle/slideback.wav"},
    [1.4] = {"weapons/deagle/slideforward.wav"},
}
SWEP.ShootWait = 0.1
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"
------------------------------------------
SWEP.Weight = 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.HoldType = "revolver"
------------------------------------------
SWEP.Slot = 1
SWEP.SlotPos = 2
SWEP.DrawAmmo = true
SWEP.DrawCrosshair = false
SWEP.ViewModel = "models/weapons/w_pist_deagle.mdl"
SWEP.WorldModel = "models/weapons/w_pist_deagle.mdl"
SWEP.addPos = Vector(5, 0.1, 4)
SWEP.addAng = Angle(-2.4, 4.95, 0)
SWEP.sightPos = Vector(4.5, 10, 1.20)
SWEP.sightAng = Angle(4, 8, 0)
SWEP.fakeHandRight = Vector(3.5, -1.5, 2)
SWEP.Recoil = 4