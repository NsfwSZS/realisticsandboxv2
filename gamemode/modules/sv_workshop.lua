local workshops = {
    {id = 3256245130, name = "Realistic Sandbox | Models weapons"},
    {id = 3258336192, name = "Realistic Sandbox | Models weapons 2"},
    {id = 3141596838, name = "Realistic Sandbox | Models armor"},
    {id = 3258989742, name = "Realistic Sandbox | Models jmod"}
}

local function addWorkshops()
    for _, workshop in pairs(workshops) do
        resource.AddWorkshop(workshop.id)
        -- print("Workshop ' " .. workshop.name .. " ' Add.")
    end
end

addWorkshops()