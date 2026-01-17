local ReplicatedStorage = game:GetService("ReplicatedStorage")
local BuffEvent = ReplicatedStorage:WaitForChild("BuffEvent")

local BUFF_DURATION = 6
local SPEED_VALUE = 32

BuffEvent.OnServerEvent:Connect(function(player, buffType)
	if buffType == "SpeedBuff" then
		local char = player.Character
		if not char then return end
		local hum = char:FindFirstChildOfClass("Humanoid")
		if not hum then return end

		local oldSpeed = hum.WalkSpeed
		hum.WalkSpeed = SPEED_VALUE

		task.delay(BUFF_DURATION, function()
			if hum then
				hum.WalkSpeed = oldSpeed
			end
		end)
	end
end)
