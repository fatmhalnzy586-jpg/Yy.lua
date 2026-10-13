--==================================================--
--     BlockSpin Hermanos Rival Fishing Farm Pro     --
--               Created by: dev night              --
--==================================================--

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleBar = Instance.new("Frame")
local TitleText = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local ToggleButton = Instance.new("TextButton")

ScreenGui.Name = "DevNightHermanosProUI"
ScreenGui.Parent = game:GetService("CoreGui") or game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- زر إظهار / إخفاء السكربت (زر جانبي)
ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
ToggleButton.BorderColor3 = Color3.fromRGB(138, 43, 226)
ToggleButton.BorderSizePixel = 2
ToggleButton.Position = UDim2.new(0, 10, 0.4, 0)
ToggleButton.Size = UDim2.new(0, 120, 0, 42)
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.Text = "🎣 dev night Hub"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 16

-- النافذة الرئيسية (تحريك بالسحب)
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
MainFrame.BorderColor3 = Color3.fromRGB(138, 43, 226)
MainFrame.BorderSizePixel = 2
MainFrame.Position = UDim2.new(0.25, 0, 0.15, 0)
MainFrame.Size = UDim2.new(0, 380, 0, 520)
MainFrame.Active = true
MainFrame.Draggable = true

TitleBar.Name = "TitleBar"
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
TitleBar.BorderSizePixel = 0
TitleBar.Size = UDim2.new(1, 0, 0, 40)

TitleText.Name = "TitleText"
TitleText.Parent = TitleBar
TitleText.BackgroundTransparency = 1
TitleText.Position = UDim2.new(0, 12, 0, 0)
TitleText.Size = UDim2.new(0.8, 0, 1, 0)
TitleText.Font = Enum.Font.SourceSansBold
TitleText.Text = "BlockSpin | Hermanos Rival (dev night)"
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.TextSize = 16
TitleText.TextXAlignment = Enum.TextXAlignment.Left

CloseButton.Name = "CloseButton"
CloseButton.Parent = TitleBar
CloseButton.BackgroundColor3 = Color3.fromRGB(220, 40, 40)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(1, -35, 0, 5)
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 18

CloseButton.MouseButton1Click:Connect(function() MainFrame.Visible = false end)
ToggleButton.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)

-- ==================== 📊 عدادات البنك والكاش والفارم ====================
local StatsFrame = Instance.new("Frame")
StatsFrame.Parent = MainFrame
StatsFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 36)
StatsFrame.BorderSizePixel = 1
StatsFrame.BorderColor3 = Color3.fromRGB(60, 60, 85)
StatsFrame.Position = UDim2.new(0, 15, 0, 50)
StatsFrame.Size = UDim2.new(0, 350, 0, 130)

local function CreateStatLabel(text, pos)
    local lbl = Instance.new("TextLabel")
    lbl.Parent = StatsFrame
    lbl.BackgroundTransparency = 1
    lbl.Position = pos
    lbl.Size = UDim2.new(1, -20, 0, 25)
    lbl.Font = Enum.Font.SourceSansBold
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(0, 255, 160)
    lbl.TextSize = 15
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return lbl
end

local CashLabel = CreateStatLabel("💵 الكاش معـك: $0", UDim2.new(0, 10, 0, 5))
local BankLabel = CreateStatLabel("🏦 الرصيد بالبنك: $0", UDim2.new(0, 10, 0, 35))
local FishCounter = CreateStatLabel("🐟 أسماك تم صيدها: 0", UDim2.new(0, 10, 0, 65))
local TimeCounter = CreateStatLabel("⏱️ وقت الفارم: 00:00:00", UDim2.new(0, 10, 0, 95))

-- ==================== ⚙️ أزرار الإعدادات ====================
local Scroll = Instance.new("ScrollingFrame")
Scroll.Parent = MainFrame
Scroll.BackgroundTransparency = 1
Scroll.Position = UDim2.new(0, 15, 0, 190)
Scroll.Size = UDim2.new(0, 350, 0, 280)
Scroll.CanvasSize = UDim2.new(0, 0, 0, 550)
Scroll.ScrollBarThickness = 6

local layout = Instance.new("UIListLayout")
layout.Parent = Scroll
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Padding = UDim.new(0, 8)

local function CreateToggle(text, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = Scroll
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 58)
    btn.BorderColor3 = Color3.fromRGB(80, 80, 120)
    btn.BorderSizePixel = 1
    btn.Size = UDim2.new(1, -10, 0, 38)
    btn.Font = Enum.Font.SourceSansBold
    btn.Text = text .. " [ ❌ معطل ]"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 15

    local enabled = false
    btn.MouseButton1Click:Connect(function()
        enabled = not enabled
        if enabled then
            btn.Text = text .. " [ ✅ مفعل ]"
            btn.BackgroundColor3 = Color3.fromRGB(35, 130, 65)
        else
            btn.Text = text .. " [ ❌ معطل ]"
            btn.BackgroundColor3 = Color3.fromRGB(40, 40, 58)
        end
        callback(enabled)
    end)
    return btn
