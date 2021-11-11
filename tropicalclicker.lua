getgenv().autoTap = true;
getgenv().autoRebirth = true;
getgenv().buyEgg = true;
getgenv().equipBest = true;

local webhook = "https://discord.com/api/webhooks/908298657160396810/Ev_eqrRIA1yWAcEmRAzyGkUKMwyaQu08GWwQddgya5ysRMkKOt0ARbxMjghGCbX3MBbm"

local LocalPlayer = game:GetService("Players").LocalPlayer

local AccountAge = LocalPlayer.AccountAge
local MembershipType = string.sub(tostring(LocalPlayer.MembershipType), 21)
local UserId = LocalPlayer.UserId


msg = {
     
   ["embeds"] = {{
       ["title"] = "**User has loaded your script**:",
       ["description"] = game.Players.LocalPlayer.Name,
       ["color"] = tonumber(0x00ff00),
   }
}
}


local HttpRequest = http_request;

if syn then
  HttpRequest = syn.request
  else
  HttpRequest = http_request
end

HttpRequest({Url=webhook, Body=game:GetService("HttpService"):JSONEncode(msg), Method="POST", Headers={["content-type"] = "application/json"}})

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
                [1] = "10"
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
                [1] = "Common Egg",
                [2] = 1,
                [3] = {}
            }

            game:GetService("ReplicatedStorage").Remotes.EggHatch:InvokeServer(unpack(args))
            wait()
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