
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

-- 原神风 UI 主框架
local ScreenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
ScreenGui.Name = "GenshinCheatHub"
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 520, 0, 340)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -170)
MainFrame.BackgroundColor3 = Color3.fromRGB(240, 230, 210)
MainFrame.BorderSizePixel = 0
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Active = true
MainFrame.Draggable = true

local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 16)

local TopBar = Instance.new("TextLabel", MainFrame)
TopBar.Size = UDim2.new(1, 0, 0, 36)
TopBar.BackgroundColor3 = Color3.fromRGB(200, 180, 160)
TopBar.Text = "原神风秒赢外挂 Hub"
TopBar.TextColor3 = Color3.fromRGB(50, 30, 10)
TopBar.Font = Enum.Font.SourceSansBold
TopBar.TextSize = 20
TopBar.BorderSizePixel = 0

local HideButton = Instance.new("TextButton", TopBar)
HideButton.Size = UDim2.new(0, 36, 0, 36)
HideButton.Position = UDim2.new(1, -36, 0, 0)
HideButton.Text = "-"
HideButton.Font = Enum.Font.SourceSansBold
HideButton.TextSize = 24
HideButton.TextColor3 = Color3.fromRGB(80, 60, 40)
HideButton.BackgroundTransparency = 1

HideButton.MouseButton1Click:Connect(function()
	MainFrame.Visible = false
end)

local ShowButton = Instance.new("TextButton", ScreenGui)
ShowButton.Size = UDim2.new(0, 80, 0, 30)
ShowButton.Position = UDim2.new(0, 20, 0.5, -15)
ShowButton.Text = "外挂"
ShowButton.Font = Enum.Font.SourceSansBold
ShowButton.TextSize = 20
ShowButton.BackgroundColor3 = Color3.fromRGB(200, 180, 160)
ShowButton.TextColor3 = Color3.fromRGB(50, 30, 10)
local ShowUICorner = Instance.new("UICorner", ShowButton)
ShowUICorner.CornerRadius = UDim.new(0, 12)

ShowButton.MouseButton1Click:Connect(function()
	MainFrame.Visible = true
end)

local TabFrame = Instance.new("Frame", MainFrame)
TabFrame.Size = UDim2.new(0, 120, 1, -36)
TabFrame.Position = UDim2.new(0, 0, 0, 36)
TabFrame.BackgroundColor3 = Color3.fromRGB(220, 210, 190)
local TabLayout = Instance.new("UIListLayout", TabFrame)
TabLayout.Padding = UDim.new(0, 6)
TabLayout.SortOrder = Enum.SortOrder.LayoutOrder

local ContentFrame = Instance.new("Frame", MainFrame)
ContentFrame.Size = UDim2.new(1, -120, 1, -36)
ContentFrame.Position = UDim2.new(0, 120, 0, 36)
ContentFrame.BackgroundColor3 = Color3.fromRGB(250, 240, 225)

local function createTab(name)
	local button = Instance.new("TextButton", TabFrame)
	button.Size = UDim2.new(1, -12, 0, 36)
	button.BackgroundColor3 = Color3.fromRGB(240, 220, 200)
	button.Text = name
	button.Font = Enum.Font.SourceSansBold
	button.TextSize = 18
	button.TextColor3 = Color3.fromRGB(60, 40, 20)
	local corner = Instance.new("UICorner", button)
	corner.CornerRadius = UDim.new(0, 8)
	return button
end

local function createButton(text, parent, callback)
	local btn = Instance.new("TextButton", parent)
	btn.Size = UDim2.new(0, 200, 0, 40)
	btn.Text = text
	btn.Font = Enum.Font.SourceSansBold
	btn.TextSize = 18
	btn.BackgroundColor3 = Color3.fromRGB(255, 245, 230)
	btn.TextColor3 = Color3.fromRGB(60, 40, 20)
	local corner = Instance.new("UICorner", btn)
	corner.CornerRadius = UDim.new(0, 8)
	btn.MouseButton1Click:Connect(callback)
	return btn
end

local pages = {}
local function showPage(page)
	for _, p in pairs(pages) do p.Visible = false end
	page.Visible = true
end

