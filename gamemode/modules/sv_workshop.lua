
local workshopid = {
    "3256245130", -- https://steamcommunity.com/sharedfiles/filedetails/?id=3256245130 models 1
    "3258336192", -- https://steamcommunity.com/sharedfiles/filedetails/?id=3258336192 models 2
    -- "3141596838", -- https://steamcommunity.com/sharedfiles/filedetails/?id=3141596838 map
    "3258989742", -- https://steamcommunity.com/sharedfiles/filedetails/?id=3258989742 jmod models
}

local function addWorkshopResources(ids)
    for _, id in ipairs(ids) do
        resource.AddWorkshop(id)
    end
end

addWorkshopResources(workshopid)
