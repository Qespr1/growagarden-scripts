-- Grow a Garden Mobile Auto Script (Delta APK)
getgenv().AutoFarm = true
getgenv().SeedType = "Carrot" -- Change this to any unlocked seed
getgenv().SpawnPetName = "T-Rex" -- Optional dino pet
getgenv().SpawnSeedName = "Bone Blossom" -- Optional rare seed

local plr = game.Players.LocalPlayer
local rs = game:GetService("ReplicatedStorage")
local events = rs:WaitForChild("GameEvents")
local myFarm

for _, farm in pairs(workspace.Farm:GetChildren()) do
  local owner = farm.Important and farm.Important.Data.Owner
  if owner and owner.Value == plr.Name then
    myFarm = farm
    break
  end
end

spawn(function()
  while getgenv().AutoFarm and myFarm do
    local plot = myFarm.Important.Plant_Locations
    for _, soil in pairs(plot:GetChildren()) do
      events.Plant_RE:FireServer(soil.Position, getgenv().SeedType)
    end
    wait(3)
    for _, plant in pairs(myFarm.Important.Plants_Physical:GetChildren()) do
      local prompt = plant:FindFirstChildWhichIsA("ProximityPrompt", true)
      if prompt and prompt.Enabled then
        fireproximityprompt(prompt)
      end
    end
    wait(2)
    events.Sell_Inventory:FireServer()
    wait(10)
  end
end)

if getgenv().SpawnPetName then
  local spawnPet = events:FindFirstChild("SpawnPet")
  if spawnPet then spawnPet:FireServer(getgenv().SpawnPetName) end
end

if getgenv().SpawnSeedName then
  events.BuySeedStock:FireServer(getgenv().SpawnSeedName)
end

print("✅ Farming " .. getgenv().SeedType)
