-- Grow a Garden | Infinite Watering Can Uses (Backpack, Hotbar, Equipped)
-- Works on Delta APK (Mobile Safe)

local player = game.Players.LocalPlayer
local function patchCan(tool)
    if not tool:IsA("Tool") then return end
    if tool.Name:lower():find("water") then
        if tool:FindFirstChild("Uses") then
            tool.Uses.Value = 9999
            print("✅ Watering can Uses set to 9999")
        elseif tool:FindFirstChild("Durability") then
            tool.Durability.Value = 9999
            print("✅ Watering can Durability set to 9999")
        else
            warn("❌ No Uses or Durability value found")
        end
    end
end

-- Check backpack, character, and hotbar (1–0)
local function scanAll()
    local backpack = player:WaitForChild("Backpack")
    local character = player.Character or player.CharacterAdded:Wait()

    for _, tool in ipairs(backpack:GetChildren()) do
        patchCan(tool)
    end

    for _, tool in ipairs(character:GetChildren()) do
        patchCan(tool)
    end
end

-- Initial scan
scanAll()

-- Also catch any new tools (auto update if picked up later)
player.Backpack.ChildAdded:Connect(patchCan)
player.CharacterAdded:Connect(function(char)
    char.ChildAdded:Connect(patchCan)
end)
