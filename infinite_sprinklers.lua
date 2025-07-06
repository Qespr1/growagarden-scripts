-- Grow a Garden | Infinite Sprinklers Script (Delta APK)
-- Use in private server to avoid detection
local rs = game:GetService("ReplicatedStorage")
local sprinklerRemote = rs:WaitForChild("GameEvents"):FindFirstChild("PlaceSprinkler")

local farm = nil
for _, f in pairs(workspace.Farm:GetChildren()) do
    local owner = f:FindFirstChild("Important") and f.Important:FindFirstChild("Data") and f.Important.Data:FindFirstChild("Owner")
    if owner and owner.Value == game.Players.LocalPlayer.Name then
        farm = f
        break
    end
end

-- Spawn sprinklers across your entire plot
if farm and sprinklerRemote then
    local spots = farm.Important.Plant_Locations:GetChildren()
    for _, spot in pairs(spots) do
        local pos = spot.Position
        sprinklerRemote:FireServer(pos)
        wait(0.1) -- prevent flooding server
    end
    print("✅ Unlimited sprinklers placed across your farm.")
else
    warn("⚠️ Sprinkler remote or farm not found.")
end
