--[[ Open sourced incase if you need something ]]--
local loaderSettings = loaderSettings or {
    accentcolor = Color3.fromRGB(145, 50, 168);
    accentcolor2 = Color3.fromRGB(85, 25, 99);
    background = nil;
    topcolor2 = Color3.fromRGB(20, 20, 20);
    cursor = true;
}

local loader = loadstring(game:HttpGet("https://raw.githubusercontent.com/coolb0y08/coolware/main/loader.lua"))()
local library = loader.load("ui"); do
    for i,v in pairs(loaderSettings) do
        library.theme[i] = v
    end
end

local Discord = loader.load("discord")
local Counter = loader.load("counter")

library._window = library:CreateWindow("coolware v2", Vector2.new(500, 300), "Insert"); do
    local Loader = library._window:CreateTab("Loader"); do
        local LoaderSect = Loader:CreateSector("Loader", "Left") do
            LoaderSect:AddButton("Load", function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/coolb0y08/coolware/main/loader.lua"))().load()
            end)

            LoaderSect:AddLabel("Game:"..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)
        end
        
        local themes = Loader:CreateSector("Themes", "Right"); do
            themes:AddToggle("Custom UI name", false, function(t)
                if t then
                    library._window.NameLabel.Text = library.flags["themes_name"]
                else
                    library._window.NameLabel.Text = "coolware v2"
                end
            end, "themes_customname")
            
            themes:AddTextbox("Name", library._window.name, function(t)
                if library.flags["themes_customname"] then
                    library._window.NameLabel.Text = t
                end
            end, "themes_name")
            
            AccentColor1 = themes:AddColorpicker("Accent Color 1", library.theme.accentcolor, function(t)
                library.theme.accentcolor = t
                library._window:UpdateTheme()
                _watermark:UpdateTheme()
            end) 
            
            AccentColor2 = themes:AddColorpicker("Accent Color 2", library.theme.accentcolor2, function(t)
                library.theme.accentcolor2 = t
                library._window:UpdateTheme()
                _watermark:UpdateTheme()
            end) 
    
            TopColor1 = themes:AddColorpicker("Top Color 1", library.theme.topcolor, function(t)
                library.theme.topcolor = t
                library._window:UpdateTheme()
                _watermark:UpdateTheme()
            end) 
            
            TopColor2 = themes:AddColorpicker("Top Color 2", library.theme.topcolor2, function(t)
                library.theme.topcolor2 = t
                library._window:UpdateTheme()
                _watermark:UpdateTheme()
            end)
            
            Background = themes:AddTextbox("Background", library.theme.background, function(t)
                library.theme.background = t
                library._window:UpdateTheme()
                _watermark:UpdateTheme()
            end)
            
            backgroundcolor = themes:AddColorpicker("Background Color", library.theme.backgroundcolor, function(t)
                library.theme.backgroundcolor = t
                library._window:UpdateTheme()
                _watermark:UpdateTheme()
            end)
            
            themes:AddButton("Reset Themes", function()
                Watermark:Set(true)
                AccentColor1:Set(_fromRGB(65, 150, 250))
                AccentColor2:Set(_fromRGB(70, 127, 194))
                TopColor1:Set(_fromRGB(30, 30, 30))
                TopColor2:Set(_fromRGB(20, 20, 20))
                Background:Set(nil)
                backgroundcolor:Set(_fromRGB(20, 20, 20))
    
                
                library._window:UpdateTheme()
                _watermark:UpdateTheme()
            end)
        end
        
        local __Others = Loader:CreateSector("Others", "Left"); do
            __Others:AddKeybind("UI Toggle", Enum.KeyCode.RightControl, function(t)
                print(t)
            end, function()
                if library._window.Frame.Visible then
                    library._window.Frame.Visible = false
                else
                    library._window.Frame.Visible = true
                end
            end)
            
            __Others:AddKeybind("Force UI Toggle", Enum.KeyCode.RightShift, function(t)
                print(t)
            end, function()
                if library._window.Frame.Visible then
                    library._window.Frame.Visible = false
                    _watermark.Visible = false
                else
                    library._window.Frame.Visible = true
                    _watermark.Visible = true
                end
            end)
            
            __Others:AddSeperator("Script Info")

            __Others:AddLabel("Executed:"..Counter.get().." time(s)")
            
            if Discord ~= nil then
                __Others:AddSeperator("Discord Info")

                local Members = Discord.fetch("find", "Member Count").name:gsub("Member Count: ", "")
                local Roles = Discord.fetch("find", "Role Count").name:gsub("Role Count: ", "")
                local Channels = Discord.fetch("find", "Channel Count").name:gsub("Channel Count: ", "")

                __Others:AddLabel("Members in server:"..tostring(Members))
                __Others:AddLabel("Roles in server:"..tostring(Roles))
                __Others:AddLabel("Channels in server:"..tostring(Channels))
                __Others:AddLabel("Active Members:"..Discord.fetch("active"))
                __Others:AddLabel("Name:"..Discord.fetch("guild").name)
                __Others:AddLabel("ID:"..Discord.fetch("guild").id)
                __Others:AddLabel("Verification Level:"..Discord.fetch("guild").verification_level)
                __Others:AddLabel("NSFW Level:"..Discord.fetch("guild").nsfw_level)
                __Others:AddButton("Join Discord", function()
                    local s, e = pcall(function()
                        syn.request({
                            Url = "http://127.0.0.1:6463/rpc?v=1",
                            Method = "POST",
                            Headers = {
                                ["Content-Type"] = "application/json",
                                ["origin"] = "https://discord.com",
                            },
                            Body = game:GetService("HttpService"):JSONEncode(
                                {
                                    ["args"] = {
                                        ["code"] = "m9Xd5FYqZz",
                                    },
                                    ["cmd"] = "m9Xd5FYqZz",
                                    ["nonce"] = "."
                                }
                            )
                        })
                    end)

                    if not s then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))().Notify({
                            Description = "Failed to join discord, please join manually. Invite is copied to your clipboard";
                            Title = "coolware";
                            Duration = 5;
                        });                       
                        setclipboard("m9Xd5FYqZz")     
                    end
                end)
            else
                __Others:AddLabel("Discord is deleted")
            end
        end
    end
end

Counter.load()
