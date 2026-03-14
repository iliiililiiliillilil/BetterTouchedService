local Players = game:GetService("Players");

local BetterTouchedService = {};

function BetterTouchedService.playerTouched(obj: BasePart, callback)
	while true do
		task.wait(0.1);
		for _, player in Players:GetPlayers() do
			local character = player.Character or player.CharacterAdded:Wait();
			local characterHumanoidRootPart = character:FindFirstChild("HumanoidRootPart");

			local distance = (obj.Position - characterHumanoidRootPart.Position).Magnitude;

			if distance <= obj.Size.X then
				callback();
			end
		end
	end
end


function BetterTouchedService.playerTouchedOnce(obj: BasePart, callback)
	local IsCompleted = false;
	
	while true do
		task.wait(0.1);
		for _, player in Players:GetPlayers() do
			local character = player.Character or player.CharacterAdded:Wait();
			local characterHumanoidRootPart = character:FindFirstChild("HumanoidRootPart");

			local distance = (obj.Position - characterHumanoidRootPart.Position).Magnitude;

			if distance <= obj.Size.X then
				callback();
				IsCompleted = true;
			end
		end

		if IsCompleted then
			break;
		end
	end
end

return BetterTouchedService;
