-- Grow a Garden | Infinite Watering Can Uses (Delta APK Safe)

local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")
local character = player.Character or player.CharacterAdded:Wait()

-- Function to patch watering can uses
local function patchCan(tool)
    if tool and tool:FindFirstChild("Uses") then
        tool.Uses.Value = 9999
        print("✅ Watering can uses set to 9999")
    elseif tool:FindFirstChild("Durability") then
        tool.Durability.Value = 9999
        print("✅ Watering can durability set to 9999")
    else
        warn("❌ No Uses/Durability value found in tool")
    end
end

-- Look in character & backpack
for _, tool in ipairs(backpack:GetChildren()) do
    if tool:IsA("Tool") and tool.Name:lower():find("water") then
        patchCan(tool)
    end
end

for _, tool in ipairs(character:GetChildren()) do
    if tool:IsA("Tool") and tool.Name:lower():find("water") then
        patchCan(tool)
    end
end
