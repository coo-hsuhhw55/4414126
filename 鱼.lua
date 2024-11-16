local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")


local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RealisticHackGui"
screenGui.IgnoreGuiInset = true 
screenGui.Parent = playerGui


local backgroundFrame = Instance.new("Frame")
backgroundFrame.Size = UDim2.new(1, 0, 1, 0)
backgroundFrame.BackgroundColor3 = Color3.new(0, 0, 0)
backgroundFrame.BackgroundTransparency = 1
backgroundFrame.Parent = screenGui


local flashFrame = Instance.new("Frame")
flashFrame.Size = UDim2.new(1, 0, 1, 0)
flashFrame.BackgroundColor3 = Color3.new(1, 0, 0)
flashFrame.BackgroundTransparency = 1
flashFrame.Parent = backgroundFrame


local scanLine = Instance.new("Frame")
scanLine.Size = UDim2.new(1, 0, 0.02, 0)
scanLine.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
scanLine.BackgroundTransparency = 0.5
scanLine.Position = UDim2.new(0, 0, 0, 0)
scanLine.Parent = backgroundFrame


local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = ""
textLabel.Font = Enum.Font.Code
textLabel.TextColor3 = Color3.new(0, 1, 0)
textLabel.TextScaled = true
textLabel.TextXAlignment = Enum.TextXAlignment.Left
textLabel.TextYAlignment = Enum.TextYAlignment.Top
textLabel.Parent = backgroundFrame


local alarmSound = Instance.new("Sound")
alarmSound.SoundId = "rbxassetid://9113085665" 
alarmSound.Looped = true
alarmSound.Volume = 2
alarmSound.Parent = screenGui


local typingSound = Instance.new("Sound")
typingSound.SoundId = "rbxassetid://178675387" 
typingSound.Looped = false
typingSound.Volume = 0.5
typingSound.Parent = screenGui


local function flashRed()
    for i = 1, 5 do
        flashFrame.BackgroundTransparency = 0.5
        wait(0.1)
        flashFrame.BackgroundTransparency = 1
        wait(0.1)
    end
end


local function moveScanLine()
    while screenGui.Parent do
        scanLine.Position = UDim2.new(0, 0, 0, 0)
        for i = 0, 1, 0.01 do
            scanLine.Position = UDim2.new(0, 0, i, 0)
            wait(0.02)
        end
    end
end


local function typeText(label, text, delay)
    for i = 1, #text do
        label.Text = string.sub(text, 1, i)
        typingSound:Play() 
        wait(delay)
    end
end


local function tweenTransparency(instance, targetTransparency, duration)
    game:GetService("TweenService"):Create(
        instance,
        TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundTransparency = targetTransparency}
    ):Play()
end


tweenTransparency(backgroundFrame, 0, 2) 
alarmSound:Play() 
task.spawn(moveScanLine) 
wait(2)

typeText(textLabel, "ACCESSING SYSTEM FILES...\nPLEASE WAIT...\n", 0.05)
flashRed()
wait(2)

typeText(textLabel, "\nSYSTEM BREACH DETECTED.\nOVERRIDING SECURITY PROTOCOLS...", 0.05)
flashRed()
wait(3)

typeText(textLabel, "\n\nINITIATING DATA WIPE...\nDELETING FILES: █████████████████", 0.05)
wait(2)

typeText(textLabel, "\n\nERROR: FILE SYSTEM CORRUPTED.\nATTEMPTING RECOVERY...", 0.05)
flashRed()
wait(2)


textLabel.TextColor3 = Color3.new(1, 1, 1)
typeText(textLabel, "\n\n\Дан руу хар, энэ бол зүгээр л Spoof off бол энэ бол түүнийг орчуулдаг, би үүнийг сэргээнэ!", 0.05)
wait(3)


tweenTransparency(backgroundFrame, 1, 2)
wait(2)
screenGui:Destroy()


alarmSound:Stop()
