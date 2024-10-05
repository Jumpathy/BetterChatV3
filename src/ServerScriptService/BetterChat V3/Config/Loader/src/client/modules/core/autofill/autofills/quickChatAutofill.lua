-- Author: @Jumpathy
-- Name: quickChatAutofill.lua
-- Description: Quick chat autofill system

return function(config)
	local players = game:GetService("Players")
	local localPlayer = players.LocalPlayer

	local autofill = {}
	autofill.beginsWith = "/"
	autofill.endsWith = " "
	autofill.security = "internal"

	autofill.onCapture = function(matches,environment)
		local fill,gsub,callback,placeAt = {},{},nil,nil
		for _,match in pairs(matches) do
			local text = match["text"]
			if text and text ~= "" and tonumber(text) then
				local number = tonumber(text)
				if(environment.config.Messages.QuickChat and number <= 20) then
					if(match.hasClosing or #text == 2) then
						local slot = environment:getQuickChatSlot(tonumber(text))
						gsub["/" .. text] = slot
						placeAt = 9999
					else
						for i = 1,20 do
							if(tostring(i):sub(1,#tostring(text)) == tostring(text)) then
								local slot = environment:getQuickChatSlot(i)
								if slot and slot ~= "" then
									table.insert(fill,{
										text = "/" .. tostring(i),
										autofillBar = match.before .. "/" .. tostring(number),
										gsub = {
											"/" .. text,
											slot
										}
									})
								end
							end
						end
						if(#fill == 1) then
							gsub["/" .. text] = fill[1]["gsub"][2]
							fill = {}
							placeAt = 9999
						end
					end
				end
			end
		end
		return gsub,fill,callback,placeAt
	end

	return autofill
end