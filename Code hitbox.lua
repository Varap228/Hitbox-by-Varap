getgenv().SecureMode = true
if not game.Players.LocalPlayer.Character then
    game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = "No local character", 
        Text = "wait for the character to load!"
    })
    repeat task.wait() 
    until game.Players.LocalPlayer.Character
end
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Varap hub", 
    Text = "Hello " .. game.Players.LocalPlayer.Name .. "!", 
})
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Window = Rayfield:CreateWindow({
	Name = "Varap HitBox test",
	LoadingTitle = "Rayfield Interface Suite",
	LoadingSubtitle = "by Sirius",
	ConfigurationSaving = {
		Enabled = false,
		FolderName = "Rayfield Interface Suite",
		FileName = "HitBox testing"
	},
	KeySystem = false, -- Set this to true to use their key system
	KeySettings = {
		Title = "Varap hub",
		Subtitle = "Key System",
		Note = "Penis",
		SaveKey = true,
		Key = "Varap"
	}
})

local Tab = Window:CreateTab("HitBox", 4483362458)
local Section = Tab:CreateSection("")
local TabVis = Window:CreateTab("visuals", 4483362458) 
local SectionVis = TabVis:CreateSection("")


_G.hitbox = false
_G.Color = Color3.fromRGB(150,0,0)
_G.hitboxD = "HumanoidRootPart"
_G.HitboxSize = 5
_G.HitboxTransparency = 0.8
_G.CharacterHP = false
_G.Massless = false
local tablehead = {}
local tableHumanoid = {}
for i, v in next, game:GetService("Players"):GetPlayers() do
    if v.Name == game:GetService("Players").LocalPlayer.Name and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("HumanoidRootPart") then
        tablehead["headSize"] = v.Character.Head.Size
        tablehead["headMassless"] = v.Character.Head.Massless
        tablehead["headCanCollide"] = v.Character.Head.CanCollide
        tablehead["headTransparency"] = v.Character.Head.Transparency

        tableHumanoid["humanoidSize"] = v.Character.HumanoidRootPart.Size
        tableHumanoid["humanoidMassless"] = v.Character.HumanoidRootPart.Massless
        tableHumanoid["humanoidCanCollide"] = v.Character.HumanoidRootPart.CanCollide
        tableHumanoid["humanoidTransparency"] = v.Character.HumanoidRootPart.Transparency
    end
end

local Button = Tab:CreateButton({
	Name = "Button Esp (Ban risk)",
	Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua', true))()
	end,
})

function EspWithHP(v)
    if v.Character and v.Character.Humanoid.Health > 0 and not v.Character:FindFirstChild("ForceField") then
        v.Character[_G.hitboxD].Size = Vector3.new(_G.HitboxSize, _G.HitboxSize, _G.HitboxSize)
        v.Character[_G.hitboxD].Transparency = _G.HitboxTransparency
        v.Character[_G.hitboxD].Color = _G.Color
        v.Character[_G.hitboxD].Material = "Neon"
        v.Character[_G.hitboxD].CanCollide = false
        if _G.hitboxD == "Head" then
            v.Character[_G.hitboxD].Massless = true
        end
    else
        v.Character[_G.hitboxD].Color = Color3.fromRGB(163,162,165)
        v.Character[_G.hitboxD].Material = "Plastic"
        if _G.hitboxD == "Head" then
            v.Character.Head.CanCollide = tablehead.headCanCollide
            v.Character.Head.Size = tablehead.headSize
            v.Character.Head.Transparency = tablehead.headTransparency
            v.Character.Head.Massless = tablehead.headMassless
        elseif _G.hitboxD == "HumanoidRootPart" then
            v.Character.HumanoidRootPart.CanCollide = tableHumanoid.humanoidCanCollide
            v.Character.HumanoidRootPart.Size = tableHumanoid.humanoidSize
            v.Character.HumanoidRootPart.Transparency = tableHumanoid.humanoidTransparency
            v.Character.HumanoidRootPart.Massless = tableHumanoid.humanoidMassless
        
        end
        v.Character[_G.hitboxD].Transparency = 1
    end
