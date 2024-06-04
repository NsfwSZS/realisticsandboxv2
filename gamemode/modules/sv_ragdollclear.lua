
function RagdollOwner(rag)
    for _, ply in ipairs(player.GetAll()) do
        if ply:GetNWEntity("DeathRagdoll") == rag then return ply end
    end
    return nil
end

local function CleanUpRagdolls()
    print('НАХУЙЙЙЙЙЙ РЭГДОЛЛЫЛЛЛЫЛЫ')
    for _, ragdoll in ipairs(ents.FindByClass("prop_ragdoll")) do
        local owner = RagdollOwner(ragdoll)
        if not owner or (IsValid(owner) and not owner:GetNWBool("fake")) then
            if IsValid(ragdoll.AssociatedWeapon) then
                ragdoll.AssociatedWeapon:Remove()
            end
            -- Удаляем рэгдолл
            ragdoll:Remove()
        end
    end
end

if timer.Exists("RagdollCleanupTimer") then
    timer.Remove("RagdollCleanupTimer")
end

timer.Create("RagdollCleanupTimer", 900, 0, CleanUpRagdolls)
