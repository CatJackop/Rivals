-- CAT HUB GUI TEST EXAMPLE
-- For testing the CAT HUB GUI library in your own Roblox experience.

local Library = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/CatJackop/CATHUBGUI/refs/heads/main/CAT_HUB_GUI.luau"
))()

local Window = Library:MakeWindow({
    Title = "CAT HUB",
    SubTitle = "GUI Test Example",
    ScriptFolder = "cat_hub_gui_test",
})

-- INFO TAB
local Info = Window:MakeTab({
    Name = "info",
})

Info:AddParagraph("CAT HUB GUI TEST", "This is a simple test project for your GUI library.")
Info:AddParagraph("Status", "GUI loaded successfully.")

Info:AddButton({
    Name = "Test Notification",
    Callback = function()
        pcall(function()
            Window:Notify({
                Title = "CAT HUB",
                Content = "Button works!",
                Duration = 3,
            })
        end)
    end,
})

-- CONTROLS TAB
local Controls = Window:MakeTab({
    Name = "controls",
})

Controls:AddToggle({
    Name = "Test Toggle",
    Default = false,
    Callback = function(value)
        print("Test Toggle:", value)
    end,
})

Controls:AddSlider({
    Name = "Test Slider",
    Min = 0,
    Max = 100,
    Default = 50,
    Rounding = 0,
    Callback = function(value)
        print("Test Slider:", value)
    end,
})

Controls:AddDropdown({
    Name = "Test Dropdown",
    Values = {"Option 1", "Option 2", "Option 3"},
    Default = "Option 1",
    Callback = function(value)
        print("Test Dropdown:", value)
    end,
})

Controls:AddButton({
    Name = "Test Button",
    Callback = function()
        print("CAT HUB test button works")
    end,
})

-- GAME TEST TAB
-- These controls only change harmless Lighting settings in your own game.
local GameTest = Window:MakeTab({
    Name = "game test",
})

local Lighting = game:GetService("Lighting")

GameTest:AddToggle({
    Name = "Test Atmosphere",
    Default = false,
    Callback = function(enabled)
        Lighting.Brightness = enabled and 3 or 2
        Lighting.ClockTime = enabled and 18 or 14
    end,
})

GameTest:AddSlider({
    Name = "Brightness",
    Min = 0,
    Max = 5,
    Default = Lighting.Brightness,
    Rounding = 1,
    Callback = function(value)
        Lighting.Brightness = value
    end,
})

GameTest:AddButton({
    Name = "Reset Lighting",
    Callback = function()
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
    end,
})

-- MOBILE / OUTSIDE BUTTON TEST
-- This creates a movable button outside the main GUI.
local OutsideButton = Window:CreateMobileMinimizer({
    Image = "rbxassetid://126031329785796",
    Size = UDim2.fromOffset(48, 48),
    Position = UDim2.fromScale(0.17, 0.28),
    BackgroundColor3 = Color3.fromRGB(246, 248, 98),
})

OutsideButton.Name = "CATHUB_TestButton"

OutsideButton.Activated:Connect(function()
    pcall(function()
        Window:Minimize()
    end)
end)

print("CAT HUB GUI TEST loaded successfully.")