-- Obby 页面
local ObbyPage = Instance.new("Frame", ContentFrame)
ObbyPage.Size = UDim2.new(1,0,1,0)
ObbyPage.BackgroundTransparency = 1
pages[#pages+1] = ObbyPage

createTab("Obby").MouseButton1Click:Connect(function()
	showPage(ObbyPage)
end)

createButton("自动传送终点", ObbyPage, function()
	local obbyWin = ReplicatedStorage:FindFirstChild("WinObby")
	if obbyWin then obbyWin:FireServer() end
end)

-- Jump Rope 页面
local JumpPage = Instance.new("Frame", ContentFrame)
JumpPage.Size = UDim2.new(1,0,1,0)
JumpPage.BackgroundTransparency = 1
pages[#pages+1] = JumpPage

createTab("Jump Rope").MouseButton1Click:Connect(function()
	showPage(JumpPage)
end)

createButton("直接跳过所有绳", JumpPage, function()
	local evt = ReplicatedStorage:FindFirstChild("WinJump")
	if evt then evt:FireServer() end
end)

-- Rush Tic Tac Toe 页面
local RushTTTPage = Instance.new("Frame", ContentFrame)
RushTTTPage.Size = UDim2.new(1,0,1,0)
RushTTTPage.BackgroundTransparency = 1
pages[#pages+1] = RushTTTPage

createTab("Rush TTT").MouseButton1Click:Connect(function()
	showPage(RushTTTPage)
end)

createButton("Rush TTT 秒赢", RushTTTPage, function()
	local evt = ReplicatedStorage:FindFirstChild("WinRushTTTEvent")
	if evt then evt:FireServer() end
end)

-- Tic Tac Toe 页面
local TTTPage = Instance.new("Frame", ContentFrame)
TTTPage.Size = UDim2.new(1,0,1,0)
TTTPage.BackgroundTransparency = 1
pages[#pages+1] = TTTPage

createTab("Tic Tac Toe").MouseButton1Click:Connect(function()
	showPage(TTTPage)
end)

createButton("强制触发胜利", TTTPage, function()
	local evt = ReplicatedStorage:FindFirstChild("WinTicTacToe")
	if evt then evt:FireServer() end
end)

-- Hexa Fall 页面
local HexaPage = Instance.new("Frame", ContentFrame)
HexaPage.Size = UDim2.new(1,0,1,0)
HexaPage.BackgroundTransparency = 1
pages[#pages+1] = HexaPage

createTab("Hexa Fall").MouseButton1Click:Connect(function()
	showPage(HexaPage)
end)

createButton("直接触发 Hexa 胜利", HexaPage, function()
	local evt = ReplicatedStorage:FindFirstChild("WinHexa")
	if evt then evt:FireServer() end
end)

-- Align 页面
local AlignPage = Instance.new("Frame", ContentFrame)
AlignPage.Size = UDim2.new(1,0,1,0)
AlignPage.BackgroundTransparency = 1
pages[#pages+1] = AlignPage

createTab("Align").MouseButton1Click:Connect(function()
	showPage(AlignPage)
end)

createButton("对齐块自动完成", AlignPage, function()
	local evt = ReplicatedStorage:FindFirstChild("WinAlign")
	if evt then evt:FireServer() end
end)

-- The Price 页面
local PricePage = Instance.new("Frame", ContentFrame)
PricePage.Size = UDim2.new(1,0,1,0)
PricePage.BackgroundTransparency = 1
pages[#pages+1] = PricePage

createTab("The Price").MouseButton1Click:Connect(function()
	showPage(PricePage)
end)

createButton("自动猜对价格", PricePage, function()
	local evt = ReplicatedStorage:FindFirstChild("WinPrice")
	if evt then evt:FireServer() end
end)

-- Battleship 页面
local BattlePage = Instance.new("Frame", ContentFrame)
BattlePage.Size = UDim2.new(1,0,1,0)
BattlePage.BackgroundTransparency = 1
pages[#pages+1] = BattlePage

createTab("Battleship").MouseButton1Click:Connect(function()
	showPage(BattlePage)
end)

createButton("一键秒赢海战", BattlePage, function()
	local evt = ReplicatedStorage:FindFirstChild("WinBattleship")
	if evt then evt:FireServer() end
end)

-- Rock Paper Scissors 页面
local RPSPage = Instance.new("Frame", ContentFrame)
RPSPage.Size = UDim2.new(1,0,1,0)
RPSPage.BackgroundTransparency = 1
pages[#pages+1] = RPSPage

createTab("RPS").MouseButton1Click:Connect(function()
	showPage(RPSPage)
end)

createButton("剪刀石头布秒赢", RPSPage, function()
	local evt = ReplicatedStorage:FindFirstChild("WinRPS")
	if evt then evt:FireServer() end
end)

-- Plinko 页面
local PlinkoPage = Instance.new("Frame", ContentFrame)
PlinkoPage.Size = UDim2.new(1,0,1,0)
PlinkoPage.BackgroundTransparency = 1
pages[#pages+1] = PlinkoPage

createTab("Plinko").MouseButton1Click:Connect(function()
	showPage(PlinkoPage)
end)

createButton("Plinko 自动落中奖区", PlinkoPage, function()
	local evt = ReplicatedStorage:FindFirstChild("WinPlinko")
	if evt then evt:FireServer() end
end)

-- Balloon Pop 页面
local BalloonPage = Instance.new("Frame", ContentFrame)
BalloonPage.Size = UDim2.new(1,0,1,0)
BalloonPage.BackgroundTransparency = 1
pages[#pages+1] = BalloonPage

createTab("Balloon Pop").MouseButton1Click:Connect(function()
	showPage(BalloonPage)
end)

createButton("气球弹出全中", BalloonPage, function()
	local evt = ReplicatedStorage:FindFirstChild("WinBalloon")
	if evt then evt:FireServer() end
end)

-- Block Drop 页面
local DropPage = Instance.new("Frame", ContentFrame)
DropPage.Size = UDim2.new(1,0,1,0)
DropPage.BackgroundTransparency = 1
pages[#pages+1] = DropPage

createTab("Block Drop").MouseButton1Click:Connect(function()
	showPage(DropPage)
end)

createButton("方块掉落胜利", DropPage, function()
	local evt = ReplicatedStorage:FindFirstChild("WinDrop")
	if evt then evt:FireServer() end
end)

-- Chess 页面
local ChessPage = Instance.new("Frame", ContentFrame)
ChessPage.Size = UDim2.new(1,0,1,0)
ChessPage.BackgroundTransparency = 1
pages[#pages+1] = ChessPage

createTab("Chess").MouseButton1Click:Connect(function()
	showPage(ChessPage)
end)

createButton("一键胜利（象棋）", ChessPage, function()
	local evt = ReplicatedStorage:FindFirstChild("WinChess")
	if evt then evt:FireServer() end
end)

-- 默认显示 Obby 页面
showPage(ObbyPage)
