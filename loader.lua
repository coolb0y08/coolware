spawn(function()
    game.CoreGui:WaitForChild("DevConsoleMaster").DevConsoleWindow.DescendantAdded:Connect(function(t)
        if t.Name == "msg" then
            t.RichText = true
        end
    end)
end)

local Loader = {}
local Owner = "coolb0y08";
local Path = Owner.."/coolware/main/";
local Place = game.PlaceId;

Loader.load = function(string, bool, func)
    if not string or string == game.PlaceId then
        local bool = bool or false
        local func = func or print
        local __1, __2 = pcall(function()
            return loadstring(game:HttpGet("https://raw.githubusercontent.com/"..Path.."games/"..Place..".lua"))()
        end)

        if not __1 and bool then
            func("<font color='rgb(230, 94, 94)'>", debug.traceback(), __2.."</font>")
        end
        
        if __1 and bool then
            func("<font color='rgb(98, 201, 75)'>Loaded</font>")
        end
    else
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/"..Path.."etc/"..string..".lua"))()
    end
end

return Loader