end
local Toggle = Tab:CreateToggle({
	Name = "Hitbox all players",
	CurrentValue = false,
	Flag = "Toggle2", 
	Callback = function(hitboxVal)
        _G.hitbox = hitboxVal
        if hitboxVal then
            while _G.hitbox do
                if not _G.hitbox then 
                    break 
                end
			for i,v in next, game:GetService('Players'):GetPlayers() do
				if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                        pcall(function()
                            if _G.CharacterHP then
                                EspWithHP(v)
                            else
                                v.Character[_G.hitboxD].Size = Vector3.new(_G.HitboxSize, _G.HitboxSize, _G.HitboxSize)
                                v.Character[_G.hitboxD].Transparency = _G.HitboxTransparency
                                v.Character[_G.hitboxD].Color = _G.Color
                                v.Character[_G.hitboxD].Material = "Neon"
                                v.Character[_G.hitboxD].CanCollide = false
                                if _G.hitboxD == "Head" then
                                    v.Character[_G.hitboxD].Massless = true
                                end
                            end
                        end)
                    end
                end
                task.wait()
            end 
        else
            backHitBox()          
        end
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Hitbox with team check",
	CurrentValue = false,
	Flag = "Toggle1", 
	Callback = function(hitboxVal)
        _G.hitbox = hitboxVal
        if hitboxVal then
            while _G.hitbox do
                if not _G.hitbox then 
                    break 
                end
                for i, v in next, game:GetService('Players'):GetPlayers() do
                    if v.Name ~= game:GetService('Players').LocalPlayer.Name and game:GetService('Players').LocalPlayer.Team ~= v.Team then
                        pcall(function()
                            if _G.CharacterHP then
                                EspWithHP(v)
                            else
                                v.Character[_G.hitboxD].Size = Vector3.new(_G.HitboxSize, _G.HitboxSize, _G.HitboxSize)
                                v.Character[_G.hitboxD].Transparency = _G.HitboxTransparency
                                v.Character[_G.hitboxD].Color = _G.Color
                                v.Character[_G.hitboxD].Material = "Neon"
                                v.Character[_G.hitboxD].CanCollide = false
                            end
                        end)
                    end
                end
                task.wait()
            end 
        else
            backHitBox()          
        end
	end,
})
local ToggleHp = Tab:CreateToggle({
   Name = "Check Hp and Shield",
   CurrentValue = false,
   Flag = "ToggleHp",
   Callback = function(HpValue)
       _G.CharacterHP = HpValue
   end,
})  
local partPlayer = {}

for i, v in ipairs(game:GetService('Players'):GetPlayers()) do
    if v.Name == game:GetService('Players').LocalPlayer.Name then
        for i, b in ipairs(v.Character:GetChildren()) do
            if b.Name == "HumanoidRootPart" or b.Name == "Head" or b.Name == "Hitbox" then
                table.insert(partPlayer, b.Name)
            end
        end
    end
end


local DropdownHB = Tab:CreateDropdown({
    Name = "Dropdown Hitbox",
    Options = partPlayer,
    CurrentOption = partPlayer[1],
    Flag = "Dropdown1", 
    Callback = function(Option)
        _G.hitboxD = Option[1]
    end,
})

