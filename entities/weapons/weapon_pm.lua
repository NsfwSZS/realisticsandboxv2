SWEP.Base = 'nsbase' -- base

SWEP.PrintName 				= "PM"
SWEP.Author 				= "Makarov"
SWEP.Instructions			= "ПМ - Пистолет макарова, стреляющий патронами 9x18мм, стандартный штатный магазин на 8 патрон."
SWEP.Category 				= "Оружие - Пистолеты"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false
if (CLIENT) then SWEP.WepSelectIcon=surface.GetTextureID("vgui/tfa_ins2_pm") SWEP.IconOverride="vgui/tfa_ins2_pm" end
SWEP.vbwPos = Vector(6,0,-3)
------------------------------------------

SWEP.Primary.ClipSize		= 8
SWEP.Primary.DefaultClip	= 8
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "9х18 mm"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 40
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "weapons/tec9/fire.wav"
SWEP.Primary.FarSound = "snd_jack_hmcd_smp_far.wav"
SWEP.Primary.Force = 40
SWEP.ReloadTime = 2
SWEP.ShootWait = 0.07
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

SWEP.addAng = Angle(0.1,-0.1,0) -- Barrel ang adjust
SWEP.addPos = Vector(0,0,0) -- Barrel pos adjust
SWEP.SightPos = Vector(-14,1.5,3.5) -- Sight pos
SWEP.SightAng = Angle(0,8,0) -- Sight ang

function SWEP:Think()
    
    if self.holdnow == "pistol" then self:SetHoldType("pistol") end
    if self.holdnow == "revolver" then return end
end