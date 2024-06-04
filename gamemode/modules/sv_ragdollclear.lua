-- Функция для определения владельца рэгдолла
function RagdollOwner(rag)
    for _, ply in ipairs(player.GetAll()) do
        if ply:GetNWEntity("DeathRagdoll") == rag then return ply end
    end
    return nil
end

-- Функция для очистки рэгдоллов и связанного с ними оружия
local function CleanUpRagdolls()
    print('НАХУЙЙЙЙЙЙ РЭГДОЛЛЫ!!!')
    for _, ragdoll in ipairs(ents.FindByClass("prop_ragdoll")) do
        local owner = RagdollOwner(ragdoll)
        -- Удаляем рэгдолл и связанное с ним оружие, если у него нет владельца или если у владельца не установлен флаг 'fake'
        if not owner or (IsValid(owner) and not owner:GetNWBool("fake")) then
            -- Удаляем все сущности оружия, связанные с этим рэгдоллом
            if IsValid(ragdoll.AssociatedWeapon) then
                ragdoll.AssociatedWeapon:Remove()
            end
            -- Удаляем рэгдолл
            ragdoll:Remove()
        end
    end
end

-- Убедимся, что таймер не был создан ранее
if timer.Exists("RagdollCleanupTimer") then
    timer.Remove("RagdollCleanupTimer")
end

-- Создаем таймер, который будет вызывать функцию CleanUpRagdolls каждые 5 секунд
timer.Create("RagdollCleanupTimer", 900, 0, CleanUpRagdolls)
