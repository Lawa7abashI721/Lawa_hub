# 🌟 Lawa Hub 🌟
**Lawa Hub** is a powerful Roblox script packed with exciting features like Fly Mode, Speed Boost, and Jump Boost. Enhance your Roblox gameplay experience with ease!

---

## 🚀 Features
- **Fly Mode**: Soar through the map with smooth flying controls.
- **Speed Boost**: Move faster and outrun anyone.
- **Jump Boost**: Jump higher than ever before.
- **Easy GUI**: User-friendly buttons to toggle features.

---

## 📜 How to Use
1. Copy the code from the `lawa-hub.lua` file.
2. Open your Roblox executor (e.g., Synapse X, KRNL, Script-Ware).
3. Paste the script into the executor.
4. Execute the script and enjoy!

---

## ⚠️ Disclaimer
This script is for educational purposes. **Using exploits in Roblox can violate its Terms of Service.** Use responsibly and only in environments where you have permission.

---

## 💻 About
Created by **Lawen**. Lawa Hub is designed to offer a fun, customizable experience for Roblox players.

---

## 📷 Preview
(Insert screenshots or GIFs of the script running in-game, if possible.)
-- Lawa Hub by Lawen
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

-- UI Creation
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 200, 0, 300)
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
MainFrame.BorderSizePixel = 0

local Title = Instance.new("TextLabel", MainFrame)
Title.Text = "Lawa Hub"
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundColor3 = Color3.new(1, 0, 0)
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextScaled = true

-- Fly Functionality
local flying = false
local flySpeed = 50
local function toggleFly()
    flying = not flying
    if flying then
        local BodyVelocity = Instance.new("BodyVelocity")
        BodyVelocity.MaxForce = Vector3.new(1e5, 1e5, 1e5)
        BodyVelocity.Velocity = Vector3.zero
        BodyVelocity.Parent = Character.HumanoidRootPart
        
        local connection
        connection = UserInputService.InputBegan:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.W then
                BodyVelocity.Velocity = Character.HumanoidRootPart.CFrame.LookVector * flySpeed
            elseif input.KeyCode == Enum.KeyCode.S then
                BodyVelocity.Velocity = -Character.HumanoidRootPart.CFrame.LookVector * flySpeed
            elseif input.KeyCode == Enum.KeyCode.Space then
                BodyVelocity.Velocity = Vector3.new(0, flySpeed, 0)
            end
        end)

        UserInputService.InputEnded:Connect(function(input)
            if flying and connection then
                connection:Disconnect()
                BodyVelocity:Destroy()
            end
        end)
    else
        Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
    end
end

-- Speed Functionality
local speedBoost = 50
local originalWalkSpeed = Humanoid.WalkSpeed
local function toggleSpeed()
    Humanoid.WalkSpeed = (Humanoid.WalkSpeed == originalWalkSpeed) and speedBoost or originalWalkSpeed
end

-- Jump Functionality
local jumpPowerBoost = 100
local originalJumpPower = Humanoid.JumpPower
local function toggleJump()
    Humanoid.JumpPower = (Humanoid.JumpPower == originalJumpPower) and jumpPowerBoost or originalJumpPower
end

-- UI Buttons
local buttons = {
    {Text = "Toggle Fly", Callback = toggleFly},
    {Text = "Toggle Speed", Callback = toggleSpeed},
    {Text = "Toggle Jump", Callback = toggleJump}
}

for i, button in ipairs(buttons) do
    local Btn = Instance.new("TextButton", MainFrame)
    Btn.Text = button.Text
    Btn.Size = UDim2.new(1, 0, 0, 50)
    Btn.Position = UDim2.new(0, 0, 0, 50 * i)
    Btn.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    Btn.TextColor3 = Color3.new(1, 1, 1)
    Btn.TextScaled = true
    Btn.MouseButton1Click:Connect(button.Callback)
end

-- Finish
print("Lawa Hub loaded successfully!")