end

-- المتغيرات
local AutoFish = false
local UndergroundFishing = false
local CarControl = false
local GodMode = false
local AutoRespawn = false
local FishCaughtCount = 0
local StartTime = os.time()

-- خيارات السكربت
CreateToggle("تفعيل Auto Fish (صيد تلقائي)", function(v) AutoFish = v end)
CreateToggle("صيد تحت الأرض / آمن (Underground Fishing)", function(v) UndergroundFishing = v end)
CreateToggle("الصيد والتحكم عبر السيارة (Car Fishing)", function(v) CarControl = v end)
CreateToggle("مضاد الموت (Godmode)", function(v) GodMode = v end)
CreateToggle("رسبونة تلقائية عند الموت (Auto Respawn)", function(v) AutoRespawn = v end)

-- حقل تغيير الاسم
local NameBox = Instance.new("TextBox")
NameBox.Parent = Scroll
NameBox.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
NameBox.BorderColor3 = Color3.fromRGB(138, 43, 226)
NameBox.Size = UDim2.new(1, -10, 0, 38)
NameBox.Font = Enum.Font.SourceSansBold
NameBox.PlaceholderText = "اكتب الاسم المزور هنا (Fake Name)..."
NameBox.Text = "dev night"
NameBox.TextColor3 = Color3.fromRGB(255, 255, 255)
NameBox.TextSize = 15

NameBox.FocusLost:Connect(function(enter)
    if enter then
        pcall(function()
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid.DisplayName = NameBox.Text
            end
        end)
    end
end)

-- الحقوق
local DevLabel = Instance.new("TextLabel")
DevLabel.Parent = MainFrame
DevLabel.BackgroundTransparency = 1
DevLabel.Position = UDim2.new(0, 15, 0, 480)
DevLabel.Size = UDim2.new(0, 350, 0, 30)
DevLabel.Font = Enum.Font.SourceSansItalic
DevLabel.Text = "Developed by: dev night 👑"
DevLabel.TextColor3 = Color3.fromRGB(160, 160, 210)
DevLabel.TextSize = 15

-- ==================== 🔄 النظام البرمجي المتطور ====================

-- تحديث الوقت والبنك والكاش
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            local p = game.Players.LocalPlayer
            local elapsed = os.time() - StartTime
            local hrs = math.floor(elapsed / 3600)
            local mins = math.floor((elapsed % 3600) / 60)
            local secs = elapsed % 60
            TimeCounter.Text = string.format("⏱️ وقت الفارم: %02d:%02d:%02d", hrs, mins, secs)

            -- قراءة الكاش والبنك
            local leaderstats = p:FindFirstChild("leaderstats")
            if leaderstats then
                local cash = leaderstats:FindFirstChild("Cash") or leaderstats:FindFirstChild("Money") or leaderstats:FindFirstChild("كاش")
                local bank = leaderstats:FindFirstChild("Bank") or leaderstats:FindFirstChild("بنك")
                if cash then CashLabel.Text = "💵 الكاش معـك: $" .. tostring(cash.Value) end
                if bank then BankLabel.Text = "🏦 الرصيد بالبنك: $" .. tostring(bank.Value) end
            end
        end)
    end
end)

-- حماية الموت والرسبونة
game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
    if AutoRespawn then
        task.wait(1)
        char:WaitForChild("Humanoid")
    end
end)

-- حلقة الفارم والخيارات المتقدمة
task.spawn(function()
    while task.wait(0.3) do
        pcall(function()
            local player = game.Players.LocalPlayer
            local char = player.Character
            if not char then return end
            local hrp = char:FindFirstChild("HumanoidRootPart")
            local hum = char:FindFirstChild("Humanoid")

            -- Godmode
            if GodMode and hum then
                hum.MaxHealth = math.huge
                hum.Health = math.huge
            end

            -- الصيد تحت الأرض
            if UndergroundFishing and hrp then
                hrp.CFrame = hrp.CFrame * CFrame.new(0, -12, 0)
            end

            -- Auto Fish
            if AutoFish then
                local tool = char:FindFirstChildOfClass("Tool")
                if not tool then
                    for _, item in pairs(player.Backpack:GetChildren()) do
                        if item:IsA("Tool") and (item.Name:lower():find("fish") or item.Name:lower():find("rod") or item.Name:lower():find("صيد")) then
                            item.Parent = char
                            tool = item
                            break
                        end
                    end
                end

                if tool then
                    tool:Activate()
                    FishCaughtCount = FishCaughtCount + 1
                    FishCounter.Text = "🐟 أسماك تم صيدها: " .. tostring(FishCaughtCount)
                end
            end
        end)
    end
end)

print("BlockSpin Hermanos Rival Fishing Farm Loaded | dev night")

