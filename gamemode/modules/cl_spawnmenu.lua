local PANEL = {}

function PANEL:Init()
    self.PanelList = vgui.Create("DPanelList", self)
    self.PanelList:SetPadding(4)
    self.PanelList:SetSpacing(2)
    self.PanelList:EnableVerticalScrollbar(true)
    self:BuildList()
end

local function AddComma(n)
    local sn = tostring(n)
    sn = string.ToTable(sn)
    local tab = {}

    for i = 0, #sn - 1 do
        if i % 3 == #sn % 3 and not (i == 0) then
            table.insert(tab, ",")
        end

        table.insert(tab, sn[i + 1])
    end

    return string.concat("", tab)
end

function PANEL:BuildList()
    self.PanelList:Clear()
    local constructs = {
"models/props_junk/wood_crate001a.mdl",
"models/props_c17/oildrum001.mdl",
"models/props_c17/FurnitureChair001a.mdl",
"models/props_c17/FurnitureCouch001a.mdl","models/props_c17/FurnitureCouch002a.mdl",
"models/props_c17/FurnitureTable001a.mdl","models/props_c17/FurnitureSink001a.mdl",
"models/props_c17/FurnitureTable002a.mdl","models/props_c17/FurnitureTable003a.mdl",
"models/props_c17/FurnitureToilet001a.mdl","models/props_c17/FurnitureWashingmachine001a.mdl","models/props_c17/bench01a.mdl","models/props_c17/chair02a.mdl",
"models/props_c17/concrete_barrier001a.mdl",
"models/props_c17/FurnitureCupboard001a.mdl","models/props_c17/FurnitureDrawer001a.mdl","models/props_c17/gravestone002a.mdl",
"models/props_c17/gravestone001a.mdl","models/props_c17/gravestone_coffinpiece001a.mdl","models/props_junk/PlasticCrate01a.mdl","models/props_c17/shelfunit01a.mdl",
"models/props_combine/breenchair.mdl","models/props_combine/breendesk.mdl","models/props_combine/breenglobe.mdl","models/props_interiors/BathTub01a.mdl",
"models/props_interiors/Furniture_chair01a.mdl","models/props_interiors/Furniture_chair03a.mdl",
"models/props_interiors/Furniture_Couch01a.mdl","models/props_interiors/Furniture_Couch02a.mdl","models/props_interiors/Furniture_Lamp01a.mdl",
"models/props_interiors/Furniture_shelf01a.mdl","models/props_interiors/pot01a.mdl","models/props_interiors/pot02a.mdl","models/props_interiors/Radiator01a.mdl",
"models/props_interiors/SinkKitchen01a.mdl","models/props_interiors/VendingMachineSoda01a.mdl","models/props_junk/cardboard_box001a.mdl",
"models/props_junk/cardboard_box003a.mdl","models/props_junk/CinderBlock01a.mdl","models/props_junk/metal_paintcan001a.mdl","models/props_junk/MetalBucket01a.mdl",
"models/props_junk/MetalBucket02a.mdl","models/props_junk/metalgascan.mdl","models/props_junk/PushCart01a.mdl","models/props_junk/TrashDumpster01a.mdl",
"models/props_junk/TrashDumpster02b.mdl","models/props_wasteland/cafeteria_table001a.mdl","models/props_wasteland/kitchen_shelf002a.mdl",
"models/props_wasteland/kitchen_shelf001a.mdl","models/props_c17/cashregister01a.mdl","models/props_c17/chair_kleiner03a.mdl",
"models/props_combine/breenclock.mdl","models/props_c17/tv_monitor01.mdl","models/props_c17/TrapPropeller_Lever.mdl","models/props_c17/TrapPropeller_Engine.mdl",
"models/props_lab/workspace001.mdl","models/props_lab/workspace002.mdl","models/props_lab/workspace003.mdl","models/props_lab/workspace004.mdl"
    } 
    local armorprops = {
        "models/props_c17/fence01a.mdl",
        "models/props_wasteland/interior_fence002d.mdl","models/props_wasteland/interior_fence002e.mdl",
        "models/props_c17/fence03a.mdl","models/props_wasteland/interior_fence001g.mdl","models/props_c17/display_cooler01a.mdl","models/props_c17/door01_left.mdl",
        "models/props_interiors/ElevatorShaft_Door01a.mdl","models/props_lab/blastdoor001c.mdl",
    }
    local otherprops = {
        "models/props_phx/construct/metal_plate1.mdl","models/props_phx/construct/metal_plate2x2.mdl",
        "models/props_phx/construct/plastic/plastic_panel1x1.mdl","models/props_phx/construct/plastic/plastic_panel1x2.mdl",
        "models/hunter/blocks/cube05x05x05.mdl","models/hunter/blocks/cube075x075x075.mdl","models/hunter/blocks/cube075x075x025.mdl",
        "models/hunter/plates/plate1x1.mdl","models/hunter/plates/plate2x2.mdl","models/hunter/plates/plate1x3.mdl","models/hunter/triangles/1x1x1.mdl",
        "models/hunter/triangles/3x3x2.mdl",
    }

    self:AddCategory("Стройка", constructs)
    self:AddCategory("Защита", armorprops)
    self:AddCategory("Другое", otherprops)
