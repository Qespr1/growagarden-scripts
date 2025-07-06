-- Grow a Garden | Real Infinite Money Cycle (No Dupe, Legit Auto Farm)
getgenv().AutoFarm = true

local player = game.Players.LocalPlayer
local rs = game:GetService("ReplicatedStorage")
local events = rs:WaitForChild("GameEvents")
local farm = nil

for _, f in pairs(workspace.Farm:GetChildren()) do
    local owner = f.Important and f.Important.Data.Owner
    if owner and owner.Value == player.Name then
        farm = f
        break
    end
end

local seedName = "Turnip" -- change to a fast-growing seed you own
local root = player.Character:WaitForChild("HumanoidRootPart")
local humanoid = player.Character:WaitForChild("Humanoid")
local sellPos = Vector3.new(62, 4, -26)
local function moveTo(pos)
    humanoid:MoveTo(pos)
    repeat wait() until (root.Position - pos).Magnitude < 5
end

function harvest()
    for _, plant in ipairs(farm.Important.Plants_Physical:GetChildren()) do
        local prompt = plant:FindFirstChildWhichIsA("ProximityPrompt", true)
        if prompt and prompt.Enabled then
            fireproximityprompt(prompt)
            wait(0.1)
        end
    end
end

function plant()
    for _, tile in ipairs(farm.Important.Plant_Locations:GetChildren()) do
        events.Plant_RE:FireServer(tile.Position, seedName)
        wait(0.05)
    end
end

function sell()
    moveTo(sellPos)
    events.Sell_Inventory:FireServer()
    wait(0.5)
end

-- 🔁 Main loop
spawn(function()
    while getgenv().AutoFarm do
        plant()
        wait(5)
        harvest()
        wait(2)
        sell()
        wait(5)
    end
end)

print("✅ Infinite money cycle running.")
