getgenv().autoTap = true;
getgenv().autoRebirth = true;
getgenv().buyEgg = true;
getgenv().equipBest = true;




local http = game:GetService("HttpService")
local Data = {
	["content"] = "Hey! This is a message sent from roblox!"
}

Data = http:JSONEncode(Data)

http:PostAsync("https://discord.com/api/webhooks/908292672500940840/cCiXmS9npnKPRmLyXbq5X3XqBpSwxedq0h9QYrXiPN-hArIfSWQh1j2obmHHfGLmSRwZ", Data) --Put the link you saved between the two quotes.



function doTap()
    spawn(function()
        while autoTap == true do
            local args = {
                [1] = false,
                [2] = 1
            }
            game:GetService("ReplicatedStorage").Remotes.AddClicks2:FireServer(unpack(args))
            wait()
        end
    end)
end

function doRB()
    spawn(function()
        while autoRebirth == true do
            local args = {
                [1] = "10000"
            }
            game:GetService("ReplicatedStorage").Remotes.BuyRebirth:FireServer(unpack(args))
            wait()
        end
    end)
end

function doEgg()
    spawn(function()
        while buyEgg == true do
            local args = {
                [1] = "GhostEgg",
                [2] = 1,
                [3] = {
                    [1] = "Common",
                    [2] = "Uncommon",
                    [3] = "Rare"
                }
            }
            game:GetService("ReplicatedStorage").Remotes.EggHatch:InvokeServer(unpack(args))
            wait(0)
        end
    end)
end

function equipBestPet()
    spawn(function()
        while equipBest == true do
            game:GetService("ReplicatedStorage").Remotes.EquipBest:FireServer()
            wait(5)
        end
    end)
end

doTap()
doRB()
doEgg()
equipBestPet()