function SWEP:DrawWorldModel()
	self:DrawModel()
end
SWEP.PrintName = "Пояс смертника"
    
SWEP.Author = "чеча"
SWEP.Purpose = ""
SWEP.Instructions = ""
SWEP.Category = "Другое"

SWEP.ViewModel = "models/props_junk/cardboard_jox004a.mdl"
SWEP.WorldModel = "models/props_junk/cardboard_jox004a.mdl"

SWEP.Spawnable= true
SWEP.AdminOnly = false

SWEP.Slot = 2
SWEP.SlotPos = 2

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.DrawCrosshair = false

function SWEP:Initialize()
	self:SetHoldType("slam")
    self.redline = false
    self.blueline = false
    self.greenline = false
end

function SWEP:RedLineTrue()
    self.redline = true
end

function SWEP:GreenLineTrue()
    self.greenline = true
end

function SWEP:BlueLineTrue()
    self.blueline = true
end


function SWEP:GetBlue()
    return self.blueline
end

function SWEP:GetGreen()
    return self.greenline
end

function SWEP:GetRed()
    return self.redline
end

if CLIENT then
	local Hidden=0
	function SWEP:GetViewModelPosition(pos,ang)
		if not(self.DownAmt)then self.DownAmt=16 end
		if(self.Owner:KeyDown(IN_SPEED))then
			self.DownAmt=math.Clamp(self.DownAmt+.8,0,16)
		else
			self.DownAmt=math.Clamp(self.DownAmt-.9,0,16)
		end
		local NewPos=pos+ang:Forward()*50-ang:Up()*(20+self.DownAmt+Hidden)+ang:Right()*20
		return NewPos,ang
	end
	function SWEP:DrawWorldModel()
	if(self.Owner:IsValid())then
		local Pos,Ang=self.Owner:GetBonePosition(self.Owner:LookupBone("ValveBiped.Bip01_R_Hand"))
		if(self.DatDetModel)then
			self.DatDetModel:SetRenderOrigin(Pos+Ang:Forward()*4+Ang:Right()*1)
			Ang:RotateAroundAxis(Ang:Up(),90)
			Ang:RotateAroundAxis(Ang:Right(),180)
			self.DatDetModel:SetRenderAngles(Ang)
			self.DatDetModel:DrawModel()
		else
			self.DatDetModel=ClientsideModel("models/props_junk/cardboard_jox004a.mdl")
			self.DatDetModel:SetPos(self:GetPos())
			self.DatDetModel:SetParent(self)
			self.DatDetModel:SetNoDraw(true)
			self.DatDetModel:SetModelScale(.35,0)
		end
	end
	end
end