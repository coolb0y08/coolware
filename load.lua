spawn(function()
    game.CoreGui:WaitForChild("DevConsoleMaster").DevConsoleWindow.DescendantAdded:Connect(function(t)
        if t.Name == "msg" then
            t.RichText = true
        end
    end)
end)

local Owner = "coolb0y08";
local Path = Owner.."/coolware/main/games/";
local Place = game.PlaceId;

local __1, __2 = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/"..Path..Place..".lua"))()
end)

if not __1 then
    print("<font color='rgb(230, 94, 94)'>", debug.traceback(), __2.."</font>")
end