end

function PANEL:AddCategory(categoryName, propsList)
    local Category = vgui.Create("DCollapsibleCategory", self)
    self.PanelList:AddItem(Category)
    Category:SetExpanded(true)
    Category:SetLabel(categoryName)
    Category:SetCookieName("EntitySpawn." .. categoryName)
    local Content = vgui.Create("DPanelList")
    Category:SetContents(Content)
    Content:EnableHorizontal(true)
    Content:SetDrawBackground(false)
    Content:SetSpacing(2)
    Content:SetPadding(2)
    Content:SetAutoSize(true)

    for _, model in ipairs(propsList) do
        local Icon = vgui.Create("SpawnIcon", self)
        Icon:SetModel(model)
         Icon.DoClick = function()
            RunConsoleCommand("gm_spawn", model)
            surface.PlaySound("ui/buttonclick.wav")
        end

        local label = vgui.Create("DLabel", Icon)
        label:SetFont("DebugFixedSmall")
        label:SetTextColor(color_black)
        label:SetText(model)
        label:SetContentAlignment(5)
        label:SetWide(self:GetWide())
        label:AlignBottom(-42)
        Content:AddItem(Icon)
    end
end

function PANEL:PerformLayout()
    self.PanelList:StretchToParent(0, 0, 0, 0)
end

local CreationSheet = vgui.RegisterTable(PANEL, "Panel")

local function CreateContentPanel()
    local ctrl = vgui.CreateFromTable(CreationSheet)

    return ctrl
end


local function RemoveSandboxTabs()
    local AccsesGroup = {"admin"}
    local tabstoremove = {
            language.GetPhrase("spawnmenu.content_tab"), 
            language.GetPhrase("spawnmenu.category.npcs"), 
        --  language.GetPhrase("spawnmenu.category.entities"), 
        --  language.GetPhrase("spawnmenu.category.weapons"), 
        --    language.GetPhrase("spawnmenu.category.vehicles"), 
            language.GetPhrase("spawnmenu.category.postprocess"), 
            language.GetPhrase("spawnmenu.category.dupes"), 
            language.GetPhrase("spawnmenu.category.saves")
    }
    if table.HasValue(AccsesGroup, LocalPlayer():GetUserGroup()) or LocalPlayer():IsSuperAdmin() then 
        return false
    else
        for k, v in pairs(g_SpawnMenu.CreateMenu.Items) do
            if v.Tab:GetText() != "Разрешенные пропы" and v.Tab:GetText() != language.GetPhrase("spawnmenu.category.weapons") and v.Tab:GetText() != language.GetPhrase("spawnmenu.category.entities") then
                g_SpawnMenu.CreateMenu:CloseTab(v.Tab, true)
                RemoveSandboxTabs()
            end
        end
        
    end
end

hook.Add("SpawnMenuOpen", "blockmenutabs", RemoveSandboxTabs)

spawnmenu.AddCreationTab("Разрешенные пропы", CreateContentPanel, "icon16/application_view_tile.png", 4)