local ColorPickerHB = Tab:CreateColorPicker({
    Name = "Color Hitbox",
    Color = Color3.fromRGB(122,0,0), --Color3.fromRGB(122,0,0)
    Flag = "ColorPicker1", 
    Callback = function(ColorValue)
        _G.Color = ColorValue
    end
})
local SliderHBS = Tab:CreateSlider({
	Name = "HitBox size slider",
	Range = {0, 100},
	Increment = 1,
	Suffix = "",
	CurrentValue = 5,
	Flag = "HitBoxSizeSlider", 
	Callback = function(HitboxSizeValue)
        _G.HitboxSize = HitboxSizeValue
	end,
})
local SliderHBT = Tab:CreateSlider({
	Name = "Hitbox transparency slider",
	Range = {0, 1},
	Increment = 0.01,
	Suffix = "",
	CurrentValue = 0.8,
	Flag = "HitBoxSizeSlider", 
	Callback = function(HitboxTransparencyValue)
        _G.HitboxTransparency = HitboxTransparencyValue
	end,
})
local backfog = game:GetService("Lighting").FogEnd
local ToggleFog = TabVis:CreateToggle({
   Name = "Toggle Fog",
   CurrentValue = false,
   Flag = "ToggleFog",
   Callback = function(FogValue)
    if FogValue then
        game:GetService("Lighting").FogEnd = math.huge
    else
        game:GetService("Lighting").FogEnd = backfog
    end
   end,
})   
local SliderFog = TabVis:CreateSlider({
	Name = "Fog slider",
	Range = {0, 10000},
	Increment = 100,
	Suffix = "",
	CurrentValue = game:GetService("Lighting").FogEnd,
	Flag = "FogSlider", 
	Callback = function(FogValue)
        game:GetService("Lighting").FogEnd = FogValue
	end,
})
if game:GetService("Lighting"):FindFirstChildWhichIsA("Atmosphere") then
local Label = TabVis:CreateLabel("Atmosphere")
local backAt = game:GetService("Lighting"):FindFirstChildWhichIsA("Atmosphere").Density
local ToggleAtmosphere = TabVis:CreateToggle({
   Name = "Toggle Atmosphere",
   CurrentValue = false,
   Flag = "ToggleAtmosphere",
   Callback = function(AtmosphereValue)
    if AtmosphereValue then
        game:GetService("Lighting"):FindFirstChildWhichIsA("Atmosphere").Density = 0
    else
        game:GetService("Lighting"):FindFirstChildWhichIsA("Atmosphere").Density = backAt
    end
   end,
})
local SliderAtmosphere = TabVis:CreateSlider({
	Name = "Atmosphere slider",
	Range = {0, 1},
	Increment = 0.01,
	Suffix = "",
	CurrentValue = game:GetService("Lighting"):FindFirstChildWhichIsA("Atmosphere").Density,
	Flag = "AtmosphereSlider", 
	Callback = function(AtmosphereValue)
        game:GetService("Lighting"):FindFirstChildWhichIsA("Atmosphere").Density = AtmosphereValue
	end,
}) 
end
local Label = TabVis:CreateLabel("Clock time")
local SliderClockTime = TabVis:CreateSlider({
	Name = "ClockTime slider",
	Range = {0, 23},
	Increment = 0.01,
	Suffix = "",
	CurrentValue = game:GetService("Lighting").ClockTime,
	Flag = "ClockTimeSlider", 
	Callback = function(ClockTimeValue)
        game:GetService("Lighting").ClockTime = ClockTimeValue
	end,
}) 

local Label = Tab:CreateLabel("Destroy")
local Button = Tab:CreateButton({
	Name = "Destroy UI",
	Callback = function()
		Rayfield:Destroy()
	end,
})
function backHitBox() 
    for i,v in next, game:GetService('Players'):GetPlayers() do
        if v.Name ~= game:GetService('Players').LocalPlayer.Name then
            pcall(function()
                v.Character[_G.hitboxD].Color = Color3.fromRGB(163,162,165)
                v.Character[_G.hitboxD].Material = "Plastic"
                if _G.hitboxD == "Head" then
                    v.Character[_G.hitboxD].CanCollide = tablehead.headCanCollide
                    v.Character[_G.hitboxD].Size = tablehead.headSize
                    v.Character[_G.hitboxD].Transparency = tablehead.headTransparency
                    v.Character[_G.hitboxD].Massless = tablehead.headMassless
                elseif _G.hitboxD == "HumanoidRootPart" then
                    v.Character.HumanoidRootPart.CanCollide = tableHumanoid.humanoidCanCollid
                    v.Character.HumanoidRootPart.Transparency = tableHumanoid.humanoidTransparency
                    v.Character.HumanoidRootPart.Massless = tableHumanoid.humanoidMassless
                    v.Character.HumanoidRootPart.Size = tableHumanoid.humanoidSize
                end
                v.Character[_G.hitboxD].Transparency = 1
            end)
        end
    end 
end
