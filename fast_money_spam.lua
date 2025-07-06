-- Grow a Garden | Fast Money Spam (Clean, GUI-Free)
-- Fires Sell_Inventory remote 1000x for massive money

local player = game.Players.LocalPlayer
local remote = game:GetService("ReplicatedStorage")
    :WaitForChild("GameEvents")
    :WaitForChild("Sell_Inventory")

for i = 1, 1000 do
    remote:FireServer()
    wait(0.05)
end

print("✅ Money spam complete.")
