local marketplaceService = game:GetService("MarketplaceService")

return function(api)
	local is_supporter = function(player)
		-- implement supporter logic here (return true)
		-- example: (for gamepass 12345678)
		return marketplaceService:UserOwnsGamePassAsync(player.UserId,12345678)
	end
	
	local supporter_emojis = {
		["supporter_emoji_name_here"] = "rbxassetid://10525641606"
	}
	
	api.onCustomEmojiListRequest:Connect(function(emojis,user)
		if is_supporter(user) then
			for emojiName,emojiImage in pairs(supporter_emojis) do
				emojis[emojiName] = emojiImage
			end
		end
	end)
end