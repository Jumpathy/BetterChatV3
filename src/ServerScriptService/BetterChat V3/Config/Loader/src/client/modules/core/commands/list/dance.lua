-- Author: @Jumpathy
-- Name: dance.lua
-- Description: Emote support

local command = {}
command.name = "e"
command.aliases = {"emote"}
command.security = "internal"

command.call = function(message,environment)
	local defaultEmotes = {
		wave = true,point = true,dance = true,
		dance2 = true,dance3 = true,laugh = true,
		cheer = true
	}

	local function getEmoteName()
		if(string.sub(message,1,3) == "/e ") then
			return message:sub(4,#message)
		elseif(string.sub(message,1,7) == "/emote ") then
			return message:sub(8,#message)
		end
		return nil
	end

	local systemMessage = function(localizationKey)
		environment:sendSystemMessage(environment.localization:localize(localizationKey))
	end

	local emoteName = getEmoteName()
	if(defaultEmotes[emoteName]) then
		return
	end

	local character = game:GetService("Players").LocalPlayer.Character
	if(not character) then
		systemMessage("InGame.Chat.Response.EmotesTemporarilyUnavailable")
		return
	end

	local animateScript = character:FindFirstChild("Animate")
	if(not animateScript) then
		systemMessage("InGame.Chat.Response.EmotesNotSupported")
		return
	end

	local playEmoteBindable = animateScript:FindFirstChild("PlayEmote")
	if(not playEmoteBindable) then
		systemMessage("InGame.Chat.Response.EmotesNotSupported")
		return
	end

	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if(not humanoid) then
		systemMessage("InGame.Chat.Response.EmotesTemporarilyUnavailable")
		return
	end

	if(humanoid.RigType ~= Enum.HumanoidRigType.R15) then
		systemMessage("InGame.Chat.Response.EmotesWrongAvatarType")
		return
	end

	local humanoidDescription = humanoid:FindFirstChildOfClass("HumanoidDescription")
	if(not humanoidDescription) then
		systemMessage("InGame.Chat.Response.EmotesNotSupported")
		return true
	end

	local index = {}
	for name,value in pairs(humanoidDescription:GetEmotes()) do
		index[string.lower(name)] = name
	end

	local slot = tonumber(emoteName)
	if(slot) then
		for _,information in pairs(humanoidDescription:GetEquippedEmotes()) do
			if(information.Slot == slot) then
				emoteName = information.Name
			end
		end
	end

	emoteName = index[emoteName:lower()]
	if(not emoteName) then
		systemMessage("InGame.Chat.Response.EmoteNotAvailable")
		return
	end

	coroutine.wrap(function()
		local ok,didPlay = pcall(function() 
			return humanoid:PlayEmote(emoteName)
		end)
		if(not ok) then
			systemMessage("InGame.Chat.Response.EmotesNotSupported")
		elseif(not didPlay) then
			systemMessage("InGame.Chat.Response.EmotesTemporarilyUnavailable")
		end
	end)()
end

return command