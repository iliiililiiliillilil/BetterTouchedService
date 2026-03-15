local Players = game:GetService("Players");

local BetterTouchedService = {};

function BetterTouchedService.playerTouched(obj: BasePart, callback)
	while true do
		task.wait(0.1);
		for _, player in Players:GetPlayers() do
			local character = player.Character or player.CharacterAdded:Wait();
			local characterHumanoidRootPart = character:FindFirstChild("HumanoidRootPart");
			
			local closestPoint = obj:GetClosestPointOnSurface(characterHumanoidRootPart.Position);
			local distance = (closestPoint - characterHumanoidRootPart.Position).Magnitude;

			if distance <= 4  then
				callback(player, obj);
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
			
			local closestPoint = obj:GetClosestPointOnSurface(characterHumanoidRootPart.Position);
			local distance = (closestPoint - characterHumanoidRootPart.Position).Magnitude;

			if distance <= 4 then
				callback(player, obj);
				IsCompleted = true;
			end
		end

		if IsCompleted then
			break;
		end
	end
end

return BetterTouchedService;
