-- Yo.
local __1, __2 = pcall(function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/CatzCode/cattoware/main/libraries/ui.lua"))()
end)

if not __1 then
  game.Players.LocalPlayer:Kick("[Failed to load cattoware/main/libraries/ui.lua]\n\n"..__2)
end;
