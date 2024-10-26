--[[

  ___      _   _              ___ _         _         ____
 | _ ) ___| |_| |_ ___ _ _   / __| |_  __ _| |_  __ _|__ /
 | _ \/ -_)  _|  _/ -_) '_| | (__| ' \/ _` |  _| \ V /|_ \
 |___/\___|\__|\__\___|_|    \___|_||_\__,_|\__|  \_/|___/
 
Created by: @Jumpathy

Credits:
@Xsitsu - A few of the original chat functions such as user chat colors and chat cooldowns.
@qwreey74 - High quality material icons
@Blockzez - Hex color encode / decode functions
@boatbomber - Textbox+'s undo/redo system code concept
@boatbomber - Image masking for some user thumbnails
@ForeverHD - Topbar+
@Fm_Trick - Slider math help via public resource
@McThor2 - Math help for bubble chat
@sleitnick - Raycasting code for bubble chat
@alexinite - Contributing bug fixes and helping people in replies with their issues

]]

return {
	Permissions = {
		Ranks = { 
			--[[
				Ranks are like permissions for the chat, we can assign things 
				like editing message access to them if you don't want regular users
				to have those. They're not admin-commands, I've just named them in this
				manner to understand more effectively.
			--]]

			[1] = "Guest", --> Rank ID 1 will automatically be assigned to each user (the config below can determine their final permission level)
			[2] = "VIP",
			[3] = "Admin",
			[4] = "Owner" --> Automatically assigned to the group creator or game creator
		},
		Users = {
			[1] = "Admin", --> Roblox -> Admin rank
		},
		Groups = {
			[1200769] = { --> Roblox admins get the admin rank automatically
				[71] = "Admin"
			}
		},
		Gamepasses = {
			[0] = "VIP" --> Gamepass 0 --> VIP rank
		},
		RobloxPremium = "VIP"
	},
	ChatTags = {
		MaxAmountTags = 10, --> Maximum amount of tags one user can have
		Users = {
			["Roblox"] = { --> Assign Roblox a red 'Owner' tag
				{
					Text = "Owner",
					Color = Color3.fromRGB(255,0,0)
				}
			}
		},
		Ranks = {
			[4] = { --> Assign the owner of the game with the chat a yellow owner tag
				{	
					Text = "Owner",
					Color = Color3.fromRGB(255,255,0),
					Priority = 5 --> If you have a max amount of tags and one user goes over it, the tags with the lowest priority will be removed first.
				}
			}
		}
	},
	TextColors = {
		Ranks = {
			[4] = Color3.fromRGB(255,255,0) --> Assign the owner role a golden text color
		},
		Users = {
			["Roblox"] = Color3.fromRGB(255,0,0) --> Assign Roblox a red chat color
		}
	},
	NameColors = {
		Ranks = {
			[4] = Color3.fromRGB(255,255,0) --> Assign the owner of the game with a yellow name color
		},
		Users = {
			["Roblox"] = Color3.fromRGB(255,0,0) --> Assign Roblox a red username
		}
	},
	UI = {
		ChatSizes = {
			Phone = UDim2.new(0.5,0,0.5,24); --> Chat size on phone
			Tablet = UDim2.new(0.4,0,0.3,24); --> Chat size on tablet
			Desktop = UDim2.new(0.3,0,0.25,24); --> Chat size on desktop
		},
		Fonts = {
			TextFont = Enum.Font.GothamMedium --> Every text's font in the chat
		},
		Colors = {
			SystemPrefixColor = Color3.fromRGB(253,80,111) --> Color of the prefix used for [Team] / [From: user]
		},
		FadeOptions = {
			Window = {
				HoveringTransparency = 0.75, --> Transparency of main window when hovering
				NotHoveringTransparency = 1 --> When not hovering
			},
			Chatbar = { --> Transparency of chatbar, resize button, channel button
				HoveringTransparency = 0,
				NotHoveringTransparency = 1,
				TextColor = { --> Chatbar text color when hovering
					Regular = {
						Hovering = Color3.fromRGB(100,100,100),
						NotHovering = Color3.fromRGB(255,255,255)
					},
					Placeholder = {
						Hovering = Color3.fromRGB(80,80,80),
						NotHovering = Color3.fromRGB(200,200,200)
					}
				}
			}
		},
		ColorOptions = {
			ChatbarColor = Color3.fromRGB(255,255,255),
			Buttons = {
				ResizeButton = { --> UI resize button
					BackgroundColor = Color3.fromRGB(52,52,52),
					IconColor = Color3.fromRGB(255,255,255)
				},
				ChannelButton = { --> Channel bar channel buttons: (also autofill too lol)
					BackgroundColor = Color3.fromRGB(0,0,0),
					TextColor = Color3.fromRGB(255,255,255)
				},
				AutofillButton = { --> Autofill buttons
					BackgroundColor = Color3.fromRGB(30,30,30),
					TextColor = Color3.fromRGB(255,255,255)
				},
				ReplyAndChannel = { --> On the chatbar, when whispering or replying this icon shows up
					BackgroundColor = Color3.fromRGB(253,80,111), --> 253,80,111
					TextAndIconColor = Color3.fromRGB(255,255,255)
				}
			},
			Window = {
				BackgroundColor = Color3.fromRGB(0,0,0),
			}
		},
		ChatWindowVisible = true, --> Is it just the chatbar visible?
		ChannelBarEnabled = true, --> Channel navigation bar at the top of the chat
		SeparateChatbarFromMenu = true, --> Do separate the chat bar from the main UI?
		Resizable = true, --> Can the user resize their chat?
		Rounding = 8, --> UI roundness in px
		BaseTextSize = 16, --> Base text size for the UI
		CornerPosition = "TopLeft" --> Chat corner position (BottomRight, TopLeft, TopRight, BottomLeft)
	},
	User = {
		ChangeDisplayNameColorWhenAttributeChanged = true, --> If you change their DisplayName at run time, will it also automatically update their name color?
		NameColors = { --> Default name colors
			Color3.fromRGB(253,41,67), --> Red
			Color3.fromRGB(1,162,255), --> Blue
			Color3.fromRGB(1,236,111), --> Green
			Color3.fromRGB(174,81,202), --> Purple
			Color3.fromRGB(255,154,76), --> Orange
			Color3.fromRGB(255,211,50), --> Yellow
			Color3.fromRGB(255,205,221), --> Pink
			Color3.fromRGB(255,234,183) --> Beige
		},
		SaveData = { --> Data saving for the options menu (uses ProfileService internally)
			Enabled = true, --> Enable data-saving for these? (Better user-experience if enabled)
			Advanced = { --> Recommend not changing if you don't know what you're doing.
				DatastoreName = "BetterChatV3Data", --> Changing this can reset any existing user data for the chat until you change it back
				HandleOwnData = false --[[
				Create a server addon and register these functions 
					:registerGetProfileFunction(<function:callback>) <plr> (return a table that will save data that's updated in it)
					:registerUnloadProfileFunction(<function:callback>) <plr>
				--]]
			}
		}
	},
	DisplayNames = {
		Enabled = true, --> Are player display names enabled (attribute for the player still works but it's not set initially)
	},
	Teams = {
		TeamColorPriority = true, --> Does team color override their natural chat color?
		TeamChat = true, --> Team chat?
	},
	Notifiers = {
		FriendJoinNotifier = true, --> Notify the user when their friend joins the game?
		TeamChangeNotifier = true, --> Notify the user when their team is changed?
		BlockedUserNotifier = true, --> Place a system message in the chat when a user is blocked?
	},
	Messages = {
		BlacklistEnabled = false, --> Do you want to enact a custom word blacklist?
		BlacklistCanUseDatastores = true, --> Enabling this allows API methods such as :blacklistWord(word <string>,state <bool>) which will save in live time
		BlacklistedWords = {}, --> Will be filtered automatically
		FilterProcessingCharacter = "_", --> What messages are replaced with before being properly filtered and distributed (whilst pending)
		IncludeIcon = true,	--> Display a player thumbnail next to their username in the chat
		UseViewportForIcon = false, --> Use a viewport frame for this? (Helpful for Roleplay games where your avatar isn't the same as it normally would be)
		MaximumLength = 200, --> Maximum allowed message length (> 1000 would probably just brick the chat)
		DisallowedWhitespace = {"\n","\r","\t","\v","\f"}, --> Filter these characters out of the messages to prevent breaking the chat
		ChannelMessageLimit = 100, --> Max amount of messages displayed in a channel at one time
		QuickChat = true, --> Quick chat system enabled?
		Cooldown = { --> This is the chat's antispam system.
			ExpireTimePeriod = 15, --> Maximum message cooldown length
			NumberMessageAllowed = 7 --> Maximum messages allowed in a pre-defined time period
		},
		Private = {
			WhispersEnabled = true --> Private messaging between users
		},
		Extra = {
			DeleteableMessages = "Guest", --> Permission needed to delete messages
			Editable = "Guest", --> Permission needed to edit messages by right clicking / clicking the text (leaves an '(edited)' stamp)
			MarkdownEnabled = "Guest", --> Permission needed to use markdown format, eg: **bold**
			ReplyEnabled = "Guest", --> Permission needed to reply to a message
			MentionEnabled = "Guest", --> Permission needed to mention another user in the chat
			MeCommand = "Guest" --> Permission needed to use the /me command
		},
		Markdown = {
			ItalicBold = true,
			Bold = true,
			Italics = true,
			Underlines = true,
			Strikethrough = true,
			Colored = true,
			Outlines = true,
			Fonts = false
		},
		MessageGrouping = {
			Enabled = true, --> Merge messages when sent by the same user back to back?
			GroupTimeout = 120 --> When do they split back up again?
		},
		CustomEmojis = {
			Enabled = true, --> Enable custom emojis?
			PermissionLocked = false, --> Set to a rank such as "Owner" to enable custom emojis for specific users only
			ScaleType = Enum.ScaleType.Fit, --> Scale type for custom emoji images
			List = { --> Allowed formats: "id" or {"id","permission to lock it to"}
				["ban_hammer"] = {"rbxassetid://4813866018","Owner"},
				["troll"] = "rbxassetid://15828456252",
				["vibe_cat"] = { --> Vibe cat
					["Image"] = "rbxassetid://18495257138",
					["ImageRectSize"] = Vector2.new(68.2,68.2), --> Image dimensions / columns and rows
					["Columns"] = 5,
					["Rows"] = 15,
					["Frames"] = 71,
					["FPS"] = 15 --> Above this gets a little too fast to comprehend logically
				}
			}
		},
		RemoveFormattingForChattedEvent = true
	},
	BubbleChat = {
		Enabled = true, --> Custom bubble chat enabled state (setting to false will default to the regular bubble chat which can be turned off in the properties of game.Chat)
		Config = {
			TypingIndicator = true, --> Some dots to indicate you're typing
			EasingStyle = Enum.EasingStyle.Bounce, --> The chat bubble's tween style
			Length = 0.16, --> The length per tween in the UI
			MaxMessages = 4, --> The max amount of bubble chat messages above one user's head at once
			FadeoutTime = 10, --> Message fading time
			TextSize = 16, --> This is the chat bubble's text size.
			Padding = 8, --> Padding in offset on each side of the message.
			BubbleFont = Enum.Font.GothamMedium, --> The chat bubble's primary font.
			TypingIndicatorColor = Color3.fromRGB(255,255,255), --> Player typing indicator color.
			BubbleBackgroundColor = Color3.fromRGB(20,20,20), --> The chat bubble's background color.
			BubbleTextColor = Color3.fromRGB(255,255,255), --> The chat bubble's text color.
			Roundness = 8, --> The chat bubble's roundness in pixels
			MaxDistance = 40, --> How far away the bubble chat can be seen from?
			Offsets = { --> How high above the player's head the billboard UI for the chat bubble is 
				OtherPlayers = Vector3.new(0,10.5,0.1),
				LocalPlayer = Vector3.new(0,9.5,2)
			},
		}
	},
	SettingsMenu = { --> Settings for the chat's interface
		Enabled = true, --> Do you want it to be enabled?
		ApiEnabledAndUIDisabled = false, --> Do you want to just enable the settings API for the client & disable the UI so you can design your own?
		TopbarButton = {
			Enabled = true, --> If it's enabled, do you want a topbar button for it? If not, you can use "/settings" to open the menu.
			Icon = "rbxassetid://8654540235" --> If you use the topbar button, what icon?
		}
	}
}
-- Author: @Jumpathy
-- Name: loader.lua
-- Description: Better chat loader

local configuration = require(script.Parent)
local toRequire = script:WaitForChild("src")
local addons = script.Parent.Parent:WaitForChild("Addons")

require(toRequire)(configuration,addons)
-- Author: @Jumpathy
-- Name: chat.lua
-- Description: Chat system init

local httpService = game:GetService("HttpService")
local debugMode = false

local checkUpdate = function(currentUpdate)
	if httpService.HttpEnabled then
		task.spawn(function()
			local success,response = pcall(function()
				return httpService:GetAsync("https://pastebin.com/raw/6wHsFsZT")
			end)
			if success and response then
				local response = game:GetService("HttpService"):JSONDecode(response)
				if(response.version ~= currentUpdate) then
					warn("[BetterChat V3]: This version is outdated, and needs to be updated for the latest functionality!")
				end
			end
		end)
	end
end

checkUpdate("1.1.6")

return function(config,addons)
	config.DebugMode = debugMode
	addons.Parent.Parent = game:GetService("ServerScriptService")

	local messageEditingPermissions = config.Messages.Extra.Editable
	local replyEnabled = config.Messages.Extra.ReplyEnabled
	local mentioningEnabled = config.Messages.Extra.MentionEnabled
	local messageDeletingPermissions = config.Messages.Extra.DeleteableMessages or ""

	local displayNamesEnabled = config.DisplayNames.Enabled
	local teamsOverride = config.Teams.TeamColorPriority
	local teamChatEnabled = config.Teams.TeamChat

	local players = game:GetService("Players")
	local replicatedStorage = game:GetService("ReplicatedStorage")
	local teams = game:GetService("Teams")
	local chatService = game:GetService("Chat")
	local textService = game:GetService("TextService")
	local constructors

	local profileService = require(script:WaitForChild("core"):WaitForChild("services"):WaitForChild("profile"))(config,function()
		return constructors
	end)

	local callback = {}
	local sharedFolder = script:WaitForChild("shared")
	local network = require(sharedFolder:WaitForChild("network")):setup(debugMode)
	local signal = require(sharedFolder:WaitForChild("signal"))
	local wrap = require(sharedFolder:WaitForChild("wrap"))

	sharedFolder.Name = "betterchat_shared"
	sharedFolder.Parent = replicatedStorage
	sharedFolder:SetAttribute("debugMode",debugMode)

	addons:WaitForChild("Client").Parent = sharedFolder:WaitForChild("addons")

	local serverAddons = addons:WaitForChild("Server");
	serverAddons.Parent = script:WaitForChild("core")
	serverAddons.Name = "plugins"

	local core = script:WaitForChild("core")
	local classes = core:WaitForChild("constructors")

	local rateLimit = require(core:WaitForChild("rateLimit"))(config)
	local util = require(core:WaitForChild("utility"):WaitForChild("main"))(config)
	local permission = require(core:WaitForChild("permission"))(config)

	local cooldowns = {}
	local speakers = {}

	local fetchChannels = function(speaker)
		local channels = speaker.channels
		local names = {}
		for _,channel in pairs(channels) do
			table.insert(names,channel.name)
		end
		return names
	end

	local handle = function(list,player)
		local toReturn = {}
		for key,emoji in pairs(list) do
			if(typeof(emoji) == "table") then
				if emoji.Image then
					toReturn[key] = emoji
				elseif #emoji == 2 then
					local lockedTo = emoji[2]
					if(permission:canUse(lockedTo,player.UserId)) then
						toReturn[key] = emoji[1]
					end
				end
			else
				toReturn[key] = emoji
			end
		end
		for _,cb in pairs(callback) do
			cb(toReturn,player)
		end
		return toReturn
	end

	local getAllowedEmojisFor = function(player)
		local custom = config.Messages.CustomEmojis or {Enabled = false, List = {}}
		if custom.Enabled then
			if custom.PermissionLocked then
				if permission:canUse(custom.PermissionLocked,player.UserId) then
					return handle(custom.List,player)
				else
					return {}
				end
			else
				return handle(custom.List,player)
			end
		else 
			return {}
		end
	end

	local richText = require(sharedFolder:WaitForChild("formatting"):WaitForChild("richText"))(config,getAllowedEmojisFor)
	local services = {}

	constructors = {
		speaker = require(classes:WaitForChild("speaker"))(network,fetchChannels,signal),
		channel = require(classes:WaitForChild("channel"))(network,config,signal),
		message = require(classes:WaitForChild("message"))(util,config,messageEditingPermissions,permission,richText,signal),
		profileService = profileService,
		network = network,
		signal = signal
	}

	local api = require(core:WaitForChild("api"))(constructors,wrap,config,callback,permission)
	constructors.speaker:setup(constructors.channel)
	constructors.channel:setup(constructors.speaker,constructors.message)

	network:newEvent("receiveMessage")
	network:newEvent("receiveMessageCreation")
	network:newEvent("receiveMuteUpdate")

	local defaultChannel = constructors.channel.new("Main",true)

	local connections = {}
	local teamIds = {}

	local link = function(conns,connection)
		table.insert(conns,connection)
	end

	local getById = function(id)
		for _,plr in pairs(players:GetPlayers()) do
			print(plr,plr.UserId,id)
			if(math.abs(plr.UserId) == id) then
				return plr
			end
		end
	end

	local getTeamId = function(team)
		if(teamIds[team]) then
			return teamIds[team]
		else
			teamIds[team] = "team_" .. util:newGuid()
			return teamIds[team]
		end
	end

	local workshop = function(message)
		return message
	end

	local onPlayer = function(player)
		local name,display = player.Name,(displayNamesEnabled and player.DisplayName or player.Name)
		local _,speaker = constructors.speaker.new(name,player)
		local list = {}
		connections[player] = list

		if config.BubbleChat.Enabled and config.BubbleChat.Config.TypingIndicator then
			player:SetAttribute("TypingIndicatorEnabled",true)
		end

		player:SetAttribute("TypingIndicatorColor",config.BubbleChat.Config.TypingIndicatorColor)
		player:SetAttribute("BubbleBackgroundColor",config.BubbleChat.Config.BubbleBackgroundColor)
		player:SetAttribute("BubbleTextColor",config.BubbleChat.Config.BubbleTextColor)
		player:SetAttribute("TextSize",config.BubbleChat.Config.TextSize)
		player:SetAttribute("BubbleFont",config.BubbleChat.Config.BubbleFont.Name)
		player:SetAttribute("BubbleRoundness",config.BubbleChat.Config.Roundness)
		
		player:SetAttribute("DisplayName",display)
		player:SetAttribute("DisplayNameColor",util:getNameColor(display))
		player:SetAttribute("NameColor",util:getNameColor(name))
		player:SetAttribute("ChatColor",Color3.fromRGB(255,255,255))
		player:SetAttribute("UseTeamColor",teamsOverride)
		player:SetAttribute("Muted",false)

		if(config.User.ChangeDisplayNameColorWhenAttributeChanged) then
			link(list,player:GetAttributeChangedSignal("DisplayName"):Connect(function()
				player:SetAttribute("DisplayNameColor",util:getNameColor(player:GetAttribute("DisplayName")))
			end))
		end
		
		link(list,player:GetAttributeChangedSignal("Muted"):Connect(function()
			speaker:updateMuteStatus(player:GetAttribute("Muted"))
		end))
		
		if(teamChatEnabled) then
			local lastTeam
			local updateTeam = function()
				local success,resp = pcall(function()
					if (lastTeam) then
						local teamId = getTeamId(lastTeam)
						lastTeam = nil
						if(table.find(fetchChannels(speakers[player]),teamId)) then
							local chatChannel = constructors.channel:getByName(teamId)
							chatChannel:removeSpeaker(speakers[player])
						end
					end
					if(player.Team ~= nil and (not player.Neutral)) then
						lastTeam = player.Team
						local teamId = getTeamId(player.Team)
						local chatChannel = constructors.channel:getByName(teamId)
						if(not chatChannel) then
							local _,new = constructors.channel.new(teamId,false)
							new:registerMessageProcess("on_create",function(message)
								message.data.isTeam = true
							end)
							chatChannel = new
						end
						chatChannel:addSpeaker(speakers[player])
					end
				end)
				if not success then
					warn("[BetterChat]:",resp)
				end
			end
			link(list,player:GetPropertyChangedSignal("Team"):Connect(updateTeam))
			task.delay(0.1,updateTeam)
		end

		speakers[player] = speaker
		cooldowns[player] = rateLimit:createCooldown(player.UserId)
		permission:get(player.UserId)
		util:verifyChatInstalled(player)
	end

	network:newEvent("receiveChannelUpdate",function(plr)
		speakers[plr]:sendChannels()
	end)

	-- Plugins

	local onPlugin = function(module)
		task.spawn(function()
			local success,response = pcall(require,module)
			if not success and response then
				warn("[BetterChatV3] Attempted to load plugin",module,"but failed with",response)
			elseif(success and response) then
				local success,response = pcall(response,api)
				if not success then
					warn("[BetterChatV3] Attempted to load plugin",module,"but failed with",response)
				end
			end
		end)
	end
	serverAddons.ChildAdded:Connect(onPlugin)
	for _,pluginModule in pairs(serverAddons:GetChildren()) do
		task.spawn(onPlugin,pluginModule)
	end

	-- Remotes:

	local failed_payload = {messages = {}}

	network:newFunction("getChannelsIn",function(player)
		return fetchChannels(speakers[player])
	end)

	network:newFunction("requestHistory",function(player,channel)
		if(type(channel) == "string") then
			local channel = constructors.channel:getByName(channel)
			if(channel) then
				return channel:getHistoryForSpeaker(speakers[player]) or failed_payload
			else
				return failed_payload
			end
		else
			return failed_payload
		end
	end)

	network:newFunction("requestConfig",function()
		return config
	end)

	-- 5/28/22 (Jumpathy): why is this function so complicated :skull:

	network:newFunction("requestMessage",function(player,message,channel,extraData)
		if(type(message) == "string" and type(channel) == "string" and #message:gsub(" ","") >= 1) then
			if(util:getSendability(message)) then
				message = workshop(message)
				local speaker = speakers[player]
				if(speaker.muted) then
					return false,true,{"GameChat_ChatChannel_MutedInChannel"}
				end

				--------- Team chat logic: ---------

				if(extraData and extraData.team and teamChatEnabled) then
					if(player.Team == extraData.team) then
						channel =  getTeamId(extraData.team)
					end
				end

				--------- Whisper logic:  ---------

				-- Flow: Extract IDs from whisper channel -> get players -> create channel if it doesn't exist
				-- -> continue to regular

				if(config.Messages.Private.WhispersEnabled) then
					if(channel:sub(1,8) == "whisper_") then
						local list = channel:split("_")
						local count = 0
						local ids = {math.abs(list[2] and tonumber(list[2]) or 0),math.abs(list[3] and tonumber(list[3]) or 0)}
						table.sort(ids)
						local name = "whisper_" .. table.concat(ids,"_")
						for key,id in pairs(ids) do
							if(getById(id) ~= nil) then
								ids[key] = getById(id)
								count += 1
							end
						end
						if(count == 2 and (ids[1] ~= ids[2])) then -- make sure both users are valid and ensure they're not whispering to themselves
							local chatChannel = constructors.channel:getByName(name)
							if(not chatChannel) then
								local _,new = constructors.channel.new(name,false)
								chatChannel = new
								chatChannel:registerMessageProcess("on_create",function(message)
									message.data.isWhisper = true
									message.data.from_user = message.senderId
									message.data.to_user = ( message.senderId == ids[1] and ids[2] or ids[1]).UserId
									message.data.ids = {math.abs(list[2] and tonumber(list[2]) or 0),math.abs(list[3] and tonumber(list[3]) or 0)}
								end)
								local removing
								removing = players.PlayerRemoving:Connect(function(p)
									for _,plr in pairs(ids) do
										if(p == plr) then
											chatChannel:Destroy()
											removing:Disconnect()
											break
										end
									end
								end)
							end
							for _,plr in pairs(ids) do
								chatChannel:addSpeaker(speakers[plr])
							end
						end
					end
				end

				--------- Reply logic: ---------
				-- Flow: Check if message exists -> Check if message channel exists ->
				-- check if the user can talk in that channel -> check their cooldown -> send message

				if(channel:sub(1,6) == "reply_" and (permission:canUse(replyEnabled,player.UserId))) then
					local replyTo = tonumber(channel:sub(7,#channel))
					if(replyTo) then
						local existing = constructors.message:getById(replyTo)
						if(existing) then
							local channelFrom = existing.data.channelFrom
							local chatChannel = constructors.channel:getByName(channelFrom)
							if(chatChannel and chatChannel:canSpeakerTalk(speaker)) then
								local userCooldown = cooldowns[player]
								if(userCooldown:canSend()) then
									userCooldown:log()
									message = util:fixWhitespace(message)
									if(#message >= 1) then
										speaker:say(channelFrom,message,existing)
										return true
									end
								else
									return false,true,{"GameChat_ChatFloodDetector_MessageDisplaySeconds",userCooldown:getCooldown()}
								end
							else
								return false
							end
						else
							return false
						end
					else
						return false
					end
				end

				--------- Regular message logic: ---------
				-- Flow: Check if channel exists -> check if the user can talk in that channel -> check their cooldown -> send message

				local chatChannel = constructors.channel:getByName(channel)
				if(chatChannel and chatChannel:canSpeakerTalk(speaker)) then
					local userCooldown = cooldowns[player]
					if(userCooldown:canSend()) then
						userCooldown:log()
						message = util:fixWhitespace(message)
						if(#message >= 1) then
							speaker:say(channel,message)
							return true
						else
							return false
						end
					else
						return false,true,{"GameChat_ChatFloodDetector_MessageDisplaySeconds",userCooldown:getCooldown()}
					end
				else
					return false
				end
			else
				return false
			end
		else
			return false
		end
	end)

	network:newEvent("editMessage",function(player,id,channel,new)
		if(permission:canUse(messageEditingPermissions,player.UserId)) then -- dw ya boi got sanity checks
			if(type(new) == "string" and type(channel) == "string" and #new:gsub(" ","") >= 1) then
				if(util:getSendability(new)) then
					local chatChannel = constructors.channel:getByName(channel)
					local speaker = speakers[player]
					if(chatChannel and chatChannel:canSpeakerTalk(speaker)) then
						local existing = chatChannel:getMessageById(id)
						if(existing and existing.senderId == player.UserId) then
							local userCooldown = cooldowns[player]
							if(userCooldown:canSend() and #new >= 1) then
								new = workshop(new)
								userCooldown:log()
								chatChannel:editMessage(id,new)
							end
						end
					end
				end
			end
		end
	end)

	if messageDeletingPermissions ~= "" then
		network:newEvent("deleteMessage",function(player,id,channel)
			if(permission:canUse(messageDeletingPermissions,player.UserId)) then -- dw ya boi got sanity checks
				local chatChannel = constructors.channel:getByName(channel)
				local speaker = speakers[player]
				if(chatChannel and chatChannel:canSpeakerTalk(speaker)) then
					chatChannel:deleteMessage(id)
				end
			end
		end)
	end

	if(config.BubbleChat.Enabled and config.BubbleChat.Config.TypingIndicator) then
		-- replicate typing indicator status
		network:newEvent("typingIndicator",function(player,hasTypingIndicator)
			if(type(hasTypingIndicator) == "boolean") then
				network:fireClients("typingIndicator","all",player,hasTypingIndicator)
			end
		end)
	end

	-- Config-saving:

	local availableOptions = {
		BubbleChat = {
			["Enabled"] = true,
			["AnimationStyle"] = true,
			["EasingStyle"] = true,
			["FadeoutTime"] = true,
			["Font"] = true
		},
		UI = {
			Resizable = true,
			Roundness = true,
			TextSize = true,
			ChatbarFont = true,
			TextFont = true
		}
	}

	local allowed = {"number","string","boolean"}
	network:newFunction("writeConfig",function(player,location,configName,configValue)
		if(location ~= "QuickChats") then
			if(availableOptions[location]) then
				local option = availableOptions[location][configName]
				if(option ~= nil) then
					if(table.find(allowed,typeof(configValue))) then
						if(type(configValue) == "string") then
							configValue = configValue:sub(1,35)
						elseif(type(configValue) == "number") then
							configValue = math.floor(configValue)
						end
						local success,profile = profileService:get(player)
						if(success) then
							profile.config = profile.config or {}
							profile.config[location] = profile.config[location] or {}
							profile.config[location][configName] = configValue
							return true
						end
					end
				end
			end
		else
			local filter = function(text,player)
				local success,response = pcall(function()
					return chatService:FilterStringAsync(text,player,player)
				end)
				if(not success) then
					return("Failed to filter")
				else
					return(response)
				end
			end

			local place = math.clamp((tonumber(configName) or 0),1,20)
			local value = filter(tostring(configValue):sub(1,config.Messages.MaximumLength),player)

			local success,profile = profileService:get(player)
			if(success) then
				profile.config = profile.config or {}
				profile.config[location] = profile.config[location] or {}
				profile.config[location][place] = value
				return value
			end
		end
		return false
	end)

	network:newFunction("fetchUserConfig",function(player)
		local success,profile = profileService:get(player)
		if(success) then
			return profile.config or {}
		end
	end)

	network:newFunction("getAllowedEmojis",function(player)
		return getAllowedEmojisFor(player)
	end)

	-- Data-saving:

	if(config.User.SaveData.Enabled) then
		profileService.new(config.User.SaveData.Advanced.DatastoreName)
	end

	-- Client

	local client = script:WaitForChild("client")
	client.Name = "betterChatClient"
	client.Parent = game:GetService("StarterPlayer"):WaitForChild("StarterPlayerScripts")

	-- Player connections:

	players.PlayerAdded:Connect(onPlayer)
	for _,player in pairs(players:GetPlayers()) do
		task.spawn(onPlayer,player)
	end

	players.PlayerRemoving:Connect(function(player)
		local speaker = constructors.speaker:getByName(player.Name)
		if(speaker ~= nil) then
			speaker:Destroy()
			local list = connections[player]
			for k,conn in pairs(list) do
				conn:Disconnect()
				table.remove(list,k)
			end
			connections[player] = nil
			speakers[player] = nil
			rateLimit:unlink(player.UserId)
		end
	end)
end
-- Author: @Jumpathy
-- Name: speaker.lua
-- Description: Speaker objects manager

return function(network,fetch,signal)
	local speakerModule = {}
	speakerModule.internal = {}
	speakerModule.internal.speakers = {}
	speakerModule.speakerAdded = signal.new()
	speakerModule.speakerRemoved = signal.new()
	
	local speakersList = speakerModule.internal.speakers
	local channel

	function speakerModule.new(name,player)
		if(speakersList[name] ~= nil) then
			warn(("[Better Chat]: Speaker '%s' already exists."):format(name))
			return false
		end
		
		local speaker = {}
		speaker.name = name
		speaker.channels = {}
		speaker.tags = {}
		speaker.isPlayer = (player ~= nil)
		speaker.id = (speaker.isPlayer and player.UserId or nil)
		speaker.player = player
		speaker.muted = false
		speaker.icon = ""
		speaker.events = {
			channelUpdated = signal.new(),
			muteUpdate = signal.new(),
			chatted = signal.new()
		}
		
		if(player) then
			function speaker:sendChannels()
				network:fireClients("receiveChannelUpdate",{player},fetch(speaker))
			end
			
			speaker.events.channelUpdated:Connect(speaker.sendChannels)
			
			speaker.events.muteUpdate:Connect(function()
				network:fireClients("receiveMuteUpdate",{player},speaker.muted)
			end)
		end
		
		function speaker:unmute()
			speaker.muted = false
			speaker.events.muteUpdate:Fire(false)
		end
		
		function speaker:mute()
			speaker.muted = true
			speaker.events.muteUpdate:Fire(true)
		end
		
		function speaker:addTag(text,color)
			table.insert(speaker.tags,{
				text = text,
				color = color		
			})
		end
		
		function speaker:updateMuteStatus(state)
			speaker.muted = state
			speaker.events.muteUpdate:Fire(state)
		end
		
		function speaker:removeTag(text)
			for key,tag in pairs(speaker.tags) do
				if (tag.text == text) then
					table.remove(speaker.tags,key)
				end
			end
		end
		
		function speaker:addToChannel(channelName)
			channel:getByName(channelName):addSpeaker(speaker)
		end
		
		function speaker:removeFromChannel(channelName)
			channel:getByName(channelName):removeSpeaker(speaker)
		end
		
		function speaker:setIcon(icon)
			speaker.icon = icon
		end
		
		function speaker:say(channelName,message,existing)
			local toSendIn = channel:getByName(channelName)
			if(not toSendIn:canSpeakerTalk(speaker)) then
				warn(("%s cannot talk in channel '%s'"):format(speaker.name,channelName))
				return
			end
			if toSendIn.handlingMessagesOnOwn then
				toSendIn:handleMessageRequest(speaker,message,existing)
			else
				local object = toSendIn:sendMessage(speaker,message,existing)
				speaker.events.chatted:Fire(message,object)
				return object
			end
		end
		
		function speaker:Destroy()
			for _,channel in pairs(speaker.channels) do
				pcall(function()
					channel:removeSpeaker(speaker)
				end)
			end
			for _,event in pairs(speaker.events) do
				event:DisconnectAll()
			end
			speakersList[name] = nil
			speakerModule.speakerRemoved:Fire(name)
		end

		speakersList[name] = speaker
		channel:findAutojoinForSpeaker(speaker)
		speakerModule.speakerAdded:Fire(speaker)

		return true,speaker
	end
	
	function speakerModule:getByName(name)
		return speakersList[name]
	end

	function speakerModule:getById(id)
		for _,speaker in pairs(speakersList) do
			if(speaker.id == id) then
				return speaker
			end
		end
	end

	function speakerModule:getSpeakers()
		return speakersList
	end

	function speakerModule:setup(module)
		channel = module
	end

	function speakerModule:onSpeaker(callback)
		for _,speaker in pairs(speakerModule:getSpeakers()) do
			task.spawn(callback,speaker)
		end
		speakerModule.speaker.speakerAdded:Connect(callback)
	end
	
	return speakerModule
end
-- Author: @Jumpathy
-- Name: channel.lua
-- Description: Channel objects manager

local chatService = game:GetService("Chat")
local textChatService = game:GetService("TextChatService")
local players = game:GetService("Players")

return function(network,config,signal)
	local channelAdded = signal.new()
	
	local channelModule = {}
	channelModule.internal = {}
	channelModule.internal.channels = {}

	local channelsList = channelModule.internal.channels
	local messagesLimit = config.Messages.ChannelMessageLimit
	local speaker
	local messages

	local shallowCopy = function(original)
		local copy = {}
		for key,value in pairs(original) do
			copy[key] = value
		end
		return copy
	end

	-- check out the sick networking I had a stroke trying to write :skull:
	-- and then roblox decided to be like 'lets release our custom networking system for chats!1'
	
	local canCommunicate = function(senderId,userId)
		local canCommunicate = false
		if(senderId ~= nil) then
			local success,chat = pcall(function()
				return textChatService:CanUsersChatAsync(senderId,userId)
			end)
			if(success) then
				canCommunicate = chat
			end
		end
		return canCommunicate
	end
	
	channelModule.canCommunicate = canCommunicate
	
	local getFilteredMessage = function(object,speaker)
		local messageOwner = object.sender
		local filterObject = object.filtered
		if(((not object.data.isPlayer) or canCommunicate(messageOwner.UserId,speaker.player.UserId))) then
			local messageContent = filterObject:GetChatForUserAsync(not object.data.isPlayer and "" or speaker.player.UserId)
			local copiedData = shallowCopy(object.data)
			copiedData.message = messageContent
			return copiedData
		end
	end

	local replicateMessage = function(channel,object,list)
		local messageOwner = object.sender
		for _,speaker in pairs(list or channel.speakers) do
			task.spawn(function()
				if(speaker.player ~= nil) then 
					if(((not object.data.isPlayer) or canCommunicate(messageOwner.UserId,speaker.player.UserId))) then
						local toSend = getFilteredMessage(object,speaker)
						if(toSend.replyingTo ~= nil) then
							toSend.replyingTo = getFilteredMessage(toSend.replyingTo,speaker)
							if(not toSend.replyingTo) then -- failed to communicate
								return
							end
						end
						if speaker.player == messageOwner then
							toSend.unfiltered = object.unblacklisted
						end
						network:fireClients("receiveMessage",{speaker.player},{messages = {toSend},is_singular = true})
					end
				end
			end)
		end
	end

	local replicateRawMessage = function(channel,object,list)
		for _,speaker in pairs(list or channel.speakers) do
			task.spawn(function()
				if(speaker.player ~= nil) then
					network:fireClients("receiveMessage",{speaker.player},{messages = {object},is_singular = true})
				end
			end)
		end
	end

	local replicateEditedMessage = function(channel,object,list)
		local messageOwner = object.sender
		for _,speaker in pairs(list or channel.speakers) do
			task.spawn(function()
				if(speaker.player ~= nil and (object.data.isPlayer)) then 
					if(canCommunicate(messageOwner.UserId,speaker.player.UserId)) then
						local toSend = getFilteredMessage(object,speaker)
						if(toSend.replyingTo ~= nil) then
							toSend.replyingTo = getFilteredMessage(toSend.replyingTo,speaker)
							if(not toSend.replyingTo) then -- failed to communicate
								return
							end
						end
						if messageOwner == speaker.player then
							toSend.unfiltered = object.unblacklisted
						end
						network:fireClients("editMessage",{speaker.player},toSend)
					end
				elseif(not object.data.isPlayer and (speaker.player ~= nil)) then
					local toSend = getFilteredMessage(object,speaker)
					if(toSend.replyingTo ~= nil) then
						toSend.replyingTo = getFilteredMessage(toSend.replyingTo,speaker)
						if(not toSend.replyingTo) then -- failed to communicate
							return
						end
					end
					network:fireClients("editMessage",{speaker.player},toSend)
				end
			end)
		end
	end

	local replicateUnfilteredMessage = function(channel,object,list)
		local messageOwner = object.sender
		for _,speaker in pairs(list or channel.speakers) do
			task.spawn(function()
				if(speaker.player ~= nil) then 
					if((not object.data.isPlayer) or canCommunicate(messageOwner.UserId,speaker.player.UserId)) then
						local toSend = shallowCopy(object.data)
						toSend.message = string.rep("_",toSend.length)
						if(toSend.replyingTo ~= nil) then
							toSend.replyingTo = getFilteredMessage(toSend.replyingTo,speaker)
							if(not toSend.replyingTo) then -- failed to communicate
								return
							end
						end
						network:fireClients("receiveMessageCreation",{speaker.player},{messages = {toSend},is_singular = true})
					end
				end
			end)
		end
	end
	
	local fetchChannelHistoryForSpeaker = function(channel,s)
		local speakerModule = speaker
		local speaker = s
		-- Flow: Loop through channel history -> ensure message sender is still in game -> 
		-- see if it's a reply and see if the original message owner is still in-game -> add to history
		local receive = {messages = {}}
		for _,object in pairs(channel.history) do
			if(speaker.player ~= nil) then 
				local canSeeMessage = false
				if(object.data.isPlayer) then
					if(object.senderId ~= nil) then
						if(players:GetPlayerByUserId(object.senderId)) then
							canSeeMessage = canCommunicate(object.senderId,speaker.player.UserId)
						end
					end
				else
					canSeeMessage = true
				end
				if(canSeeMessage) then
					local toSend = getFilteredMessage(object,speaker)
					local checkThreadReplies = function()
						if(toSend.replyingTo ~= nil) then
							if(not players:GetPlayerByUserId(toSend.replyingTo.sender and toSend.replyingTo.sender.UserId or 0)) then
								if(toSend.replyingTo.isPlayer) then
									return -- message doesnt exist
								end
							end
							toSend.replyingTo = getFilteredMessage(toSend.replyingTo,speaker)
							if(not toSend.replyingTo) then -- failed to communicate
								return
							end
						end
					end
					checkThreadReplies()
					if toSend.player == speaker.player then
						toSend.unfiltered = object.unblacklisted
					end
					table.insert(receive.messages,1,toSend)
				end
			else
				table.insert(receive.messages,1,object)
			end
		end
		for idx,message in pairs(receive.messages) do
			if message.historyLogic and message.player then
				local canSee = message.historyLogic(message,message.player,speaker.player)
				if not canSee then
					table.remove(receive.messages,idx)
				elseif canSee then
					if message.replyingTo ~= nil then
						local replySpeaker = speakerModule:getByName("Unknown")
						local viewableMessage = message.replyingTo
						local canSend = message.historyLogic(viewableMessage,viewableMessage.player,speaker.player)
						if(not canSend) then
							message.replyingTo.message = "-----"
						end
					end
				end
			end
		end
		local found = {}
		for idx,message in pairs(receive.messages) do
			if found[message.id] then
				table.remove(receive.messages,idx)
			end
			found[message.id] = true
		end
		return receive
	end

	function channelModule.new(name,autojoin,handlingMessagesOnOwn)
		if(channelsList[name] ~= nil) then
			warn(("[Better Chat]: Channel '%s' already exists."):format(name))
			return false
		end
		local channel = {}
		channel.name = name
		channel.handlingMessagesOnOwn = (handlingMessagesOnOwn == true)
		channel.autoJoin = autojoin
		channel.speakers = {}
		channel.history = {}
		channel.messageProcessing = {}
		channel.messageCount = 0
		channel.events = {
			chatted = signal.new(),
			speakerAdded = signal.new(),
			speakerRemoved = signal.new(),
			messageRequested = signal.new()
		}
		
		function channel:handleMessageRequest(...)
			channel.events.messageRequested:Fire(...)
		end

		function channel:Destroy()
			channelsList[name] = nil
			for _,speaker in pairs(channel.speakers) do
				speaker.channels[name] = nil
				speaker.events.channelUpdated:Fire()
			end
			for _,event in pairs(channel.events) do
				event:DisconnectAll()
			end
			for k,v in pairs(channel) do
				channel[k] = nil
			end
		end

		function channel:registerMessageProcess(name,callback)
			table.insert(channel.messageProcessing,{
				name = name,
				callback = callback
			})
		end
		
		local removeAt = {}

		function channel:unregisterMessageProcess(name)
			for key,processData in pairs(channel.messageProcessing) do
				if(processData.name == name) then
					table.remove(channel.messageProcessing,key)
					break
				end
			end
		end

		function channel:canSpeakerTalk(speaker)
			return(table.find(channel.speakers,speaker) ~= nil)
		end

		function channel:addSpeaker(speaker)
			if(not table.find(channel.speakers,speaker)) then
				table.insert(channel.speakers,speaker)
				speaker.channels[name] = channel
				speaker.events.channelUpdated:Fire()
				channel.events.speakerAdded:Fire(speaker)
			end
		end

		function channel:removeSpeaker(speaker)
			local key = table.find(channel.speakers,speaker)
			if(key) then
				if speaker.player then
					
				end
				table.remove(channel.speakers,key)
				speaker.channels[name] = nil
				speaker.events.channelUpdated:Fire()
				channel.events.speakerRemoved:Fire(speaker.name)
			end
		end

		local callbacks = {
			onFiltered = function(object)
				replicateMessage(channel,object)
			end,
			onCreated = function(object)
				replicateUnfilteredMessage(channel,object)
			end,
			processMessage = function(object,isFiltered)
				for _,process in pairs(channel.messageProcessing) do
					process.callback(object)
				end
			end,
		}
		
		function channel:sendMessageToSpecificUsers(list,speaker,message,historyLogic,hookMessage,replyingTo)
			channel:sendMessage(speaker,message,replyingTo,{
				onFiltered = function(object)
					replicateMessage(channel,object,list)
				end,
				onCreated = function(object)
					hookMessage(object.data)
					replicateUnfilteredMessage(channel,object,list)
				end,
				processMessage = callbacks.processMessage
			},historyLogic)
		end

		function channel:sendMessage(speaker,message,replyTo,cb,historyLogic)
			local object = messages.new(message,speaker,name,replyTo,cb or callbacks,false,historyLogic)
			channel.messageCount += 1
			table.insert(channel.history,1,object)
			if(#channel.history > messagesLimit) then
				table.remove(channel.history,#channel.history)
			end
			channel.events.chatted:Fire(object)
			return object
		end
		
		function channel:editMessage(id,new)
			for _,message in pairs(channel.history) do
				if(message.data.id == id) then
					messages.edit(message,new)
					replicateEditedMessage(channel,message)
					break
				end
			end
		end
		
		function channel:deleteMessage(id)
			for _,message in pairs(channel.history) do
				if(message.data.id == id) then
					messages.delete(message)
					replicateEditedMessage(channel,message)
					break
				end
			end
		end

		function channel:getMessageById(id)
			for _,message in pairs(channel.history) do
				if(message.data.id == id) then
					return message
				end
			end
		end

		function channel:getHistoryForSpeaker(speaker)
			if(channel:canSpeakerTalk(speaker)) then
				return fetchChannelHistoryForSpeaker(channel,speaker)
			end
		end

		channelsList[name] = channel
		for _,speaker in pairs(speaker:getSpeakers()) do
			channelModule:findAutojoinForSpeaker(speaker)
		end
		
		channelAdded:Fire(channel)
		
		return true,channel
	end

	function channelModule:getByName(name)
		return channelsList[name]
	end

	function channelModule:findAutojoinForSpeaker(speaker)
		for _,channel in pairs(channelsList) do
			if(channel.autoJoin) then
				channel:addSpeaker(speaker)
			end
		end
	end

	function channelModule:setup(speakerModule,messageModule)
		speaker = speakerModule
		messages = messageModule
	end
	
	channelModule.channelAdded = channelAdded
	
	function channelModule:onChannel(callback)
		for _,channel in pairs(channelsList) do
			task.spawn(callback,channel)
		end
		channelModule.channelAdded:Connect(callback)
	end

	return channelModule
end
-- Author: @Jumpathy
-- Name: message.lua
-- Description: Message object wrapper

return function(utility,config,messageEditingEnabled,permission,richText,signal)
	local message = {}
	local filter = require(script.Parent.Parent:WaitForChild("filter"))(config,richText,message)
	local httpService = game:GetService("HttpService")
	local ids = 0
	local messages = {}
	
	local combine = function(speaker,existing)
		for _, tag in pairs (speaker.tags) do
			table.insert(existing,1,tag)
		end
		return existing
	end

	local deepCopy;
	deepCopy = function(original,depth)
		depth = depth or 0
		local copy
		if type(original) == "table" then
			copy = {}
			for key, value in next, original, nil do
				copy[deepCopy(key)] = deepCopy(value,depth + 1)
			end
		else
			copy = original
		end
		return copy
	end

	local get = function(speaker,property,callback)
		if(speaker.player) then
			if(property ~= "TeamColor") then
				return speaker.player:GetAttribute(property)
			elseif(speaker.player:GetAttribute("UseTeamColor")) then
				return(speaker.player.Team ~= nil and speaker.player.TeamColor.Color)
			end
		else
			return callback(speaker,property)
		end
	end

	local getExtraData = function(speaker,propertyName)
		if(propertyName == "DisplayName") then
			return speaker.name
		end
	end

	local getChatColor = function(speaker,propertyName)
		return speaker.chatColor or Color3.fromRGB(255,255,255)
	end

	local getNameColor = function(speaker,propertyName)
		return utility:getNameColor(speaker.name)
	end

	local returnTrue = function()
		return true
	end

	local returnNil = function()
		return nil
	end

	local getViewportFrom = function(player)
		if(player and config.Messages.UseViewportForIcon and player.Character and config.Messages.IncludeIcon) then
			return utility:constructViewportDescription(player.Character)
		end
	end

	local no = function() end
	local blank = {onCreated = no, processMessage = no, onFiltered = no}
	local deleteablePerm = config.Messages.Extra.DeleteableMessages

	function message.new(text,speaker,channel,replyTo,callbacks,isBroadcast,historyLogic)
		ids += 1
		local messageId = ids
		local canUseMeCommand = (speaker.player and permission:canUse(config.Messages.Extra.MeCommand,speaker.player.UserId))
		local senderId = speaker.player and speaker.player.UserId or speaker.id
		local viewport = getViewportFrom(speaker.player)
		local markdownEnabled = (speaker.player and permission:canUse(config.Messages.Extra.MarkdownEnabled,speaker.player.UserId)) or 0

		local object = {
			data = { --> jesus :sobbing:
				timeSent = workspace:GetServerTimeNow(),
				historyLogic = historyLogic,
				isPlayer = (speaker.player ~= nil),
				guid = httpService:GenerateGUID(false),
				replyingTo = replyTo,
				length = string.len(text),
				displayName = get(speaker,"DisplayName",getExtraData),
				displayNameColor = get(speaker,"DisplayNameColor",getNameColor),
				nameColor = get(speaker,"NameColor",getNameColor),
				name = speaker.name,
				teamPriority = get(speaker,"UseTeamColor",returnTrue),
				teamColor = get(speaker,"TeamColor",returnNil),
				filteredSuccessfully = false,
				class = replyTo and "reply" or "regular",
				player = speaker.player,
				viewportData = viewport,
				id = messageId,
				channelFrom = channel,
				senderId = senderId,
				isMeCommand = false,
				isBroadcast = isBroadcast,
				editingEnabled = speaker.player and permission:canUse(messageEditingEnabled,speaker.player.UserId),
				requiredToReply = (speaker.player and permission:tonumber(config.Messages.Extra.ReplyEnabled)) or 0,
				userPermission = (speaker.player and permission:get(speaker.player.UserId)) or 0,
				markdownEnabled = markdownEnabled,
				mentioningEnabled = (speaker.player and permission:canUse(config.Messages.Extra.MentionEnabled,speaker.player.UserId)) or 0,
				deletingEnabled = deleteablePerm and (speaker.player and permission:canUse(deleteablePerm,speaker.player.UserId)) or false,
				tags = combine(speaker,(speaker.player and permission:getUserTags(speaker.player)or{})),
				chatColor = get(speaker,"ChatColor",getChatColor),
			},
			filtered = nil,
			sender = speaker.player,
			senderId = senderId,
			message = text,
			unblacklisted = text
		}
		if(not viewport and (config.Messages.IncludeIcon and not object.data.player)) then
			object.data.imageId = speaker.icon
		end
		if(canUseMeCommand) then
			object.data.isMeCommand = text:sub(1,3) == "/me"
		end
		callbacks = callbacks or blank
		messages[messageId] = object
		callbacks.processMessage(object,false)
		callbacks.onCreated(object)
		local success,filterObj,emojis = filter.new(object.message,speaker.player,isBroadcast,markdownEnabled)
		object.filtered = filterObj
		object.data.filteredSuccessfully = success
		if emojis then
			object.data.customEmojis = emojis
		end
		callbacks.onFiltered(object)
		callbacks.processMessage(object,true)
		return messages[messageId]
	end

	function message.edit(message,newText)
		if(not message.data.edits) then
			message.data.edits = 0
		end
		if(message.data.isMeCommand) then
			newText = "/me " .. newText
		end
		local success,filterObj,emojis = filter.new(newText,message.sender,message.data.isBroadcast,message.data.markdownEnabled)
		if emojis then
			message.data.customEmojis = emojis
		end
		message.filtered = filterObj
		message.data.filteredSuccessfully = success
		message.data.edits += 1
	end

	function message.delete(obj)
		message.messageDeleted:Fire(deepCopy(obj))
		local success,filterObj = filter.new("Unsent a message",nil)
		obj.filtered = filterObj
		obj.data.filteredSuccessfully = success
		obj.data.deleted = true
	end

	function message:getById(id)
		return messages[id]
	end
	
	message.messageDeleted = signal.new()

	return message
end
-- Author: @Jumpathy
-- Name: rateLimit.lua
-- Description: Rate limiting for sending chat messages
-- Credit: @Xsitsu (base code)

return function(config)
	local rateLimit = {
		cooldowns = {}
	}

	local numberMessagesAllowed = config.Messages.Cooldown.NumberMessageAllowed
	local expireTimePeriod = config.Messages.Cooldown.ExpireTimePeriod
	
	function rateLimit:unlink(userId)
		rateLimit.cooldowns[userId] = nil
	end
	
	function rateLimit:createCooldown(userId)
		rateLimit.cooldowns[userId] = {}
		local flood_detection = rateLimit.cooldowns[userId]
		local return_functions = {}

		local purge_expired = function()
			local currentTick = tick()
			while(#flood_detection > 0 and flood_detection[1] < currentTick) do
				table.remove(flood_detection,1)
			end
		end

		function return_functions:log()
			purge_expired()
			if(#flood_detection < numberMessagesAllowed) then
				table.insert(flood_detection,tick() + expireTimePeriod)
			end
		end

		function return_functions:canSend()
			purge_expired()
			if(#flood_detection < numberMessagesAllowed) then
				return true
			else
				return false,math.ceil(flood_detection[1] - tick())
			end
		end
		
		function return_functions:getCooldown()
			return math.floor(({return_functions:canSend()})[2])
		end

		return return_functions
	end

	return rateLimit
end
-- Author: @Jumpathy
-- Name: permission.lua
-- Description: Ranks :sunglo:

local groupService = game:GetService("GroupService")
local players = game:GetService("Players")

local cache = {}

function cache.new(callback)
	local newCache = {internal = {}}

	function newCache.fetch(id,...)
		if(not newCache.internal[id]) then
			newCache.internal[id] = callback(id,...)
		end
		return newCache.internal[id]
	end

	return newCache
end

local groupDataCache = cache.new(function(id)
	return groupService:GetGroupInfoAsync(id)
end)

local groupsIn = cache.new(function(userId)
	local data,ret = groupService:GetGroupsAsync(userId),{}
	for _,group in pairs(data) do
		ret[group.Id] = group
	end
	return ret
end)

local getGameOwner = function()
	if(game.CreatorType == Enum.CreatorType.Group) then
		return groupDataCache.fetch(game.CreatorId)["Owner"]["Id"]
	else
		return game.CreatorId
	end
end

return function(config)
	local permission = {}
	local hasGamepass = require(script.Parent:WaitForChild("services"):WaitForChild("marketplace"))(permission)

	local gameOwner = getGameOwner()
	local configuration = config.Permissions
	local ranks = configuration.Ranks
	local groups = configuration.Groups
	local passes = configuration.Gamepasses
	local maxTags = config.ChatTags.MaxAmountTags or math.huge

	local highestRank = 0
	for rank,name in pairs(ranks) do
		if(rank > highestRank) then
			highestRank = rank
		end
	end

	local hasGroups = false
	for _,group in pairs(groups) do
		hasGroups = true
		break
	end

	local get = function(name)
		for key,val in pairs(ranks) do
			if(val == name) then
				return key
			end
		end
	end

	local permissionToNumber = function(perm)
		return((type(perm) == "number" and perm or get(perm)))
	end

	local getGroupPermission = function(userId)
		if(hasGroups) then
			local userGroups = groupsIn.fetch(userId)
			local max
			for groupId,data in pairs(userGroups) do
				if(not groups[groupId]) then
					userGroups[groupId] = nil
				else
					local highestRank
					local currentMax
					for rank,toAssign in pairs(groups[groupId]) do
						if(data.Rank >= rank and data.Rank > (highestRank or 0)) then
							currentMax = permissionToNumber(toAssign)
							highestRank = rank
						end
					end
					if((currentMax or -1) > (max or 0)) then
						max = currentMax
					end
				end
			end
			return max
		else
			return {}
		end
	end

	local getPassPerms = function(userId)
		local max
		for gamepassId,assign in pairs(passes) do
			if(hasGamepass(userId,gamepassId)) then
				local currentMax = permissionToNumber(assign)
				if(currentMax > (max or 0)) then
					max = currentMax
				end
			end
		end
		return max
	end

	local getUserPerms = function(userId)
		return permissionToNumber(configuration.Users[userId])
	end

	function permission:get(userId)
		local player = players:GetPlayerByUserId(userId)
		local hasPremium = (player and (player.MembershipType == Enum.MembershipType.Premium) or false)
		local highestPermissionViaGroup = getGroupPermission(userId)
		local highestPermissionViaPass = getPassPerms(userId)
		local highestPermissionViaUser = getUserPerms(userId)
		local premiumPermission = permissionToNumber(configuration.RobloxPremium)
		local toSort = {1}
		
		if(userId == gameOwner) then
			table.insert(toSort,highestRank)
		elseif(highestPermissionViaGroup) then
			table.insert(toSort,highestPermissionViaGroup)
		end
		if(hasPremium) then
			table.insert(toSort,premiumPermission)
		end
		if(highestPermissionViaUser) then
			table.insert(toSort,highestPermissionViaUser)
		end
		if(highestPermissionViaPass) then
			table.insert(toSort,highestPermissionViaPass)
		end
		table.sort(toSort)
		local toReturn = toSort[#toSort] or 0
		toSort = nil
		if(player) then
			if(player:GetAttribute("Permission") ~= toReturn) then
				permission:setNameColor(player,toReturn)
				permission:setTextColor(player,toReturn)
			end
			player:SetAttribute("Permission",toReturn)
		end
		return toReturn
	end

	function permission:canUse(flag,id)
		return(permission:get(id) >= (permissionToNumber(flag) or (highestRank + 1)))
	end

	function permission:tonumber(flag)
		return permissionToNumber(flag) or (highestRank + 1)
	end
	
	function permission:getUserTags(player)
		local rank,tags = permission:get(player.UserId),{}
		local toSearch = config.ChatTags.Users[player.Name] or config.ChatTags.Users[player.UserId]
		for _,tag in pairs(toSearch or {}) do
			table.insert(tags,{
				text = tag.Text,
				color = tag.Color,
				priority = tag.Priority or 3,
				image = tag.Image
			})
		end
		for cr,list in pairs(config.ChatTags.Ranks) do
			if(rank >= cr) then
				for _,tag in pairs(config.ChatTags.Ranks[cr]) do
					table.insert(tags,{
						text = tag.Text,
						color = tag.Color,
						priority = tag.Priority or 3,
						image = tag.Image
					})
				end
			end
		end
		table.sort(tags,function(a,b)
			return(a.priority > b.priority)
		end)
		if(#tags > maxTags) then
			local newTagsList = {}
			for i = 1,maxTags do
				table.insert(newTagsList,tags[i])
			end
			tags = newTagsList
		end
		return tags
	end
	
	function permission:setTextColor(player,rank)
		local color = config.TextColors or {["Ranks"] = {},["Users"] = {}}
		local rankColor,userColor = color["Ranks"][rank],(color.Users[player.Name] or color.Users[player.UserId])
		if(userColor) then
			player:SetAttribute("ChatColor",userColor)
		elseif(rankColor) then
			player:SetAttribute("ChatColor",rankColor)
		end
	end
	
	local setColor = function(player,color)
		player:SetAttribute("NameColor",color)
		player:SetAttribute("DisplayNameColor",color)
	end

	function permission:setNameColor(player,rank)
		local rankColor,userColor = config.NameColors.Ranks[rank],(config.NameColors.Users[player.Name] or config.NameColors.Users[player.UserId])
		if(rankColor) then
			setColor(player,rankColor)
		elseif(userColor) then
			setColor(player,userColor)
		end
	end
	
	function permission:resolve(num)
		return permissionToNumber(num)
	end
	
	return permission
end
-- Author: @Jumpathy
-- Name: marketplace.lua
-- Description: Marketplace-ish functions for permission module

return function(module)
	local marketplaceService = game:GetService("MarketplaceService")
	local ownedPasses = {}

	marketplaceService.PromptGamePassPurchaseFinished:Connect(function(player,id,wasPurchased)
		if(wasPurchased) then
			ownedPasses[player.UserId] = ownedPasses[player.UserId] or {}
			ownedPasses[player.UserId][id] = true
			module:get(player.UserId)
		end
	end)

	return function(userId,passId)
		local data = ownedPasses[userId] or {}
		if(not data[passId] and (passId >= 1)) then
			local success,result = pcall(function()
				return marketplaceService:UserOwnsGamePassAsync(userId,passId)
			end)
			if(success) then
				data[passId] = result
				return result
			else
				warn("[Failed to fetch gamepass ownership status,",result,"]")
				return false
			end
		else
			return data[passId]
		end
	end
end
-- Author: @Jumpathy
-- Name: api.lua
-- Description: Better chat server API

return function(constructors,wrap,config,callbacks,permission)
	local topic = "betterchat_bl_update"
	local datastoreName = "betterchat_blacklisted_words2"
	local blacklistHardcoded = config.Messages.BlacklistedWords or {}
	local blacklistCanUseDatastores = config.Messages.BlacklistCanUseDatastores == true
	
	local api = {}
	api.permission = permission
	
	local message = constructors.message
	local textChatService = game:GetService("TextChatService")
	local datastoreService = game:GetService("DataStoreService")
	local messagingService = game:GetService("MessagingService")
	
	local success,blacklistedWords = pcall(function()
		return datastoreService:GetDataStore(datastoreName)
	end)
	if not success then
		blacklistedWords = {
			UpdateAsync = function(self,n,c)
				c()
			end,
			GetAsync = function()
				return
			end,
		}
	end
	
	local chattedEvent = constructors.signal.new()

	local blacklistEnabled = config.Messages.BlacklistEnabled == true
	local blacklist = {}
	local getBlacklisted;

	if blacklistEnabled then
		if blacklistCanUseDatastores then
			local getBlacklist = function()
				local success,response = pcall(function()
					return blacklistedWords:GetAsync("list")
				end)
				if success then
					return response or {}
				else
					warn("[failed to fetch blacklist]",response)
				end
			end

			task.spawn(function()
				local new = getBlacklist()
				if new then
					blacklist = new
				else
					repeat
						warn("[retrying fetching blacklist]")
						new = getBlacklist()
						task.wait(3)
					until new ~= nil
					blacklist = new
				end
			end)

			task.spawn(function()
				local success,response = pcall(function()
					messagingService:SubscribeAsync(topic,function(data)
						blacklist = data.Data
					end)
				end)
				if not success then
					warn("[failed to subscribe]:",response)
				end
			end)
		end

		getBlacklisted = function()
			local list = {}
			for _,obj in pairs(blacklistHardcoded) do
				table.insert(list,obj)
			end
			for _,obj in pairs(blacklist) do
				table.insert(list,obj)
			end
			return list
		end
	end

	api.channel = constructors.channel
	api.speaker = constructors.speaker
	api.network = constructors.network
	api.profiles = constructors.profileService
	api.network:newEvent("systemMessage")

	function api:systemMessage(text)
		api.network:fireClients("systemMessage","all",text)
	end

	function api:resolveMessageContentForPlayer(object,player)
		local data = object.data
		if not data.isPlayer then
			return true,object.message
		else
			if data.filteredSuccessfully then
				local canTalk = constructors.channel.canCommunicate(player.UserId,data.senderId)
				if canTalk then
					return true,object.filtered:GetChatForUserAsync(player.UserId)
				else
					return false,"These users cannot interact"
				end
			else
				return false,"Message was not filtered"
			end
		end
	end

	function api:getMessageById(id)
		if id then
			local object = message:getById(id)
			if object then
				return true,object
			else
				return false
			end
		else
			return false
		end
	end

	if blacklistEnabled then
		if blacklistCanUseDatastores then
			function api:blacklistWord(word,state)
				local currentBlacklist;
				local success,response = pcall(function()
					blacklistedWords:UpdateAsync("list",function(old)
						if not old then
							old = {}
						end
						local idx = table.find(old,word)
						if not state then
							if idx then
								table.remove(old,idx)
							end
						else
							if not idx then
								table.insert(old,word)
							end
						end
						currentBlacklist = old
						return old
					end)
				end)
				if success then
					blacklist = currentBlacklist
					task.spawn(function()
						messagingService:PublishAsync(topic,blacklist)
					end)
				else
					warn("[failed to write]:",response)
				end
			end
		end

		function api:getBlacklist()
			return getBlacklisted()
		end
	end
	
	local _gsub_escape_table = {
		["\000"] = "%z", ["("] = "%(", [")"] = "%)", ["."] = "%.",
		["%"] = "%%", ["+"] = "%+", ["-"] = "%-", ["*"] = "%*",
		["?"] = "%?", ["["] = "%[", ["]"] = "%]", ["^"] = "%^",
		["$"] = "%$",
	}

	local escapePattern = function(str)
		return str:gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", _gsub_escape_table)
	end

	constructors.channel:onChannel(function(channel)
		channel.events.chatted:Connect(function(message)
			chattedEvent:Fire(message)
		end)
	end)
	
	constructors.message.preprocess = function(msg)
		if not blacklistEnabled then
			return msg
		else
			local function normalizeText(text)
				return text:lower():gsub("%s+", ""):gsub("%p", "")
			end

			local blacklist = getBlacklisted()
			local normalizedMsg = normalizeText(msg)

			for _, word in pairs(blacklist) do
				local normalizedWord = normalizeText(word)
				local pattern = escapePattern(normalizedWord)

				while true do
					local startPos, endPos = normalizedMsg:find(pattern)
					if not startPos then break end

					local originalStart = 1
					local normalizedCount = 0
					for i = 1, #msg do
						local char = msg:sub(i, i)
						if normalizeText(char) ~= "" then
							normalizedCount = normalizedCount + 1
						end
						if normalizedCount == startPos then
							originalStart = i
							break
						end
					end

					local originalEnd = originalStart
					normalizedCount = 0
					for i = originalStart, #msg do
						local char = msg:sub(i, i)
						if normalizeText(char) ~= "" then
							normalizedCount = normalizedCount + 1
						end
						if normalizedCount == endPos - startPos + 1 then
							originalEnd = i
							break
						end
					end

					local replacement = string.rep("#", originalEnd - originalStart + 1)
					msg = msg:sub(1, originalStart - 1) .. replacement .. msg:sub(originalEnd + 1)
					normalizedMsg = normalizedMsg:sub(1, startPos - 1) .. string.rep("#", endPos - startPos + 1) .. normalizedMsg:sub(endPos + 1)
				end
			end

			return msg
		end
	end
	
	api.chatted = chattedEvent
	api.messageDeleted = message.messageDeleted
	
	if config.User.SaveData.Advanced.HandleOwnData then
		function api:registerGetProfileFunction(callback)
			constructors.profileService:register(callback)
		end
		
		function api:registerUnloadProfileFunction(callback)
			constructors.profileService:register2(callback)
		end
	end
	
	api.onCustomEmojiListRequest = {
		Connect = function(self,callback)
			table.insert(callbacks,callback)
		end
	}
	
	return wrap(api)
end
-- Author: @Jumpathy
-- Name: filter.lua
-- Description: Chat filtering

return function(config,richText,msg)
	-- WARNING: Don't edit this unless you know what you're doing! A compromised chat filter can lead to your game being deleted.
	
	local filter = {}
	local chatService = game:GetService("Chat")
	local textService = game:GetService("TextService")
	local runService = game:GetService("RunService")
	local failedCharacter = config.Messages.FilterProcessingCharacter

	local handleFilterError = function(result)
		warn("[Better chat]: Internal error whilst filtering chat",result)
	end

	local psuedoFrom = function(message)
		return {
			GetChatForUserAsync = function()
				return message
			end
		}
	end
	
	local wrap = function(filterObj,recombineFunc)
		local obj = {}
		
		function obj:GetChatForUserAsync(...)
			return recombineFunc(richText:escape(filterObj:GetChatForUserAsync(...)))
		end
		
		return obj
	end
	
	function filter.new(message,player,isBroadcast,isMarkdown)
		local stripped,recombine,emojis
		if isMarkdown then
			local marked = richText:markdown(richText:escape(message))
			stripped,recombine,emojis = richText:processForFilter(marked,player)
			if recombine then
				message = stripped
			end
		end
		if(not isBroadcast) then
			if(runService:IsStudio()) then
				task.wait(0.1) --> simulate latency
			end
			if(player ~= nil) then
				local success,result = pcall(function()
					local handle = msg.preprocess(richText:unescape(message))
					return textService:FilterStringAsync(handle,player.UserId)
				end)
				if(success) then
					if recombine then
						return true,wrap(result,recombine),emojis
					else
						return true,result,emojis
					end
				elseif(not success) then
					handleFilterError(result)
					return false,psuedoFrom(string.rep(failedCharacter,#message))
				end
			elseif(not player) then
				return true,psuedoFrom(message),emojis
			end
		else
			local success,response = pcall(function()
				return chatService:FilterStringForBroadcast(message,player)
			end)
			if(success) then
				return true,response,emojis
			else
				handleFilterError(response)
				return false,string.rep(failedCharacter,#message)
			end
		end
	end

	return filter
end
-- Author: @Jumpathy
-- Name: utility.lua
-- Description: Utility functions
-- Credit: @Xsitsu (base code for some functions)

local deps = script.Parent:WaitForChild("dependencies")

return function(config)
	local extract = require(deps:WaitForChild("extract"))
	local httpService = game:GetService("HttpService")
	
	local maxMessageLength = config.Messages.MaximumLength
	local maxBytes = 6
	local utility = {}

	local nameColors = config.User.NameColors
	local getNameValue = function(name)
		local value = 0
		local nameLength = string.len(name)
		for i = 1,nameLength do
			local charValue = string.byte(name:sub(i,i))
			local reverseIndex = nameLength - i + 1
			if(nameLength % 2 == 1) then
				reverseIndex -= 1
			end
			if(reverseIndex % 4 >= 2) then
				charValue = -charValue
			end
			value += charValue
		end
		return value
	end

	function utility:getNameColor(name)
		return nameColors[((getNameValue(name)) % #nameColors) + 1]
	end

	function utility:getSendability(message)
		if((not(string.len(message) > maxMessageLength * maxBytes))) then
			if((not(utf8.len(message) == nil))) then
				if(not(utf8.len(utf8.nfcnormalize(message)) > maxMessageLength)) then
					return(true)
				end
			end
		end
		return(false)
	end

	function utility:fixWhitespace(message)
		local disallowedWhitespace = config.Messages.DisallowedWhitespace
		for _,character in pairs(disallowedWhitespace) do
			if(character == "\t") then
				message = message:gsub(character,string.char(32))
			else
				message = message:gsub(character,"")
			end
		end
		message = message:gsub("\n","")
		message = message:gsub("[ ]+"," ")
		if(message:sub(1,1) == " ") then
			local endAt = 0
			for i = 1,#message do
				endAt = i
				if(message:sub(i,i) ~= " ") then
					break
				end
			end
			message = message:sub(endAt,#message)
		end
		return message
	end
	
	function utility:constructViewportDescription(character)
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if(humanoid) then
			return extract(humanoid:GetAppliedDescription())
		end
	end
	
	function utility:newGuid()
		return httpService:GenerateGUID(false):gsub("-","")
	end
	
	function utility:verifyChatInstalled(player)
		local source = deps:WaitForChild("chatInstaller"):Clone()
		local house = Instance.new("ScreenGui")
		house.Name = "betterChatInstaller"
		house.ResetOnSpawn = false
		source.Parent = house
		house.Parent = player.PlayerGui
	end
	
	return utility
end
-- Author: @Jumpathy
-- Name: chatInstaller.lua
-- Description: Verify chat installation on clientside

local player = game:GetService("Players").LocalPlayer
local holder = game:GetService("StarterPlayer").StarterPlayerScripts
local scripts = player.PlayerScripts

if(not scripts:FindFirstChild("betterChatClient")) then
	holder:WaitForChild("betterChatClient").Parent = scripts
end

task.wait()
script.Parent:Destroy()
-- Author: @Jumpathy
-- Name: extract.lua
-- Description: Extract humanoid description to a table

local propertiesToExtract = {
	"Archivable",
	"BackAccessory",
	"BodyTypeScale",
	"ClimbAnimation",
	"DepthScale",
	"Face",
	"FaceAccessory",
	"FallAnimation",
	"FrontAccessory",
	"GraphicTShirt",
	"HairAccessory",
	"HatAccessory",
	"Head",
	"HeadColor",
	"HeadScale",
	"HeightScale",
	"IdleAnimation",
	"JumpAnimation",
	"LeftArm",
	"LeftArmColor",
	"LeftLeg",
	"LeftLegColor",
	"NeckAccessory",
	"Pants",
	"ProportionScale",
	"RightArm",
	"RightArmColor",
	"RightLeg",
	"RightLegColor",
	"RunAnimation",
	"Shirt",
	"ShouldersAccessory",
	"SwimAnimation",
	"Torso",
	"TorsoColor",
	"WaistAccessory",
	"WalkAnimation",
	"WidthScale"
}

return function(description)
	local extracted = {}
	for _,property in pairs(propertiesToExtract) do
		extracted[property] = description[property]
	end
	return extracted
end
-- Author: @Jumpathy
-- Name: network.lua
-- Description: Remote event wrapper for readability

local network = {};
local blank = function() end
local events = script.Parent:WaitForChild("events");
local inDebug = false
local logs = {}

local new = function(class,name)
	local object = Instance.new(class);
	object.Parent = events;
	object.Name = name;
	return object;
end

local get = function(name)
	return events:WaitForChild(name,12)
end

local log = function(event,data)
	logs[event.Name] = logs[event.Name] or {}
	table.insert(logs[event.Name],data)
end

-- Server:

local formatTime = function()
	local time = os.time()
	local milliseconds = math.floor((os.clock() % 1) * 1000)
	return os.date("%H:%M:%S", time) .. string.format(".%03d", milliseconds)
end

function network:newEvent(name,callback,bypass)
	if inDebug and not bypass then
		local event = new("RemoteEvent",name)
		event.OnServerEvent:Connect(function(...)
			local data = {
				on = formatTime(),
				sent = {...},
				identifier = game:GetService("HttpService"):GenerateGUID()
			}
			log(event,data);
			network:fireClients("logUpdated","all",event,data);
			(callback or blank)(...);
		end)
	else
		new("RemoteEvent",name).OnServerEvent:Connect(callback or blank);
	end
end

function network:newFunction(name,callback)
	if inDebug then
		local event = new("RemoteFunction",name)
		event.OnServerInvoke = function(...)
			local response = {(callback or blank)(...)}
			local data = {
				on = formatTime(),
				sent = {
					{
						request = {...},
						response = response
					}
				},
				identifier = game:GetService("HttpService"):GenerateGUID()
			}
			log(event,data);
			network:fireClients("logUpdated","all",event,data);
			return unpack(response)
		end
	else
		new("RemoteFunction",name).OnServerInvoke = callback or blank;
	end
end

function network:fireClients(name,clients,...)
	local event = get(name);
	if(clients == "all") then
		event:FireAllClients(...);
	else
		for _,client in pairs(clients) do
			if(typeof(client) == "table") then
				client = client.player
			end
			if(client) then
				event:FireClient(client,...);
			end
		end
	end
end

-- Client:

network.onClientEvent = function(name,callback)
	get(name).OnClientEvent:Connect(callback)
end

function network:invoke(name,...)
	return get(name):InvokeServer(...);
end

function network:fire(name,...)
	get(name):FireServer(...);
end

function network:setup(debugMode)
	inDebug = debugMode
	if inDebug then
		warn("[BetterChat]: Debug mode enabled, memory usage will go up as a result")
		warn("[BetterChat]: Debug mode will expose all calls to the server for the chat to all clients, your messages will not be private.")
		network:newFunction("getEventLogs",function(player,event)
			return logs[event.Name] or {}
		end,true)
		network:newEvent("logUpdated",nil,true)
	end
	return network
end

return network;
--------------------------------------------------------------------------------
--               Batched Yield-Safe Signal Implementation                     --
-- This is a Signal class which has effectively identical behavior to a       --
-- normal RBXScriptSignal, with the only difference being a couple extra      --
-- stack frames at the bottom of the stack trace when an error is thrown.     --
-- This implementation caches runner coroutines, so the ability to yield in   --
-- the signal handlers comes at minimal extra cost over a naive signal        --
-- implementation that either always or never spawns a thread.                --
--                                                                            --
-- API:                                                                       --
--   local Signal = require(THIS MODULE)                                      --
--   local sig = Signal.new()                                                 --
--   local connection = sig:Connect(function(arg1, arg2, ...) ... end)        --
--   sig:Fire(arg1, arg2, ...)                                                --
--   connection:Disconnect()                                                  --
--   sig:DisconnectAll()                                                      --
--   local arg1, arg2, ... = sig:Wait()                                       --
--                                                                            --
-- Licence:                                                                   --
--   Licenced under the MIT licence.                                          --
--                                                                            --
-- Authors:                                                                   --
--   stravant - July 31st, 2021 - Created the file.                           --
--------------------------------------------------------------------------------

-- The currently idle thread to run the next handler on
local freeRunnerThread = nil

-- Function which acquires the currently idle handler runner thread, runs the
-- function fn on it, and then releases the thread, returning it to being the
-- currently idle one.
-- If there was a currently idle runner thread already, that's okay, that old
-- one will just get thrown and eventually GCed.
local function acquireRunnerThreadAndCallEventHandler(fn, ...)
	local acquiredRunnerThread = freeRunnerThread
	freeRunnerThread = nil
	fn(...)
	-- The handler finished running, this runner thread is free again.
	freeRunnerThread = acquiredRunnerThread
end

-- Coroutine runner that we create coroutines of. The coroutine can be 
-- repeatedly resumed with functions to run followed by the argument to run
-- them with.
local function runEventHandlerInFreeThread(...)
	acquireRunnerThreadAndCallEventHandler(...)
	while true do
		acquireRunnerThreadAndCallEventHandler(coroutine.yield())
	end
end

-- Connection class
local Connection = {}
Connection.__index = Connection

function Connection.new(signal, fn)
	return setmetatable({
		_connected = true,
		_signal = signal,
		_fn = fn,
		_next = false,
	}, Connection)
end

function Connection:Disconnect()
	assert(self._connected, "Can't disconnect a connection twice.", 2)
	self._connected = false

	-- Unhook the node, but DON'T clear it. That way any fire calls that are
	-- currently sitting on this node will be able to iterate forwards off of
	-- it, but any subsequent fire calls will not hit it, and it will be GCed
	-- when no more fire calls are sitting on it.
	if self._signal._handlerListHead == self then
		self._signal._handlerListHead = self._next
	else
		local prev = self._signal._handlerListHead
		while prev and prev._next ~= self do
			prev = prev._next
		end
		if prev then
			prev._next = self._next
		end
	end
end

-- Make Connection strict
setmetatable(Connection, {
	__index = function(tb, key)
		error(("Attempt to get Connection::%s (not a valid member)"):format(tostring(key)), 2)
	end,
	__newindex = function(tb, key, value)
		error(("Attempt to set Connection::%s (not a valid member)"):format(tostring(key)), 2)
	end
})

-- Signal class
local Signal = {}
Signal.__index = Signal
Signal.SigId = game.JobId

function Signal.new()
	return setmetatable({
		_handlerListHead = false
	}, Signal)
end

function Signal:Connect(fn)
	local connection = Connection.new(self, fn)
	if self._handlerListHead then
		connection._next = self._handlerListHead
		self._handlerListHead = connection
	else
		self._handlerListHead = connection
	end
	return connection
end

-- Disconnect all handlers. Since we use a linked list it suffices to clear the
-- reference to the head handler.
function Signal:DisconnectAll()
	self._handlerListHead = false
end

-- Signal:Fire(...) implemented by running the handler functions on the
-- coRunnerThread, and any time the resulting thread yielded without returning
-- to us, that means that it yielded to the Roblox scheduler and has been taken
-- over by Roblox scheduling, meaning we have to make a new coroutine runner.
function Signal:Fire(...)
	local item = self._handlerListHead
	while item do
		if item._connected then
			if not freeRunnerThread then
				freeRunnerThread = coroutine.create(runEventHandlerInFreeThread)
			end
			task.spawn(freeRunnerThread, item._fn, ...)
		end
		item = item._next
	end
end

-- Implement Signal:Wait() in terms of a temporary connection using
-- a Signal:Connect() which disconnects itself.
function Signal:Wait()
	local waitingCoroutine = coroutine.running()
	local cn;
	cn = self:Connect(function(...)
		cn:Disconnect()
		task.spawn(waitingCoroutine, ...)
	end)
	return coroutine.yield()
end

-- Make signal strict
setmetatable(Signal, {
	__index = function(tb, key)
		error(("Attempt to get Signal::%s (not a valid member)"):format(tostring(key)), 2)
	end,
	__newindex = function(tb, key, value)
		error(("Attempt to set Signal::%s (not a valid member)"):format(tostring(key)), 2)
	end
})

return Signal
-- Author: @Jumpathy
-- Name: wrap.lua
-- Description: Wraps a table so different cases like 'SNAKE_CASE' can be used to make developers feel comfortable

local splitFunctionName = function(text)
	return string.sub(string.gsub(text,"(%u)"," %1"),1,-1):split(string.char(32))
end

local constructFunctionNames = function(original)
	local split = splitFunctionName(original)
	return {
		original, -- camelCase
		split[1]:sub(1,1):upper() .. split[1]:sub(2,#split[1]) .. (#split >= 2 and  table.concat({unpack(split,2,#split)},"") or ""), -- PascalCase
		table.concat(split,"_"):upper(), -- SNAKE_CASE
		table.concat(split,"_"):lower() -- snake_case
	}
end

local cache = {}
local reference = {}
local cachedWrappers = {}

wrap = function(api)
	local main = cachedWrappers[tostring(api)] or {}
	cachedWrappers[tostring(api)] = main

	if(not getmetatable(main)) then
		setmetatable(main,{
			__index = function(_,idx)
				for name,value in pairs(api) do
					cache[name] = cache[name] or constructFunctionNames(name)
					for _,newName in pairs(cache[name]) do
						reference[newName] = name
					end
				end
				if(reference[idx]) then
					local name = reference[idx]
					if(typeof(api[name]) == "table") then
						if api[name]["SigId"] then
							return api[name]
						end
						return wrap(api[name])
					end
					return api[name]
				end
			end,
		})
	end
	
	function main:getOriginal()
		return api
	end

	return main
end

return wrap
-- Author: @Jumpathy
-- Name: richText.lua
-- Description: Rich text formatting

return function(config,getAllowedEmojisFor)
	local richText = {}
	local f = math.floor
	local runService = game:GetService("RunService")
	local isServer = runService:IsServer()
	local httpService = game:GetService("HttpService")
	local guid = httpService:GenerateGUID()
	
	local fromXml = require(script.Parent.Parent.xml)

	function richText:escape(text) -- like one of the most important functions lol
		return text:gsub(".",{
			["<"] = "&lt;",
			[">"] = "&gt;",
			["\""] = "&quot;",
			["'"] = "&apos;",
			["&"] = "&amp;"
		})
	end

	function richText:unescape(text)
		local tbl = {
			["&lt;"] = "<",
			["&gt;"] = ">",
			["&quot;"] = "\"",
			["&apos;"] = "'",
			["&amp;"] = "&"
		}
		for pattern, replacement in pairs(tbl) do
			text = text:gsub(pattern, replacement)
		end
		return text
	end

	function richText:getId()
		return guid
	end

	function richText:colorize(text,rgb)
		return("<font color=\"rgb(%s)\">%s</font>"):format(richText:tostringRgb(rgb),richText:escape(text))
	end

	local parse = function(hex,...)
		local packed = {}
		for _,pos in pairs({...}) do
			table.insert(packed,tonumber(("0x%s"):format(hex:sub(unpack(pos)))))
		end
		return unpack(packed)
	end

	function richText:tostringRgb(rgb)
		return("%s,%s,%s"):format(f(rgb.R * 255),f(rgb.G * 255),f(rgb.B * 255))
	end

	function richText:hexToRgb(hex)
		return Color3.fromRGB(parse(hex:gsub("#",""),{1,2},{3,4},{5,6}))
	end

	local markdown = require(script.Parent:WaitForChild("markdown"))(richText,config)

	function richText:markdown(text,bypass)
		if isServer or bypass then
			if text:sub(1,1) == [[\]] then
				return text:sub(2,#text)
			end
			return markdown:format(text)
		else
			-- new update has server process rich text
			return text
		end
	end

	function richText:mark(text)
		return markdown:format(text)
	end

	local stripXMLTags = function(text)
		return (text:gsub("<.->",""))
	end

	function richText:strip(message)
		return stripXMLTags(message)
	end

	local restoreTags = function(original,filtered)
		local result = ""
		local originalIndex = 1
		local filteredIndex = 1

		while originalIndex <= #original do
			local char = original:sub(originalIndex,originalIndex)
			if char == "<" then
				local tagEnd = original:find(">",originalIndex)
				result = result .. original:sub(originalIndex,tagEnd)
				originalIndex = tagEnd + 1
			else
				result = result .. filtered:sub(filteredIndex,filteredIndex)
				filteredIndex = filteredIndex + 1
				originalIndex = originalIndex + 1
			end
		end

		return result
	end

	local getIndex = function(dict)
		if(dict[1]) then
			return 1
		end
		for k,v in pairs(dict) do
			if(k ~= "_attr") then
				return k
			end
		end
	end

	local recurse;
	recurse = function(tag,index,depth,base)
		depth += 1
		local idx = getIndex(tag)
		if not base then
			base = tag
		end
		if(typeof(tag[idx]) == "table") then
			if(depth < 100) then
				local indexed = index or {}
				table.insert(indexed,idx)
				return recurse(tag[idx],indexed,depth,base)
			end
		else
			local indexed = index or {}
			table.insert(indexed,idx)
			return indexed
		end
	end

	local allTags = function(tags)
		return recurse(tags,nil,0)
	end

	local _gsub_escape_table = {
		["\000"] = "%z", ["("] = "%(", [")"] = "%)", ["."] = "%.",
		["%"] = "%%", ["+"] = "%+", ["-"] = "%-", ["*"] = "%*",
		["?"] = "%?", ["["] = "%[", ["]"] = "%]", ["^"] = "%^",
		["$"] = "%$",
	}

	local escapePattern = function(str)
		return str:gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", _gsub_escape_table)
	end

	local byLetter = function(inputString,callback)
		for idx,codepoint in utf8.codes(inputString) do
			callback(utf8.char(codepoint),idx)
		end
	end

	richText.splitXmlAndText = function(input)
		local result = {}
		local stack = {}
		local lastIndex = 1

		-- Helper function to add text segments to the result
		local function addText(start, stop)
			if start <= stop then
				local text = input:sub(start, stop)
				if text:find("%S") then -- Check if there's any non-whitespace character
					table.insert(result, {["type"] = "text", content = text})
				end
			end
		end

		while true do
			local tagStart, tagEnd = input:find("</?[%w:][^>]*>", lastIndex)
			if not tagStart then
				addText(lastIndex, #input)
				break
			end

			if #stack == 0 then
				addText(lastIndex, tagStart - 1)
			end

			local tag = input:sub(tagStart, tagEnd)
			if tag:match("^</") then -- Closing tag
				if #stack > 0 then
					local openTagStart = table.remove(stack)
					if #stack == 0 then
						table.insert(result, {["type"] = "xml", content = (input:sub(openTagStart, tagEnd))})
					end
				end
			else
				table.insert(stack, tagStart)
			end

			lastIndex = tagEnd + 1
		end

		return result
	end

	local getIndex = function(dict)
		if(dict[1]) then
			return 1
		end
		for k,v in pairs(dict) do
			if(k ~= "_attr") then
				return k
			end
		end
	end
	
	local generateTag = function(id,inner)
		return `<image id="{id}">{inner or "custom_emoji"}</image>`
	end

	function richText:processForFilter(message,player)
		local customEmojis = {}
		local count = 0
		local list = getAllowedEmojisFor(player)

		local getFrom = function(id)
			for k,v in pairs(list) do
				if typeof(v) == "table" and v.Image == id then
					return k
				elseif(v == id) then
					return k
				end
			end
		end
		
		local data = {}
		for emojiName,emojiContent in pairs(list) do
			if typeof(emojiContent) == "table" then
				data[emojiName] = emojiContent
				emojiContent = emojiContent.Image
			end
			local imgTag = generateTag(emojiContent)
			local old = message
			message = message:gsub(escapePattern(`:{emojiName}:`),imgTag)
		end

		local split = richText.splitXmlAndText(message)
		
		for _,v in pairs(split) do
			if(v["type"] == "xml") then
				local parsed = fromXml(v["content"])
				for _,tag in pairs(allTags(parsed)) do
					if(tag == "image") then
						local imgId = parsed[tag]["_attr"]["id"]
						local imgTag = generateTag(imgId,"::")
						local imgTag2 = generateTag(imgId,`:{getFrom(imgId)}:`)
						table.insert(customEmojis,{
							imgTag,
							imgId,
							v["content"],
							imgTag2,
							data[getFrom(imgId)]
						})
					end
					parsed = parsed[tag]
				end
			end
		end
		
		for _,emoji in pairs(customEmojis) do
			message = message:gsub(escapePattern(emoji[3]),emoji[1])
		end
			
		local strippedText = stripXMLTags(message)	
		return strippedText,function(filteredText)
			local restored = restoreTags(message,filteredText)
			-- this will filter out the custom emojis to prevent smart bypasses lol
			for _,data in pairs(customEmojis) do
				local toReplace = data[1]
				local replaceWith = data[4]
				restored = restored:gsub(toReplace,replaceWith)
				data[1] = replaceWith
				data[4] = toReplace
			end
			return restored
		end,customEmojis
	end

	return richText
end
-- Author: @Jumpathy
-- Name: markdown.lua
-- Description: Chat system text formatting system, eg: **bold** --> (imagine this is now bold text)
-- Note: I added a ton of comments to this to try to explain what in the world is my wacky-looking code is even attempting to do
-- Edit like 3 months later: yea thank god I added those comments lol I don't even know what this says AND I WROTE IT

local colorModule = require(script.Parent:WaitForChild("color"))

return function(rich_text,config)
	local guid = rich_text:getId()
	local availableFonts = Enum.Font:GetEnumItems()
	
	local enabled = config.Messages.Markdown or {
		ItalicBold = true,
		Bold = true,
		Italics = true,
		Underlines = true,
		Strikethrough = true,
		Colored = true,
		Outlines = true,
	}
	
	if enabled.Fonts == nil then
		enabled.Fonts = true
	end
		
	local parse_color = function(color)
		color = color:gsub(" ","") -- remove spaces
		local default = Color3.fromRGB(255,255,255)
		if(color:sub(1,1) == "#" and #color >= 7) then -- check if they passed a hex value
			return colorModule.rgb_to_hex(colorModule.hex_to_rgb(color))
		elseif(color:find(",")) then -- check if they passed a RGB value
			local rgb = {}
			for _,num in pairs(string.split(color,",")) do -- R,G,B --> {R,G,B}
				table.insert(rgb,math.clamp((tonumber(num) or 0),0,255))
			end
			return colorModule.rgb_to_hex(Color3.fromRGB(unpack(rgb)))
		else
			return colorModule.rgb_to_hex(colorModule.matchBrickcolor(color))
		end
	end
	
	local parse_font = function(text)
		for _,font in pairs(availableFonts) do
			if(font.Name:lower() == text) then
				return font.Name
			end
		end
	end
	
	local font_tag = function(text,info)
		if info and #info >= 1 then
			local font = parse_font(info:lower():gsub(" ",""))
			if font then
				return ('<font face="%s">%s</font>'):format(font,text)
			end
		end
		return text
	end

	local color_tag = function(text,color) -- place text in a rich text color tag with the specified color
		return ('<font color="%s">%s</font>'):format(parse_color(color),text)
	end
	
	local stroke_tag = function(text,color)
		return ('<stroke thickness = "1" join = "round" color="%s">%s</stroke>'):format(parse_color(color),text)
	end
	
	local main = {}
	
	local regulartag = function(text,tag,format)
		main = {}
		local from = function(t,c) --> generates a XML tag for opening and closing (c -> true = closing): eg: <a> </a>
			if c then
				return ("<%s%s>"):format((c and "/" or ""),t)
			else
				return(`<%s>`):format(t)
			end
		end
		local opening = ""
		local closing = ""
		for i = 1,#tag do
			table.insert(main,1,tag:sub(i,i)) -- insert this in the reversed order of the tags
			-- when using multiple tags, to close it you need to close it with the same tags but backwards (this table manages that)
			-- ex: <i><b>hi</b></i>
			opening = opening .. from(tag:sub(i,i))
		end
		for _,v in pairs(main) do
			closing = closing .. from(v,true)
		end
		return (opening .. (text) .. closing)
	end

	local customcolor = function(b)
		-- color format ex: (255,0,0 / hi)
		local s,e = string.find(b,"/") -- look for the separator as seen in the example
		if(s and e and b:sub(1,1) ~= "<") then -- if it has the separator, then make sure it wasn't also falsified by a closing tag like </i>
			if b and b:find("<i>") then
				if(b:sub(s-1,s+2) == "</i>") then
					return ("(" .. b .. ")")
				end				
			end
			local split = {b:sub(1,e - 1),b:sub(e + 1,#b)} -- don't use string.split because of the other formats like *italics* would throw it off with the closing tags.
			local color = split[1]
			local awaitingClose = (split[2]:sub(1,1) == string.char(32)) -- see if we need to remove spaces at the start from when it's separated by the '/' (so messages arent padded out weirdly)
			local text = split[2]:gsub(".",function(c)
				if(awaitingClose) then
					local is_space = (c == string.char(32))
					awaitingClose = is_space
					return(is_space and "" or c)
				else
					return c
				end
			end)
			return color_tag(text,color) -- actually use this information lol
		else -- if it was a false alarm by someone just using text like "im murderer (im not)" then make sure to return it properly
			return "(" .. b .. ")"
		end
	end
	
	local filter = function(tbl)
		local ret = {}
		for _,v in pairs(tbl) do
			if(v) then
				table.insert(ret,v)
			end
		end
		return ret
	end
	
	local wrap = function(b,start,close,callback)
		local s, e = string.find(b, "/")
		if s and e and b:sub(1, 1) ~= "<" then
			if b and b:find("<i>") then
				if b:sub(s - 1, s + 2) == "</i>" then
					return start .. b .. close
				end				
			end
			local split = {b:sub(1, e - 1), b:sub(e + 1, #b)}
			local color = split[1]
			local text = split[2]:gsub("^%s*(.-)%s*$", "%1") -- trim leading/trailing spaces

			-- Ensure text is not empty or invalid
			if text == "" or text:match("^%-+$") then
				text = "-" -- replace with a placeholder if necessary
			end

			return callback(text, color)
		else
			return start .. b .. close
		end
	end
	
	local customcolor = function(b)
		return wrap(b,"(",")",color_tag)
	end
	
	local outline = function(b)
		return wrap(b,"[","]",stroke_tag)
	end
	
	local font = function(b)
		return wrap(b,"&lt;","&gt;",font_tag)
	end
	
	local formats = filter({
		-- don't change the order of these pls lol
		-- they're priority-based so things like *** would be grabbed before ** etc
		enabled.ItalicBold and {"***","ib",regulartag}, --> ***hello*** means italic and bold
		enabled.Bold and {"**","b",regulartag}, --> **bold** means bold
		enabled.Italics and {"*","i",regulartag}, --> *italics* means italic ofc
		enabled.Underlines and {"__","u",regulartag}, --> __under__ underlines your text
		enabled.Italics and {"_","i",regulartag}, --> _hi_ makes italics
		enabled.Strikethrough and {"~~","s",regulartag}, --> ~~hi~~ makes the text crossed through
		enabled.Colored and {"(","",customcolor,")"}, --> (255,0,0 / red) (#FF0000 / red) (Really red / red) --> red text
		enabled.Outlines and {"[","",outline,"]"},
		enabled.Fonts and {"&lt;","",font,"&gt;"},
	})

	local _gsub_escape_table = {
		["\000"] = "%z", ["("] = "%(", [")"] = "%)", ["."] = "%.",
		["%"] = "%%", ["+"] = "%+", ["-"] = "%-", ["*"] = "%*",
		["?"] = "%?", ["["] = "%[", ["]"] = "%]", ["^"] = "%^",
		["$"] = "%$",
	}

	local escapePattern = function(str)
		return str:gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", _gsub_escape_table)
	end
	
	local new = function(p1,p2) -- generates the pattern needed to find text
		return(escapePattern(p1) .. "(.-)" .. escapePattern(p2))
	end

	local markdownFormat
	markdownFormat = function(text,depth,canUseColor)
		if(not depth) then
			--text = rich_text:escape(text)
		end
		local base = text
		local matches = {gsub = {},count = 0}
		for _,info in pairs(formats) do
			text = text:gsub(new(info[1],info[4] or info[1]),function(between)
				-- we found some text between a pattern like '*hi*' and now we reassemble it so that it can be removed later
				-- this whole thing makes sure that: *yo* -> <i>yo</i>
				local matched = info[1] .. between .. (info[4] or info[1])
				-- this checks to make sure that the pattern isn't just something like ________ (in my past system this just removed the whole thing)
				local doContinue = not (matched == string.rep(matched:sub(1,1),#matched))
				if(doContinue) then
					-- at the end all the info in the 'gsub' table will be ran
					table.insert(matches.gsub,{
						escapePattern(matched), -- the text we want to remove
						info[3](between,info[2],info[1]) -- this is the text we'll replace like '<i>hi</i>'
					})
					matches.count += 1 -- later we do recursive checks to make sure that we get all of the patterns and if this never goes above zero then the recursive check ends
					return ""
				end
			end)
		end
		
		-- if anything is passed we'll replace all the text to be formatted properly

		for _,rep in pairs(matches.gsub) do
			base = base:gsub(unpack(rep))
		end

		-- when this function is first called, it won't have the 'depth' argument and it can do another check

		-- since when text is detected like "*__underline but italics__*" it'll only get the italics part but then we run this to make sure it also gets the underline
		if(not depth) then
			local layers = 0
			if(matches.count >= 1) then -- then we'll check again if there ever was some text found like *italics*
				repeat -- repeat this whole code 25 times or until there's no more *special text* found
					layers += 1
					base,matches = markdownFormat(base,layers,canUseColor)
				until(layers >= 25 or matches.count == 0)
			end
		end
		return base,matches
	end

	return {
		format = function(_,text,canUseColor) -- :format("*italics*") --> "<i>italics</i>"
			local formatted,matches = markdownFormat(text,nil,canUseColor)
			return formatted
		end
	}
end
-- Author: @Jumpathy
-- Name: color.lua
-- Description: Color functions
-- Credit: @Blockzez - hex stuff lol

local brickColors = {}
local blank = {}

for i = 1,1032 do -- iirc there's around 1032 brick colors (this gets all of them and adds them to a list)
	local col = BrickColor.new(i)
	local n = col.Name
	local s = n:sub(1,1):lower()
	-- the list is ordered by first character (to prevent it from running ~= 1,032 checks every time this is parsed)
	brickColors[s] = brickColors[s] or {}
	brickColors[s][n] = col.Color
end

local rgb_to_hex = function(color)
	return string.format("#%02X%02X%02X",color.R * 0xFF,color.G * 0xFF,color.B * 0xFF)
end

local hex_to_rgb = function(hex) -- hex to rgb
	local r,g,b = string.match(hex,"^#?(%w%w)(%w%w)(%w%w)$")
	return Color3.fromRGB(tonumber(r,16),tonumber(g,16),tonumber(b,16))
end

local matchBrickcolor = function(toMatch)
	local defaultColor = Color3.fromRGB(0,0,0)
	if(string.len(toMatch) >= 1) then
		for name,col in pairs(brickColors[toMatch:sub(1,1):lower()] or blank) do
			if(name:gsub(string.char(32),""):sub(1,#toMatch):lower() == toMatch:lower()) then
				return(col)
			end
		end
	end
	return(defaultColor)
end

return {
	hex_to_rgb = hex_to_rgb,
	rgb_to_hex = rgb_to_hex,
	matchBrickcolor = matchBrickcolor
}
-- update has a much more friendly overhead

return function(s)
	local stack = {}
	local top = {}
	table.insert(stack, top)

	local i = 1
	while i <= #s do
		if s:sub(i, i) == "<" then
			if s:sub(i+1, i+1) == "/" then
				-- Closing tag
				table.remove(stack)
				top = stack[#stack]
				local closeIndex = s:find(">", i)
				if closeIndex then
					i = closeIndex + 1
				else
					i = #s + 1
				end
			else
				-- Opening tag
				local j = s:find(">", i)
				if not j then
					j = #s + 1
				end
				local tag = s:sub(i+1, j-1)
				local name, attrs = tag:match("(%w+)(.*)$")
				local node = {}

				-- Parse attributes
				if attrs then
					node._attr = {}
					for k, v in attrs:gmatch('%s(%w+)="([^"]*)"') do
						node._attr[k] = v
					end
				end

				if top[name] then
					if type(top[name]) ~= "table" then
						top[name] = {top[name]}
					end
					table.insert(top[name], node)
				else
					top[name] = node
				end
				top = node
				table.insert(stack, top)
				i = j + 1
			end
		else
			-- Text content
			local j = s:find("<", i) or #s + 1
			local text = s:sub(i, j - 1)
			if text:find("%S") then  -- Only add non-empty text
				if #top == 0 then
					top[1] = text
				else
					table.insert(top, text)
				end
			end
			i = j
		end
	end

	return stack[1]
end
-- Author: @Jumpathy
-- Name: start.lua
-- Description: Chat system start on client

local replicatedStorage = game:GetService("ReplicatedStorage")
local userInput = game:GetService("UserInputService")
local guiService = game:GetService("GuiService")
local runService = game:GetService("RunService")
local chatService = game:GetService("Chat")
local players = game:GetService("Players")
local heartbeat = runService.Heartbeat

-- platform:

local scaleToOffset = function(size)
	local viewportSize = workspace.CurrentCamera.ViewportSize
	return(UDim2.fromOffset(
		math.clamp((viewportSize.X * size.X.Scale) + size.X.Offset,50,math.huge),
		math.clamp((viewportSize.Y * size.Y.Scale) + size.Y.Offset,50,math.huge)
	))
end

local platform = function()
	if(userInput.TouchEnabled) then
		return((workspace.CurrentCamera.ViewportSize.Y < 600) and "Phone" or "Tablet")
	else
		return(guiService:IsTenFootInterface() and "Console" or "Desktop")
	end
end

local currentPlatform = platform()
if(currentPlatform ~= "Console") then
	-- wait for server:

	local betterchat_shared = replicatedStorage:WaitForChild("betterchat_shared")
	local network = require(betterchat_shared:WaitForChild("network"))
	local addons = betterchat_shared:WaitForChild("addons"):WaitForChild("Client")
	local signal = require(betterchat_shared:WaitForChild("signal"))
	local wrap = require(betterchat_shared:WaitForChild("wrap"))
	
	-- info:
	
	local debugMode = betterchat_shared:GetAttribute("debugMode")
	
	-- client:

	local container = script.Parent
	local modules = container:WaitForChild("modules")
	local core = modules:WaitForChild("core")

	local connections = require(core:WaitForChild("connections"))
	local privacy = require(modules:WaitForChild("privacy"))
	local bubbleChat = require(modules:WaitForChild("bubbleChat"):WaitForChild("main"))
	local settingsMenu = require(core:WaitForChild("settingsMenu"))
	
	local localPlayer = game:GetService("Players").LocalPlayer
	local playerGui = localPlayer.PlayerGui
	
	if(not privacy.chatDisabled) then

		-- change:
		
		local elements = core:WaitForChild("elements")
		local gui = require(elements:WaitForChild("chatGui"))()
		gui.Parent = playerGui
		
		local container = gui:WaitForChild("Container")
		
		local chatbarContainer = container:WaitForChild("ChatBarContainer"):WaitForChild("Main")
		local chatbox = chatbarContainer:WaitForChild("Container"):WaitForChild("Box"):WaitForChild("Input")
		local config = network:invoke("requestConfig")
		
		local mutelist = {}
		local canMuteSelf = false
		
		local environment = {
			utility = require(core:WaitForChild("utility")),
			localization = require(core:WaitForChild("localization"))(),
			richText = require(betterchat_shared:WaitForChild("formatting"):WaitForChild("richText"))(config),
			connections = connections,
			network = network,
			config = config,
			messages = {},
			main_ui = container,
			lastRefresh = tick(),
			gui = gui,
			container = container,
			addons = addons,
			signal = signal,
			betterchat_shared = betterchat_shared,
			onEmoji = signal.new(),
			interceptions = {},
			addToCache = {},
			mutelist = mutelist
		}
		
		if environment.config.DebugMode then
			environment.debugging = true
			function environment:debugLog(...)
				print("[BetterChat Debug Log]",...)
			end
		end
				
		environment.config.UI.ColorOptions = environment.config.UI.ColorOptions or {
			ChatbarColor = Color3.fromRGB(255,255,255),
			Buttons = {
				ResizeButton = { --> UI resize button
					BackgroundColor = Color3.fromRGB(52,52,52),
					IconColor = Color3.fromRGB(255,255,255)
				},
				ChannelButton = { --> Channel bar channel buttons: (also autofill too lol)
					BackgroundColor = Color3.fromRGB(0,0,0),
					TextColor = Color3.fromRGB(255,255,255)
				},
				AutofillButton = { --> Autofill buttons
					BackgroundColor = Color3.fromRGB(30,30,30),
					TextColor = Color3.fromRGB(255,255,255)
				},
				ReplyAndChannel = { --> On the chatbar, when whispering or replying this icon shows up
					BackgroundColor = Color3.fromRGB(253,80,111), --> 253,80,111
					TextAndIconColor = Color3.fromRGB(255,255,255)
				}
			},
			Window = {
				BackgroundColor = Color3.fromRGB(0,0,0),
			}
		}
		
		-- channel bar:
		
		function environment:getTextSize()
			return chatbox.TextSize
		end
		
		environment.doDestroy = function(object)
			object.Parent = nil
			local class = object:GetAttribute("Class")
			if(class == "regular") then
				environment.addToCache[class](object)
			end
		end
		
		environment.processData = function(messageData,origin)
			for _,interception in pairs(environment.interceptions) do
				interception(messageData,origin)
			end
			return messageData
		end
		
		local channelBarEnabled = environment.config.UI.ChannelBarEnabled
		if(channelBarEnabled) then
			container:WaitForChild("Channelbar").Visible = true
		end
		environment.channelBarUi = container.Channelbar:WaitForChild("Main"):WaitForChild("Container"):WaitForChild("Scroller")

		
		-- bubble:
		
		local label = Instance.new("TextLabel")
		label.RichText = true
		
		local getTextContent = function(text)
			label.Text = text
			return label.ContentText
		end
		environment.bubbleChatEnabled = false
		environment.bubbleChatConfig = environment.config.BubbleChat.Config
		
		if(environment.config.BubbleChat.Enabled) then
			bubbleChat.init(environment.config.BubbleChat,environment.network,environment)
			environment.bubbleChatEnabled = true
		elseif(chatService.BubbleChatEnabled) then
			local config = environment.config.BubbleChat.Config
			local getUserSettings = function(player)
				return {
					BackgroundColor3 = player:GetAttribute("BubbleBackgroundColor") or config.BubbleBackgroundColor ,
					TextColor3 = player:GetAttribute("BubbleTextColor") or config.BubbleTextColor,
					TextSize = player:GetAttribute("TextSize") or config.TextSize,
					["Font"] = Enum.Font[player:GetAttribute("BubbleFont") or config.BubbleFont.Name],
					["CornerRadius"] = UDim.new(0,player:GetAttribute("BubbleRoundness") or config.Roundness),
					["BubbleDuration"] = config.FadeoutTime
				}
			end
			local userSpecificSettings = {}
			network.onClientEvent("receiveMessage",function(data)
				if(data.is_singular) then
					local player = data.messages[1].player
					if(player and player.Character) then
						if(environment.config.BubbleChat.ApplyValidConfigToDefaultBubbleChat) then
							for _,user in pairs(players:GetPlayers()) do
								userSpecificSettings[user.UserId] = getUserSettings(user)
							end
							chatService:SetBubbleChatSettings({
								UserSpecificSettings = userSpecificSettings --> (roblox decides to deep copy tables and i dont think changes will replicate)
							})
						end
						chatService:Chat(player.Character,getTextContent(environment.richText:markdown(data.messages[1]["message"])))
					end
				end
			end)
		end
		
		task.spawn(function()
			if(environment.config.SettingsMenu.Enabled) then
				-- settings menu:
				settingsMenu(environment)
			end
		end)
		
		-- util
		
		local message_senders
		
		task.spawn(function()
			local saveChat = gui:WaitForChild("SaveChat")
			local container = saveChat:WaitForChild("Container")
			local button = container:WaitForChild("Slot"):Clone()
			container.Slot:Destroy()

			local close = function()
				environment.tweenPosition(saveChat,UDim2.fromScale(0.5,-1.5),Enum.EasingDirection.In,Enum.EasingStyle.Linear,0.25,true)
			end

			function environment:openSaveChat(message)
				saveChat.Position = UDim2.fromScale(0.5,-1.5)
				environment.tweenPosition(saveChat,UDim2.fromScale(0.5,0.5),Enum.EasingDirection.In,Enum.EasingStyle.Linear,0.25,true)

				for _,child in pairs(container:GetChildren()) do
					if(child:IsA("TextButton")) then
						child:Destroy()
					end
				end

				for i = 1,20 do
					local option = button:Clone()
					option.Parent = container
					option.Text = ("Slot %s"):format(i)
					environment.utility:linkObjectSignals(option,{
						option.MouseButton1Click:Connect(function()
							task.spawn(function()
								environment:saveToSlot(i,message)
								message_senders.makeSm(("You can now say '/%s' to send that message again"):format(i))
							end)
							close()
						end)
					})
				end
			end

			saveChat:WaitForChild("Header"):WaitForChild("UI"):WaitForChild("Close").MouseButton1Click:Connect(close)
		end)
		
		-- prefixes internal:
		
		function environment:generateReplyCode(id)
			return("reply_"..id)
		end
		
		-- setup:
		
		local chatWindowVisible = environment.config.UI.ChatWindowVisible
		local chatSizes = environment.config.UI.ChatSizes
		local chatModules = require(core:WaitForChild("chat"))(environment)
		local chatbar = chatModules.chatbar:setup(chatbarContainer,chatbox)
		local chatWindow = chatModules.chatWindow:setup(container,chatbar)
		environment.chatWindowVisible = chatWindowVisible
		
		if(not chatWindowVisible) then
			container.ChatBarContainer.Position = UDim2.new(0,0,0,0)
			container.ChatBarContainer.AnchorPoint = Vector2.new(0,0)
			container.ChatWindow.Visible = false
		end

		-- scale:
		
		local baseSize = scaleToOffset(chatSizes[currentPlatform])
		local lastScale
		container.Size = baseSize

		workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
			local key = tick()
			lastScale = key
			runService.Heartbeat:Wait()
			if(lastScale == key) then
				if not environment.stopSizing then
					local newSize = scaleToOffset(chatSizes[currentPlatform])
					local sizeDiff = baseSize - newSize
					container.Size = (newSize + sizeDiff)
					baseSize = newSize
				end
			end
		end)
	
		environment.utility.descendantOfClassAdded(gui,"UICorner",function(corner)
			local roundness = environment.config.UI.Rounding
			if(corner.Name ~= "Ignore") then
				corner.CornerRadius = UDim.new(0,roundness)
			end
		end)
		
		function environment:refreshRounding()
			local roundness = environment.config.UI.Rounding
			for _,object in pairs(gui:GetDescendants()) do
				if(object:IsA("UICorner") and object.Name ~= "Ignore") then
					object.CornerRadius = UDim.new(0,roundness)
				end
			end
		end
		
		-- text scale
		
		local ogTextSizes = {}
		local lastTextSize = environment.config.UI.BaseTextSize
		local base = lastTextSize
		
		local scale = function(obj,original)
			pcall(function()
				local difference = (lastTextSize - base)
				obj.TextSize = original + difference
			end)
		end
		
		function environment:setTextSize(new)
			lastTextSize = new
			for object,original in pairs(ogTextSizes) do
				task.spawn(scale,object,original)
			end
		end
		
		for _,obj in pairs(gui:GetDescendants()) do
			local success,hasTextSize = pcall(function()
				return obj["TextSize"]
			end)
			if(success and hasTextSize) then
				if(not ogTextSizes[obj]) then
					ogTextSizes[obj] = obj.TextSize
				end
			end
		end
		
		gui.DescendantAdded:Connect(function(obj)
			local success,hasTextSize = pcall(function()
				return obj["TextSize"]
			end)
			if(success and hasTextSize) then
				if(not ogTextSizes[obj]) then
					ogTextSizes[obj] = obj.TextSize
				end
			end
			scale(obj,ogTextSizes[obj])
		end)

		-- message:

		local messages = core:WaitForChild("messages")
		local queue = {}

		message_senders = {
			reply = require(messages:WaitForChild("reply"))(environment),
			system = require(messages:WaitForChild("system"))(environment,queue),
			default = require(messages:WaitForChild("default"))(environment),
			makeSm = function(message,override)
				if not override then
					message_senders.system(
						unpack(environment.localization:produceSystemMessage(message))
					)
				else
					message_senders.system("",message)
				end
				environment:checkScrollerPos(false,0)
			end,
		}

		environment.message_senders = message_senders

		-- received:

		local scroller = environment.mainUi.scroller
		local realScroller = scroller.Parent
		local messageLimit = environment.config.Messages.ChannelMessageLimit

		local clearScroller = function()
			for k,v in pairs(queue) do
				table.remove(queue,k)
			end
			for _,child in pairs(scroller:GetChildren()) do
				if(child:IsA("Frame")) then
					environment.doDestroy(child)
				end
			end
		end
		
		local count = 0
		local currentChannel

		local onMessage = function(message)
			count += 1
			connections:Fire("ChatWindow","MessagesChanged",count)
		end

		local handleDeletionOfOldMessages = function()
			if(#queue > messageLimit) then
				local idx = #queue
				local obj = queue[idx]
				environment.doDestroy(obj)
				table.remove(queue,idx)
			end
		end
		
		function environment:sendSystemMessage(text)
			local object = message_senders.system("",text)
			table.insert(queue,1,object)
		end
		
		local getObject = function(data)
			if(data.class == "regular") then
				return message_senders.default(data)
			elseif(data.class == "reply") then
				return message_senders.reply(data,queue)
			end
		end
		
		local onCreated = function(object,data,extra)
			environment.messages[data.id] = {
				object = object,
				data = data,
				extra = extra
			}
		end
		
		local createNewMessage = function(data) -- this function initiates every message ever sent :eyes:
			if(mutelist[data.senderId] or (data.channelFrom ~= currentChannel)) then
				return
			end
			local existingMessageById = environment.messages[data.id]
			if(existingMessageById) then
				if(data.class == "reply") then
					existingMessageById.extra.replace(data,queue)
				else
					local api = environment:checkThread(data.id)
					if(api) then
						api:editBaseMessage(data)
					end
					local currentKey = table.find(queue,existingMessageById.object)
					if(currentKey) then
						local object = getObject(data)
						onCreated(object,data)
						queue[currentKey] = object
						existingMessageById.object:Destroy()
					end
				end
			else
				local object,extra = getObject(data)
				onCreated(object,data,extra)
				table.insert(queue,1,object)
				onMessage(object)
			end
			handleDeletionOfOldMessages()
		end
		
		local muteKeys = {
			[false] = "GameChat_ChatMain_SpeakerHasBeenUnMuted",
			[true] = "GameChat_ChatMain_SpeakerHasBeenMuted",
			["failed"] = "GameChat_DoMuteCommand_CannotMuteSelf"
		}
		
		local announceMute = function(player,state)
			message_senders.makeSm(environment.localization:localize(muteKeys[state]):format(player.Name))
		end
		
		function environment:mute(player)
			if(localPlayer == player and (not canMuteSelf)) then
				message_senders.makeSm(environment.localization:localize(muteKeys["failed"]))
				return
			end
			mutelist[player.UserId] = true
			announceMute(player,true)
		end
		
		function environment:deleteMessage(message)
			network:fire("deleteMessage",message.id,message.channelFrom)
		end
		
		function environment:unmute(player)
			if(localPlayer == player and (not canMuteSelf)) then
				return
			end
			mutelist[player.UserId] = false
			announceMute(player,false)
		end
		
		local includeBeginningMessageAndScroll = function(id)
			local sm = message_senders.system(unpack(environment.localization:getWelcomeMessage(id)))
			table.insert(queue,sm)
			onMessage(sm)
			environment:checkScrollerPos(true,0)
		end
		
		environment.channelChanged = signal.new()
		local batchCount = 0
		
		local refreshHistory = function(channel)
			batchCount += 1
			currentChannel = channel
			local received = network:invoke("requestHistory",channel)
			environment.lastRefresh = tick()
			local current = environment.lastRefresh
			environment.messages = {}
			environment.threads = {}
			heartbeat:Wait()
			clearScroller()
			local last = 0
			local key = 0
			for _,data in pairs(received.messages) do
				environment.processData(data,"chat")
				key += 1
				if(data.id ~= nil) then
					last = data.id
				end
					if(not data.replyingTo) then
						data.massMessageLoad = true
						createNewMessage(data)
					else
						data.massMessageLoad = true
						repeat
							runService.Heartbeat:Wait()
						until(environment.messages[data.replyingTo.id])
						if(environment.lastRefresh == current) then
							createNewMessage(data)
						end
					end
				-- chunking (makes loading much faster, as well as optimizations to only load the message function after the mouse hovers on it)
				if(key == 10) then
					task.wait(0.05)
					key = 0
				end
			end
			includeBeginningMessageAndScroll((last or 9999)+1)
			environment.channelChanged:Fire(channel)
		end
		
		local onMessageReceived = function(received) --> this message will handle every single message ever displayed in the chat, kinda crazy tbh
			for _,data in pairs(received.messages) do
				if debugMode then
					local current = batchCount
					environment:debugLog("Creating",data.id,"for batch",current)
				end
				data = environment.processData(data,"chat")
				task.spawn(function()
					if(channelBarEnabled) then
						if(currentChannel == data.channelFrom) then
							createNewMessage(data)
						elseif(data.filteredSuccessfully) then
							environment:addNotificationToChannel(data.channelFrom)
						end
					else
						createNewMessage(data)
					end
				end)
			end
		end

		network.onClientEvent("receiveMessage",onMessageReceived)
		network.onClientEvent("receiveMessageCreation",onMessageReceived)
		network.onClientEvent("editMessage",createNewMessage)
		
		local doFormat = function(number) -- written by: waves5217 (@https://devforum.roblox.com/t/help-with-floating-point-errors/2474289/3)
			local formatted = string.format("%.3f", number) --> omit to three decimals
			formatted = formatted:gsub("%.?0+$", "") --> remove the dot and trailing zeroes
			return tonumber(formatted)
		end

		function environment:atBottom()
			return(doFormat(realScroller.CanvasPosition.Y) == doFormat(realScroller.AbsoluteCanvasSize.Y - realScroller.AbsoluteSize.Y))
		end

		function environment:checkScrollerPos(bypass,len)
			if(doFormat(realScroller.CanvasPosition.Y) == doFormat(realScroller.AbsoluteCanvasSize.Y - realScroller.AbsoluteSize.Y) or bypass) then
				task.spawn(function()
					heartbeat:Wait()
					environment.utility:tween({realScroller,(len or 0.25),{
						["CanvasPosition"] = Vector2.new(0,doFormat(realScroller.AbsoluteCanvasSize.Y))
					}})
				end)
			end
		end

		function environment:addMessageToQueue(message)
			onMessage(message)
			table.insert(queue,1,message)
			handleDeletionOfOldMessages()
		end

		function environment:fetchChannelHistory(channelName)
			environment.currentChannel = channelName
			refreshHistory(channelName)
		end
		
		-- core ui:

		local chatOpenState = false
		local locked = false
		
		local toggleChatState = function()
			if(locked) then
				return
			end
			connections:Fire("ChatWindow","VisibilityStateChanged",(not chatOpenState))
			chatOpenState = not chatOpenState
			container.Visible = chatOpenState
		end
		
		function environment:setChatOpenState(state)
			chatOpenState = state
		end
		
		function environment:setChatLocked(state)
			locked = state
		end
		
		connections:Connect("ChatWindow","ToggleVisibility",toggleChatState)
		toggleChatState()
		
		connections:Connect("ChatWindow","CoreGuiEnabled",function(state)
			container.Visible = state
		end)
				
		-- notifiers
		
		local players = game:GetService("Players")
		local starterGui = game:GetService("StarterGui")
		local notifiers = environment.config.Notifiers
		
		if(notifiers.FriendJoinNotifier) then
			players.PlayerAdded:Connect(function(plr)
				if(plr:IsFriendsWith(localPlayer.UserId)) then
					message_senders.makeSm(environment.localization:localize("GameChat_FriendChatNotifier_JoinMessage"):format(plr.Name))
				end
			end)
		end
		
		if(notifiers.TeamChangeNotifier) then
			local changed = function(name)
				message_senders.makeSm(environment.localization:localize("GameChat_TeamChat_NowInTeam"):format(name))
			end
			localPlayer:GetPropertyChangedSignal("Team"):Connect(function()
				local teamName = localPlayer.Team and localPlayer.Team.Name or "Neutral"
				changed(teamName)
			end)
		end
		
		if(notifiers.BlockedUserNotifier) then
			local blockKeys = {
				["blocked"] = "GameChat_ChatMain_SpeakerHasBeenBlocked",
				["unblocked"] = "GameChat_ChatMain_SpeakerHasBeenUnBlocked"
			}
			
			local blockEvents = {
				["blocked"] = starterGui:GetCore("PlayerBlockedEvent"),
				["unblocked"] = starterGui:GetCore("PlayerUnblockedEvent")
			}
			
			for keyToTrigger,event in pairs(blockEvents) do
				event.Event:Connect(function(player)
					message_senders.makeSm(environment.localization:localize(blockKeys[keyToTrigger]):format(player.Name))
				end)
			end
		end
		
		-- custom commands
		
		environment.utility.childAdded(addons:WaitForChild("Commands"),function(command)
			command.Parent = core:WaitForChild("commands"):WaitForChild("list")
		end)
		
		-- plugins
		
		local api = require(core:WaitForChild("api"))(environment,wrap,connections)
		environment.utility.childAdded(addons:FindFirstChild("Plugins") or Instance.new("Folder"),function(module)
			require(module)(api)
		end)
	end
end
-- Author: @Jumpathy
-- Name: connections.lua
-- Description: Set up core connections for Roblox's chat so I can connect signals like .Chatted etc

local starterGui = game:GetService("StarterGui")

local chatConnectionsList = {}

local createEvents = function(array)
	for name,info in pairs(array) do
		local event = Instance.new(info.class)
		event.Name = name
		chatConnectionsList[info.category] = chatConnectionsList[info.category] or {}
		chatConnectionsList[info.category][name] = event
	end
end

createEvents({
	["ToggleVisibility"] = { -- Fired when CoreGui chat button is pressed
		class = "BindableEvent",
		category = "ChatWindow"
	},
	["SetVisible"] = { -- Fired when CoreGui wants to change if the chat is visible
		class = "BindableEvent",
		category = "ChatWindow"
	},
	["FocusChatBar"] = { -- Fired when CoreGui wants to focus the chat bar
		class = "BindableEvent",
		category = "ChatWindow"
	},
	["TopbarEnabledChanged"] = { -- Fired when topbar visibility changes
		class = "BindableEvent",
		category = "ChatWindow"
	},
	["SpecialKeyPressed"] = { -- Fired when the chat hotkey is pressed
		class = "BindableEvent",
		category = "ChatWindow"
	},
	["CoreGuiEnabled"] = { -- Fired when the developer sets StarterGui:SetCoreGuiEnabled for the chat
		class = "BindableEvent",
		category = "ChatWindow"
	},
	["ChatBarFocusChanged"] = { -- Fire w 'true' when you want to ensure that the chatbar is being focused on
		class = "BindableEvent",
		category = "ChatWindow"
	},
	["VisibilityStateChanged"] = { -- Fire w 'true' when the user shows or hides the chat
		class = "BindableEvent",
		category = "ChatWindow"
	},
	["MessagesChanged"] = { -- Fire this to set the topbar chat button's message counter
		class = "BindableEvent",
		category = "ChatWindow"
	},
	["MessagePosted"] = { 
		-- Fired for the .Chatted event, attempting to forge this can land you with trouble in moderation
		class = "BindableEvent",
		category = "ChatWindow"
	},
	["IsFocused"] = { -- Invoked by CoreGui to determine if the chat is focused
		class = "BindableFunction",
		category = "ChatWindow"
	},
	["ChatMakeSystemMessage"] = { -- https://developer.roblox.com/en-us/api-reference/function/StarterGui/SetCore
		class = "BindableEvent",
		category = "SetCore"
	},
	["ChatWindowPosition"] = { -- https://developer.roblox.com/en-us/api-reference/function/StarterGui/SetCore
		class = "BindableEvent",
		category = "SetCore"
	},
	["ChatWindowSize"] = { -- https://developer.roblox.com/en-us/api-reference/function/StarterGui/SetCore
		class = "BindableEvent",
		category = "SetCore"
	},
	["ChatBarDisabled"] = { -- https://developer.roblox.com/en-us/api-reference/function/StarterGui/SetCore
		class = "BindableEvent",
		category = "SetCore"
	}
})

createEvents({
	["ChatWindowPosition"] = { -- Invoked by :GetCore to return the UDim2 position of the chat window
		class = "BindableFunction",
		category = "GetCore"
	},
	["ChatWindowSize"] = { -- Invoked by :GetCore to determine the chat size of the window with a UDim2 value
		class = "BindableFunction",
		category = "GetCore"
	},
	["ChatBarDisabled"] = { -- Invoked by :GetCore to return a boolean if the chatbar is disabled
		class = "BindableFunction",
		category = "GetCore"
	}
})

local loaded = false
local loadedEvent = Instance.new("BindableEvent")

task.spawn(function()
	local tries = 0
	local maxAttempts = 10
	while(tries < maxAttempts) do
		local success,result = pcall(function()
			starterGui:SetCore("CoreGuiChatConnections",chatConnectionsList)
		end)
		if(success) then
			loaded = true
			loadedEvent:Fire()
			break
		else
			tries += 1
			if(tries == maxAttempts) then
				error("[Better Chat]: Error calling SetCore CoreGuiChatConnections:",result)
			else
				task.wait()
			end
		end
	end
end)

local pending = {}

function pending:Connect(category,name,callback)
	if(not loaded) then
		loadedEvent.Event:Wait()
	end
	local event = chatConnectionsList[category][name]
	if(event:IsA("BindableEvent")) then
		event.Event:Connect(callback)
	else
		event.OnInvoke = callback
	end
end

function pending:Fire(category,name,...)
	if(not loaded) then
		loadedEvent.Event:Wait()
	end
	chatConnectionsList[category][name]:Fire(...)
end

function pending:Invoke(category,name,...)
	if(not loaded) then
		loadedEvent.Event:Wait()
	end
	return chatConnectionsList[category][name]:Invoke(...)
end

return pending
-- Author: @Jumpathy
-- Name: utility.lua
-- Description: Utilitarian functions (dont know if that's even a word LMAO)

local utility = {}
local tweenService = game:GetService("TweenService")
local players = game:GetService("Players")
local style = Enum.EasingStyle.Linear

function utility:tween(...)
	local args = {...}
	if(type(args[1]) ~= "table") then
		local object,length,properties,direction,overStyle = unpack(args)
		local tween = tweenService:Create(object,TweenInfo.new(length,overStyle or style,direction or Enum.EasingDirection.Out),properties)
		tween:Play()
		return tween
	else
		local tweens = {}
		for _,t in pairs(args) do
			local object,length,properties,direction,overStyle = unpack(t)
			local tween = tweenService:Create(object,TweenInfo.new(length,overStyle or style,direction or Enum.EasingDirection.Out),properties)
			tween:Play()
			tweens[object] = tween
		end
		return tweens
	end
end

function utility.descendantOfClassAdded(holder,class,callback)
	local check = function(object)
		if(object:IsA(class)) then
			callback(object)
		end
	end
	holder.DescendantAdded:Connect(check)
	for _,descendant in pairs(holder:GetDescendants()) do
		task.spawn(check,descendant)
	end
end

function utility:clampTextLimit(box,limit)
	local conn
	local last = ""
	conn = box.Changed:Connect(function()
		if(box:GetFullName() ~= box.Name) then
			if(#box.Text > limit) then
				box.Text = last
				return
			end
			last = box.Text
		else
			conn:Disconnect()
		end
	end)
end

function utility:linkObjectSignals(object,signals)
	local conn;
	conn = object.Changed:Connect(function()
		if(object:GetFullName() == object.Name) then
			for _,sig in pairs(signals) do
				sig:Disconnect()
			end
			conn:Disconnect()
			signals = nil
		end
	end)
end

utility.childAdded = function(parent,onChild)
	parent.ChildAdded:Connect(onChild)
	for _,child in pairs(parent:GetChildren()) do
		task.spawn(onChild,child)
	end
end

utility.viewport = require(script.Parent:WaitForChild("constructors"):WaitForChild("buildViewport"))

return utility
-- Author: Roblox? (Skidd- I mean rewritten by Jumpathy)
-- Name: localization.lua
-- Description: Manage localization lol

return function()
	local localizationService = game:GetService("LocalizationService")
	local localizationTable,entries = require(script.Parent:WaitForChild("lists"):WaitForChild("localizationTable"))()
	local userInput = game:GetService("UserInputService")
	local touchEnabled = userInput.TouchEnabled
	
	local fetchEntry = function(key)
		for _,entry in pairs(entries) do 
			if(entry.Key == key) then
				return entry
			end
		end
		return {["en-us"] = "..."}
	end
	
	local getDefault = function(key)
		return fetchEntry(key)["en-us"]
	end
	
	local prefixKeys = {
		["System"] = "InGame.Chat.Label.SystemMessagePrefix",
		["Team"] = "InGame.Chat.Label.TeamMessagePrefix",
		["From"] = "InGame.Chat.Label.From",
		["To"] = "InGame.Chat.Label.To",
		["Welcome"] = "GameChat_ChatCommandsTeller_AllChannelWelcomeMessage"
	}
	
	local standardKeys = {
		["Chatbar"] = touchEnabled and "GameChat_ChatMain_ChatBarTextTouch" or "GameChat_ChatMain_ChatBarText",
		["CannotTalk"] = "Muted"
	}

	local module = {
		internal = {fetchedLocalization = false,translator = nil}		
	}

	function module.internal:fetchTranslator()
		if(not module.internal.translator and not module.internal.fetchedLocalization) then
			module.internal.fetchedLocalization = true
			module.internal.translator = localizationTable:GetTranslator(localizationService.RobloxLocaleId)
			local changedLocaleSignal
			changedLocaleSignal = localizationService:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function()
				changedLocaleSignal:Disconnect()
				module.internal.fetchedLocalization = false
				module.internal.translator = nil
			end)
		end
		return module.internal.translator
	end
	
	function module:getWelcomeMessage(...)
		return {
			module:localize(prefixKeys.System,getDefault(prefixKeys.System)),
			module:localize(prefixKeys.Welcome,getDefault(prefixKeys.Welcome)),
			...
		}
	end

	function module:produceSystemMessage(message)
		return {
			module:localize(prefixKeys.System,getDefault(prefixKeys.System)),
			message
		}
	end
	
	function module:getChatbarPlaceholder(key)
		local keyToUse = key and standardKeys.CannotTalk or standardKeys.Chatbar
		return module:localize(keyToUse,getDefault(keyToUse))
	end
	
	function module:localizeResponse(key,...)
		return module:localize(key,getDefault(key),{...})
	end
	
	function module:localize(key,default,...)
		local success,returnValue = pcall(function(...)
			local translator = module.internal:fetchTranslator()
			if(translator ~= nil) then
				return translator:FormatByKey(key,...)
			else
				warn("[Better Chat]: Missing internal translator, using default value for key",key)
			end
		end,...)
		if(not success and returnValue) then
			warn(returnValue)
		end
		return(success and returnValue or (default or getDefault(key)))
	end
	
	function module:getMessagePrefix(base)
		return module:localize(prefixKeys[base])
	end
	
	return module
end
-- Author: @Jumpathy
-- Name: system.lua
-- Description: System messages :D

return function(environment,queue)
	local scroller = environment.mainUi.scroller
	local templates = script.Parent:WaitForChild("templates")
	local regular = require(templates:WaitForChild("regular"))
	local rich = environment.richText
	
	return function(speaker,message,order)
		environment:checkScrollerPos()
		local object = regular.new(environment)
		local message = rich:mark(rich:escape(message))
		object.Raw.Text = speaker ~= "" and ("%s %s"):format(rich:colorize(speaker .. ":",Color3.fromRGB(200,200,200)),message) or message
		object.Parent = scroller
		object.LayoutOrder = order and order or (queue[1] and queue[1].LayoutOrder or 0)
		return object
	end
end
-- Author: @Jumpathy
-- Name: regular.lua
-- Description: Regular message constructor

local collectionService = game:GetService("CollectionService")
local cache = {}

local reset = function(object)
	for _,obj in pairs(object:GetDescendants()) do
		if(obj.Name == "WrappedLine") then
			obj:Destroy()
		end
	end
end

local create = function(environment)
	--[[
	local newMessage
	if cache[1] then --> using a message cache to be more memory-friendly :skull:
		local message = cache[1]
		table.remove(cache,1)
		reset(message)
		newMessage = message
	end
	
	local raw,user,icon,edit;
	if newMessage then
		raw = newMessage.Raw
		user = raw.User
		icon = newMessage:FindFirstChild("Icon")
		edit = newMessage:FindFirstChild("Edit")
	end
	]]
	
	local message = Instance.new("Frame")
	message.Name = "Message"
	message.AutomaticSize = Enum.AutomaticSize.Y
	message.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	message.BackgroundTransparency = 1
	message.Size = UDim2.new(1, 0, 0, 16)
	message:SetAttribute("Class","regular")
	
	local raw = Instance.new("TextLabel")
	raw.Name = "Raw"
	raw.Font = environment.config.UI.Fonts.TextFont	
	raw.RichText = true
	raw.Text = ""
	raw.TextColor3 = Color3.fromRGB(255, 255, 255)
	raw.TextSize = 15
	raw.TextStrokeTransparency = 0.9
	raw.TextWrapped = true
	raw.TextXAlignment = Enum.TextXAlignment.Left
	raw.AnchorPoint = Vector2.new(1, 0)
	raw.AutomaticSize = Enum.AutomaticSize.Y
	raw.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	raw.BackgroundTransparency = 1
	raw.Position = UDim2.fromScale(1, 0)
	raw.Size = UDim2.new(1, 0, 0, 16)
	raw.ZIndex = 2
	collectionService:AddTag(raw,"TextFont")

	local user =  Instance.new("TextButton")
	user.Name = "User"
	user.Font = Enum.Font.GothamMedium
	user.RichText = true
	user.TextColor3 = Color3.fromRGB(0, 0, 0)
	user.TextSize = 15
	user.TextTransparency = 1
	user.TextWrapped = true
	user.AutomaticSize = Enum.AutomaticSize.XY
	user.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	user.BackgroundTransparency = 1
	user.Size = UDim2.fromOffset(0, 16)
	user.Parent = raw

	local uIPadding = Instance.new("UIPadding")
	uIPadding.Name = "UIPadding"
	uIPadding.Parent = raw

	raw.Parent = message

	local icon = Instance.new("ImageLabel")
	icon.Name = "Icon"
	icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	icon.BackgroundTransparency = 1
	icon.BorderSizePixel = 0
	icon.Size = UDim2.fromOffset(15, 15)
	icon.Visible = false
	icon.ZIndex = 2
	icon.Parent = message

	local mentioned = Instance.new("Frame")
	mentioned.Name = "Mentioned"
	mentioned.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
	mentioned.BackgroundTransparency = 0.75
	mentioned.BorderSizePixel = 0
	mentioned.Size = UDim2.fromScale(1, 1)
	mentioned.Visible = false

	local ignore = Instance.new("UICorner")
	ignore.Name = "Ignore"
	ignore.CornerRadius = UDim.new(0, 4)
	ignore.Parent = mentioned

	local bar = Instance.new("Frame")
	bar.Name = "Bar"
	bar.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
	bar.BorderSizePixel = 0
	bar.Size = UDim2.fromOffset(5, 16)

	local uICorner = Instance.new("UICorner")
	uICorner.Name = "UICorner"
	uICorner.CornerRadius = UDim.new(0, 4)
	uICorner.Parent = bar

	bar.Parent = mentioned

	mentioned.Parent = message

	local edit = Instance.new("TextBox")
	edit.Name = "Edit"
	edit.ClearTextOnFocus = false
	edit.Font = Enum.Font.GothamMedium
	edit.Text = ""
	edit.TextColor3 = Color3.fromRGB(255, 255, 255)
	edit.TextSize = 15
	edit.TextStrokeTransparency = 0.9
	edit.TextWrapped = true
	edit.TextXAlignment = Enum.TextXAlignment.Left
	edit.Active = false
	edit.AnchorPoint = Vector2.new(1, 0)
	edit.AutomaticSize = Enum.AutomaticSize.Y
	edit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	edit.BackgroundTransparency = 1
	edit.Position = UDim2.fromScale(1, 0)
	edit.Selectable = false
	edit.Size = UDim2.new(1, 0, 0, 16)
	edit.Visible = false
	edit.Parent = message
	edit.Font = environment.config.UI.Fonts.TextFont
	collectionService:AddTag(edit,"TextFont")
	
	return message
end

return {new = function(environment)
	return create(environment)
end, addToCache = function(object)
	table.insert(cache,object)
end}
-- Author: @Jumpathy
-- Name: reply.lua
-- Description: Reply constructor
local collectionService = game:GetService("CollectionService")

local bottom = function(environment)
	local bottom = Instance.new("Frame")
	bottom.Name = "Bottom"
	bottom.AutomaticSize = Enum.AutomaticSize.Y
	bottom.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	bottom.BackgroundTransparency = 1
	bottom.ClipsDescendants = true
	bottom.LayoutOrder = 1
	bottom.Size = UDim2.fromScale(1, 0)

	local replyArea = Instance.new("Frame")
	replyArea.Name = "ReplyArea"
	replyArea.AutomaticSize = Enum.AutomaticSize.Y
	replyArea.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	replyArea.BackgroundTransparency = 1
	replyArea.Position = UDim2.fromOffset(30, 0)
	replyArea.Size = UDim2.new(1, -25, 0, 15)

	local reply = Instance.new("TextLabel")
	reply.Name = "Reply"
	reply.Font = environment.config.UI.Fonts.TextFont
	reply.RichText = true
	reply.Text = ""
	reply.TextColor3 = Color3.fromRGB(255, 255, 255)
	reply.TextSize = 13
	reply.TextStrokeTransparency = 0.9
	reply.TextWrapped = true
	reply.TextXAlignment = Enum.TextXAlignment.Left
	reply.TextYAlignment = Enum.TextYAlignment.Bottom
	reply.AnchorPoint = Vector2.new(1, 0)
	reply.AutomaticSize = Enum.AutomaticSize.Y
	reply.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	reply.BackgroundTransparency = 1
	reply.Position = UDim2.fromScale(1, 0)
	reply.Size = UDim2.new(1, 0, 0, 16)
	reply.ZIndex = 2
	collectionService:AddTag(reply,"TextFont")
	
	local user = Instance.new("TextButton")
	user.Name = "User"
	user.Font = environment.config.UI.Fonts.TextFont
	user.RichText = true
	user.TextColor3 = Color3.fromRGB(0, 0, 0)
	user.TextSize = 15
	user.TextTransparency = 1
	user.TextWrapped = true
	user.AutomaticSize = Enum.AutomaticSize.XY
	user.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	user.BackgroundTransparency = 1
	user.Size = UDim2.fromOffset(0, 16)
	user.Parent = reply
	collectionService:AddTag(user,"TextFont")

	local mentioned = Instance.new("Frame")
	mentioned.Name = "Mentioned"
	mentioned.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
	mentioned.BackgroundTransparency = 0.75
	mentioned.BorderSizePixel = 0
	mentioned.Position = UDim2.fromOffset(-8, 0)
	mentioned.Size = UDim2.new(1, 10, 1, 0)

	local uICorner = Instance.new("UICorner")
	uICorner.Name = "UICorner"
	uICorner.Parent = mentioned

	local bar = Instance.new("Frame")
	bar.Name = "Bar"
	bar.AutomaticSize = Enum.AutomaticSize.Y
	bar.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
	bar.BorderSizePixel = 0
	bar.Size = UDim2.fromOffset(5, 26)

	local uICorner1 = Instance.new("UICorner")
	uICorner1.Name = "UICorner"
	uICorner1.Parent = bar

	bar.Parent = mentioned

	mentioned.Parent = reply

	reply.Parent = replyArea

	local edit = Instance.new("TextBox")
	edit.Name = "Edit"
	edit.ClearTextOnFocus = false
	edit.Font = environment.config.UI.Fonts.TextFont
	edit.Text = ""
	edit.TextColor3 = Color3.fromRGB(255, 255, 255)
	edit.TextSize = 13
	edit.TextStrokeTransparency = 0.9
	edit.TextTransparency = 1
	edit.TextWrapped = true
	edit.TextXAlignment = Enum.TextXAlignment.Left
	edit.TextYAlignment = Enum.TextYAlignment.Bottom
	edit.Active = false
	edit.AnchorPoint = Vector2.new(1, 0)
	edit.AutomaticSize = Enum.AutomaticSize.Y
	edit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	edit.BackgroundTransparency = 1
	edit.Position = UDim2.fromScale(1, 0)
	edit.Selectable = false
	edit.Size = UDim2.new(1, 0, 0, 16)
	edit.ZIndex = 2
	edit.Parent = replyArea
	collectionService:AddTag(edit,"TextFont")

	replyArea.Parent = bottom

	local bottom1 = Instance.new("Frame")
	bottom1.Name = "Bottom"
	bottom1.AnchorPoint = Vector2.new(0, 1)
	bottom1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	bottom1.BackgroundTransparency = 1
	bottom1.ClipsDescendants = true
	bottom1.LayoutOrder = 3
	bottom1.Position = UDim2.new(0, 0, 1, -5)
	bottom1.Size = UDim2.fromOffset(23, 10)
	bottom1.ZIndex = 4

	local bottom2 = Instance.new("ImageLabel")
	bottom2.Name = "Bottom"
	bottom2.Image = "rbxassetid://8594890205"
	bottom2.AnchorPoint = Vector2.new(0, 1)
	bottom2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	bottom2.BackgroundTransparency = 1
	bottom2.LayoutOrder = 3
	bottom2.Position = UDim2.fromScale(0, 1)
	bottom2.Size = UDim2.fromOffset(23, 23)
	bottom2.ZIndex = 4
	bottom2.Parent = bottom1

	bottom1.Parent = bottom

	local middle = Instance.new("Frame")
	middle.Name = "Middle"
	middle.AnchorPoint = Vector2.new(0, 1)
	middle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	middle.BackgroundTransparency = 1
	middle.LayoutOrder = 3
	middle.Position = UDim2.new(0, 0, 1, -5)
	middle.Size = UDim2.fromOffset(23, 10)
	middle.ZIndex = 4

	local middle1 = Instance.new("ImageLabel")
	middle1.Name = "Middle"
	middle1.Image = "rbxassetid://8594897232"
	middle1.SliceCenter = Rect.new(28, 0, 300, 300)
	middle1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	middle1.BackgroundTransparency = 1
	middle1.LayoutOrder = 2
	middle1.Position = UDim2.fromScale(0, -100)
	middle1.Size = UDim2.new(0, 23, 100, 0)
	middle1.ZIndex = 3
	middle1.Parent = middle

	middle.Parent = bottom
	return bottom
end

local middle = function(environment)
	local middle = Instance.new("Frame")
	middle.Name = "Middle"
	middle.AutomaticSize = Enum.AutomaticSize.Y
	middle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	middle.BackgroundTransparency = 1
	middle.Size = UDim2.fromScale(1, 0)

	local middle1 = Instance.new("ImageLabel")
	middle1.Name = "Middle"
	middle1.Image = "rbxassetid://8594897232"
	middle1.SliceCenter = Rect.new(28, 0, 300, 300)
	middle1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	middle1.BackgroundTransparency = 1
	middle1.LayoutOrder = 2
	middle1.Size = UDim2.new(0, 23, 1, 0)
	middle1.ZIndex = 3
	middle1.Parent = middle

	local replyArea = Instance.new("Frame")
	replyArea.Name = "ReplyArea"
	replyArea.AutomaticSize = Enum.AutomaticSize.Y
	replyArea.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	replyArea.BackgroundTransparency = 1
	replyArea.Position = UDim2.fromOffset(30, 0)
	replyArea.Size = UDim2.new(1, -25, 0, 15)

	local reply = Instance.new("TextLabel")
	reply.Name = "Reply"
	reply.Font = environment.config.UI.Fonts.TextFont
	reply.RichText = true
	reply.Text = ""
	reply.TextColor3 = Color3.fromRGB(255, 255, 255)
	reply.TextSize = 13
	reply.TextStrokeTransparency = 0.9
	reply.TextWrapped = true
	reply.TextXAlignment = Enum.TextXAlignment.Left
	reply.AnchorPoint = Vector2.new(1, 0)
	reply.AutomaticSize = Enum.AutomaticSize.Y
	reply.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	reply.BackgroundTransparency = 1
	reply.Position = UDim2.fromScale(1, 0)
	reply.Size = UDim2.new(1, 0, 0, 16)
	reply.ZIndex = 2
	collectionService:AddTag(reply,"TextFont")
	
	local user = Instance.new("TextButton")
	user.Name = "User"
	user.Font = environment.config.UI.Fonts.TextFont
	user.RichText = true
	user.TextColor3 = Color3.fromRGB(0, 0, 0)
	user.TextSize = 15
	user.TextTransparency = 1
	user.TextWrapped = true
	user.AutomaticSize = Enum.AutomaticSize.XY
	user.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	user.BackgroundTransparency = 1
	user.Size = UDim2.fromOffset(0, 16)
	user.Parent = reply
	collectionService:AddTag(user,"TextFont")

	local mentioned = Instance.new("Frame")
	mentioned.Name = "Mentioned"
	mentioned.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
	mentioned.BackgroundTransparency = 0.75
	mentioned.BorderSizePixel = 0
	mentioned.Position = UDim2.fromOffset(-8, 0)
	mentioned.Size = UDim2.new(1, 10, 1, 0)
	mentioned.Visible = false

	local uICorner = Instance.new("UICorner")
	uICorner.Name = "UICorner"
	uICorner.Parent = mentioned

	local bar = Instance.new("Frame")
	bar.Name = "Bar"
	bar.AutomaticSize = Enum.AutomaticSize.Y
	bar.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
	bar.BorderSizePixel = 0
	bar.Size = UDim2.fromOffset(5, 26)

	local uICorner1 = Instance.new("UICorner")
	uICorner1.Name = "UICorner"
	uICorner1.Parent = bar

	bar.Parent = mentioned

	mentioned.Parent = reply

	reply.Parent = replyArea

	local edit = Instance.new("TextBox")
	edit.Name = "Edit"
	edit.ClearTextOnFocus = false
	edit.Font = environment.config.UI.Fonts.TextFont
	edit.Text = ""
	edit.TextColor3 = Color3.fromRGB(255, 255, 255)
	edit.TextSize = 13
	edit.TextStrokeTransparency = 0.9
	edit.TextTransparency = 1
	edit.TextWrapped = true
	edit.TextXAlignment = Enum.TextXAlignment.Left
	edit.Active = false
	edit.AnchorPoint = Vector2.new(1, 0)
	edit.AutomaticSize = Enum.AutomaticSize.Y
	edit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	edit.BackgroundTransparency = 1
	edit.Position = UDim2.fromScale(1, 0)
	edit.Selectable = false
	edit.Size = UDim2.new(1, 0, 0, 16)
	edit.ZIndex = 2
	edit.Parent = replyArea
	
	collectionService:AddTag(edit,"TextFont")

	replyArea.Parent = middle
	return middle
end

local new = function(environment)
	local replyMessage = Instance.new("Frame")
	replyMessage.Name = "ReplyMessage"
	replyMessage.AutomaticSize = Enum.AutomaticSize.Y
	replyMessage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	replyMessage.BackgroundTransparency = 1
	replyMessage.Size = UDim2.new(1, 0, 0, 16)

	local original = Instance.new("TextLabel")
	original.Name = "Original"
	original.Font = environment.config.UI.Fonts.TextFont
	original.RichText = true
	original.Text = "Bob: Hello world"
	original.TextColor3 = Color3.fromRGB(255, 255, 255)
	original.TextSize = 12
	original.TextStrokeTransparency = 0.9
	original.TextWrapped = true
	original.TextXAlignment = Enum.TextXAlignment.Left
	original.AnchorPoint = Vector2.new(1, 0)
	original.AutomaticSize = Enum.AutomaticSize.Y
	original.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	original.BackgroundTransparency = 1
	original.Position = UDim2.fromScale(1, 0)
	original.Size = UDim2.new(1, 0, 0, 16)
	original.ZIndex = 2
	collectionService:AddTag(original,"TextFont")

	local user = Instance.new("TextButton")
	user.Name = "User"
	user.Font = environment.config.UI.Fonts.TextFont
	user.RichText = true
	user.TextColor3 = Color3.fromRGB(0, 0, 0)
	user.TextSize = 12
	user.TextTransparency = 1
	user.TextWrapped = true
	user.AutomaticSize = Enum.AutomaticSize.XY
	user.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	user.BackgroundTransparency = 1
	user.Size = UDim2.fromOffset(0, 16)
	user.Parent = original
	collectionService:AddTag(user,"TextFont")

	local uIPadding = Instance.new("UIPadding")
	uIPadding.Name = "UIPadding"
	uIPadding.Parent = original

	original.Parent = replyMessage

	local icon = Instance.new("ImageLabel")
	icon.Name = "Icon"
	icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	icon.BackgroundTransparency = 1
	icon.BorderSizePixel = 0
	icon.Size = UDim2.fromOffset(16, 16)
	icon.Visible = false
	icon.Parent = replyMessage

	local edit = Instance.new("TextBox")
	edit.Name = "Edit"
	edit.ClearTextOnFocus = false
	edit.Font = environment.config.UI.Fonts.TextFont
	edit.Text = ""
	edit.TextColor3 = Color3.fromRGB(255, 255, 255)
	edit.TextSize = 15
	edit.TextStrokeTransparency = 0.9
	edit.TextWrapped = true
	edit.TextXAlignment = Enum.TextXAlignment.Left
	edit.AnchorPoint = Vector2.new(1, 0)
	edit.AutomaticSize = Enum.AutomaticSize.Y
	edit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	edit.BackgroundTransparency = 1
	edit.Position = UDim2.fromScale(1, 0)
	edit.Selectable = false
	edit.Size = UDim2.new(1, 0, 0, 16)
	edit.Visible = false
	edit.Parent = replyMessage
	collectionService:AddTag(edit,"TextFont")

	local replyChain = Instance.new("Frame")
	replyChain.Name = "ReplyChain"
	replyChain.AutomaticSize = Enum.AutomaticSize.Y
	replyChain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	replyChain.BackgroundTransparency = 1
	replyChain.Position = UDim2.fromOffset(0, 20)
	replyChain.Size = UDim2.fromScale(1, 0)

	local uIListLayout = Instance.new("UIListLayout")
	uIListLayout.Name = "UIListLayout"
	uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout.Parent = replyChain

	replyChain.Parent = replyMessage
	return replyMessage
end

return {new = function(environment)
	return new(environment)
end,Bottom = function(environment)
	return bottom(environment)
end,Middle = function(environment)
	return middle(environment)
end,}
-- Author: @Jumpathy
-- Name: default.lua
-- Description: User messages base

local runService = game:GetService("RunService")
local userInput = game:GetService("UserInputService")
local players = game:GetService("Players")
local textService = game:GetService("TextService")
local collectionService = game:GetService("CollectionService")
local heartbeat = runService.Heartbeat

local localPlayer = players.LocalPlayer
local label = Instance.new("TextLabel")
label.RichText = true

local getTextContent = function(text)
	label.Text = text
	return label.ContentText
end

local italicize = function(text)
	return("<i>%s</i>"):format(text)
end

local getTextBounds = function(object,text)
	return textService:GetTextSize(getTextContent(text),object.TextSize,object.Font,Vector2.new(object.AbsoluteSize.X,math.huge))
end

return function(environment)
	local useIcons = environment.config.Messages.IncludeIcon
	local font = environment.config.UI.Fonts.TextFont
	local grouping = environment.config.Messages.MessageGrouping
	local merge = grouping and grouping.Enabled
	local timeout = grouping and grouping.GroupTimeout or 120
	local userSplit = environment.config.Messages.UserAndMessageOnSeparateLines
	
	local _gsub_escape_table = {
		["\000"] = "%z", ["("] = "%(", [")"] = "%)", ["."] = "%.",
		["%"] = "%%", ["+"] = "%+", ["-"] = "%-", ["*"] = "%*",
		["?"] = "%?", ["["] = "%[", ["]"] = "%]", ["^"] = "%^",
		["$"] = "%$",
	}
	
	local escapePattern = function(str)
		return str:gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", _gsub_escape_table)
	end
	
	function environment:updFont(new)
		font = environment.config.UI.Fonts.TextFont
		for _,obj in pairs(collectionService:GetTagged("TextFont")) do
			if obj and obj:GetFullName() ~= obj.Name then
				obj.Font = font
			end
		end
		for _,obj in pairs(collectionService:GetTagged("ChatbarFont")) do
			if obj and obj:GetFullName() ~= obj.Name then
				obj.Font = font
			end
		end
	end
	
	local editedText = environment.localization:localize("Chat_Edited")
	local editedStamp = ("<font color=\"rgb(200,200,200)\"> (%s)</font>"):format(editedText)
	local deletedStamp = ("<font color=\"rgb(200,200,200)\">(%s)</font>"):format("Unsent a message")
	environment.editedStamp = editedStamp
	
	local systemPrefixColor = environment.config.UI.Colors.SystemPrefixColor
	local meCommandColor = Color3.fromRGB(235, 235, 235)
	
	local scroller = environment.mainUi.scroller
	local templates = script.Parent:WaitForChild("templates")	
	local rich = environment.richText
	
	local util = script.Parent:WaitForChild("util")
	local regular = require(templates:WaitForChild("regular"))
	local functions = require(util:WaitForChild("functions"))(environment)
	local prompt = require(util:WaitForChild("prompt"))(environment,functions)
	
	environment.attachCustomEmojis = functions.attachCustomEmojis
	environment.addToCache.regular = regular.addToCache
	
	function environment:processEmojis(object,data,txt)
		if(data.customEmojis) then
			local spacing = functions.lineDetector:getSpacingFor(object,object.TextSize)
			data.spacing = spacing
			data.emojis = data.emojis or {}
			local idx = 0
			for _,emoji in pairs(data.customEmojis) do
				local emojiTag,emojiImage = emoji[1],emoji[2]
				txt = txt:gsub(escapePattern(emojiTag),spacing)
			end
		end
		return txt
	end
	
	local padding = 2
	local mentionString = ("@%s"):format(localPlayer.Name)
	environment.mouseMoved = environment.mouseMoved or {}
	
	local ts = function()
		return environment.config.UI.BaseTextSize
	end
	
	local getLast = function(toIgnore,relevantChannel)
		local last;
		for _,msg in pairs(environment.messages) do
			if(msg.data.id ~= toIgnore and msg.data.id < toIgnore) then
				if(msg.data.channelFrom == relevantChannel) then
					last = msg
				end
			end
		end
		return last
	end
	
	return function(data)
		local afterName = ": "
		if data.name == "" and data.displayName == "" then
			afterName = ""
		end
		local t = 0
		
		local lastMessage = getLast(data.id,data.channelFrom)
		local mergeMessage = false
				
		if lastMessage and lastMessage.data.name == data.name and merge then
			if lastMessage.data.class == data.class and data.channelFrom == lastMessage.data.channelFrom then
				local timeDiff = data.timeSent - lastMessage.data.timeSent
				if timeDiff <= timeout then
					if(lastMessage.data.id - data.id < 0) then
						mergeMessage = true
					end
				end
			end
		end
		
		local editCount = data.edits or 0
		local object = regular.new(environment)
		local id = data.player ~= nil and data.player.UserId or 0
		local canReceiveInput,lastPosition,iconOption,lastInBounds,lastSize,lastInput,lastPrompt = false,nil,nil,nil,nil,nil,nil
		
		environment:checkScrollerPos()
		
		local isMentioned = data.message:find(mentionString) and data.mentioningEnabled
		local isMeCommand = data.isMeCommand
		local canEdit = (data.senderId == localPlayer.UserId) and data.editingEnabled
		local canReply = (localPlayer:GetAttribute("Permission") >= data.requiredToReply)
		local originalText = data.message
		
		if data.imagesDisabled ~= true then
			if(useIcons and (not isMeCommand)) then
				local offset = (isMentioned and UDim2.new(0,8,0,0) or UDim2.new(0,0,0,0))
				if(data.viewportData) then
					task.spawn(function() -- spawned bc it yields and not cool >:(
						local viewport = environment.utility.viewport.new(data.viewportData,16)
						viewport.Parent = object
						viewport.Position = offset
						iconOption = viewport
					end)
				else
					object.Icon.Image = data.imageId ~= "" and data.imageId or functions:getUserThumbnail(id)
					object.Icon.Visible = true
					object.Icon.Position = offset
					iconOption = object.Icon
				end
				object.Raw.Size = UDim2.new(1,(isMentioned and -28 or -20),0,16)
				object.Edit.Size = UDim2.new(1,(isMentioned and -28 or -20),0,16)
			elseif(isMentioned) then
				object.Raw.Size = UDim2.new(1,-8,0,16)
				object.Edit.Size = UDim2.new(1,-8,0,16)
			end
		end
		
		if(isMentioned) then
			object.Mentioned.Visible = true
		end
		
		local hasDisplayName = data.displayName ~= data.name
		
		local tags = ""
		if(not isMeCommand) then
			tags = functions.getTags(data)
		else
			data.message = data.message:sub(5,#data.message)
		end
		
		local color = (data.teamColor or (hasDisplayName and data.displayNameColor or data.nameColor))
		local userPrefix = rich:colorize(data.displayName .. (isMeCommand and " " or afterName),isMeCommand and meCommandColor or color)
		local markdownEnabled = data.markdownEnabled
		local messageContent = (markdownEnabled and environment.richText:markdown(data.message)) or environment.richText:escape(data.message)		
		local originalContent = messageContent
		
		if(editCount >= 1) then
			messageContent = messageContent .. editedStamp
		end
		
		if(isMentioned) then
			messageContent = messageContent:gsub(mentionString,environment.richText:colorize(mentionString,Color3.fromRGB(255, 170, 0)))
		end
		
		if data.deleted then
			messageContent = deletedStamp
		end
		
		local getPrefix = function(update)
			if mergeMessage then
				return ""
			end
			
			if update then
				return functions.getTags(data) .. userPrefix .. (userSplit and "\n" or "")
			else
				return tags .. userPrefix ..  (userSplit and "\n" or "")
			end
		end
		
		if mergeMessage and iconOption then
			iconOption:Destroy()
			iconOption = nil
		end
		
		local prefix = getPrefix()
		
		local getText = function()
			if data.customEmojis and #data.customEmojis > 0 then
				return environment:processEmojis(object.Raw,data,messageContent)
			else
				return messageContent
			end
		end
		
		object.Raw.Text = prefix .. getText()
		object.Raw.TextColor3 = data.chatColor
		object.Raw.User.Text = prefix
		object.Parent = scroller
		object.LayoutOrder = data.id
		
		local i = 0
		local added = false
		local imgCont;
		
		local createContainer = function()
			added = true
			local container = Instance.new("Frame")
			container.Name = "ImageContainer"
			container.Size = UDim2.fromOffset(0,ts())
			container.Position = UDim2.fromOffset(0,0)
			container.Parent = object.Raw
			container.BackgroundTransparency = 1
			container.AutomaticSize = Enum.AutomaticSize.X
			local layout = Instance.new("UIListLayout")
			layout.Padding = UDim.new(0,5)
			layout.FillDirection = Enum.FillDirection.Horizontal
			layout.Parent = container
			layout.SortOrder = Enum.SortOrder.LayoutOrder
			imgCont = container
		end
		
		if not mergeMessage then
			for dx,tag in pairs(data.tags) do
				if tag.image and (not isMeCommand) then
					if not added then
						createContainer()
					end
					i += 1
					local image = Instance.new("ImageLabel")
					image.Size = UDim2.fromOffset(ts(),ts())
					image.Image = tag.image
					image.Parent = imgCont
					image.BackgroundTransparency = 1
					image.Name = tostring(i)
					image.LayoutOrder = dx
					image.ImageColor3 = tag.color or Color3.fromRGB(255,255,255)
				elseif not tag.image then
					if not isMeCommand then
						if not added and functions:hasImages(data.tags) then
							createContainer()
						end
						local psuedoTagSpacer = Instance.new("Frame")
						psuedoTagSpacer.Parent = imgCont
						psuedoTagSpacer.Name = tag.text
						psuedoTagSpacer.BackgroundTransparency = 1
						local size = textService:GetTextSize("["..tag.text.."]",ts(),font,Vector2.new(math.huge,ts()))
						psuedoTagSpacer.Size = UDim2.fromOffset(size.X-5,ts())
						psuedoTagSpacer.LayoutOrder = dx
					end
				end
			end
		end
		
		if(isMeCommand) then
			object.Raw.Text = italicize(object.Raw.Text)
		end
		
		if(isMeCommand) then
			object.Raw.TextColor3 = meCommandColor
		end
		
		local edit = object.Edit
		local collector = functions.createCollector(object,function() --> RBXScriptConnection collector
			prompt:removeData(object)
		end)
		
		local editCallback = function() end
		
		if(canEdit) then
			local hiding = false
			collector:add(object.Raw.DescendantAdded:Connect(function(child)
				if hiding and child:GetAttribute("IsEmoji") then
					child.Visible = false
				end
			end))
			
			editCallback = function()
				local prefix = getTextContent(prefix)
				local raw = object.Raw
				edit.Text = getTextContent(prefix .. originalContent)
				edit.TextTransparency = 1
				
				collector:add(object.Raw.Changed:Connect(function()
					edit.Size = UDim2.new(1,0,0,raw.AbsoluteSize.Y)
				end))
				
				collector:add(edit.Focused:Connect(function()
					hiding = true
					for _,obj in pairs(object.Raw:GetDescendants()) do
						if(obj:GetAttribute("IsEmoji") or obj:GetAttribute("IsMessagePart")) then
							obj.Visible = false
						end
					end
					if(iconOption) then
						iconOption.Visible = false
					end
					edit.TextTransparency = 0
					object.Raw:SetAttribute("CurrentlyEditing",true)
					if not data.customEmojis or #data.customEmojis < 1 then
						object.Raw.TextTransparency = 1
					end
				end))
				
				collector:add(edit.FocusLost:Connect(function(enterPressed)
					pcall(function()
						if(iconOption) then
							iconOption.Visible = true
						end
						if(enterPressed) then
							local newText = edit.Text:sub(#prefix+1,#edit.Text)
							environment:onEdit(newText)
							environment.network:fire("editMessage",data.id,data.channelFrom,newText)
						end
						edit.TextTransparency = 1
						hiding = false
						for _,obj in pairs(object.Raw:GetDescendants()) do
							if(obj:GetAttribute("IsEmoji") or obj:GetAttribute("IsMessagePart")) then
								obj.Visible = true
							end
						end
						object.Raw:SetAttribute("CurrentlyEditing",false)
						if not data.customEmojis or #data.customEmojis < 1 then
							object.Raw.TextTransparency = 0
						end
					end)
				end))
				
				collector:add(edit.Changed:Connect(function()
					if(edit.CursorPosition <= #prefix) then
						edit.CursorPosition = #prefix + 1
					end
					if(#edit.Text < #prefix) then
						edit.Text = prefix
					end
				end))
				
				collector:add(object.Raw:GetAttributeChangedSignal("CurrentlyEditing"):Connect(function()
					local currentlyEditing = object.Raw:GetAttribute("CurrentlyEditing")	
					for _,child in pairs(object.Raw:GetChildren()) do
						if(child.Name == "WrappedLine") then
							for _,obj in pairs(child:GetChildren()) do
								if obj:IsA("TextLabel") then
									child.TextTransparency = currentlyEditing and 1 or 0
								end
							end
						end
					end
				end))
				
				environment.utility:clampTextLimit(edit,environment.config.Messages.MaximumLength)
			end
		else
			edit:Destroy()
		end
		
		local user = object.Raw.User
		local mentionedBar = object:WaitForChild("Mentioned"):WaitForChild("Bar")
		local lastTextSize = 0
		
		local handleDifference = function()
			if data.customEmojis and #data.customEmojis > 0 then
				local txt = getText()
				object.Raw.Text = prefix .. txt
				functions:attachCustomEmojis(object.Raw,originalText,data.customEmojis,data.spacing,nil,editedStamp)
			end
		end
		
		local standardCheck = function()
			heartbeat:Wait()
			if(object:GetFullName() ~= object.Name) then
				if(object.AbsoluteSize ~= lastSize) then
					lastSize = object.AbsoluteSize
					local currentPadding = (object.Raw.TextBounds.Y > object.Raw.TextSize and padding or 0)
					mentionedBar.Size = UDim2.new(0,5,0,object.Raw.AbsoluteSize.Y + (currentPadding * 2)) --UDim2.new(0,5,0,object.Raw.TextBounds.Y + (currentPadding * 2))
					handleDifference()
				end
				if(object.Raw.TextSize ~= lastTextSize) then
					lastTextSize = object.Raw.TextSize
					if imgCont then
						imgCont.Size = UDim2.fromOffset(0,ts())
						for _,img in pairs(imgCont:GetChildren()) do
							if img:IsA("ImageLabel") then
								img.Size = UDim2.fromOffset(ts(),ts())
							elseif img:IsA("Frame") then
								local size = textService:GetTextSize("["..img.Name.."]",ts(),font,Vector2.new(math.huge,ts()))
								img.Size = UDim2.fromOffset(size.X,ts())
							end
						end
					end
					if not isMeCommand then
						prefix = getPrefix(true)
						object.Raw.Text = prefix .. getText()				
					end
					handleDifference()
				end
			else
				lastPosition = nil
				local current = environment.messages[data.id]
				if(current) then
					current = current["data"]["edits"]
					if(current == editCount) then -- wasnt edited when the obj was deleted
						if((tick()-environment.lastRefresh) >= 0.1) then
							environment.messages[data.id] = nil
						end
						data = nil
					end
				end
			end
		end
		
		collector:add(object.Changed:Connect(standardCheck))
		standardCheck()
		
		local loaded = false
		local load = function()
			loaded = true
			if(object:GetFullName() == object.Name) then
				return
			end
			environment.mouseMoved[object.Raw] = function(position)
				lastPosition = position
				local isInBounds = false
				if(position.X <= (object.AbsolutePosition.X + object.AbsoluteSize.X)) then
					if(position.X >= (object.AbsolutePosition.X)) then
						if(position.Y >= (object.AbsolutePosition.Y)) then
							if(position.Y <= (object.AbsolutePosition.Y + object.AbsoluteSize.Y)) then
								isInBounds = true
							end
						end
					end
				end
				canReceiveInput = isInBounds
			end
			
			environment.mouseMoved[object] = function(position)
				local inBounds = false
				if(position.X <= (user.AbsolutePosition.X + user.AbsoluteSize.X)) then
					if(position.X >= (user.AbsolutePosition.X)) then
						if(position.X >= (user.AbsolutePosition.X + getTextBounds(user,tags).X)) then
							if(position.Y >= (user.AbsolutePosition.Y)) then
								if(position.Y <= (user.AbsolutePosition.Y + user.AbsoluteSize.Y)) then
									inBounds = true
								end
							end
						end
					end
				end
				if(lastInBounds ~= inBounds) then
					lastInBounds = inBounds
					if(hasDisplayName) then
						if(inBounds) then
							userPrefix = rich:colorize(data.name .. afterName,(data.teamColor or data.nameColor))
						else
							userPrefix = rich:colorize(data.displayName .. afterName,(data.teamColor or data.displayNameColor))
						end
					end
					prefix = getPrefix()
					--object.Raw.Text = isMeCommand and italicize(text) or text
					handleDifference()
					
					if(canEdit and (not edit:IsFocused())) then
						object.Edit.Visible = (not inBounds)
					end
				end
			end
			
			local bools = {canEdit,canReply}
			local enabled = bools[1] or bools[2]
			
			if(enabled and not data.deleted) then
				prompt:set(object,canEdit,canReply)
				collector:add(userInput.InputBegan:Connect(function(input)
					if(lastPrompt) then
						task.delay(0.05,function()
							if(lastPrompt) then
								lastPrompt:Destroy()
								lastPrompt = nil
							end
						end)
					end
					if(input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton2) then
						heartbeat:Wait()
						if(canReceiveInput) then
							local key = tick()
							lastInput = key
							task.delay((userInput.TouchEnabled and 0.5 or 0),function()
								if(lastInput == key and (canReceiveInput)) then
									lastPrompt = prompt:open(object,data,collector,edit)
								end
							end)
						end
					end
				end))
			end
			
			collector:add(object.Raw.User.MouseButton1Click:Connect(function()
				functions:initWhisper(players:GetPlayerByUserId(data.senderId))
			end))
			
			task.spawn(editCallback)
		end
		
		collector:add(object.MouseEnter:Connect(function()
			if(not loaded) then
				load()
			end
		end))
		
		-- sobbing, the stupid custom emojis WILL NOT WORK (initially) without this
		
		if data.customEmojis and #data.customEmojis > 0 then
			local og,sig = tick(),nil
			local iterations = 0
			sig = runService.RenderStepped:Connect(function()
				if(iterations < 5) then
					iterations += 1
					handleDifference()
				else
					sig:Disconnect()
				end
			end)
		end
		
		return object
	end
end
-- Author: @Jumpathy
-- Name: reply.lua
-- Description: Message reply template
-- Note: This literally destroyed my brain cells to create lmao you better like it

local players = game:GetService("Players")
local runService = game:GetService("RunService")
local heartbeat = runService.Heartbeat
local localPlayer = players.LocalPlayer

local label = Instance.new("TextLabel")
label.RichText = true

local getTextContent = function(text)
	label.Text = text
	return label.ContentText
end

return function(environment)
	local scroller = environment.mainUi.scroller
	local templates = script.Parent:WaitForChild("templates")
	local replyMessage = require(templates:WaitForChild("reply"))
	local rich = environment.richText
	local editedStamp = ("<font color=\"rgb(200,200,200)\"> (%s)</font>"):format(environment.localization:localize("Chat_Edited"))
	local deletedStamp = ("<font color=\"rgb(200,200,200)\">(%s)</font>"):format("Unsent a message")
	local userSplit = environment.config.Messages.UserAndMessageOnSeparateLines
	
	local grouping = environment.config.Messages.MessageGrouping
	local merge = grouping and grouping.Enabled
	local timeout = grouping and grouping.GroupTimeout or 120
	
	local getText = function(data,wasEdited,key,internal,object)
		local isBlank = data.name == "" and data.displayName == ""
		local atEnd = isBlank and "" or ": "
		
		local editStamp = (wasEdited and editedStamp or "")
		local hasDisplayName = data.displayName ~= data.name
		local userPrefix = rich:colorize(data.displayName .. atEnd,(data.teamColor or (hasDisplayName and data.displayNameColor or data.nameColor)))
		local messageContent = (data.markdownEnabled and environment.richText:markdown(data.message)) or environment.richText:escape(data.message)
		local splitLine = userSplit and "\n" or ""
		if merge and internal then
			local previous = internal[math.clamp(key - 1,1,math.huge)]
			if previous ~= data then
				if previous.name == data.name then
					local timeDiff = data.timeSent - previous.timeSent
					if timeDiff <= timeout then
						userPrefix = ""
						splitLine = ""
					end
				end
			end
		end
		messageContent = environment:processEmojis(object,data,messageContent)
		if(data.customEmojis) then
			if(object.Name == "Reply") then
				object.Size = UDim2.new(1,0,0,object.TextSize)
				object.User.Size = UDim2.new(1,0,0,object.TextSize)
			end
			environment:attachCustomEmojis(object,messageContent,data.customEmojis,data.spacing,nil,editedStamp)
		end
		return userPrefix .. splitLine .. messageContent .. editStamp,userPrefix,messageContent ..editStamp
	end
	
	local label = Instance.new("TextLabel")
	label.RichText = true
	local getContent = function(text)
		label.Text = text
		return label.ContentText
	end

	local internal = {}
	local threadApis = {}
	local threadConnections = {}
	local lastChain

	local push = function(object,newReply)
		if(not object:FindFirstChild("ReplyChain")) then
			return false
		end
		local replyChain = object.ReplyChain
		local id = object:GetAttribute("ID")
		internal[id] = internal[id] or {}
		if(newReply) then
			table.insert(internal[id],newReply)
		end
		local isAtBottom = environment:atBottom()
		for _,child in pairs(replyChain:GetChildren()) do
			if(child:IsA("Frame")) then
				child:Destroy()
			end
		end
		local endIdx = #internal[id]
		for key,reply in pairs(internal[id]) do
			local template = replyMessage[key < endIdx and "Middle" or "Bottom"](environment)
			template.Parent = replyChain.Parent
			
			local content,userPrefix,raw = getText(reply,(reply.edits and reply.edits >= 1 and true or false),key,internal[id],template.ReplyArea.Reply)
			local isMentioned = raw:find(("@"..localPlayer.Name))
			local isOwner = (reply.senderId == localPlayer.UserId)
			local canEdit = isOwner and reply.editingEnabled
			local editBox = template.ReplyArea.Edit
			local connected
			template.ReplyArea.Reply.Text = content
			template.ReplyArea.Reply.TextColor3 = reply.chatColor
			getText(reply,(reply.edits and reply.edits >= 1 and true or false),key,internal[id],template.ReplyArea.Reply)
			
			local signals = {}
			local connect = function(sig)
				table.insert(signals,sig)
				if(not connected) then
					connected = template.Changed:Connect(function()
						if(template:GetFullName() == template.Name) then
							connected:Disconnect()
							for _,signal in pairs(signals) do 
								signal:Disconnect()
							end
							signals = {}
						end
					end)
				end
			end
			
			connect(template:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				getText(reply,(reply.edits and reply.edits >= 1 and true or false),key,internal[id],template.ReplyArea.Reply)
			end))
			
			if(editBox and canEdit) then
				local prefix = getContent(userPrefix)
				editBox.Text = prefix .. getTextContent(reply.message)
				editBox.TextTransparency = 1
				local hiding = false
				
				connect(template.ReplyArea.Reply.DescendantAdded:Connect(function(child)
					if(child:GetAttribute("IsEmoji") and hiding) then
						child.Visible = false
					end
				end))
				
				connect(editBox.Focused:Connect(function()
					hiding = true
					for _,obj in pairs(template.ReplyArea.Reply:GetDescendants()) do
						if(obj:GetAttribute("IsEmoji") or obj:GetAttribute("IsMessagePart")) then
							obj.Visible = false
						end
					end
					editBox.TextTransparency = 0
					template.ReplyArea.Reply:SetAttribute("CurrentlyEditing",true)
					if not reply.customEmojis then
						template.ReplyArea.Reply.TextTransparency = 1
					end
				end))

				connect(editBox.FocusLost:Connect(function(enterPressed)
					pcall(function()
						if(enterPressed) then
							local newText = editBox.Text:sub(#prefix+1,#editBox.Text)
							environment:onEdit(newText)
							environment.network:fire("editMessage",reply.id,reply.channelFrom,newText)
						end
						hiding = false
						for _,obj in pairs(template.ReplyArea.Reply:GetDescendants()) do
							if(obj:GetAttribute("IsEmoji") or obj:GetAttribute("IsMessagePart")) then
								obj.Visible = true
							end
						end
						editBox.TextTransparency = 1
						template.ReplyArea.Reply:SetAttribute("CurrentlyEditing",false)
						if not reply.customEmojis then
							template.ReplyArea.Reply.TextTransparency = 0
						end
					end)
				end))

				connect(editBox.Changed:Connect(function()
					if(editBox.CursorPosition <= #prefix) then
						editBox.CursorPosition = #prefix + 1
					end
					if(#editBox.Text < #prefix) then
						editBox.Text = prefix
					end
				end))
				
				connect(template.ReplyArea.Reply:GetAttributeChangedSignal("CurrentlyEditing"):Connect(function()
					local currentlyEditing = template.ReplyArea.Reply:GetAttribute("CurrentlyEditing")	
					for _,child in pairs(template.ReplyArea.Reply:GetChildren()) do
						if(child.Name == "WrappedLine") then
							for _,obj in pairs(child:GetChildren()) do
								if obj:IsA("TextLabel") then
									obj.TextTransparency = currentlyEditing and 1 or 0
								end
							end
						end
					end
				end))
				
				environment.utility:clampTextLimit(editBox,environment.config.Messages.MaximumLength)
			else
				editBox:Destroy()
			end
			if(isMentioned) then
				template.ReplyArea.Reply.Mentioned.Visible = true
				local changed
				changed = template.Changed:Connect(function()
					template.ReplyArea.Reply.Mentioned.Bar.Size = UDim2.fromOffset(5,0)
					heartbeat:Wait()
					if(template:GetFullName() ~= template.Name) then
						template.ReplyArea.Reply.Mentioned.Bar.Size = UDim2.fromOffset(5,template.ReplyArea.Reply.Mentioned.AbsoluteSize.Y)
					else
						changed:Disconnect()
					end
				end)
			else
				template.ReplyArea.Reply.Mentioned:Destroy()
			end
			template.Parent = replyChain
		end
		if(isAtBottom) then
			environment:checkScrollerPos(true,0.1)
		end
		return true
	end

	environment.threads = {}
	function environment:checkThread(id)
		return environment.threads[id] and threadApis[id]
	end
	
	--[[
		Flow:
		1. If a message is being replied to, check if there's an existing thread on that message
		1A. If there's not an existing thread, create one and continue
		1B. If there is, continue
		2. Push reply into message stack/thread
		
		Alternate:
		> Rebuild the thread if a message is edited
	--]]
	
	local main
	main = function(dta,queue)
		if(environment.threads[dta.replyingTo.id] == queue[1]) then
			push(queue[1],dta)
			return environment.threads[dta.replyingTo.id],threadApis[dta.replyingTo.id]
		elseif(environment.threads[dta.replyingTo.id] ~= nil) then
			internal[dta.replyingTo.id] = {}
			threadApis = {}
		end
		
		environment:checkScrollerPos()
		local object = replyMessage.new(environment)
		object.Parent = scroller

		local id = dta.replyingTo.id
		local originalMessage = dta.replyingTo
		local _,userPrefix,textContent = getText(originalMessage,nil,nil,nil,object.Original)
		local user = object.Original.User
		local lastInBounds = false
		
		object.Original.Text = userPrefix .. textContent
		object.LayoutOrder = dta.id
		object:SetAttribute("ID",id)
		object.Original.User.Text = userPrefix
		object.Original.TextColor3 = originalMessage.chatColor
		getText(originalMessage,nil,nil,nil,object.Original)
		
		local hasDisplayName = originalMessage.displayName ~= originalMessage.name
		local update = function()
			local isBlank = originalMessage.name == "" and originalMessage.displayName == ""
			local atEnd = isBlank and "" or ": "
			
			if(hasDisplayName) then
				if(lastInBounds) then
					userPrefix = rich:colorize(originalMessage.name .. atEnd,(originalMessage.teamColor or originalMessage.nameColor))
				else
					userPrefix = rich:colorize(originalMessage.displayName .. atEnd,(originalMessage.teamColor or originalMessage.displayNameColor))
				end
			end
			object.Original.Text = userPrefix .. textContent
		end
		
		environment.mouseMoved[object] = function(position)
			local inBounds = false
			if(position.X <= (user.AbsolutePosition.X + user.AbsoluteSize.X)) then
				if(position.X >= (user.AbsolutePosition.X)) then
					if(position.Y >= (user.AbsolutePosition.Y)) then
						if(position.Y <= (user.AbsolutePosition.Y + user.AbsoluteSize.Y)) then
							inBounds = true
						end
					end
				end
			end
			if(lastInBounds ~= inBounds) then
				lastInBounds = inBounds
				update()
			end
		end
		
		environment.threads[dta.replyingTo.id] = object
		push(object,dta)
		local changed,repaired = nil,false
		changed = object.Changed:Connect(function()
			if(object:GetFullName() == object.Name) then
				changed:Disconnect()
				internal[dta.replyingTo.id] = nil
				for _,conn in pairs(threadConnections[dta.replyingTo.id] or {}) do
					conn:Disconnect()
				end
				task.delay(3,function()
					if(not repaired) then
						lastChain = nil
					end
				end)
			end
		end)
		
		local repair = function(chain)
			repaired = true
			pcall(function()
				environment.threads[dta.replyingTo.id]:Destroy()
			end)
			if(chain) then
				internal[dta.replyingTo.id] = chain
			end
			environment.threads[dta.replyingTo.id] = nil
			local obj = main(dta,queue)
			table.insert(queue,1,obj)
		end
		
		local threadApi = {
			replace = function(data,queue)
				local replyChain = internal[id]
				if(not replyChain) then
					repair(lastChain)
					return
				else
					lastChain = replyChain
				end
				for key,child in pairs(replyChain) do
					if(child.id == data.id) then
						replyChain[key] = data
					end
				end
				local success = push(object,nil)
				if(not success) then
					repair(lastChain)
				end
			end,
			editBaseMessage = function(self,new)
				local _,_,newText = getText(new,nil,nil,nil,object.Original)
				textContent = newText .. editedStamp
				if new.deleted == true then
					textContent = deletedStamp
				end
				update()
			end,
		}
		threadApis[dta.replyingTo.id] = threadApi
		return object,threadApi
	end

	return main
end
-- Author: @Jumpathy
-- Name: functions.lua
-- Descriptions: Function serving for messages

return function(environment)
	local players = game:GetService("Players")
	local textService = game:GetService("TextService")
	local httpService = game:GetService("HttpService")

	local playerGui = players.LocalPlayer.PlayerGui

	local lineDetector = require(script.Parent.lineDetector)(
		require(environment.betterchat_shared.xml),
		environment.gui
	)
	
	local spritesheetManager = require(script.Parent.spritesheet)

	local rich = environment.richText
	local systemPrefixColor = environment.config.UI.Colors.SystemPrefixColor
	local font = environment.config.UI.Fonts.TextFont
	local localPlayer = players.LocalPlayer

	local functions = {}
	local c = "\u{200A}" .. " "

	local fs = function()
		return environment.config.UI.BaseTextSize
	end

	local _gsub_escape_table = {
		["\000"] = "%z", ["("] = "%(", [")"] = "%)", ["."] = "%.",
		["%"] = "%%", ["+"] = "%+", ["-"] = "%-", ["*"] = "%*",
		["?"] = "%?", ["["] = "%[", ["]"] = "%]", ["^"] = "%^",
		["$"] = "%$",
	}

	local escapePattern = function(str)
		return str:gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", _gsub_escape_table)
	end

	local generateSpaces = function(px)
		local a,i = 0,0
		repeat
			i += 1
			a = textService:GetTextSize(string.rep(c,i),fs(),font,Vector2.new(math.huge,fs()))
		until(a.X >= px)
		return string.rep(c,i)
	end

	function functions:hasImages(tagList)
		for _,obj in pairs(tagList) do
			if obj.image then
				return true
			end
		end
	end

	local getById = function(id)
		for _,plr in pairs(players:GetPlayers()) do
			if(math.abs(plr.UserId) == math.abs(id)) then
				return plr
			end
		end
	end

	functions.getTags = function(data)
		local tagsList = data.tags or {}
		if(data.isWhisper) then
			data.tags = {}
			tagsList = data.tags
			local sender = data.player
			local from = getById(sender==localPlayer and data.to_user or data.to_user)
			local opposite = getById(data.ids[1]==localPlayer.UserId and data.ids[2] or data.ids[1])
			if(from ~= nil) then
				local prefix = environment.localization:getMessagePrefix(sender == localPlayer and "To" or "From")
				table.insert(tagsList,1,{
					text = ("%s %s"):format(prefix,opposite:GetAttribute("DisplayName")),
					color = systemPrefixColor,
					specialTag = true
				})
			end
		elseif(data.isTeam) then
			local found = false;
			for k,v in pairs(tagsList) do
				if(v.teamTag) then
					found = true;
					break
				end
			end
			if not found then
				table.insert(tagsList,1,{
					text = environment.localization:getMessagePrefix("Team"),
					color = systemPrefixColor,
					teamTag = true
				})
			end
		end
		local tags = ""
		local padded = false
		local totalImages = 0;
		for _,tag in pairs(tagsList) do
			if tag.image and not padded then
				tags = tags .. generateSpaces(5)
				padded = true
			elseif tag.image then
				totalImages += 1
			end
			tag = tag.image and generateSpaces(fs()) or rich:colorize(("[TEXTHERE]"):format(tag.text),tag.color):gsub("TEXTHERE",rich:markdown(tag.text))
			tags = tags .. tag .. " "
		end
		if totalImages > 1 then
			tags = tags .. generateSpaces(5*(totalImages-1))
		end
		return tags
	end

	function functions:getUserThumbnail(userId)
		return("rbxthumb://type=AvatarHeadShot&id=%s&w=150&h=150"):format(userId)
	end

	function functions.createCollector(object,onEnd)
		local collector = {signals = {}}

		function collector:add(signal)
			if (collector) then
				table.insert(collector.signals,signal)
			end
		end

		local changed;
		changed = object.Changed:Connect(function()
			if(object:GetFullName() == object.Name) then
				changed:Disconnect()
				for _,signal in pairs(collector.signals) do
					signal:Disconnect()
				end
				collector.signals = nil
				collector = nil
				pcall(onEnd or function() end)
			end
		end)

		return collector
	end

	function functions:initReply(data)
		environment:setChannel(environment:generateReplyCode(data.id),true)
	end

	function functions:initWhisper(player)
		if(player and environment.config.Messages.Private.WhispersEnabled) then
			environment:whisper(player)
		end
	end

	function functions:getLines(object,text,spacing)
		return lineDetector:splitLines(object,text,spacing)
	end

	local guid = httpService:GenerateGUID()

	local getSize = function(object,text)
		return lineDetector:getTextSize(object,text)
	end

	local placeEmoji = function(object,customEmojis,id,num)
		local emoji = object:FindFirstChild(tostring(id)) or Instance.new("ImageLabel")
		emoji.Size = UDim2.fromOffset(object.TextSize,object.TextSize)
		emoji:SetAttribute("IsEmoji",true)
		emoji.Parent = object
		emoji.Name = tostring(id)
		emoji.Image = customEmojis[id][2]
		emoji.BorderSizePixel = 0
		emoji.BackgroundTransparency = 1
		emoji.ScaleType = environment.config.Messages.CustomEmojis.ScaleType
		emoji.LayoutOrder = num
		if customEmojis[id][5] then
			functions.animate(emoji,customEmojis[id][5])
		end
		environment.onEmoji:Fire(emoji)
	end

	local defaultTransformation = function(pos) 
		return pos 
	end

	local validify = function(cb)
		return typeof(cb) == "function" and cb or nil
	end
	
	local split = function(str, delimiter)
		local result = {}
		local pattern = string.format("(.-)()" .. delimiter .. "()")
		local lastEnd = 1

		for part, partEnd, splitStart in str:gmatch(pattern) do
			if part ~= "" then
				table.insert(result, part)
			end
			table.insert(result, str:sub(partEnd, splitStart - 1))
			lastEnd = splitStart
		end

		if lastEnd <= #str then
			table.insert(result, str:sub(lastEnd))
		end

		return result
	end
		
	local wrappedObject = {}
	
	function functions.animate(object,data)
		object.ImageRectSize = data.ImageRectSize
		spritesheetManager.new(object,data.Columns,data.Rows,data.Frames,data.FPS)
	end
	
	environment.animateCustomEmoji = functions.animate
	
	function functions:attachCustomEmojis(object, text, customEmojis, spacing , cb, editedStamp)
		local transformFunction = validify(cb) or defaultTransformation
		if(customEmojis and #customEmojis > 0) then
			object.TextTransparency = 1
			local currentlyEditing = object:GetAttribute("CurrentlyEditing")
			if wrappedObject[object] then
				for _,wrappedLine in pairs(wrappedObject[object]) do
					wrappedLine:Destroy()
				end
			end
			wrappedObject[object] = {}
			local emojiNumber = 0
			local lines = functions:getLines(object,spacing)
			for idx,line in pairs(lines) do
				if editedStamp then
					line = line:gsub(editedStamp,"")
				end
				local lineClone = object:Clone()
				lineClone.Size = UDim2.new(1,0,0,object.TextSize)
				lineClone.TextTransparency = currentlyEditing and 1 or 0
				lineClone.Parent = object
				lineClone.Position = UDim2.fromOffset(0,(idx - 1) * object.TextSize)
				lineClone.Text = ""
				lineClone.Parent = object
				lineClone.Name = "WrappedLine"
				if(object.Name ~= "Label") then
					lineClone.AnchorPoint = Vector2.new(0,0)
				else
					lineClone.AnchorPoint = Vector2.new(0.5,0.5)
					lineClone.Position = UDim2.new(0.5,0,0,(idx) * object.TextSize)
				end
				lineClone.TextWrapped = false
				lineClone.ClipsDescendants = true
				lineClone:ClearAllChildren()
				
				local layout = Instance.new("UIListLayout")
				layout.Parent = lineClone
				layout.FillDirection = Enum.FillDirection.Horizontal
				layout.SortOrder = Enum.SortOrder.LayoutOrder
				
				if(object.Name == "Label") then
					layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
				end
				
				table.insert(wrappedObject[object],lineClone)
				local prevEndPos = 0
				local order = 0
				
				local createText = function(text)
					local label = lineClone:Clone()
					label:ClearAllChildren()
					label.Parent = lineClone
					label.Text = text
					label.AutomaticSize = Enum.AutomaticSize.X
					label.Size = UDim2.new(0,0,0,label.TextSize)
					label:SetAttribute("IsMessagePart",true)
					order += 1
					label.LayoutOrder = order
				end
				
				for _,tag in pairs(lineDetector:splitXml(line)) do
					for _,text in pairs(split(tag.content,spacing)) do
						if(text == spacing) then
							emojiNumber += 1
							order += 1
							placeEmoji(lineClone,customEmojis,emojiNumber,order)
						else
							createText(text)
						end
					end
				end
			end
		end
	end

	functions.lineDetector = lineDetector

	return functions
end
-- Author: @Jumpathy
-- Name: prompt.lua
-- Description: Message context menu prompt

local customOptions = {}
local localPlayer = game:GetService("Players").LocalPlayer

local editPrompt = function(environment,data)
	local editPrompt = Instance.new("Frame")
	editPrompt.Name = "EditPrompt"
	editPrompt.AutomaticSize = Enum.AutomaticSize.XY
	editPrompt.BackgroundColor3 = Color3.fromRGB(40,40,40)
	editPrompt.BackgroundTransparency = 0
	editPrompt.BorderSizePixel = 0
	editPrompt.Position = UDim2.fromOffset(500, 50)
	editPrompt.Size = UDim2.fromOffset(100, 0)
	editPrompt.Visible = false
	editPrompt.ZIndex = 3

	local uIListLayout = Instance.new("UIListLayout")
	uIListLayout.Name = "UIListLayout"
	uIListLayout.Padding = UDim.new(0, 3)
	uIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
	uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	uIListLayout.Parent = editPrompt
	
	local uiPadding = Instance.new("UIPadding")
	uiPadding.Parent = editPrompt
	uiPadding.PaddingLeft = UDim.new(0,5)
	uiPadding.PaddingRight = UDim.new(0,5)
	uiPadding.PaddingTop = UDim.new(0,5)
	uiPadding.PaddingBottom = UDim.new(0,5)

	local reply = Instance.new("TextButton")
	reply.Name = "Reply"
	reply.Font = Enum.Font.GothamMedium
	reply.Text = "Reply"
	reply.TextColor3 = Color3.fromRGB(255, 255, 255)
	reply.TextSize = 14
	reply.TextXAlignment = Enum.TextXAlignment.Left
	reply.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	reply.BackgroundTransparency = 0
	reply.BorderSizePixel = 0
	reply.Size = UDim2.new(1,0,0,25)
	reply.ZIndex = 5
	reply.BackgroundColor3 = Color3.fromRGB(20,20,20)

	local roundness = Instance.new("UICorner")
	roundness.Parent = reply
	roundness.CornerRadius = UDim.new(0,environment.config.UI.Rounding)

	local uIPadding = Instance.new("UIPadding")
	uIPadding.Name = "UIPadding"
	uIPadding.PaddingBottom = UDim.new(0, 2)
	uIPadding.PaddingLeft = UDim.new(0, 5)
	uIPadding.PaddingRight = UDim.new(0, 5)
	uIPadding.PaddingTop = UDim.new(0, 2)
	uIPadding.Parent = reply
	
	local imageLabel = Instance.new("ImageLabel")
	imageLabel.Name = "ImageLabel"
	imageLabel.Image = "rbxassetid://8595302757"
	imageLabel.AnchorPoint = Vector2.new(1, 0.5)
	imageLabel.BackgroundTransparency = 1
	imageLabel.BorderSizePixel = 0
	imageLabel.Position = UDim2.fromScale(1, 0.5)
	imageLabel.Size = UDim2.fromOffset(20, 20)
	imageLabel.ZIndex = 5
	imageLabel.Parent = reply

	reply.Parent = editPrompt

	local uIPadding = Instance.new("UIPadding")
	uIPadding.Name = "UIPadding"
	uIPadding.PaddingBottom = UDim.new(0, 2)
	uIPadding.PaddingLeft = UDim.new(0, 10)
	uIPadding.PaddingRight = UDim.new(0, 10)
	uIPadding.PaddingTop = UDim.new(0, 2)
	uIPadding.Parent = editPrompt
	
	local roundness = Instance.new("UICorner")
	roundness.Parent = editPrompt
	roundness.CornerRadius = UDim.new(0,environment.config.UI.Rounding)

	local edit = Instance.new("TextButton")
	edit.Name = "Edit"
	edit.Font = Enum.Font.GothamMedium
	edit.Text = "Edit"
	edit.TextColor3 = Color3.fromRGB(255, 255, 255)
	edit.TextSize = 14
	edit.TextXAlignment = Enum.TextXAlignment.Left
	edit.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	edit.BackgroundTransparency = 0
	edit.BorderSizePixel = 0
	edit.LayoutOrder = 1
	edit.Size = UDim2.new(1,0,0,25)
	edit.Visible = false
	edit.ZIndex = 5
	edit.BackgroundColor3 = Color3.fromRGB(20,20,20)

	local roundness = Instance.new("UICorner")
	roundness.Parent = edit
	roundness.CornerRadius = UDim.new(0,environment.config.UI.Rounding)
	
	local uIPadding = Instance.new("UIPadding")
	uIPadding.Name = "UIPadding"
	uIPadding.PaddingBottom = UDim.new(0, 2)
	uIPadding.PaddingLeft = UDim.new(0, 5)
	uIPadding.PaddingRight = UDim.new(0, 5)
	uIPadding.PaddingTop = UDim.new(0, 2)
	uIPadding.Parent = edit

	local imageLabel1 = Instance.new("ImageLabel")
	imageLabel1.Name = "ImageLabel"
	imageLabel1.Image = "rbxassetid://8603600017"
	imageLabel1.AnchorPoint = Vector2.new(1, 0.5)
	imageLabel1.BackgroundTransparency = 1
	imageLabel1.BorderSizePixel = 0
	imageLabel1.Position = UDim2.fromScale(1, 0.5)
	imageLabel1.Size = UDim2.fromOffset(20, 20)
	imageLabel1.ZIndex = 5
	imageLabel1.Parent = edit

	edit.Parent = editPrompt

	local quickChat = Instance.new("TextButton")
	quickChat.Name = "QuickChat"
	quickChat.Font = Enum.Font.GothamMedium
	quickChat.Text = "Add"
	quickChat.TextColor3 = Color3.fromRGB(255, 255, 255)
	quickChat.TextSize = 14
	quickChat.TextXAlignment = Enum.TextXAlignment.Left
	quickChat.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	quickChat.BackgroundTransparency = 0
	quickChat.BorderSizePixel = 0
	quickChat.LayoutOrder = 2
	quickChat.Size = UDim2.new(1,0,0,25)
	quickChat.ZIndex = 5
	quickChat.BackgroundColor3 = Color3.fromRGB(20,20,20)

	local roundness = Instance.new("UICorner")
	roundness.Parent = quickChat
	roundness.CornerRadius = UDim.new(0,environment.config.UI.Rounding)
	
	
	local imageLabel2 = Instance.new("ImageLabel")
	imageLabel2.Name = "ImageLabel"
	imageLabel2.Image = "rbxassetid://6031243319"
	imageLabel2.AnchorPoint = Vector2.new(1, 0.5)
	imageLabel2.BackgroundTransparency = 1
	imageLabel2.BorderSizePixel = 0
	imageLabel2.Position = UDim2.fromScale(1, 0.5)
	imageLabel2.Size = UDim2.fromOffset(20, 20)
	imageLabel2.ZIndex = 5
	imageLabel2.Parent = quickChat
	
	local uIPadding = Instance.new("UIPadding")
	uIPadding.Name = "UIPadding"
	uIPadding.PaddingBottom = UDim.new(0, 2)
	uIPadding.PaddingLeft = UDim.new(0, 5)
	uIPadding.PaddingRight = UDim.new(0, 5)
	uIPadding.PaddingTop = UDim.new(0, 2)
	uIPadding.Parent = quickChat
	
	local delete = Instance.new("TextButton")
	delete.Name = "Delete"
	delete.Font = Enum.Font.GothamMedium
	delete.Text = "Unsend"
	delete.TextColor3 = Color3.fromRGB(255, 255, 255)
	delete.TextSize = 14
	delete.TextXAlignment = Enum.TextXAlignment.Left
	delete.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	delete.BackgroundTransparency = 0
	delete.BorderSizePixel = 0
	delete.LayoutOrder = 2
	delete.Size = UDim2.new(1,0,0,25)
	delete.ZIndex = 5
	delete.BackgroundColor3 = Color3.fromRGB(20,20,20)

	local roundness = Instance.new("UICorner")
	roundness.Parent = delete
	roundness.CornerRadius = UDim.new(0,environment.config.UI.Rounding)

	local imageLabel2 = Instance.new("ImageLabel")
	imageLabel2.Name = "ImageLabel"
	imageLabel2.Image = "rbxassetid://6022668885"
	imageLabel2.AnchorPoint = Vector2.new(1, 0.5)
	imageLabel2.BackgroundTransparency = 1
	imageLabel2.BorderSizePixel = 0
	imageLabel2.Position = UDim2.fromScale(1, 0.5)
	imageLabel2.Size = UDim2.fromOffset(20, 20)
	imageLabel2.ZIndex = 5
	imageLabel2.Parent = delete

	local uIPadding = Instance.new("UIPadding")
	uIPadding.Name = "UIPadding"
	uIPadding.PaddingBottom = UDim.new(0, 2)
	uIPadding.PaddingLeft = UDim.new(0, 5)
	uIPadding.PaddingRight = UDim.new(0, 5)
	uIPadding.PaddingTop = UDim.new(0, 2)
	uIPadding.Parent = delete
	
	quickChat.Parent = editPrompt
	delete.Parent = editPrompt
	
	for _,option in pairs(customOptions) do
		local createObject = true
		
		if not option.selfCanSee then
			if data.isPlayer and data.senderId == localPlayer.UserId then
				createObject = false
			end
		end
		
		local create = function()
			local customButton = Instance.new("TextButton")
			customButton.Name = option.text
			customButton.Font = Enum.Font.GothamMedium
			customButton.Text = option.text
			customButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			customButton.TextSize = 14
			customButton.TextXAlignment = Enum.TextXAlignment.Left
			customButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			customButton.BackgroundTransparency = 0
			customButton.BorderSizePixel = 0
			customButton.LayoutOrder = 2
			customButton.Size = UDim2.new(1,0,0,25)
			customButton.ZIndex = 5
			customButton.BackgroundColor3 = Color3.fromRGB(20,20,20)

			local roundness = Instance.new("UICorner")
			roundness.Parent = customButton
			roundness.CornerRadius = UDim.new(0,environment.config.UI.Rounding)

			local imageLabel2 = Instance.new("ImageLabel")
			imageLabel2.Name = "ImageLabel"
			imageLabel2.Image = option.icon
			imageLabel2.AnchorPoint = Vector2.new(1, 0.5)
			imageLabel2.BackgroundTransparency = 1
			imageLabel2.BorderSizePixel = 0
			imageLabel2.Position = UDim2.fromScale(1, 0.5)
			imageLabel2.Size = UDim2.fromOffset(20, 20)
			imageLabel2.ZIndex = 5
			imageLabel2.Parent = customButton

			local uIPadding = Instance.new("UIPadding")
			uIPadding.Name = "UIPadding"
			uIPadding.PaddingBottom = UDim.new(0, 2)
			uIPadding.PaddingLeft = UDim.new(0, 5)
			uIPadding.PaddingRight = UDim.new(0, 5)
			uIPadding.PaddingTop = UDim.new(0, 2)
			uIPadding.Parent = customButton

			customButton.Parent = editPrompt
		end
		
		if createObject then
			create()
		end
	end

	return editPrompt
end

return function(environment,functions)
	local quickChatEnabled = environment.config.Messages.QuickChat
	
	local options = {}
	local lastPrompt;
	
	function environment:addPromptOption(text,icon,visibleBySelf,callback)
		table.insert(customOptions,{
			text = text,
			icon = icon,
			callback = callback,
			selfCanSee = visibleBySelf
		})
	end
	
	return {open = function(self,object,data,collector,edit)
		for _,obj in pairs(environment.gui:GetChildren()) do
			if(obj.Name == "EditPrompt") then
				obj:Destroy()
			end
		end
		
		local prompt = editPrompt(environment,data)
		prompt.Parent = environment.gui
		prompt.Visible = true
		
		prompt.Edit.Visible = options[object]["canEdit"]
		prompt.Reply.Visible = options[object]["canReply"]
		prompt.QuickChat.Visible = (data.senderId == localPlayer.UserId) and quickChatEnabled
		prompt.Delete.Visible = (data.senderId == localPlayer.UserId) and data.deletingEnabled

		for _,obj in pairs(prompt:GetChildren()) do
			if(obj:IsA("TextButton")) then
				obj.MouseButton1Down:Connect(function()
					if(obj.Name == "Reply") then
						functions:initReply(data)
					elseif(obj.Name == "Edit") then
						edit:CaptureFocus()
					elseif(obj.Name == "Delete") then
						environment:deleteMessage(data)
					elseif(obj.Name == "QuickChat") then
						environment:openSaveChat(data.unfiltered)
					else
						for _,option in pairs(customOptions) do
							if(option.text == obj.Name) then
								task.spawn(option.callback,data)
							end
						end
					end
					lastPrompt:Destroy()
					lastPrompt = nil
				end)
			end
		end

		collector:add(object.Changed:Connect(function()
			if(lastPrompt == prompt) then
				prompt.Position = UDim2.fromOffset(
					object.AbsolutePosition.X,object.AbsolutePosition.Y + object.AbsoluteSize.Y
				)
			end
		end))

		lastPrompt = prompt
		object.ZIndex += 1
		object.ZIndex -= 1
		return prompt
	end,set = function(self,object,canEdit,canReply)
		options[object] = {
			canEdit = canEdit,
			canReply = canReply
		}
	end,removeData = function(self,object)
		options[object] = nil
	end}
end
return function(root,chatUi)
	local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
	local textService = game:GetService("TextService")
	
	local fromXml = root

	local byLetter = function(inputString,callback,spacing)
		for idx,codepoint in utf8.codes(inputString) do
			callback(utf8.char(codepoint),idx)
		end
	end

	local splitXmlAndText = function(input,override)
		local result = {}
		local stack = {}
		local lastIndex = 1

		-- Helper function to add text segments to the result
		local function addText(start, stop)
			if start <= stop then
				local text = input:sub(start, stop)
				table.insert(result, {["type"] = "text", content = text})
			end
		end

		while true do
			local tagStart, tagEnd = input:find("</?[%w:][^>]*>%s*", lastIndex)
			if not tagStart then
				addText(lastIndex, #input)
				break
			end

			local spacesStart, spacesEnd = input:find("^%s*", tagEnd + 1)
			if spacesStart then
				tagEnd = spacesEnd
			end

			if #stack == 0 then
				addText(lastIndex, tagStart - 1)
			end

			local tag = input:sub(tagStart, tagEnd)
			if tag:match("^</") then -- Closing tag
				if #stack > 0 then
					local openTagStart = table.remove(stack)
					if #stack == 0 then
						local content = input:sub(openTagStart, tagEnd)
						local toAdd;
						if(content:sub(#content,#content) == " ") then
							toAdd = tagEnd
							content = content:sub(1,#content-1)
						end
						if not override then
							table.insert(result, {["type"] = "xml", content = fromXml(content)})
						else
							table.insert(result, {["type"] = "text", content = content})
						end
						if toAdd then
							addText(tagEnd,tagEnd)
						end
					end
				end
			else
				table.insert(stack, tagStart)
			end

			lastIndex = tagEnd + 1
		end

		return result
	end

	local getIndex = function(dict)
		if(dict[1]) then
			return 1
		end
		for k,v in pairs(dict) do
			if(k ~= "_attr") then
				return k
			end
		end
	end

	local recurse;
	recurse = function(tag,index,depth,base)
		depth += 1
		local idx = getIndex(tag)
		if not base then
			base = tag
		end
		if(typeof(tag[idx]) == "table") then
			if(depth < 100) then
				local indexed = index or {}
				table.insert(indexed,idx)
				return recurse(tag[idx],indexed,depth,base)
			end
		else
			local indexed = index or {}
			table.insert(indexed,idx)
			return indexed
		end
	end

	local constructProxy = function()
		local gui = chatUi

		local label = Instance.new("TextLabel")
		label.Parent = gui
		label.TextWrapped = true
		label.AutomaticSize = Enum.AutomaticSize.Y
		label.RichText = true
		label.TextTransparency = 1
		label.BackgroundTransparency = 1
		label.Name = "WrappingLabel"
		
		return label
	end

	local proxyLabel = constructProxy()

	local wrapLabel = function(label)
		proxyLabel.Size = UDim2.fromOffset(label.AbsoluteSize.X,label.TextSize)
		proxyLabel.TextXAlignment = label.TextXAlignment
		proxyLabel.TextYAlignment = label.TextYAlignment
		proxyLabel.Text = label.Text
		proxyLabel.Font = label.Font
		proxyLabel.TextSize = label.TextSize
	end

	local invisibleChars = {
		utf8.char(0x200A),
		" "
	}
	
	local getTextSizeNew = function(text,fontSize,font)
		local params = Instance.new("GetTextBoundsParams")
		params.Font = Font.fromEnum(font)
		params.Size = fontSize
		params.Text = text
		return textService:GetTextBoundsAsync(params)
	end
	
	local testCharSupport = function(char, font, fontSize)
		local success, result = pcall(function()
			return getTextSizeNew(char, fontSize, font, Vector2.new(1000, 1000)).X > 0
		end)
		return success and result
	end

	local getSpacing = function(font,fontSize,targetWidth,idx)
		local supportedChars = {}
		local charWidths = {}
		local list = invisibleChars
		
		for _, char in ipairs(list) do
			if testCharSupport(char, font, fontSize) then
				table.insert(supportedChars, char)
				charWidths[char] = getTextSizeNew(char, fontSize, font, Vector2.new(1000, 1000)).X
			end
		end

		table.sort(supportedChars, function(a, b)
			return charWidths[a] < charWidths[b]
		end)

		local result = ""
		local currentWidth = 0
		
		while currentWidth < targetWidth do
			local bestChar = supportedChars[1]
			local bestDiff = math.huge
			for _, char in ipairs(supportedChars) do
				local newWidth = currentWidth + charWidths[char]
				local diff = math.abs(targetWidth - newWidth)

				if diff < bestDiff and newWidth <= targetWidth then
					bestChar = char
					bestDiff = diff
				end
			end
			result = result .. bestChar
			currentWidth = currentWidth + charWidths[bestChar]
			if currentWidth + charWidths[supportedChars[1]] > targetWidth then
				break
			end
		end

		return result, currentWidth
	end

	local lineDetector = {}
	
	local countChar = function(str, char)
		return select(2, string.gsub(str, char, ""))
	end
	
	function lineDetector:splitLines(object,spacing)
		local text = object.Text
		text = text:gsub(spacing,"<>")
				
		local response = ""
		if(object.Text:find("<")) then
			response = splitXmlAndText(text)
		else
			response = {
				{
					["type"] = "text",
					["content"] = text
				}
			}
		end

		local textSize = object.TextSize
		local maxWidth = object.AbsoluteSize.X
		local lines = {{}}

		local format = function(letter,italic,bold,color,stroke)
			if(italic == Enum.FontStyle.Italic) then
				letter = `<i>{letter}</i>`
			end
			if(bold == Enum.FontWeight.Bold) then
				letter = `<b>{letter}</b>`
			end
			if(color) then
				letter = `<font color="{color}">{letter}</font>`
			end
			if(stroke) then
				letter = `<stroke color="{stroke.color}" thickness="{stroke.thickness}" joins = "{stroke.joins}">{letter}</stroke>`
			end
			return letter
		end

		local richText = {}
		local count = 0
		for key, text in pairs(response) do
			text.style = Font.fromEnum(object.Font)
			text.letters = {}
			if text["type"] == "xml" then
				local innerContent = text.content
				for _,tag in pairs(recurse(text.content, nil, 0)) do
					if tag == "i" then
						text.style.Style = Enum.FontStyle.Italic
					elseif tag == "b" then
						text.style.Weight = Enum.FontWeight.Bold
					elseif tag == "font" then
						text.color = innerContent[tag]["_attr"]["color"]
					elseif tag == "stroke" then
						text.stroke = {}
						text.stroke.color = innerContent[tag]["_attr"]["color"]
						text.stroke.joins = innerContent[tag]["_attr"]["joins"]
						text.stroke.thickness = innerContent[tag]["_attr"]["thickness"]
					end
					innerContent = innerContent[tag]
				end
				text.content = innerContent
				local txt = ""
				local idx = 0
				byLetter(text.content,function(letter,i)
					idx += 1
					count += 1
					richText[count] = format(letter,text.style.Style,text.style.Weight,text.color,text.stroke)
					text.letters[idx] = letter
				end)
			else
				local idx = 0
				byLetter(text.content,function(letter,i)
					count += 1
					idx += 1
					text.letters[idx] = letter
				end)
			end
		end
		
		local lines = {}

		wrapLabel(object)

		local current = ""
		local idx = 0
		local lastWhitespace = 0
		local lastStart = 0
		local lineIndexes = {{1}}

		local add = function(idx,loc)
			local last = lineIndexes[#lineIndexes]
			local previous;
			if(#lineIndexes > 1) then
				previous = lineIndexes[#lineIndexes - 1]
			end
			if(#last < 2) then
				table.insert(last,idx)
				if current:sub(last[1],last[1]):match("%s") then
					last[1] += 1
				end
				if previous then
					if(last[1] == previous[2]) then
						last[1] += 1
					end
				end
			else
				lineIndexes[#lineIndexes + 1] = {}
				table.insert(lineIndexes[#lineIndexes],idx)
				if previous then
					if(last[1] == previous[2]) then
						last[1] += 1
					end
				end
			end
		end
		
		for _, tag in pairs(response) do
			for _, letter in pairs(tag.letters) do
				idx += 1
				current ..= letter
				local lastSize = proxyLabel.AbsoluteSize.Y
				proxyLabel.Text = current
				if(letter:match("%s")) then
					lastWhitespace = idx
				end
				local currentSize = proxyLabel.AbsoluteSize.Y
				if(currentSize - lastSize ~= 0 and (idx ~= 1) or letter == "\n") then
					local lastWord = current:sub(lastWhitespace+1,#current)
					proxyLabel.Text = lastWord
					if current:match("%s") then
						local lastWordSizeY = proxyLabel.AbsoluteSize.Y
						local wrapStart = 0
						if(lastWordSizeY > proxyLabel.TextSize) then
							wrapStart = #current
							lastStart = lastStart - 1
						else
							wrapStart = lastWhitespace
						end
						if(lastStart ~= 0) then
							add(lastStart+1,1)
						end
						lastStart = wrapStart
						add(wrapStart-1,2)
					else
						if(lastStart ~= 0) then
							add(lastStart-1)
						end
						lastStart = idx
						add(idx-1)
					end
					proxyLabel.Text = current
				end
			end
		end
		for k,index in pairs(lineIndexes) do
			if(k > 1) then
				local previous = lineIndexes[k - 1]
				local diff = (index[1] - previous[2])-1
				if(diff > 0) then
					index[1] -= diff
				end
			end
			table.insert(lines,current:sub(index[1],index[2]))
		end
		local last = lineIndexes[#lineIndexes]
		if(last[#last] ~= #current and proxyLabel.AbsoluteSize.Y > proxyLabel.TextSize) then
			table.insert(lines,current:sub(last[#last]+1,#current))
		end
		local total = 0
		for k,line in pairs(lines) do
			local reconstructed = ""
			for i = 1,#line do
				total += 1
				if richText[total] then
					reconstructed ..= richText[total]
				else 
					reconstructed ..= line:sub(i,i)
				end
			end
			lines[k] = reconstructed
		end
		
		for k,line in pairs(lines) do
			if(line:sub(1,1):match("%s")) then
				lines[k] = line:sub(2,#line)
			end
		end
		
		for k,line in pairs(lines) do
			local lastChar,nextChar = line:sub(#line,#line),nil
			local nextLine = lines[k + 1]
			if nextLine then
				nextChar = nextLine:sub(1,1)
			end 
			if(lastChar == "<" and nextChar == ">") then
				lines[k] = line:sub(1,#line-1)
				lines[k + 1] = "<" .. nextLine
			end
		end
		
		for k,line in pairs(lines) do
			lines[k] = line:gsub("<>",spacing)
		end
								
		return lines
	end
	
	function lineDetector:splitXml(text)
		return splitXmlAndText(text,true)
	end

	function lineDetector:getSpacingFor(object,spacing)
		return getSpacing(object.Font,object.TextSize,spacing)
	end

	function lineDetector:getTextSize(object,text)
		wrapLabel(object)
		proxyLabel.Text = text
		proxyLabel.AutomaticSize = Enum.AutomaticSize.None
		return proxyLabel.TextBounds
	end

	return lineDetector
end
-- Author: @Jumpathy
-- Name: spritesheet.lua
-- Description: Spritesheet manager

local goToFrame = function(image,frame,rowCount)
	local totalFrames = rowCount.X * rowCount.Y
	local offsetSize = image.ImageRectSize

	frame = math.clamp(frame,1,totalFrames)
	local row = math.ceil((frame / totalFrames)*rowCount.Y)
	local column = (frame - (rowCount.X * (row - 1))) 

	local xPos = (offsetSize.X * (-1 + column))
	local yPos = (offsetSize.Y * (-1 + row))
	image.ImageRectOffset = Vector2.new(xPos,yPos)
end

local manager = {}

function manager.new(imageLabel,columns,rows,totalFrames,fps)
	local rowCount = Vector2.new(columns,rows)
	goToFrame(imageLabel,1,rowCount)

	local atFrame = 0;
	task.spawn(function()
		while(imageLabel and imageLabel:GetFullName() ~= imageLabel.Name) do
			atFrame = (atFrame + 1 > totalFrames and 1 or atFrame + 1)
			goToFrame(imageLabel,atFrame,rowCount)
			task.wait(1/(fps))
		end
	end)
end

return manager
-- Author: @Jumpathy
-- Name: developerConsole.lua
-- Description: Ability to open developer console via /console

local starterGui = game:GetService("StarterGui")
local command = {}
command.name = "console"
command.aliases = {}
command.call = function()
	local devConsoleVisible = game.StarterGui:GetCore("DevConsoleVisible")
	game:GetService("StarterGui"):SetCore("DevConsoleVisible",not devConsoleVisible)
end

return command
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
-- Author: @Jumpathy
-- Name: customEmojis.lua
-- Description: Custom emojis command

local command = {}
command.name = "emojis"
command.aliases = {"customemojis","list"}
command.security = "internal"
command.call = function(text,environment)
	local config = environment.config
	if config.Messages.CustomEmojis and config.Messages.CustomEmojis.Enabled then
		local msg = "Available custom emojis:\n"
		for emojiName,_ in pairs(environment.network:invoke("getAllowedEmojis")) do
			msg = msg .. `:{emojiName}:\n`
		end
		environment:sendSystemMessage(msg:sub(1,#msg-1))
	end
end

return command
-- Author: @Jumpathy
-- Name: mute.lua
-- Description: Ability to mute users

local players = game:GetService("Players")

local command = {}
command.name = "mute"
command.aliases = {"m"}
command.security = "internal"

command.call = function(text,env)
	local user = text:sub(string.find(text," ")+1,#text)
	if(user:sub(#user,#user) == " ") then
		user = user:sub(1,#user-1)
	end
	local player = players:FindFirstChild(user)
	if(player) then
		env:mute(player)
	end
end

return command
-- Author: @Jumpathy
-- Name: unmute.lua
-- Description: Ability to unmute users

local players = game:GetService("Players")

local command = {}
command.name = "unmute"
command.aliases = {"unm"}
command.security = "internal"

command.call = function(text,env)
	local user = text:sub(string.find(text," ") + 1,#text)
	if(user:sub(#user,#user) == " ") then
		user = user:sub(1,#user-1)
	end
	local player = players:FindFirstChild(user)
	if(player) then
		env:unmute(player)
	end
end

return command
-- Author: @Jumpathy
-- Name: settings.lua
-- Description: Open settings menu

local starterGui = game:GetService("StarterGui");
local command = {};
command.name = "settings";
command.aliases = {"s"};
command.security = "internal"
command.call = function(_,environment)
	pcall(function()
		if(environment.config.SettingsMenu.Enabled and (not environment.config.SettingsMenu.ApiEnabledAndUIDisabled)) then
			environment:openSettingsMenu()
		end
	end)
end

return command;
-- Author: @Jumpathy
-- Name: help.lua
-- Description: /help command

local starterGui = game:GetService("StarterGui")
local keys = {
	"GameChat_ChatCommandsTeller_Desc",
	"GameChat_ChatCommandsTeller_MeCommand",
	"GameChat_ChatCommandsTeller_MuteCommand",
	"GameChat_ChatCommandsTeller_SwitchChannelCommand",
	"GameChat_ChatCommandsTeller_TeamCommand",
	"GameChat_ChatCommandsTeller_UnMuteCommand",
	"GameChat_ChatCommandsTeller_WhisperCommand"
}

local command = {}
command.name = "help"
command.aliases = {}
command.security = "internal"
command.call = function(text,environment)
	local msg = ""
	for _,key in pairs(keys) do
		msg = msg .. environment.localization:localize(key) .. "\n"
	end
	environment:sendSystemMessage(msg:sub(1,#msg-1))
end

return command
-- Author: @Jumpathy
-- Name: processor.lua
-- Description: Command processor

local commands = {}
local onCommandLoaded = function(command)
	local module = require(command)
	commands[module.name] = module
end
script.Parent:WaitForChild("list").ChildAdded:Connect(onCommandLoaded)
for _,child in pairs(script.Parent.list:GetChildren()) do
	task.spawn(onCommandLoaded,child)
end

return function(environment)
	return {
		parse = function(self,text)
			if(text:sub(1,1) == "/") then
				local commandName = text:split(string.char(32))[1]:gsub("/","")
				for name,data in pairs(commands) do
					if(name == commandName or (table.find(data.aliases,commandName))) then
						local args = {}
						if(data.security == "internal") then
							table.insert(args,environment)
						end
						task.spawn(data.call,text,unpack(args))
						return true
					end
				end
			end
		end,
	}
end
-- Author: @Jumpathy
-- Name: slider.lua
-- Description: Slider gui controller

local slider = {}
local userInput = game:GetService("UserInputService")
local runService = game:GetService("RunService")

function slider.new(main,min,max,default,on)
	local object = main:WaitForChild("Center"):WaitForChild("Actual")
	local box = object:WaitForChild("Amount")
	local bar = object:WaitForChild("Bar")
	local button = bar:WaitForChild("Button")
	local progress = bar:WaitForChild("Progress")
	local holding,lastText = false,nil

	button.InputBegan:Connect(function(input)
		if((input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1) and (not holding)) then
			local ended
			holding = true
			ended = input.Changed:Connect(function()
				if(input.UserInputState == Enum.UserInputState.End) then
					ended:Disconnect()
					holding = false
				end
			end)
		end
	end)

	local handlePositioning = function(percentage)
		local xMin = ((button.AbsoluteSize.X / 2)/bar.AbsoluteSize.X)
		local xMax = ((bar.AbsoluteSize.X - (button.AbsoluteSize.X / 2)) / bar.AbsoluteSize.X)
		local positionPercentage = math.clamp(percentage,xMin,xMax)
		button.Position = UDim2.fromScale(positionPercentage,0.5)
		progress.Size = UDim2.fromScale(positionPercentage,1)
	end
	
	local handle = function(num)
		on(math.clamp(num,min,max))
	end
	
	local getNumberFromPercentage = function(percentage)
		return math.clamp((min + ((max - min) * percentage)),min,max)
	end
	
	local rescale = function()
		local newNumber = tonumber(box.Text) or 0
		local percentage = (newNumber - min) / (max - min)
		handlePositioning(percentage)
		local rawNumber = getNumberFromPercentage(percentage)
		handle(rawNumber)
		lastText = tostring(rawNumber)
		box.Text = tonumber(rawNumber)
	end

	runService.Heartbeat:Connect(function()
		if(holding) then
			local mouseLocation = userInput:GetMouseLocation()
			local relativePosition = mouseLocation - object.AbsolutePosition
			local percentage = math.clamp(relativePosition.X / bar.AbsoluteSize.X,0,1)
			local rawNumber = getNumberFromPercentage(percentage)
			box.Text = tostring(math.floor(rawNumber))
			handlePositioning(percentage)
			handle(rawNumber)
		end
	end)
	
	box.FocusLost:Connect(rescale)
	box.Changed:Connect(function()
		if(not holding and (box.Text ~= lastText) and (box.Text ~= "")) then
			if(not box:IsFocused()) then
				rescale()
			end
		end
	end)

	box.Text = tostring(default)
	return {
		set = function(self,new)
			box.Text = tostring(math.floor(new))
			rescale()
		end,
	}
end

return slider
-- Author: @Jumpathy
-- Name: toggle.lua
-- Description: Toggle ui controller

local toggle = {}
local tweenService = game:GetService("TweenService")
local length,style = 0.16,Enum.EasingStyle.Linear
local tweenInfo = TweenInfo.new(length,style)
local offset = 3

function toggle.new(object,default,callback,environment)
	local container = object:WaitForChild("Toggle")
	local zone = container:WaitForChild("Zone")
	local switch = container:WaitForChild("Rounded")
	local state = default

	local handle = function(doCall)
		tweenService:Create(container,tweenInfo,{["BackgroundColor3"] = (state and Color3.fromRGB(72,175,240) or Color3.fromRGB(171,171,171))}):Play()
		environment.tweenPosition(switch,UDim2.new((state and 1 or 0),(state and -offset or (switch.AbsoluteSize.X + offset)),0.5,0),Enum.EasingDirection.InOut,style,length,true)
		if(doCall) then
			callback(state)
		end
	end

	zone.MouseButton1Click:Connect(function()
		state = not state
		handle(true)
	end)

	handle()
	return {
		set = function(self,new)
			self.value = new
			state = new
			handle(true)
		end
	}
end

return toggle
-- Author: @Jumpathy
-- Name: dropdown.lua
-- Description: UI dropdown controller

local dropdown = {}

local newOption = function(text)
	local option = Instance.new("TextButton")
	local padding = Instance.new("UIPadding")

	option.Name = "Option"
	option.BackgroundColor3 = Color3.fromRGB(30,30,30)
	option.BackgroundTransparency = 1
	option.BorderColor3 = Color3.fromRGB(27,42,53)
	option.BorderSizePixel = 0
	option.Size = UDim2.new(1,-10,0,25)
	option.ZIndex = 15
	option.Font = Enum.Font.GothamMedium
	option.Text = text
	option.TextColor3 = Color3.fromRGB(255,255,255)
	option.TextSize = 14
	option.TextXAlignment = Enum.TextXAlignment.Left

	padding.Parent = option
	padding.PaddingLeft = UDim.new(0,5)
	return option
end

local images = {
	[false] = "rbxassetid://8677555693",
	[true] = "rbxassetid://8677748645"
}

function dropdown.new(gui,options,callback,main,environment)
	main = main or function() end
	local optionContainer = gui:WaitForChild("Dropdown"):WaitForChild("Options")
	local top = gui:WaitForChild("TopContainer")
	local button = gui:WaitForChild("Title"):WaitForChild("Drop")
	local selected = gui:WaitForChild("Title"):WaitForChild("Selected")
	local state,last = false,nil

	local setOpen = function()
		local key = tick()
		last = key
		button.Icon.Image = images[state]
		local set = function()
			top.Flat.Visible = state
			top.Background.ClipsDescendants = state
		end
		if(state) then
			set()
		end
		environment.tweenSize(gui,UDim2.new(1,-10,0,(30 + (state and (25 * #options + (#options >= 2 and ((#options - 1)*3) or 0)) or 0))),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.25,true,function()
			if(last == key and (not state)) then
				set()
			end
		end)
	end

	local toggle = function()
		state = not state
		setOpen()
	end

	button.MouseButton1Click:Connect(toggle)
	for _,option in pairs(options) do
		local button = newOption(option)
		button.Parent = optionContainer
		button.MouseButton1Click:Connect(function()
			selected.Text = option
			toggle()
			callback(option)
		end)
		main(button)
	end

	selected.Text = options[1]
	setOpen()
	return {
		set = function(self,option)
			if(table.find(options,option)) then
				selected.Text = option
				callback(option)
			end
		end,
	}
end

return dropdown
-- Author: @Jumpathy
-- Name: quickChatDropdown.lua
-- Description: Quick chat individual option component function

local boxScale = {}
local textService = game:GetService("TextService")
local tweenService = game:GetService("TweenService")

function boxScale.new(box,callback)
	local scale = function()
		local text = (box.Text ~= "" and box.Text or box.PlaceholderText)
		local bounds = textService:GetTextSize(text,box.TextSize,box.Font,Vector2.new(box.AbsoluteSize.X-10,math.huge))
		box.Size = UDim2.new(1,0,0,bounds.Y + 10)
		callback(0)
	end
	box:GetPropertyChangedSignal("Text"):Connect(scale)
	scale()
end

local tween = function(object,properties,length)
	local info = TweenInfo.new(length,Enum.EasingStyle.Linear,Enum.EasingDirection.Out)
	tweenService:Create(object,info,properties):Play()
end

local quickChatDropdown = {}

local images = {
	[false] = "rbxassetid://8677555693",
	[true] = "rbxassetid://8677748645";
}

local new = function()
	local dropdown = Instance.new("Frame")
	dropdown.Name = "Dropdown"
	dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	dropdown.BackgroundTransparency = 1
	dropdown.BorderSizePixel = 0
	dropdown.Position = UDim2.fromScale(0, 1)
	dropdown.Size = UDim2.new(1, -10, 0, 30)
	dropdown.ZIndex = 8

	local container = Instance.new("Frame")
	container.Name = "Container"
	container.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	container.BorderSizePixel = 0
	container.ClipsDescendants = true
	container.Position = UDim2.fromOffset(0, 25)
	container.Size = UDim2.fromScale(1, 0)
	container.ZIndex = 8

	local scroller = Instance.new("Frame")
	scroller.Name = "Scroller"
	scroller.AnchorPoint = Vector2.new(0.5, 0)
	scroller.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	scroller.BackgroundTransparency = 1
	scroller.BorderSizePixel = 0
	scroller.Position = UDim2.new(0.5, 0, 0, 5)
	scroller.Size = UDim2.new(1, -10, 1, -5)
	scroller.ZIndex = 8

	local uIListLayout = Instance.new("UIListLayout")
	uIListLayout.Name = "UIListLayout"
	uIListLayout.Padding = UDim.new(0, 5)
	uIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout.Parent = scroller

	local box = Instance.new("TextBox")
	box.Name = "Box"
	box.ClearTextOnFocus = false
	box.Font = Enum.Font.GothamMedium
	box.PlaceholderText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
	box.Text = ""
	box.TextColor3 = Color3.fromRGB(255, 255, 255)
	box.TextSize = 14
	box.TextWrapped = true
	box.TextXAlignment = Enum.TextXAlignment.Left
	box.TextYAlignment = Enum.TextYAlignment.Top
	box.AnchorPoint = Vector2.new(0, 1)
	box.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	box.BorderColor3 = Color3.fromRGB(27, 42, 53)
	box.BorderSizePixel = 0
	box.Size = UDim2.new(1, 0, 0, 56)
	box.ZIndex = 8

	local uIPadding = Instance.new("UIPadding")
	uIPadding.Name = "UIPadding"
	uIPadding.PaddingBottom = UDim.new(0, 5)
	uIPadding.PaddingLeft = UDim.new(0, 5)
	uIPadding.PaddingRight = UDim.new(0, 5)
	uIPadding.PaddingTop = UDim.new(0, 5)
	uIPadding.Parent = box

	local uICorner = Instance.new("UICorner")
	uICorner.Name = "UICorner"
	uICorner.Parent = box

	box.Parent = scroller

	local uIPadding1 = Instance.new("UIPadding")
	uIPadding1.Name = "UIPadding"
	uIPadding1.PaddingTop = UDim.new(0, 5)
	uIPadding1.Parent = scroller

	local options = Instance.new("Frame")
	options.Name = "Options"
	options.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	options.Size = UDim2.new(1, -10, 0, 30)

	local uIListLayout1 = Instance.new("UIListLayout")
	uIListLayout1.Name = "UIListLayout"
	uIListLayout1.Padding = UDim.new(0, 5)
	uIListLayout1.FillDirection = Enum.FillDirection.Horizontal
	uIListLayout1.HorizontalAlignment = Enum.HorizontalAlignment.Center
	uIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout1.Parent = options

	local save = Instance.new("TextButton")
	save.Name = "Save"
	save.Font = Enum.Font.GothamMedium
	save.Text = "Save"
	save.TextColor3 = Color3.fromRGB(255, 255, 255)
	save.TextSize = 14
	save.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	save.TextXAlignment = Enum.TextXAlignment.Left
	save.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
	save.BorderSizePixel = 0
	save.Size = UDim2.new(0.5, 0, 0, 30)
	save.ZIndex = 8

	local icon = Instance.new("ImageLabel")
	icon.Name = "Icon"
	icon.Image = "rbxassetid://6035067857"
	icon.AnchorPoint = Vector2.new(0, 0.5)
	icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	icon.BackgroundTransparency = 1
	icon.Position = UDim2.new(0, -25, 0.5, 0)
	icon.Size = UDim2.fromOffset(20, 20)
	icon.ZIndex = 9
	icon.Parent = save

	local uICorner1 = Instance.new("UICorner")
	uICorner1.Name = "UICorner"
	uICorner1.Parent = save

	local uIPadding2 = Instance.new("UIPadding")
	uIPadding2.Name = "UIPadding"
	uIPadding2.PaddingLeft = UDim.new(0, 30)
	uIPadding2.Parent = save

	save.Parent = options

	local delete = Instance.new("TextButton")
	delete.Name = "Delete"
	delete.Font = Enum.Font.GothamMedium
	delete.Text = "Delete"
	delete.TextColor3 = Color3.fromRGB(255, 255, 255)
	delete.TextSize = 14
	delete.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	delete.TextXAlignment = Enum.TextXAlignment.Left
	delete.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
	delete.BorderSizePixel = 0
	delete.Size = UDim2.new(0.5, 0, 0, 30)
	delete.ZIndex = 8

	local icon1 = Instance.new("ImageLabel")
	icon1.Name = "Icon"
	icon1.Image = "http://www.roblox.com/asset/?id=6022668885"
	icon1.AnchorPoint = Vector2.new(0, 0.5)
	icon1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	icon1.BackgroundTransparency = 1
	icon1.Position = UDim2.new(0, -25, 0.5, 0)
	icon1.Size = UDim2.fromOffset(20, 20)
	icon1.ZIndex = 9
	icon1.Parent = delete

	local uICorner2 = Instance.new("UICorner")
	uICorner2.Name = "UICorner"
	uICorner2.Parent = delete

	local uIPadding3 = Instance.new("UIPadding")
	uIPadding3.Name = "UIPadding"
	uIPadding3.PaddingLeft = UDim.new(0, 30)
	uIPadding3.Parent = delete

	delete.Parent = options

	options.Parent = scroller

	local command = Instance.new("TextLabel")
	command.Name = "Command"
	command.Font = Enum.Font.GothamMedium
	command.Text = "Send in chat using '/1'"
	command.TextColor3 = Color3.fromRGB(200, 200, 200)
	command.TextSize = 14
	command.TextXAlignment = Enum.TextXAlignment.Left
	command.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	command.BackgroundTransparency = 1
	command.Size = UDim2.new(1, 0, 0, 20)
	command.ZIndex = 8

	local uIPadding4 = Instance.new("UIPadding")
	uIPadding4.Name = "UIPadding"
	uIPadding4.PaddingLeft = UDim.new(0, 5)
	uIPadding4.Parent = command

	command.Parent = scroller

	scroller.Parent = container

	container.Parent = dropdown

	local title = Instance.new("TextLabel")
	title.Name = "Title"
	title.Font = Enum.Font.GothamMedium
	title.Text = "1"
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.TextSize = 14
	title.Active = true
	title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	title.BorderColor3 = Color3.fromRGB(27, 42, 53)
	title.BorderSizePixel = 0
	title.Selectable = true
	title.Size = UDim2.new(1, 0, 0, 30)
	title.ZIndex = 8

	local uICorner3 = Instance.new("UICorner")
	uICorner3.Name = "UICorner"
	uICorner3.Parent = title

	local icon2 = Instance.new("ImageButton")
	icon2.Name = "Icon"
	icon2.Image = "rbxassetid://8677555693"
	icon2.Active = false
	icon2.AnchorPoint = Vector2.new(1, 0.5)
	icon2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	icon2.BackgroundTransparency = 1
	icon2.Position = UDim2.new(1, -5, 0.5, 0)
	icon2.Selectable = false
	icon2.Size = UDim2.fromOffset(30, 30)
	icon2.ZIndex = 10
	icon2.Parent = title

	title.Parent = dropdown

	return dropdown
end

function quickChatDropdown.new(text,title,callback)
	local object = new()
	local container = object:WaitForChild("Container")
	local scroller = container:WaitForChild("Scroller")
	local box = scroller:WaitForChild("Box")
	local layout = scroller:WaitForChild("UIListLayout")
	local state = false
		
	scroller.Command.Text = ("Send in chat using '/%s'"):format(title)
	object.Title.Text = title
	box.Text = text

	local scale = function(length)
		local size = (state and UDim2.new(1,0,0,layout.AbsoluteContentSize.Y + 15) or UDim2.fromScale(1,0))
		tween(container,{
			Size = size
		},length)
		tween(object,{
			Size = UDim2.new(1,-10,0,30 + math.clamp(size.Y.Offset-5,0,math.huge))
		},length)
	end

	boxScale.new(box,scale)

	local button = object:WaitForChild("Title"):WaitForChild("Icon")
	button.MouseButton1Click:Connect(function()
		state = not state
		button.Image = images[state]
		scale(0.2)
	end)

	local options = {
		scroller:WaitForChild("Options"):WaitForChild("Save"),
		scroller:WaitForChild("Options"):WaitForChild("Delete")
	}

	local api = {
		setText = function(self,text)
			box.Text = text
		end,
		getText = function()
			return box.Text
		end,
		getBox = function()
			return box
		end,
		reparent = function(self,parent)
			object.Parent = parent
		end,
	}

	for _,option in pairs(options) do
		option.MouseButton1Click:Connect(function()
			callback(option.Name,api)
		end)
	end

	return api
end

return quickChatDropdown
-- Author: @Jumpathy
-- Name: buildViewport.lua
-- Description: Build headshot viewport frames for roleplay effects n stuff

local utility = require(script.Parent:WaitForChild("util"):WaitForChild("main"))
local storage = game:GetService("ReplicatedStorage"):WaitForChild("betterchat_shared"):WaitForChild("loading")
local buildViewport = {}
local cached = {}

local constructFromGround = function(description,id)
	local event = Instance.new("BindableEvent")
	cached[id] = event
	local dummy,toApply = utility:createDummy(),utility:create("HumanoidDescription",description)
	dummy.Parent = storage
	dummy.Humanoid:ApplyDescription(toApply)
	dummy.Name = utility:guid()
	local changed
	changed = dummy.Changed:Connect(function()
		if(dummy:GetFullName() == dummy.Name) then
			cached[id] = nil
		end
	end)
	cached[id] = dummy
	event:Fire()
	event:Destroy()
	return dummy
end

function buildViewport.new(description,size)
	local id = utility:getDescriptionId(description)
	local constructed
	if(cached[id]) then
		if(cached[id]:IsA("BindableEvent")) then
			cached[id].Event:Wait()
		end
		constructed = cached[id]
	else
		constructFromGround(description,id)
		constructed = cached[id]
	end
	local frame,camera,worldModel = utility:createViewport(size)
	local dummy = constructed:Clone()
	dummy.Parent = worldModel
	camera.CFrame = CFrame.lookAt(
		dummy.Head.Position + (dummy.Head.CFrame.LookVector * (3)),
		dummy.Head.Position
	)
	return frame
end

return buildViewport
-- Author: @Jumpathy
-- Name: utility.lua
-- Description: Utility functions for building viewport headshots

local zlib = require(script.Parent:WaitForChild("zlib"))
local httpService = game:GetService("HttpService")
local utility = {}

function utility:createViewport(size)
	local viewport = Instance.new("ViewportFrame")
	viewport.Size = UDim2.fromOffset(size,size)
	viewport.BackgroundTransparency = 1
	viewport.BorderSizePixel = 0
	viewport.BackgroundColor3 = Color3.fromRGB(80,80,80)
	local world = Instance.new("WorldModel")
	world.Parent = viewport
	local camera = Instance.new("Camera")
	camera.Parent = world
	camera.FieldOfView = 50
	viewport.CurrentCamera = camera
	return viewport,camera,world
end

function utility:create(class,properties)
	local created = Instance.new(class)
	for property,value in pairs(properties) do
		created[property] = value
	end
	return created
end

function utility:compress(text)
	return zlib.Zlib.Compress(text,{
		strategy = "dynamic",
		level = 9
	})
end

function utility:getDescriptionId(description)
	local toAlphabetize = {}
	for property,value in pairs(description) do
		table.insert(toAlphabetize,property)
	end
	table.sort(toAlphabetize)
	local id = {}
	for _,name in pairs(toAlphabetize) do
		table.insert(id,name..":"..tostring(description[name]))
	end
	return utility:compress(table.concat(id,","))
end

function utility:guid()
	return httpService:GenerateGUID():sub(2,37):gsub("-","")
end

function utility:createDummy()
	local dummy = Instance.new("Model")
	dummy.Name = "Dummy"
	dummy.WorldPivot = CFrame.new(0, 0, 0, -1, 0, 0, 0, 1, 0, 0, 0, -1)

	local head = Instance.new("Part")
	head.Name = "Head"
	head.BrickColor = BrickColor.new(0.898, 0.894, 0.875)
	head.CFrame = CFrame.new(0, 2, 0, -1, 0, 0, 0, 1, 0, 0, 0, -1)
	head.Color = Color3.fromRGB(229, 228, 223)
	head.Orientation = Vector3.new(0, 180, 0)
	head.Position = Vector3.new(0, 2, 0)
	head.Rotation = Vector3.new(-180, 0, -180)
	head.Size = Vector3.new(2, 1, 1)
	head.TopSurface = Enum.SurfaceType.Smooth

	local mesh = Instance.new("SpecialMesh")
	mesh.Name = "Mesh"
	mesh.Scale = Vector3.new(1.2, 1.2, 1.2)
	mesh.Parent = head

	local face = Instance.new("Decal")
	face.Name = "Face"
	face.Parent = head

	head.Parent = dummy

	local torso = Instance.new("Part")
	torso.Name = "Torso"
	torso.BrickColor = BrickColor.new(0.898, 0.894, 0.875)
	torso.CFrame = CFrame.new(0, 0.5, 0, -1, 0, 0, 0, 1, 0, 0, 0, -1)
	torso.Color = Color3.fromRGB(229, 228, 223)
	torso.LeftSurface = Enum.SurfaceType.Weld
	torso.Orientation = Vector3.new(0, 180, 0)
	torso.Position = Vector3.new(0, 0.5, 0)
	torso.RightSurface = Enum.SurfaceType.Weld
	torso.Rotation = Vector3.new(-180, 0, -180)
	torso.Size = Vector3.new(2, 2, 1)

	local right_Shoulder = Instance.new("Motor6D")
	right_Shoulder.Name = "Right Shoulder"
	right_Shoulder.DesiredAngle = -0.038
	right_Shoulder.MaxVelocity = 0.15
	right_Shoulder.C0 = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
	right_Shoulder.C1 = CFrame.new(-0.5, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
	right_Shoulder.Parent = torso

	local left_Shoulder = Instance.new("Motor6D")
	left_Shoulder.Name = "Left Shoulder"
	left_Shoulder.DesiredAngle = -0.038
	left_Shoulder.MaxVelocity = 0.15
	left_Shoulder.C0 = CFrame.new(-1, 0.5, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
	left_Shoulder.C1 = CFrame.new(0.5, 0.5, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
	left_Shoulder.Parent = torso

	local right_Hip = Instance.new("Motor6D")
	right_Hip.Name = "Right Hip"
	right_Hip.DesiredAngle = 0.038
	right_Hip.MaxVelocity = 0.1
	right_Hip.C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
	right_Hip.C1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
	right_Hip.Parent = torso

	local left_Hip = Instance.new("Motor6D")
	left_Hip.Name = "Left Hip"
	left_Hip.DesiredAngle = 0.038
	left_Hip.MaxVelocity = 0.1
	left_Hip.C0 = CFrame.new(-1, -1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
	left_Hip.C1 = CFrame.new(-0.5, 1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
	left_Hip.Parent = torso

	local neck = Instance.new("Motor6D")
	neck.Name = "Neck"
	neck.C1 = CFrame.new(0, 1.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	neck.Parent = torso

	torso.Parent = dummy

	local left_Arm = Instance.new("Part")
	left_Arm.Name = "Left Arm"
	left_Arm.BottomSurface = Enum.SurfaceType.Smooth
	left_Arm.BrickColor = BrickColor.new(0.898, 0.894, 0.875)
	left_Arm.CFrame = CFrame.new(1.5, 0.5, 0, -1, 0, 0, 0, 1, 0, 0, 0, -1)
	left_Arm.CanCollide = false
	left_Arm.Color = Color3.fromRGB(229, 228, 223)
	left_Arm.Orientation = Vector3.new(0, 180, 0)
	left_Arm.Position = Vector3.new(1.5, 0.5, 0)
	left_Arm.Rotation = Vector3.new(-180, 0, -180)
	left_Arm.Size = Vector3.new(1, 2, 1)
	left_Arm.Parent = dummy

	local right_Arm = Instance.new("Part")
	right_Arm.Name = "Right Arm"
	right_Arm.BottomSurface = Enum.SurfaceType.Smooth
	right_Arm.BrickColor = BrickColor.new(0.898, 0.894, 0.875)
	right_Arm.CFrame = CFrame.new(-1.5, 0.5, 0, -1, 0, 0, 0, 1, 0, 0, 0, -1)
	right_Arm.CanCollide = false
	right_Arm.Color = Color3.fromRGB(229, 228, 223)
	right_Arm.Orientation = Vector3.new(0, 180, 0)
	right_Arm.Position = Vector3.new(-1.5, 0.5, 0)
	right_Arm.Rotation = Vector3.new(-180, 0, -180)
	right_Arm.Size = Vector3.new(1, 2, 1)
	right_Arm.Parent = dummy

	local left_Leg = Instance.new("Part")
	left_Leg.Name = "Left Leg"
	left_Leg.BottomSurface = Enum.SurfaceType.Smooth
	left_Leg.BrickColor = BrickColor.new(0.898, 0.894, 0.875)
	left_Leg.CFrame = CFrame.new(0.5, -1.5, 0, -1, 0, 0, 0, 1, 0, 0, 0, -1)
	left_Leg.CanCollide = false
	left_Leg.Color = Color3.fromRGB(229, 228, 223)
	left_Leg.Orientation = Vector3.new(0, 180, 0)
	left_Leg.Position = Vector3.new(0.5, -1.5, 0)
	left_Leg.Rotation = Vector3.new(-180, 0, -180)
	left_Leg.Size = Vector3.new(1, 2, 1)
	left_Leg.Parent = dummy

	local right_Leg = Instance.new("Part")
	right_Leg.Name = "Right Leg"
	right_Leg.BottomSurface = Enum.SurfaceType.Smooth
	right_Leg.BrickColor = BrickColor.new(0.898, 0.894, 0.875)
	right_Leg.CFrame = CFrame.new(-0.5, -1.5, 0, -1, 0, 0, 0, 1, 0, 0, 0, -1)
	right_Leg.CanCollide = false
	right_Leg.Color = Color3.fromRGB(229, 228, 223)
	right_Leg.Orientation = Vector3.new(0, 180, 0)
	right_Leg.Position = Vector3.new(-0.5, -1.5, 0)
	right_Leg.Rotation = Vector3.new(-180, 0, -180)
	right_Leg.Size = Vector3.new(1, 2, 1)
	right_Leg.Parent = dummy

	local humanoid = Instance.new("Humanoid")
	humanoid.Name = "Humanoid"
	humanoid.NameOcclusion = Enum.NameOcclusion.NoOcclusion
	humanoid.Parent = dummy

	return dummy
end

return utility
-- Author: @Jumpathy
-- Name: slider.lua
-- Description: Color wheel slider controller (gross code)

local userInput = game:GetService("UserInputService");
local runService = game:GetService("RunService");
local guiService = game:GetService("GuiService");
local inset = guiService:GetGuiInset();
local step = 20;

local getGradientFromColor = function(color)
	local sequence = {};
	local count = step;
	local hasHadZero = {R = false,G = false,B = false};
	
	local gv = function(color,idx,iter)
		local depth = 255 / count;
		local col = math.floor(color[idx] * 255);
		local num = math.clamp(col - (depth * iter),0,255);
		if(num < 1) then
			hasHadZero[idx] = true;
		end
		return num;
	end
	
	local i = -1;
	for c = 1,count do
		i += 1;
		table.insert(sequence,(Color3.fromRGB(unpack({
			gv(color,"R",i),
			gv(color,"G",i);
			gv(color,"B",i)
		}))));
		local cancel = true;
		for k,v in pairs(hasHadZero) do
			if(not v) then
				cancel = false;
				break;
			end
		end
		if(cancel) then
			break;
		end
	end
	
	if(#sequence == 1) then
		table.insert(sequence,sequence[1]);
	end
	
	for i = 1,#sequence do
		sequence[i] = ColorSequenceKeypoint.new((i == 1 and 0 or (i/#sequence)),sequence[i]);
	end
	
	return ColorSequence.new(sequence);
end

local getValueAtStep = function(sequence,max,current)
	local timeToEval = current/max;
	if(timeToEval == 0) then 
		return sequence.Keypoints[1].Value;
	elseif(timeToEval == 1) then 
		return sequence.Keypoints[#sequence.Keypoints].Value;
	end
	for i = 1, #sequence.Keypoints - 1 do
		local curentPoint = sequence.Keypoints[i];
		local nextPoint = sequence.Keypoints[i + 1];
		if(timeToEval >= curentPoint.Time and timeToEval < nextPoint.Time) then
			local alpha = (timeToEval - curentPoint.Time) / (nextPoint.Time - curentPoint.Time);
			return Color3.new(
				(nextPoint.Value.R - curentPoint.Value.R) * alpha + curentPoint.Value.R,
				(nextPoint.Value.G - curentPoint.Value.G) * alpha + curentPoint.Value.G,
				(nextPoint.Value.B - curentPoint.Value.B) * alpha + curentPoint.Value.B
			)
		end
	end
end

local validInputs = {
	[Enum.UserInputType.Touch] = true,
	[Enum.UserInputType.MouseButton1] = true
}

for i = 1,8 do 
	validInputs[Enum.UserInputType["Gamepad" .. i]] = true;
end

local constructVerticalSlider = function(object,max,handle)
	local drag = object:WaitForChild("Drag");
	local dragging = false;
	
	local getMousePos = function()
		local base = userInput:GetMouseLocation() - inset;
		return base;
	end
	
	drag.InputBegan:Connect(function(input)
		if(validInputs[input.UserInputType] and (not dragging)) then
			dragging = true;
			local endedSignal;
			endedSignal = input.Changed:Connect(function()
				if(input.UserInputState == Enum.UserInputState.End) then
					dragging = false;
					endedSignal:Disconnect();
				end
			end)
		end
	end)

	runService.RenderStepped:Connect(function()
		if(dragging) then
			local mousePos = getMousePos();
			if(mousePos) then
			local desiredAbsolutePosition = Vector2.new(drag.AbsolutePosition.X,(mousePos.Y));
			local relativePosition = desiredAbsolutePosition - drag.Parent.AbsolutePosition;
			local percentage = math.clamp((relativePosition.Y / object.AbsoluteSize.Y),0,1);
			drag.Position = UDim2.fromScale(0,math.clamp((math.clamp(relativePosition.Y,0,object.AbsoluteSize.Y)/object.AbsoluteSize.Y),drag.AbsoluteSize.Y/(object.AbsoluteSize.Y),1));
				handle(percentage * max);
			end
		end
	end)
end

return function(slider,callback)
	local gradient = slider:WaitForChild("Gradient");
	local last = 0;

	local on = function(number)
		local value = getValueAtStep(gradient.Color,step,number);
		callback(value);
	end

	constructVerticalSlider(slider,step,function(number)
		last = number;
		on(last);
	end);

	gradient.Changed:Connect(function()
		on(last);
	end)

	return setmetatable({},{
		__newindex = function(t,k,v)
			if(k == "Color") then
				gradient.Color = getGradientFromColor(v);
			end
		end
	});
end
-- Author: @Jumpathy
-- Name: colorPicker.lua
-- Description: Chat color picker

local controller = function()
	local hsl_to_rgb = function(h,s,L)
		h = h/360
		local m1,m2
		if L<=0.5 then 
			m2 = L*(s+1)
		else 
			m2 = L+s-L*s
		end
		m1 = L*2-m2

		local function _h2rgb(m1,m2,h)
			if h<0 then h = h+1 end
			if h>1 then h = h-1 end
			if h*6<1 then 
				return m1+(m2-m1)*h*6
			elseif h*2<1 then 
				return m2 
			elseif h*3<2 then 
				return m1+(m2-m1)*(2/3-h)*6
			else
				return m1
			end
		end

		return _h2rgb(m1,m2,h+1/3),_h2rgb(m1,m2,h),_h2rgb(m1,m2,h-1/3)
	end

	local rgb_to_hsl = function(r,g,b)
		local min = math.min(r,g,b)
		local max = math.max(r,g,b)
		local delta = max - min

		local h,s,l = 0,0,((min+max)/2)

		if l > 0 and l < 0.5 then s = delta/(max+min) end
		if l >= 0.5 and l < 1 then s = delta/(2-max-min) end

		if delta > 0 then
			if max == r and max ~= g then h = h + (g-b)/delta end
			if max == g and max ~= b then h = h + 2 + (b-r)/delta end
			if max == b and max ~= r then h = h + 4 + (r-g)/delta end
			h = h / 6;
		end

		if h < 0 then h = h + 1 end
		if h > 1 then h = h - 1 end

		return h * 360,s,l
	end

	local gamepads = {};

	for i = 1,8 do 
		gamepads[Enum.UserInputType["Gamepad" .. i]] = true;
	end

	local guiService = game:GetService("GuiService");
	local runService = game:GetService("RunService")

	local inset = guiService:GetGuiInset();
	local useInset = false;
	local controllerOffset = (useInset and -inset or Vector2.new(0,0));

	return function(signalModule)
		-- Authors: @Jumpathy (slider and stuff),morashsPeasant (color wheel)
		-- Name: controller.lua
		-- Description: Color wheel controller

		local atan2,sqrt,min,floor,c3 = math.atan2,math.sqrt,math.min,math.floor,Color3.new
		local sin,cos,pi,toRad,toDeg = math.sin,math.cos,math.pi,(math.pi/180),(180/math.pi)
		local sliderModule = require(script.Parent.util:WaitForChild("slider"));

		return function(frame)
			local module = {}
			local api = {};
			local moveMarkerToColor;

			api.colorChanged = signalModule.new();

			local uis = game:GetService("UserInputService")
			local inset = game:GetService("GuiService"):GetGuiInset();

			local wheel = frame:WaitForChild("Wheel");
			local marker = wheel:WaitForChild("Marker");
			local slider = frame:WaitForChild("Slider");
			local options = frame:WaitForChild("Options");

			local r,g,b = options:WaitForChild("R"),options:WaitForChild("G"),options:WaitForChild("B");
			local opts = {R = r,G = g,B = b};
			local last = Color3.fromRGB(255,255,255);

			local from = function(color)
				return {
					R = math.floor(color.R * 255),
					G = math.floor(color.G * 255),
					B = math.floor(color.B * 255)
				}
			end

			local get = function()
				return Color3.fromRGB(tonumber(r.Text),tonumber(g.Text),tonumber(b.Text))
			end

			local focused = false;
			local handle = function(color)
				local new = from(color);
				if(not focused) then
					for k,v in pairs(new) do
						opts[k].Text = v;
					end
				end
				last = color;
				api.colorChanged:Fire(last);
			end

			local hexValue = options.Parent.Hex.Value

			local gradient = sliderModule(slider,function(col)
				hexValue.Text = "#" .. col:ToHex()
				handle(col);
			end);

			local onColor = function(col)
				gradient.Color = col;
			end

			local getFrom = function(value)
				return math.clamp((tonumber(value.Text) or 0),0,255)
			end

			local move = function()
				local packed = {};
				table.insert(packed,getFrom(opts.R));
				table.insert(packed,getFrom(opts.G));
				table.insert(packed,getFrom(opts.B));
				local newColor = Color3.fromRGB(unpack(packed));
				if(moveMarkerToColor) then
					moveMarkerToColor(newColor);
					hexValue.Text = "#" .. get():ToHex()
				end
			end

			for idx,value in pairs(opts) do
				value:GetPropertyChangedSignal("Text"):Connect(function()
					if(value:IsFocused()) then
						if(#value.Text > 3) then
							value.Text = value.Text:sub(1,3);
						end
					end
				end)
				value.FocusLost:Connect(function()
					focused = false;
					local num = getFrom(value);
					value.Text = tostring(num);
					move();
				end)
				value.Focused:Connect(function()
					focused = true;
				end)
			end

			local fromHex = function(value)
				local success,color = pcall(function()
					return Color3.fromHex(value)
				end)
				return success and color or Color3.fromRGB(255,255,255)
			end

			hexValue:GetPropertyChangedSignal("Text"):Connect(function()
				if #hexValue.Text > 6 and hexValue.Text:sub(1,1) ~= "#" then
					hexValue.Text = hexValue.Text:sub(1,6)
				elseif(#hexValue.Text > 6 and hexValue.Text:sub(1,1) == "#") then
					hexValue.Text = hexValue.Text:sub(1,7)
				end
				if(hexValue:IsFocused()) then
					moveMarkerToColor(fromHex(hexValue.Text))
				end
			end)

			--Constants
			local RADIUS = wheel.AbsoluteSize.X/2
			local MRADIUS = math.max(marker.AbsoluteSize.X/2)
			local cx,cy = wheel.AbsolutePosition.X + RADIUS,wheel.AbsolutePosition.Y + RADIUS

			--Moves marker to a certain color
			moveMarkerToColor = function(color)
				local angle,rad = rgb_to_hsl(color.r,color.g,color.b)
				angle,rad = angle * toRad,rad * RADIUS
				local newX,newY = RADIUS + rad * cos(angle),RADIUS - rad*sin(angle) -- (-y)
				marker.Position = UDim2.new(0,newX - MRADIUS,0,newY - MRADIUS)
				--Change color
				onColor(color);
			end

			module.maxLight = 1
			module.minLight = .5
			module.Light = .5 --white

			module.Light = 1
			module.LightRange = NumberRange.new(0,1)
			module.sliderActive = false

			local lightCheck = function()
				return module.Light --for now
			end

			local updateWheel = function(x,y)

				--Color calculations
				local nx,ny = cx - x,cy - y
				local theta = atan2(ny,nx) + pi --makes it sane
				local dist = sqrt((nx * nx) + (ny * ny)) 
				dist = (dist/RADIUS) > .1 and dist or 0
				local lum = dist ~= 0 and .5 or lightCheck()
				local mag = min(RADIUS,dist)
				local hue,sat = 360 - ((theta) * (180/pi)),mag/RADIUS

				--Marker position calc
				local newX,newY = RADIUS + mag * cos(theta),RADIUS + mag * sin(theta)
				marker.Position = UDim2.new(0,newX - MRADIUS,0,newY - MRADIUS)
				local color = c3(hsl_to_rgb(hue,sat,lum))
				hexValue.Text = "#" .. get():ToHex()
				onColor(color);

				return color
			end

			module.init = function()
				local widget = {}
				cx,cy = wheel.AbsolutePosition.X + RADIUS,wheel.AbsolutePosition.Y + RADIUS
				widget.Color = Color3.fromRGB(255,255,255);
				cx,cy = wheel.AbsolutePosition.X + RADIUS,wheel.AbsolutePosition.Y + RADIUS
				moveMarkerToColor(widget.Color)		

				local oldwidget = widget --Quick switcharoo
				widget = module
				widget.wheelDown = wheel.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						if widget.movingWheel and widget.movingWheel.connected then 
							widget.movingWheel:Disconnect();
						end

						if widget.btnUp and widget.btnUp.connected then 
							widget.btnUp:Disconnect() 
						end

						local usingGamepad = false;
						--UIS bind to detect end of input
						widget.btnUp = input.Changed:Connect(function()
							if input.UserInputState == Enum.UserInputState.End then
								widget.movingWheel:Disconnect()
								widget.btnUp:Disconnect()
								local pos = uis:GetMouseLocation() - inset
								local color = updateWheel(pos.X,pos.Y)
								widget.Color = color;
							end
						end)

						--UIS bind to detect mouse 
						local on = function(pos)
							local color = updateWheel(pos.X,pos.Y)
							widget.Color = color; --widget:Changed(color)
						end

						local handle = function(input)
							local inputType = input.UserInputType;
							if(gamepads[inputType]) then
								usingGamepad = true;
								local pos = uis:GetMouseLocation() + controllerOffset;
								on(pos);
								return;
							end

							usingGamepad = false;
							if inputType == Enum.UserInputType.MouseMovement or inputType == Enum.UserInputType.Touch then
								local pos = input.Position
								on(pos);
							end
						end

						widget.movingWheel = uis.InputChanged:Connect(handle);
						handle({UserInputType = Enum.UserInputType.MouseMovement,Position = uis:GetMouseLocation() - inset})
					end
				end)

				runService.RenderStepped:Connect(function()
					cx,cy = wheel.AbsolutePosition.X + RADIUS,wheel.AbsolutePosition.Y + RADIUS
				end)
				widget = oldwidget; oldwidget = nil	

				frame.Visible = true
				widget.Active = true
				gradient.Color = Color3.fromRGB(255,255,255);

				return api
			end

			return module
		end
	end
end

return function(environment)
	return {
		new = function(object)
			local wheel = controller()(environment.signal);
			local colorWheel = wheel(object);
			return colorWheel:init();
		end
	}
end
-- Author: @Jumpathy
-- Name: helpDropdown.lua
-- Description: UI dropdown controller or help menu

local dropdown = {}

local images = {
	[false] = "rbxassetid://8677555693",
	[true] = "rbxassetid://8677748645"
}

function dropdown.new(gui,environment)
	local optionContainer = gui:WaitForChild("Dropdown")
	local button = gui:WaitForChild("Cover"):WaitForChild("Drop")
	local state = false
	local layout = optionContainer.UIListLayout
	local currentSize = layout.AbsoluteContentSize
	optionContainer.Visible = true
	
	local setOpen = function()
		currentSize = layout.AbsoluteContentSize
		local key = tick()
		button.Icon.Image = images[state]
		environment.tweenSize(gui,UDim2.new(1,-10,0,((not state) and 30 or (35 + currentSize.Y))),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.25,true)
		environment.tweenSize(optionContainer,UDim2.new(1,0,0,(state and currentSize.Y) or 0),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.25,true)
	end

	local toggle = function()
		state = not state
		setOpen()
	end

	button.MouseButton1Click:Connect(toggle)
	
	layout.Changed:Connect(setOpen)
end

return dropdown
-- Author: @Jumpathy
-- Name: settingsMenu.lua
-- Description: Settings menu for the GUI controller

local constructors = {}
local folder = script.Parent:WaitForChild("constructors")
local starterGui = game:GetService("StarterGui")
local topbar = require(script.Parent:WaitForChild("topbarPlus"):WaitForChild("icons"))
local localPlayer = game:GetService("Players").LocalPlayer
local chatService = game:GetService("Chat")
local runService = game:GetService("RunService")

constructors.dropdown = require(folder:WaitForChild("dropdown"))
constructors.toggle = require(folder:WaitForChild("toggle"))
constructors.slider = require(folder:WaitForChild("slider"))
constructors.quickChatDropdown = require(folder:WaitForChild("quickChatDropdown"))
constructors.helpDropdown = require(folder:WaitForChild("helpDropdown"))
constructors.colorPicker = require(folder:WaitForChild("colorPicker"))

return function(environment)
	local quickChatEnabled = environment.config.Messages.QuickChat
	constructors.colorPicker = constructors.colorPicker(environment)

	local ui = environment.gui:WaitForChild("Settings")
	local config = environment.config
	local state = false
	
	local sampleToggle = ui.Pages.BubbleChat.Scroller.Enabled:Clone()
	local sampleSlider = ui.Pages.BubbleChat.Scroller.FadeoutTime:Clone()
	local sampleDropdown = ui.Pages.BubbleChat.Scroller.Font:Clone()

	environment.settingChanged = environment.signal.new()

	function environment:toggleSettingsMenu()
		state = not state
		environment.container.Visible = not state
		local position = state and UDim2.new(0.5,0,0.5,0) or UDim2.new(0.5,0,-1.5,0)
		environment.tweenPosition(ui,position,Enum.EasingDirection.Out,Enum.EasingStyle.Linear,0.16,true)
		environment:setChatLocked(state)
	end

	local pages = {"UI","BubbleChat","QuickChat","Help"}
	if(not quickChatEnabled) then
		table.remove(pages,3)
	end

	local pageContainer = ui:WaitForChild("Pages")
	local navigation = pageContainer:WaitForChild("Navigation")
	local args = {Enum.EasingDirection.In,Enum.EasingStyle.Quad,0.16,true}
	local outPosition = UDim2.fromScale(-1,0)
	local inPosition = UDim2.fromScale(0,0)

	local selectPage = function(page)
		environment.tweenPosition(navigation,outPosition,unpack(args))
		page.Position = UDim2.fromScale(1,0)
		environment.tweenPosition(page,inPosition,unpack(args))
	end

	local back = function(page)
		environment.tweenPosition(navigation,inPosition,unpack(args))
		environment.tweenPosition(page,UDim2.fromScale(1,0),unpack(args))
	end

	for _,pageName in pairs(pages) do
		local button = navigation:WaitForChild("Content"):WaitForChild(pageName)
		button.MouseButton1Click:Connect(function()
			selectPage(pageContainer[pageName])
		end)
		pageContainer:WaitForChild(pageName):WaitForChild("Title"):WaitForChild("Back").MouseButton1Click:Connect(function()
			back(pageContainer[pageName])
		end)
	end

	local getTableFromIdx = function(tbl,idx)
		local ret = {}
		for _,option in pairs(tbl) do
			table.insert(ret,option[idx])
		end
		return ret
	end

	local getFontsList = function(priority)
		local list = Enum.Font:GetEnumItems()
		local key = table.find(list,priority)
		table.remove(list,key)
		table.insert(list,1,priority)
		local ret = {}
		for k,v in pairs(list) do
			ret[k] = v.Name
		end
		return ret
	end

	local animationStyles = {}
	for _,style in pairs(Enum.EasingStyle:GetEnumItems()) do
		table.insert(animationStyles,{style.Name,style})
	end
	environment.bubbleChatAnimationStyle = environment.config.BubbleChat.Config.EasingStyle

	local userConfig = environment.network:invoke("fetchUserConfig")

	local getConfig = function(path,name)
		local idx = userConfig[path] or {}
		return idx[name]
	end
	local apis = {["UI"] = {},["BubbleChat"] = {}}
	environment.apis = apis

	local newSetting = function(class,path,...)
		local changed = environment.signal.new()
		local setting

		if(class == "slider") then
			local limit,api,value = unpack({...})
			setting = {
				value = value,
				["type"] = "number",
				["limits"] = limit,
				changed = changed
			} 

			function setting:set(new)
				api:set(new)
			end
		elseif(class == "toggle") then
			local api,value = unpack({...})
			setting = {
				value = value,
				["type"] = "boolean",
				changed = changed
			}

			function setting:set(new)
				api:set(new)
			end
		elseif(class == "dropdown") then
			local api,value,list = unpack({...})
			setting = {
				value = value,
				["type"] = "string",
				changed = changed,
				options = list
			}

			function setting:set(new)
				api:set(new)
			end
		end

		environment.settingChanged:Connect(function(a,b,new)
			if(path[1] == a and (path[2] == b)) then
				if(setting.value ~= new) then
					setting.value = new
					changed:Fire(new)
				end
			end
		end)

		return setting
	end

	local guiOptions = { -- I'm so sorry for what happened below
		UI = {
			Resizable = function(object)
				local default = config.UI.Resizable
				local last = getConfig("UI","Resizable")
				if(typeof(last) ~= "boolean") then
					last = default
				end

				local button = environment.resizeButton
				local api = constructors.toggle.new(object,last,function(new)
					button.Visible = new
					environment.settingChanged:Fire("UI","Resizable",new)
					environment.network:invoke("writeConfig","UI","Resizable",new)
				end,environment)

				if(last) then
					button.Visible = true
				end

				apis["UI"]["Resizable"] = newSetting("toggle",{"UI","Resizable"},api,last)
			end,
			Roundness = function(object)
				local default = config.UI.Rounding
				local last = getConfig("UI","Roundness") or default
				if(typeof(last) ~= "number") then
					last = default
				end

				local api = constructors.slider.new(object,0,12,last,function(new)
					if(environment.refreshRounding) then
						config.UI.Rounding = new
						environment:refreshRounding()
						environment.settingChanged:Fire("UI","Roundness",new)
						environment.network:invoke("writeConfig","UI","Roundness",new)
					end
				end)

				apis["UI"]["Roundness"] = newSetting("slider",{"UI","Roundness"},{0,12},api,last)
			end,
			TextSize = function(object)
				local default = config.UI.BaseTextSize
				local last = getConfig("UI","TextSize") or default
				if(typeof(last) ~= "number") then
					last = default
				end

				local api = constructors.slider.new(object,10,20,math.clamp(last,10,20),function(new)
					if(environment.setTextSize) then
						config.UI.BaseTextSize = new
						environment:setTextSize(new)
						environment.settingChanged:Fire("UI","TextSize",new)
						environment.network:invoke("writeConfig","UI","TextSize",new)
					end
				end)

				apis["UI"]["TextSize"] = newSetting("slider",{"UI","TextSize"},{10,20},api,last)
			end,
			TextFont = function(object)
				local default
				default = getConfig("UI","TextFont")
				if(default == nil) then
					default = environment.config.UI.Fonts.TextFont
				else
					default = Enum.Font[default]
				end

				environment.config.UI.Fonts.TextFont = default
				environment:updFont(default)

				local fonts = getFontsList(default)
				local api = constructors.dropdown.new(object,fonts,function(picked)
					local currentFont = Enum.Font[picked]
					environment.config.UI.Fonts.TextFont = currentFont
					environment.settingChanged:Fire("UI","TextFont",picked)
					environment.network:invoke("writeConfig","UI","TextFont",picked)
					environment:updFont(currentFont)
				end,function(object)
					object.Font = Enum.Font[object.text]
					environment:updFont(Enum.Font[object.text])
				end,environment)

				apis["UI"]["TextFont"] = newSetting("dropdown",{"UI","Font"},api,fonts[1],fonts)
			end,
		},
		BubbleChat = {
			Enabled = function(object)
				local chatDefault = (config.BubbleChat.Enabled or game:GetService("Chat").BubbleChatEnabled)
				local defaultUser = getConfig("BubbleChat","Enabled")
				local default
				if(defaultUser == nil) then
					default = chatDefault
				else
					default = defaultUser
				end

				environment.bubbleChatEnabled = default
				local api = constructors.toggle.new(object,default,function(new)
					environment.bubbleChatEnabled = new
					if(environment.bubbleChatContainer) then
						environment.bubbleChatContainer.Enabled = new
					end
					environment.settingChanged:Fire("BubbleChat","Enabled",new)
					environment.network:invoke("writeConfig","BubbleChat","Enabled",new)
				end,environment)

				api:set(default)
				apis["BubbleChat"]["Resizable"] = newSetting("toggle",{"BubbleChat","Enabled"},api,default)
			end,
			AnimationStyle = function(object)
				local dropdownOptions = getTableFromIdx(animationStyles,1)
				local dropdownTranslations = getTableFromIdx(animationStyles,2)
				local from = function(optionName)
					return dropdownTranslations[table.find(dropdownOptions,optionName)]
				end
				local default = getConfig("BubbleChat","AnimationStyle")

				local api = constructors.dropdown.new(object,dropdownOptions,function(picked)
					local selection = from(picked)
					environment.bubbleChatAnimationStyle = selection
					environment.network:invoke("writeConfig","BubbleChat","AnimationStyle",picked)
				end,nil,environment)
				if(default ~= nil) then
					environment.bubbleChatAnimationStyle = from(default)
					api:set(default)
				end
				apis["BubbleChat"]["AnimationStyle"] = newSetting("dropdown",{"BubbleChat","AnimationStyle"},api,default,dropdownOptions)
			end,
			FadeoutTime = function(object)
				local default
				default = getConfig("BubbleChat","FadeoutTime")
				if(default == nil) then
					default = environment.config.BubbleChat.Config.FadeoutTime
				else
					environment.config.BubbleChat.Config.FadeoutTime = default	
				end

				local api = constructors.slider.new(object,3,25,default,function(new)
					environment.config.BubbleChat.Config.FadeoutTime = new	
					environment.settingChanged:Fire("BubbleChat","FadeoutTime",new)
					environment.network:invoke("writeConfig","BubbleChat","FadeoutTime",new)
				end)

				apis["BubbleChat"]["FadeoutTime"] = newSetting("slider",{"UI","FadeoutTime"},{3,25},api,default)
			end,
			["Font"] = function(object)
				local default
				default = getConfig("BubbleChat","Font")
				if(default == nil) then
					default = environment.config.BubbleChat.Config.BubbleFont
				else
					default = Enum.Font[default]
				end

				localPlayer:SetAttribute("BubbleFont",default.Name)
				environment.config.BubbleChat.Config.BubbleFont = default

				local fonts = getFontsList(default)
				local api = constructors.dropdown.new(object,fonts,function(picked)
					local currentFont = Enum.Font[picked]
					environment.config.BubbleChat.Config.BubbleFont = currentFont
					localPlayer:SetAttribute("BubbleFont",currentFont.Name)
					environment.settingChanged:Fire("BubbleChat","Font",picked)
					environment.network:invoke("writeConfig","BubbleChat","Font",picked)
				end,function(object)
					object.Font = Enum.Font[object.text]
				end,environment)

				apis["BubbleChat"]["Font"] = newSetting("dropdown",{"BubbleChat","Font"},api,fonts[1],fonts)
			end,
		},
		QuickChat = {},
		Help = {
			ColorFormatting = function(object)
				local other = object.Parent.Colorpicker
				other.Size = UDim2.new(1,0,0,30)
				other.Parent = object.Dropdown
				other.LayoutOrder = 10
				
				constructors.helpDropdown.new(object,environment)
				
				local colorpickerControl = function(object)
					constructors.helpDropdown.new(object,environment)

					local menu = object.Dropdown.Colorpicker
					constructors.colorPicker.new(menu.PickerWidget)

					for _,opt in pairs(menu.Options:GetChildren()) do
						if(opt:IsA("TextButton")) then
							opt.AutoLocalize = false
							opt.MouseButton1Click:Connect(function()
								local state = opt.Text == "Color picker"
								menu.PickerWidget.Visible = state
								menu.BrickColors.Visible = not state		
							end)
						end
					end

					local brickScroller = menu.BrickColors.Scroller
					local searchbar = menu.BrickColors.Searchbar.Box

					local template = brickScroller.BrickColor
					template.Parent = script
					-- stop absolute massive lag:
					template.ColorPreview.UICorner.Name = "Ignore"
					template.UICorner.Name = "Ignore"

					local brickColors = {}
					local blank = {}

					local existing = {}
					for i = 1,1032 do -- iirc there's around 1032 brick colors (this gets all of them and adds them to a list)
						local col = BrickColor.new(i)
						if col and not existing[col.Name] then
							existing[col.Name] = true
							local obj = template:Clone()
							obj.ColorPreview.BackgroundColor3 = col.Color
							obj.TextBox.Text = col.Name
							obj.Parent = brickScroller

							obj.TextBox.Focused:Connect(function()
								repeat
									obj.TextBox.SelectionStart = 0
									obj.TextBox.CursorPosition = #col.Name + 1
									task.wait()
								until(obj.TextBox:IsFocused() == false)
							end)

							brickColors[col.Name] = obj
						end
					end

					local setVisible = function(state)
						for _,color in pairs(brickScroller:GetChildren()) do
							if(color:IsA("Frame")) then
								color.Visible = state
							end
						end
					end

					searchbar:GetPropertyChangedSignal("Text"):Connect(function()
						local searchTerm = searchbar.Text:sub(1,50)
						local isBlank = searchTerm:gsub(" ","") == ""
						setVisible(isBlank)
						if not isBlank then
							for name,object in pairs(brickColors) do
								if(name:lower():find(searchTerm:lower())) then
									object.Visible = true
								end
							end
						end
					end)
				end
				
				colorpickerControl(other)
			end,
			GeneralFormatting = function(object)
				constructors.helpDropdown.new(object,environment)
			end,
		}
	}

	if(not quickChatEnabled) then
		guiOptions["QuickChat"] = nil
		navigation:WaitForChild("Content"):WaitForChild("QuickChat"):Destroy()
	end

	if(not config.BubbleChat.Enabled and (not chatService.BubbleChatEnabled)) then
		guiOptions["BubbleChat"] = nil
		navigation:WaitForChild("Content"):WaitForChild("BubbleChat"):Destroy()
	end
	
	function environment:addCustomOption(container,class,options)
		local text = options.Text or "DEFAULT"
		local icon = options.Icon or nil
		
		if(class == "Toggle") then
			local toggleUi = sampleToggle:Clone()
			toggleUi.Parent = pageContainer[container]["Scroller"]
			toggleUi.LayoutOrder = 10
			toggleUi.Title.Label.Text = text
			if icon then
				toggleUi.Title.Icon.Image = icon
			end
			local defaultValue = options.DefaultValue
			return constructors.toggle.new(toggleUi,defaultValue,options.Callback,environment)
		elseif(class == "Slider") then
			local sliderUi = sampleSlider:Clone()
			sliderUi.Parent = pageContainer[container]["Scroller"]
			sliderUi.LayoutOrder = 10
			sliderUi.Center.Title.Label.Text = text
			if icon then
				sliderUi.Center.Title.Icon.Image = icon
			end
			return constructors.slider.new(sliderUi,options.Minimum,options.Maximum,default,options.Callback,new)
		elseif(class == "Dropdown") then
			local dropdownUi = sampleDropdown:Clone()
			dropdownUi.Parent = pageContainer[container]["Scroller"]
			dropdownUi.LayoutOrder = 10
			dropdownUi.Title.Label.Text = text
			if icon then
				dropdownUi.Title.Icon.Image = icon
			end
			return constructors.dropdown.new(dropdownUi,options.Options,options.Callback,nil,environment)
		end
	end

	for pageName,opts in pairs(guiOptions) do
		local page = pageContainer:WaitForChild(pageName)
		local scroller = page:WaitForChild("Scroller")
		for optionName,callback in pairs(opts) do
			task.spawn(callback,scroller:WaitForChild(optionName))
		end
		local listLayout = scroller:FindFirstChildOfClass("UIListLayout")
		if(listLayout) then
			local rescale = function()
				scroller.CanvasSize = UDim2.fromOffset(0,listLayout.AbsoluteContentSize.Y)
			end
			listLayout.Changed:Connect(rescale)
			rescale()
		end
	end

	task.spawn(topbar,environment)

	navigation:WaitForChild("Title"):WaitForChild("Close").MouseButton1Click:Connect(function()
		environment.settingIcon:deselect()
	end)

	if(quickChatEnabled) then
		local slots = {}
		local apis = {}

		for i = 1,20 do
			local text = (getConfig("QuickChats",i) or "")
			slots[i] = text
						
			local callback = function(option,api)
				if(option == "Save") then
					local new = environment.network:invoke("writeConfig","QuickChats",i,api:getText())
					slots[i] = new
					api:setText(new)
				elseif(option == "Delete") then
					slots[i] = ""
					api:setText(environment.network:invoke("writeConfig","QuickChats",i,""))
				end
			end
			local api = constructors.quickChatDropdown.new(text,tostring(i),callback)

			apis[i] = function(text)
				api:setText(text)
				callback("Save",api)
			end

			api:reparent(pageContainer:WaitForChild("QuickChat"):WaitForChild("Scroller"))
			environment.utility:clampTextLimit(api:getBox(),config.Messages.MaximumLength)
		end

		function environment:getQuickChatSlot(i)
			return slots[i]
		end

		function environment:saveToSlot(i,text)
			apis[i](text)
		end
	end
end
-- Author: @Jumpathy
-- Name: chat.lua
-- Description: Manage chat component modules

local container = script.Parent:WaitForChild("elements")
local load = function(name,...)
	return require(container:WaitForChild(name))(...)
end

local parse = function(array)
	local returnValue = {}
	for _,module in pairs(array) do
		for key,value in pairs(module) do
			returnValue[key] = value
		end
	end
	return returnValue
end

return function(...)
	return parse({
		{chatWindow = load("chatWindow",...)},
		{chatbar = load("chatbar",...)}
	})
end
-- Author: @Jumpathy
-- Name: api.lua
-- Description: Client api module

return function(environment,wrap)
	local runService = game:GetService("RunService")
	local quickChatEnabled = environment.config.Messages.QuickChat
	local api = {}
	environment.network.onClientEvent("systemMessage",function(message)
		api:systemMessage(message)
	end)
	
	api.network = environment.network
	
	function api:getSetting(container,settingName)
		return environment.apis[container][settingName]
	end
	
	function api:getTopbarButton()
		return environment.settingIcon
	end
	
	if(quickChatEnabled) then
		function api:getQuickChatSlot(number)
			return environment:getQuickChatSlot(number)
		end
		
		function api:saveToQuickChatSlot(number,text)
			return environment:saveToSlot(number,text)
		end
	end
	
	function api:systemMessage(message)
		environment.message_senders.makeSm(message)
	end
	
	function api:sendMessage(message)
		environment.message_senders.makeSm(message,true)
	end
	
	function api:stopSizeUpdates()
		environment.stopSizing = true
	end
	
	function api:getUi()
		return environment.gui
	end
	
	api.tweening = {}
	
	function api.tweening:setTransparencyState(state)
		environment:setUiTransparency(state)
	end
	
	function api:addPromptOption(...)
		if not environment.addPromptOption then
			repeat
				task.wait()
			until environment.addPromptOption
		end
		environment:addPromptOption(...)
	end
	
	environment.client_api = api
	
	function api:getEnvironment()
		return environment
	end
	
	
	api.bubbleChat = {}
	
	function api.bubbleChat:getForPlayer(player)
		if not environment.holstered[player] then
			repeat
				runService.RenderStepped:Wait()
			until environment.holstered[player]
		end
		return environment.holstered[player]
	end	
	
	function api.bubbleChat.new(object,adornee)
		if not environment.billboard then
			repeat
				runService.RenderStepped:Wait()
			until environment.billboard
		end
		return environment.billboard:create(object,adornee)
	end
	
	function api:interceptMessageData(callback)
		table.insert(environment.interceptions,callback)
	end
	
	if(environment.config.SettingsMenu.Enabled) then
		function api:addCustomSetting(container,class,options)
			if not environment.addCustomOption then
				repeat
					runService.RenderStepped:Wait()
				until environment.addCustomOption
			end
			return environment:addCustomOption(container,class,options)
		end
	end
	
	return wrap(api)
end
-- Author: @Jumpathy
-- Name: channelBar.lua
-- Description: Set up the main channel bar

local players = game:GetService("Players")
local collectionService = game:GetService("CollectionService")
local localPlayer = players.LocalPlayer

local new = function(buttonColor,textColor,font)
	local button = Instance.new("TextButton")
	button.Name = "Button"
	button.Font = font
	button.Text = "Main"
	button.TextColor3 = textColor
	button.TextSize = 14
	button.AutomaticSize = Enum.AutomaticSize.X
	button.BackgroundColor3 = buttonColor
	button.BackgroundTransparency = 0.5
	button.BorderColor3 = Color3.fromRGB(27, 42, 53)
	button.BorderSizePixel = 0
	button.Size = UDim2.fromOffset(0, 25)
	button.ZIndex = 2
	collectionService:AddTag(button,"TextFont")

	local uIPadding = Instance.new("UIPadding")
	uIPadding.Name = "UIPadding"
	uIPadding.PaddingLeft = UDim.new(0, 5)
	uIPadding.PaddingRight = UDim.new(0, 5)
	uIPadding.Parent = button

	local notifs = Instance.new("TextLabel")
	notifs.Name = "Notifs"
	notifs.Font = Enum.Font.GothamMedium
	notifs.Text = "11"
	notifs.TextColor3 = Color3.fromRGB(255, 255, 255)
	notifs.TextScaled = true
	notifs.TextSize = 14
	notifs.TextWrapped = true
	notifs.Active = true
	notifs.BackgroundColor3 = Color3.fromRGB(255, 0, 11)
	notifs.BorderSizePixel = 0
	notifs.Position = UDim2.fromScale(1, 0)
	notifs.Selectable = true
	notifs.Size = UDim2.fromOffset(12, 12)
	notifs.Visible = false
	notifs.ZIndex = 4

	local ignore = Instance.new("UICorner")
	ignore.Name = "Ignore"
	ignore.CornerRadius = UDim.new(1, 0)
	ignore.Parent = notifs

	notifs.Parent = button

	local uICorner = Instance.new("UICorner")
	uICorner.Name = "UICorner"
	uICorner.Parent = button
	return button
end

return function(environment)
	local channelBar = {}
	local defaultChannel = "Main"
	local teamPrefix = environment.localization:getMessagePrefix("Team")
	local whisperPrefix = environment.localization:getMessagePrefix("To")
	local ui = environment.channelBarUi
	
	local colorOptions = environment.config.UI.ColorOptions
	local buttonColor = colorOptions.Buttons.ChannelButton.BackgroundColor
	local textColor = colorOptions.Buttons.ChannelButton.TextColor

	local getById = function(id)
		for _,plr in pairs(players:GetPlayers()) do
			if(math.abs(plr.UserId) == id) then
				return plr
			end
		end
	end

	local parseChannelName = function(name)
		if(name:sub(1,5) == "team_") then
			return teamPrefix
		elseif(name:sub(1,8) == "whisper_") then
			local list = name:split("_")
			local ids = {tonumber(list[2]),tonumber(list[3])}
			local target,user =  nil,""
			for _,v in pairs(ids) do
				target = getById(v)
				if(target and (target ~= localPlayer) and (target ~= nil)) then
					user = target:GetAttribute("DisplayName")
					break
				end
			end
			return whisperPrefix .. " " .. user
		else
			return name
		end
	end

	function environment:getChannelName(name)
		return parseChannelName(name)
	end

	local connections = {}

	local clear = function()
		for _,child in pairs(ui:GetChildren()) do
			if(child:IsA("TextButton")) then
				child:Destroy()
			end
		end
		for _,connection in pairs(connections) do
			connection:Disconnect()
		end
		connections = {}
	end

	local getButton = function(text)
		local button = new(buttonColor,textColor,environment.config.UI.Fonts.TextFont)
		button.Text = text
		return button
	end

	local currentlySelected
	local last
	local baseSize
	local cb

	local notificationCounts = {}
	local buttons = {}

	local handleNotifications = function(channel)
		local button = buttons[channel]
		if(button ~= nil) then
			if(notificationCounts[channel] ~= nil and (notificationCounts[channel] ~= 0)) then
				button.Notifs.Visible = true
				button.Notifs.Text = notificationCounts[channel]
			else
				button.Notifs.Visible = false
			end
		end
	end

	local clicked = function(channel)
		if not environment.fetchChannelHistory then
			repeat
				task.wait(5/1000)
			until(environment.fetchChannelHistory)
		end
		if currentlySelected ~= channel then
			environment:clearChannelNotifications(channel)
			currentlySelected = channel
			environment:fetchChannelHistory(channel)
		end
	end

	local update = function(channels,size)
		size = size or environment:getTextSize() - 1
		clear()
		local last = baseSize

		local found = false
		for _,channel in pairs(channels or {}) do
			if(currentlySelected ~= nil and (channel == currentlySelected)) then
				found = true
			end

			local parsed = parseChannelName(channel)
			local button = getButton(parsed)
			button.Parent = ui
			button.UIPadding.PaddingLeft = UDim.new(0,math.ceil(size * (5/14)))
			button.UIPadding.PaddingRight = button.UIPadding.PaddingLeft
			button.Size = UDim2.fromOffset(0,(size * (25/14)))
			button.Visible = environment.config.UI.ChannelBarEnabled

			cb = cb or button.Parent.Parent.Parent.Parent
			baseSize = (button.Size.Y.Offset * 1.4)
			cb.Size = UDim2.new(1,0,0,baseSize)

			table.insert(connections,button.MouseButton1Click:Connect(function()
				clicked(channel)
			end))

			buttons[channel] = button
			handleNotifications(channel)
		end
		if(currentlySelected) then
			if(not found) then
				environment:fetchChannelHistory(channels[1])
			end
		end
		if(last ~= baseSize) then
			if(cb.Visible) then
				cb.Visible = false
				cb.Visible = true
			end
		end
	end

	function environment:getChannelBarSize()
		return baseSize
	end

	function environment:clearChannelNotifications(channelName)
		notificationCounts[channelName] = 0
		handleNotifications(channelName)
	end

	function environment:addNotificationToChannel(channelName)
		notificationCounts[channelName] = notificationCounts[channelName] or 0
		notificationCounts[channelName] += 1
		handleNotifications(channelName)
	end

	function environment:openChannelFromBar(channel)
		clicked(channel)
	end
	
	local firstUpdate = false

	environment.network.onClientEvent("receiveChannelUpdate",function(channels)
		last = channels
		update(channels)
		if not firstUpdate then
			firstUpdate = true
			clicked(channels[1])
		end
	end)

	environment.refreshChannelSizes = function(size)
		if(last) then
			update(last,size)
		end
	end
	
	environment.network:fire("receiveChannelUpdate")

	return channelBar
end
-- Author: @Jumpathy
-- Name: chatWindow.lua
-- Description: Set up the main chat window

local userInput = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local heartbeat = runService.Heartbeat
local currentCamera = workspace.CurrentCamera
local channelBar = require(script.Parent:WaitForChild("channelBar"))

local resizeInputs,endInputs = {
	[Enum.UserInputType.MouseMovement] = true,
	[Enum.UserInputType.Touch] = true
},{
	[Enum.UserInputType.MouseButton1] = true,
	[Enum.UserInputType.Touch] = true
}

local touchEnabled = userInput.TouchEnabled

return function(environment)
	-- channel bar:

	local separate = environment.config.UI.SeparateChatbarFromMenu

	task.spawn(channelBar,environment)

	local chatWindow = {}
	local utility = environment.utility
	local api = {}
	local mainUi
	local currentState = true
	local currentlyFocused
	local zone
	local currentStateForMouse = nil
	
	local default = function() end
	
	local tweenPropertiesInternal = function(properties,gui,easingDirection,easingStyle,length,override,callback)
		utility:tween(
			gui,
			length or 1,
			properties,
			easingDirection or Enum.EasingDirection.Out,
			easingStyle or Enum.EasingStyle.Linear
		).Completed:Once(callback or default)
	end
	
	environment.tweenSize = function(gui,endSize,...)
		tweenPropertiesInternal({
			["Size"] = endSize
		},gui,...)
	end
	
	environment.tweenPosition = function(gui,endPosition,...)
		tweenPropertiesInternal({
			["Position"] = endPosition
		},gui,...)
	end
	
	environment.tweenSizeAndPosition = function(gui,endSize,endPosition,...)
		tweenPropertiesInternal({
			["Size"] = endSize,
			["Position"] = endPosition
		},gui,...)
	end
	
	-------- Fade: --------
	
	local FadeOptions = environment.config.UI.FadeOptions or {
		Window = {
			HoveringTransparency = 0.75, --> Transparency of main window when hovering
			NotHoveringTransparency = 1 --> When not hovering
		},
		Chatbar = { --> Transparency of chatbar, resize button, channel button
			HoveringTransparency = 0,
			NotHoveringTransparency = 1,
			TextColor = { --> Chatbar text color when hovering
				Regular = {
					Hovering = Color3.fromRGB(100,100,100),
					NotHovering = Color3.fromRGB(255,255,255)
				},
				Placeholder = {
					Hovering = Color3.fromRGB(80,80,80),
					NotHovering = Color3.fromRGB(200,200,200)
				}
			}
		}
	}
	
	local hoveringTransparency = FadeOptions.Window.HoveringTransparency
	local notHoveringTransparency = FadeOptions.Window.NotHoveringTransparency
	local chatbarHovering = FadeOptions.Chatbar.HoveringTransparency
	local chatbarNotHovering = FadeOptions.Chatbar.NotHoveringTransparency
	
	local o1 = FadeOptions.Chatbar.TextColor.Regular
	local o2 = FadeOptions.Chatbar.TextColor.Placeholder
			
	local fadeState = function(length,state)
		utility:tween({
			mainUi.window,length,{
				["BackgroundTransparency"] = state and hoveringTransparency or notHoveringTransparency
			}
		},{
			mainUi.bar,length,{
				["BackgroundTransparency"] = separate and (state and hoveringTransparency or notHoveringTransparency) or notHoveringTransparency
			}
		},{
			mainUi.box.Parent,length,{
				["BackgroundTransparency"] = state and chatbarHovering or chatbarNotHovering
			}
		},{
			mainUi.box,length,{
				["TextColor3"] = state and o1.Hovering or o1.NotHovering,
				["PlaceholderColor3"] = state and o2.Hovering or o2.NotHovering,
			}
		},{
			environment.resizeButton,length,{
				["BackgroundTransparency"] = state and chatbarHovering or chatbarNotHovering
			}
		},{
			environment.resizeButton.Icon,length,{
				["ImageTransparency"] = state and chatbarHovering or chatbarNotHovering
			}
		},{
			mainUi.channelBar.Main.Container,length,{
				["BackgroundTransparency"] = (state and hoveringTransparency or notHoveringTransparency)
			}
		},{
			mainUi.channelButton,length,{
				["BackgroundTransparency"] = (state and chatbarHovering or chatbarNotHovering)
			}
		},{
			mainUi.scroller.Parent,length,{
				["ScrollBarThickness"] = (state and 5 or 0),
				["ScrollBarImageTransparency"] = (state and 0 or 1)
			}
		},{
			mainUi.autofillContainer,length,{
				["BackgroundTransparency"] = (state and hoveringTransparency or 1)
			}
		})
		currentState = state
	end
	
	function environment:setUiTransparency(state,length)
		fadeState(length or 0.16,state)
	end

	local fade = function(state)
		if(not state) then
			currentStateForMouse = nil
		end
		fadeState(0.16,state)
	end

	local getChatbarSize = function()
		return(mainUi.chatbarContainer.Main.AbsoluteSize.Y)
	end

	-------- Focus area for mouse: --------

	local last
	local offset
	local uiVariable;

	local corners = {
		["BottomRight"] = function(offsetBottom)
			mainUi.channelBar.Visible = true
			mainUi.resizeButton.Parent = mainUi.channelBar.Main
			return  UDim2.new(1,-8,1,offsetBottom),Vector2.new(1,1)
		end,
		["TopLeft"] = function()
			return UDim2.fromOffset(16,8),Vector2.new(0,0)
		end,
		["TopRight"] = function()
			return UDim2.new(1,-16,0,8),Vector2.new(1,0)
		end,
		["BottomLeft"] = function(offsetBottom)
			mainUi.channelBar.Visible = true
			mainUi.resizeButton.Parent = mainUi.channelBar.Main
			return UDim2.new(0,16,1,offsetBottom),Vector2.new(0,1)
		end,
	}

	local corner = environment.config.UI.CornerPosition or "TopLeft"
	local calculatePosition = corners[corner] or corners["TopLeft"]
	environment.cornerPosition = corners[corner] and corner or "TopLeft"

	local recalculateFocusZone = function()
		local chatWindowSizeBase = (mainUi.chatbarContainer.Position.Y.Offset)
		local s2 = mainUi.chatbarContainer.Main.Autofill.Container.AbsoluteSize.Y
		local totaled = chatWindowSizeBase + getChatbarSize() + (s2) + (s2 > 0 and 5 or 0)
		local new = UDim2.new(1,0,0,totaled)

		if(zone.Size ~= new) then
			last = new
			zone.Size = new
			local position,anchorPoint = calculatePosition(-((totaled - zone.Parent.AbsoluteSize.Y)+5))
			zone.Parent.AnchorPoint = anchorPoint
			zone.Parent.Position = position
			offset = uiVariable.AbsolutePosition
		end		
	end

	local mouseEnterState = function(state)
		if((not currentlyFocused) and (not state)) then
			if(currentState) then
				fade(false)
			end
		elseif((not currentlyFocused) and (state) and (not currentState)) then
			fade(true)
		end
	end

	local focusState = function(state,doContinue)
		currentlyFocused = state
		if(doContinue) then
			if(state) then
				fade(true)
			elseif(currentState and (not state)) then
				fade(false)
			end
		end
	end

	function chatWindow:setup(ui,chatbar)
		uiVariable = ui
		local channelBar = ui:WaitForChild("Channelbar")
		mainUi = {
			chatWindow = ui:WaitForChild("ChatWindow"),
			window = ui:WaitForChild("ChatWindow"):WaitForChild("Main"),
			bar = chatbar.chatbox.Parent.Parent,
			box = chatbar.chatbox,
			scroller = ui:WaitForChild("ChatWindow"):WaitForChild("Main"):WaitForChild("Scroller"):WaitForChild("MessageContainer"),
			channelBar = channelBar,
			channelButton = chatbar.chatbox.Parent.Parent.Container.Channel,
			chatbarContainer = ui:WaitForChild("ChatBarContainer")
		}		
		mainUi.autofillContainer = mainUi.box.Parent.Parent.Parent:WaitForChild("Autofill")
		environment.mainUi = mainUi
		zone = mainUi.window.Parent.Parent:WaitForChild("Zone")
		local resizeButton = chatbar.chatbox.Parent.Parent:WaitForChild("Resize")
		environment.resizeButton = resizeButton
		mainUi.resizeButton = resizeButton
		mainUi.box.Changed:Connect(recalculateFocusZone)
		mainUi.autofillContainer.Changed:Connect(recalculateFocusZone)

		if(environment.cornerPosition:find("Bottom") and (not environment.config.UI.ChannelBarEnabled)) then
			resizeButton.Changed:Connect(function()
				mainUi.channelBar.Visible = resizeButton.Visible
			end)
		end
		
		-- colors:
		
		local colorOptions = environment.config.UI.ColorOptions
		
		local windowColor = colorOptions.Window.BackgroundColor
		local chatbarColor = colorOptions.ChatbarColor
		local buttonBgColor = colorOptions.Buttons.ResizeButton.BackgroundColor
		local buttonFillColor = colorOptions.Buttons.ResizeButton.IconColor

		mainUi.box.Parent.BackgroundColor3 = chatbarColor
		
		resizeButton.BackgroundColor3 = buttonBgColor
		resizeButton.Icon.ImageColor3 = buttonFillColor
		
		mainUi.window.BackgroundColor3 = windowColor
		mainUi.bar.BackgroundColor3 = windowColor
		mainUi.autofillContainer.BackgroundColor3 = windowColor
		mainUi.channelBar.Main.Container.BackgroundColor3 = windowColor
		
		-------- Mouse event custom: --------

		local mouseIn = false
		local positionBounds = {}
		local holdingResize = false

		local mouseEnter = function()
			mouseIn = true
			mouseEnterState(true)
		end

		local mouseLeave = function()
			mouseIn = false
			if(not holdingResize) then
				mouseEnterState(false)
			end
		end

		local checkBounds = function(input)
			if(not offset or (not zone)) then
				return
			end
			local position = input.Position
			local chatSize = ui.AbsoluteSize
			if(environment.mouseMoved) then
				for object,callback in pairs(environment.mouseMoved) do
					if(object:GetFullName() ~= object.Name) then
						task.spawn(environment.mouseMoved[object],position)
					else
						environment.mouseMoved[object] = nil
					end
				end
			end
			positionBounds = {
				x  = {
					offset.X,(offset.X + zone.AbsoluteSize.X)
				},y = {
					offset.Y,(offset.Y + zone.AbsoluteSize.Y)
				}
			}
			local inBounds = false
			if(position.X >= positionBounds.x[1] and position.X <= positionBounds.x[2]) then
				if(position.Y >= positionBounds.y[1] and position.Y <= positionBounds.y[2]) then
					inBounds = true
				end
			end
			if(currentStateForMouse ~= inBounds) then
				currentStateForMouse = inBounds
				local func = (inBounds and mouseEnter or mouseLeave)
				func()
			end
		end

		if(not touchEnabled) then
			userInput.InputChanged:Connect(function(input)
				if(input.UserInputType == Enum.UserInputType.MouseMovement) then
					checkBounds(input)
				end
			end)
		else
			userInput.InputBegan:Connect(function(input,gameProcessed)
				if(input.UserInputType == Enum.UserInputType.Touch) then
					local ended
					ended = input.Changed:Connect(function()
						if(input.UserInputState == Enum.UserInputState.End) then
							ended:Disconnect()
						end
						checkBounds(input)
					end)
					checkBounds(input)
				end
			end)
		end

		-------- Resize button: --------

		local resizeConnection
		local baseSize = ui.AbsoluteSize
		local minX,maxX = baseSize.X/2,baseSize.X * 1.75
		local minY,maxY = baseSize.Y/2,baseSize.Y * 1.75
		local scroller = mainUi.scroller.Parent
		

		ui.Changed:Connect(function()
			if(ui.Size.Y.Offset < minY or ui.Size.X.Offset < minX) then
				environment.tweenSize(ui,UDim2.fromOffset(
					math.clamp(ui.Size.X.Offset,minX,maxX),
					math.clamp(ui.Size.Y.Offset,minY,maxY)
				),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.015,true)
			end
		end)
		
		
		resizeButton.MouseButton1Down:Connect(function()
			holdingResize = true
			resizeConnection = userInput.InputChanged:Connect(function(input)
				if(resizeInputs[input.UserInputType]) then
					scroller.Size = UDim2.fromOffset(scroller.AbsoluteSize.X,scroller.AbsoluteSize.Y)
					-- since each button is in a different corner they all need to be calculated differently :cry:
					if(corner == "TopLeft") then
						environment.tweenSize(ui,UDim2.fromOffset(
							math.clamp(input.Position.X,minX,maxX),
							math.clamp(input.Position.Y + (separate and 0 or getChatbarSize()),minY,maxY)
						),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.015,true)
					elseif(corner == "BottomRight") then
						local viewportSize = workspace.CurrentCamera.ViewportSize
						local xAxis = (viewportSize.X - input.Position.X) + resizeButton.AbsoluteSize.X/2
						local yAxis = (viewportSize.Y - input.Position.Y) - resizeButton.AbsoluteSize.Y
						environment.tweenSize(ui,UDim2.fromOffset(
							math.clamp(xAxis,minX,maxX),
							math.clamp(yAxis,minY,maxY)
						),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.015,true)
					elseif(corner == "TopRight") then
						local viewportSize = workspace.CurrentCamera.ViewportSize
						local xAxis = (viewportSize.X - input.Position.X)
						local yAxis = (input.Position.Y + resizeButton.AbsoluteSize.Y/2) 
						environment.tweenSize(ui,UDim2.fromOffset(
							math.clamp(xAxis,minX,maxX),
							math.clamp(yAxis,minY,maxY)
						),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.015,true)
					elseif(corner == "BottomLeft") then
						local viewportSize = workspace.CurrentCamera.ViewportSize
						local yAxis = (viewportSize.Y - input.Position.Y) - resizeButton.AbsoluteSize.Y
						environment.tweenSize(ui,UDim2.fromOffset(
							math.clamp(input.Position.X + 8,minX,maxX),
							math.clamp(yAxis,minY,maxY)
						),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.015,true)
					end
					heartbeat:Wait()
					environment.textChanged()
				end
			end)
		end)

		userInput.InputEnded:Connect(function(input)
			if(endInputs[input.UserInputType] and holdingResize) then
				holdingResize = false
				if(not currentStateForMouse) then
					mouseEnterState(false)
				end
				resizeConnection:Disconnect()
				scroller.Size = UDim2.new(1,-15,1,-10)
				environment:checkScrollerPos(true,0)
			end
		end)

		-------- Channel bar: --------

		local padding = 5

		local handleChannelbar = function()
			local size = environment:getChannelBarSize()

			if(channelBar.Visible) then
				channelBar.Size = UDim2.new(1,0,0,0)
				environment.tweenSize(channelBar,UDim2.new(1,0,0,size),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.16,true)
				environment.tweenSizeAndPosition(
					mainUi.window.Parent,
					UDim2.new(1,0,1,(-size - (size + padding))),
					UDim2.new(0,0,0,size + padding),
					Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.16,true
				)
			else
				environment.tweenSizeAndPosition(
					mainUi.window.Parent,
					UDim2.new(1,0,1,(-size)),
					UDim2.new(0,0,0,0),
					Enum.EasingDirection.In,Enum.EasingStyle.Quad,0.16,true
				)
			end
		end
		
		mainUi.chatWindow.Changed:Connect(function()
			if(environment.chatWindowVisible) then
				if(separate) then
					mainUi.chatbarContainer.Position = UDim2.fromOffset(0,(mainUi.window.Parent.Position.Y.Offset + (mainUi.window.Parent.AbsoluteSize.Y) + 5))
				else
					mainUi.chatbarContainer.Position = UDim2.fromOffset(0,(mainUi.window.Parent.Position.Y.Offset + (mainUi.window.Parent.AbsoluteSize.Y)) - (mainUi.chatbarContainer.AbsoluteSize.Y))
				end
			end
		end)

		channelBar:GetPropertyChangedSignal("Visible"):Connect(handleChannelbar)
		handleChannelbar()

		-------- Focus detection: --------

		mainUi.box.Focused:Connect(function()
			focusState(true,true)
		end)
		mainUi.box.FocusLost:Connect(function()
			focusState(false,(not mouseIn))
		end)
		fade(false)
	end

	return chatWindow
end
-- Author: @Jumpathy
-- Name: chatbar.lua
-- Description: Set up the chatbar :D

local textService = game:GetService("TextService")
local runService = game:GetService("RunService")
local userInput = game:GetService("UserInputService")
local players = game:GetService("Players")
local chatService = game:GetService("Chat")
local collectionService = game:GetService("CollectionService")

local localPlayer = players.LocalPlayer
local heartbeat = runService.Heartbeat
local space = string.char(32)
local history = require(script.Parent.Parent:WaitForChild("history"))
local autofillFolder = script.Parent.Parent:WaitForChild("autofill")
local initCommandProcessor = require(script.Parent.Parent:WaitForChild("commands"):WaitForChild("processor"))
local autofillModule = require(autofillFolder:WaitForChild("autofill"))
local autofillManager = require(autofillFolder:WaitForChild("manager"))
local autofillListFolder = autofillFolder:WaitForChild("autofills")
local extraData

local getWhisperChannel = function(id)
	local array = {math.abs(id),math.abs(localPlayer.UserId)}
	table.sort(array)
	return "whisper_" .. table.concat(array,"_")
end

return function(environment)
	-------- Variables: --------

	local utility,connections,localization = environment.utility,environment.connections,environment.localization
	local chatbar,messageHistory = {},{}
	local pointer,padding,idx = 0,4,0
	local chatbarContainer,chatbox,count,chatboxApi = nil,nil,nil,nil
	local commandProcessor = initCommandProcessor(environment)
	local separate = environment.config.UI.SeparateChatbarFromMenu

	-------- Functions: --------

	function environment:getExtraData()
		return extraData
	end

	local fixWhitespace = function(message)
		local disallowedWhitespace = environment.config.Messages.DisallowedWhitespace
		for _,character in pairs(disallowedWhitespace) do
			if(character == "\t") then
				message = message:gsub(character,string.char(32))
			else
				message = message:gsub(character,"")
			end
		end
		message = message:gsub("\n","")
		message = message:gsub("[ ]+"," ")
		return message
	end

	local getRawTextSizeInPx = function(chatbox,text,inf)
		local text,textSize,font = (text or chatbox.Text),chatbox.TextSize,chatbox.Font
		local sizeClamp = Vector2.new((inf and math.huge or chatbox.AbsoluteSize.X),math.huge)
		return textService:GetTextSize(text,textSize,font,sizeClamp)
	end

	local setplaceholderText = function(message)
		chatbox.PlaceholderText = message or chatbox.PlaceholderText
	end
	
	local process = function(message)
		if environment.config.Messages.RemoveFormattingForChattedEvent then
			message = environment.richText:markdown(message,true)
			message = environment.richText:strip(message)
			connections:Fire("ChatWindow","MessagePosted",message)
		else
			connections:Fire("ChatWindow","MessagePosted",message)
		end
	end

	local sendMessage = function(message)
		table.insert(messageHistory,1,message)
		if(#messageHistory >= 100) then
			table.remove(messageHistory,#messageHistory)
		end
		chatbox.Text = chatboxApi:CalculateText("")
		local isCommand = commandProcessor:parse(message)
		if(not isCommand) then
			local success,hasResponse,localizationData = environment.network:invoke("requestMessage",fixWhitespace(message),environment.currentChannel,extraData)
			if(hasResponse and (not success)) then
				environment:addMessageToQueue(environment.message_senders.makeSm(localization:localizeResponse(unpack(localizationData))))
			elseif(success) then
				process(message)
			end
		else
			process(message)
		end
	end

	function environment:onEdit(message)
		connections:Fire("ChatWindow","MessagePosted",message)
	end

	local base = function()
		return(chatbox.TextSize * (2 + 1/3))
	end

	-------- Setup: --------

	function chatbar:setup(a,b)
		chatbarContainer,chatbox = a,b

		local autofill = autofillModule(environment,chatbox)
		local resize = chatbox.Parent.Parent:WaitForChild("Resize")
		local icon = resize:WaitForChild("Icon")
		local channelButton = resize.Parent:WaitForChild("Container"):WaitForChild("Channel")
		local label = channelButton:WaitForChild("Label")
		local offset = 10
		local single,isReply = nil,nil
		environment.currentChannel = "Main"

		local colorOptions = environment.config.UI.ColorOptions
		channelButton.ReplyIcon.ImageColor3 = colorOptions.Buttons.ReplyAndChannel.TextAndIconColor
		channelButton.BackgroundColor3 = colorOptions.Buttons.ReplyAndChannel.BackgroundColor

		function environment:setChannel(name,is,display,extra)
			extraData = extra
			environment.currentChannel = name
			isReply = is
			channelButton.ReplyIcon.Visible = (is == true)

			if(not isReply) then
				if(not name) then
					channelButton.Visible = false
				else
					label.Text = (display or name)
					channelButton.Visible = true
				end
			else
				label.Text = ""
				channelButton.Visible = true
				channelButton.Size = UDim2.new(0,20,0,20)
			end

			pcall(function()
				environment:clearChannelNotifications(name)
				if(environment.currentChannel ~= name) then
					environment:openChannelFromBar(name)
				end
			end)
		end

		function environment:whisper(user)
			if(user ~= localPlayer) then
				local displayName = user:GetAttribute("DisplayName")
				environment:setChannel(getWhisperChannel(user.UserId),false,environment.localization:getMessagePrefix("To") .. " " .. displayName)
			end
		end

		local typingIndicator = function()
			if(environment.config.BubbleChat.Enabled) then
				return environment.bubbleChatEnabled and environment.bubbleChatConfig.TypingIndicator
			end
		end

		-------- API: --------

		local locked = false
		chatboxApi = {
			CalculateText = function(self,text)
				return string.rep(string.char(32),(count or 0)) .. text
			end,
			GetText = function()
				return chatbox.Text:sub(idx,#chatbox.Text)
			end,
			LockChatbar = function(text)
				setplaceholderText(localization:getChatbarPlaceholder(true))
				chatbox.TextEditable = false
				locked = true
			end,
			UnlockChatbar = function()
				setplaceholderText(localization:getChatbarPlaceholder())
				chatbox.TextEditable = true
				locked = false
			end,
		}

		environment.chatboxApi = chatboxApi

		chatbox.Focused:Connect(function()
			if(locked) then
				chatbox:ReleaseFocus()
			end
		end)

		environment.network.onClientEvent("receiveMuteUpdate",function(muted)
			chatboxApi[muted and "LockChatbar" or "UnlockChatbar"]()
		end)

		-------- Up/down message --------

		local on = function()
			chatbox.Text = chatboxApi:CalculateText(messageHistory[pointer])
			chatbox.CursorPosition = 10000
		end

		userInput.InputBegan:Connect(function(input)
			pcall(function()
				if(chatbox:IsFocused()) then
					if(not environment.autofillOpen) then
						if(input.KeyCode == Enum.KeyCode.Up) then
							pointer = math.clamp(pointer + 1,1,#messageHistory)
							on()
						elseif(input.KeyCode == Enum.KeyCode.Down) then
							pointer = math.clamp(pointer - 1,1,#messageHistory)
							on()
						end
					end
				end
			end)
		end)

		-------- More functions: --------

		local get = function(t)
			return getRawTextSizeInPx(label,t,true)
		end

		local getSpaces = function(text)
			local spaceCount = 3
			local minSize = get(text) + get(string.rep(space,spaceCount))
			local lastSize
			repeat
				spaceCount += 1
				lastSize = get(string.rep(space,spaceCount))
			until(spaceCount >= 1000 or (lastSize.X >= minSize.X)) 
			return spaceCount
		end

		local lastText,expiresAt = "",0

		local timeout = function()
			task.spawn(function()
				local current = expiresAt
				task.wait((expiresAt-tick()))
				if(current == expiresAt) then
					environment.network:fire("typingIndicator",false)
				end
			end)
		end

		local logChange = function()
			if(typingIndicator() and chatbox:IsFocused() and (not locked)) then
				environment.network:fire("typingIndicator",true)
				expiresAt = tick() + 5
				timeout()
			end
		end

		local textChanged

		local newVisibility = function(recurse)
			local isVis = resize.Visible
			offset = (isVis and -(resize.AbsoluteSize.X * 1.6) or -10)
			if(environment.cornerPosition:find("Bottom")) then
				offset = -10
			end
			if(not recurse) then
				textChanged()
			end
		end

		local container = resize.Parent:WaitForChild("Container")
		chatbox.Font = environment.config.UI.Fonts.TextFont
		chatbox.Bar.Font = environment.config.UI.Fonts.TextFont

		collectionService:AddTag(chatbox,"TextFont")
		collectionService:AddTag(chatbox.Bar,"TextFont")

		textChanged = function()
			if(utf8.len(utf8.nfcnormalize(chatbox.Text)) > environment.config.Messages.MaximumLength) then
				chatbox.Text = lastText
				return
			end
			logChange()
			lastText = chatbox.Text
			local size = getRawTextSizeInPx(chatbox)

			-- buttons:

			local baseSize = (base() - (chatbox.TextSize)) + (chatbox.TextSize) + padding
			container.Position = UDim2.new(0.5,0,0,baseSize/2)

			local sizeForResize = math.ceil(baseSize * 25/36)
			resize.Size = UDim2.fromOffset(sizeForResize,sizeForResize)
			local paddingLeft = (10 + sizeForResize + 5)
			if(environment.mainUi) then
				local scroller = environment.mainUi.channelBar.Main.Container.Scroller
				if(environment.cornerPosition == "TopLeft") then
					resize.AnchorPoint = Vector2.new(1,0.5)
					resize.Position = UDim2.new(1,-5,0,baseSize/2)
				elseif(environment.cornerPosition == "BottomRight") then
					resize.AnchorPoint = Vector2.new(0,0.5)
					resize.Position = UDim2.new(0,5,0,baseSize/2)
					if(resize.Visible) then
						scroller.Size = UDim2.new(1,-paddingLeft,1,0)
					else
						scroller.Size = UDim2.new(1,-10,1,0)
					end
				elseif(environment.cornerPosition == "TopRight") then
					resize.AnchorPoint = Vector2.new(0,0.5)
					resize.Position = UDim2.new(0,5,0,baseSize/2)
					chatbox.Parent.Position = UDim2.new(0,paddingLeft-5,0.5,0)
				elseif(environment.cornerPosition == "BottomLeft") then
					resize.AnchorPoint = Vector2.new(1,0.5)
					resize.Position = UDim2.new(1,-5,0,baseSize/2)
					if(resize.Visible) then
						scroller.Position = UDim2.new(0,5,0.5,0)
						scroller.AnchorPoint = Vector2.new(0,0.5)
						scroller.Size = UDim2.new(1,-paddingLeft,1,0)
					else
						scroller.Position = UDim2.new(1,-5,0.5,0)
						scroller.AnchorPoint = Vector2.new(1,0.5)
						scroller.Size = UDim2.new(1,-10,1,0)
					end
				end
			end
			newVisibility(true)

			if(environment.refreshChannelSizes) then
				environment.refreshChannelSizes(chatbox.TextSize)
			end

			-- chatbar scaling:

			local totalSize = UDim2.new(1,0,0,(base() - (chatbox.TextSize)) + (size.Y) + padding)
			utility:tween({chatbox.Parent,0.05,{ -- white box
				Size = UDim2.new(1,offset,0,(base() - (chatbox.TextSize * 2)) + (size.Y) + (padding * 2))
			}},{chatbox,0.05,{ -- actual box
				Size = UDim2.new(1,-10,0,math.ceil(size.Y)),
			}},{chatbox.Parent.Parent.Parent,0.05,{ -- main thing
				Size = totalSize
			}})

			if(not separate) then
				local window = chatbox.Parent.Parent.Parent.Parent.Parent.ChatWindow
				window.Main.Size = UDim2.new(1,0,1,(totalSize.Y.Offset - (baseSize)))
				window.Main.Scroller.Size = UDim2.new(1,-15,1,-(totalSize.Y.Offset + 5))
			end
		end

		local deselectChannel = function()
			channelButton.Visible = false
		end

		local calculateCursor = function()
			heartbeat:Wait()
			local cursor,start = chatbox.CursorPosition,chatbox.SelectionStart
			local max = math.max(cursor,start)
			if(channelButton.Visible) then
				if(max < idx and (chatbox:IsFocused())) then
					deselectChannel()
				elseif(chatbox:IsFocused()) then
					local min = math.min(cursor,start)
					if(min ~= -1 and min < idx) then
						chatbox.SelectionStart = idx
					end
				end
			end
		end

		local onChannel = function()
			heartbeat:Wait()
			if(channelButton.Visible) then --> vomit code below
				-- fetch text size for channel button
				local textSize = isReply and {X = 25} or getRawTextSizeInPx(label,nil,true)
				-- set the size of the button
				label.Size = UDim2.new(0,textSize.X,1,0)
				channelButton.Size = (not isReply and UDim2.new(0,textSize.X + 10,0,20) or channelButton.Size)
				-- forgot what this does but it's important
				idx = 1 + (count or 0)
				-- get the spaces for the chatbar (eg: 'hello' -> '    ' if that makes sense)
				count = getSpaces(isReply and "   " or label.Text)
				chatbox.Text = string.rep(string.char(32),count) .. chatbox.Text:sub(idx,#chatbox.Text)
				-- set it to only get text after the spaces and put the cursor at the end when a channel's selected
				idx = count + 1
				chatbox.CursorPosition += 1000
				chatbox:CaptureFocus()
			else
				environment.currentChannel = "Main"
				if(idx > 1) then
					chatbox.Text = chatbox.Text:sub(idx,#chatbox.Text)
				end
				count = nil
				extraData = nil
				idx = 1
			end
		end

		-------- Connections: --------

		chatbox:GetPropertyChangedSignal("TextSize"):Connect(textChanged)
		chatbox:GetPropertyChangedSignal("Text"):Connect(textChanged)
		textChanged()

		setplaceholderText(localization:getChatbarPlaceholder())
		chatbox.Focused:Connect(logChange)
		chatbox.FocusLost:Connect(function(enterPressed,input)
			if(typingIndicator()) then
				environment.network:fire("typingIndicator",false)
			end
			if(enterPressed) then
				sendMessage(chatbox.Text:sub(idx,#chatbox.Text))
			end
		end)

		-- WARNING: USING THIS TO FAKE MESSAGES WILL LAND YOU IN MODERATION TROUBLE.
		-- THIS IS ONLY USED FOR QUICKCHAT

		function environment:sendMessageInternally(text)
			if(typingIndicator()) then
				environment.network:fire("typingIndicator",false)
			end
			sendMessage(text)
		end

		chatbox:GetPropertyChangedSignal("CursorPosition"):Connect(calculateCursor)
		chatbox:GetPropertyChangedSignal("SelectionStart"):Connect(calculateCursor)
		environment.textChanged = textChanged

		resize:GetPropertyChangedSignal("Visible"):Connect(newVisibility)
		newVisibility()

		label:GetPropertyChangedSignal("Text"):Connect(onChannel)
		channelButton:GetPropertyChangedSignal("Visible"):Connect(onChannel)
		onChannel()

		-------- Undo / redo support: --------

		history(chatbox,chatboxApi)

		-------- Autofills: --------

		local autofillsList = {}

		local onAutofill = function(rawModule)
			local module = require(rawModule)
			if(type(module) == "function") then
				module = module(environment.config)
			end
			autofillsList[rawModule.Name] = module
		end

		autofillListFolder.ChildAdded:Connect(onAutofill)
		for _,child in pairs(autofillListFolder:GetChildren()) do
			task.spawn(onAutofill,child)
		end
		
		environment.utility.childAdded(environment.addons:WaitForChild("Autofills"),function(child)
			child.Parent = autofillListFolder
		end)

		autofillManager(autofill,autofillsList,chatbox,environment)

		-------- Return: --------

		return {
			chatbox = chatbox,
			chatbar = chatbox.Parent.Parent.Parent
		}
	end

	-------- Core connections: --------

	local focusChatbar = function(state)
		if not environment.main_ui.Visible and typeof(state) == "EnumItem" then
			environment.main_ui.Visible = true
			connections:Fire("ChatWindow","VisibilityStateChanged",true)
			environment:setChatOpenState(true)
		end
		if(typeof(state) == "EnumItem") then
			state = true
		end
		if(state) then
			chatbox:CaptureFocus()
		else
			chatbox:ReleaseFocus()
		end
	end

	userInput.InputBegan:Connect(function(input,gameProcessed)
		if not gameProcessed and input.KeyCode == Enum.KeyCode.Return then
			task.wait()
			focusChatbar(true)
		end
	end)

	connections:Connect("ChatWindow","SpecialKeyPressed",focusChatbar)
	--connections:Connect("ChatWindow","ChatBarFocusChanged",focusChatbar)

	if environment.config.BubbleChat.Enabled and environment.config.BubbleChat.Config.TypingIndicator then
		localPlayer:GetAttributeChangedSignal("TypingIndicatorEnabled"):Connect(function()
			if not localPlayer:GetAttribute("TypingIndicatorEnabled") then
				environment.network:fire("typingIndicator",false)
			end
		end)
	end

	return chatbar
end
-- Author: @Jumpathy
-- Name: mention.lua
-- Description: User mention system

local players = game:GetService("Players")
local autofill = {}
autofill.beginsWith = "@"
autofill.endsWith = " "

autofill.onCapture = function(matches)
	local fill = {}
	local match = matches[#matches]
	if(match and (not match.hasClosing)) then
		for _,player in pairs(players:GetPlayers()) do
			if(player.Name:sub(1,#match.text) == match.text) then
				local display = (player.Name ~= player:GetAttribute("DisplayName") and ("(%s)"):format(player:GetAttribute("DisplayName")))
				local username = ("@%s %s"):format(player.Name,display or "")
				table.insert(fill,{
					text = (username),
					autofillBar = match.before .. "@".. player.Name,
					gsub = {"@"..match.text,"@"..player.Name.." "}
				})
			elseif(player:GetAttribute("DisplayName"):sub(1,#match.text) == match.text) then
				local username = ("@%s (%s)"):format(player:GetAttribute("DisplayName"),player.Name)
				table.insert(fill,{
					text = (username),
					autofillBar = match.before .. "@".. player:GetAttribute("DisplayName"),
					gsub = {"@"..match.text,"@"..player.Name.." "}
				})
			end
		end
	end
	if(#fill == 0) then
		fill = nil
	end
	return {},fill
end

return autofill
-- Author: @Jumpathy
-- Name: userAutofill.lua
-- Description: User autofill system

return function(config)
	local players = game:GetService("Players")
	local localPlayer = players.LocalPlayer

	local autofill = {}
	autofill.beginsWith = "/"
	autofill.endsWith = nil
	autofill.security = "internal"
	
	local autofillNameCommands = {
		["/mute"] = true,
		["/m"] = true,
		["/unmute"] = true,
		["/unm"] = true
	}
	
	if(config.Messages.Private.WhispersEnabled) then
		autofillNameCommands["/whisper"] = true
		autofillNameCommands["/w"] = true
	end

	autofill.onCapture = function(matches,environment)
		local fill,gsub,callback = {},{},nil
		local match = matches[#matches]
		local detect = function(player,name,base,command,isDisplayName)
			if(player ~= localPlayer) then
				table.insert(fill,{
					text = (isDisplayName and name .. " @"..player.Name or name),
					autofillBar = match.before .. command .. name,
					gsub = { --> replace (eg: /w Jump) with (/w Jumpathy)
						command..base,
						command..player.Name.." "
					}
				})
			end
		end
		if(match) then
			local startIdx = match.text:find(" ")
			if(startIdx) then
				local text = match.text:sub(startIdx + 1,#match.text)
				local command = "/" .. match.text:sub(1,startIdx)
				if(autofillNameCommands[command:gsub(" ","")]) then				
					if(string.len(text) >= 1) then
						for _,player in pairs(players:GetPlayers()) do
							if(player.Name:sub(1,#text) == text) then
								detect(player,player.Name,text,command)
							elseif(player:GetAttribute("DisplayName"):sub(1,#text) == text) then
								detect(player,player:GetAttribute("DisplayName"),text,command,true)
							end
						end
					end
					if(#match.text:split(" ") >= 3) then
						text = text:gsub(" ","")
						if(players:FindFirstChild(text) and command:sub(1,2) == "/w") then
							gsub[command .. text .. " "] = ""
							local target = players[text]
							callback = function()
								environment:whisper(target)
							end
						end
					end
				end
			end
		end
		return gsub,fill,callback
	end

	return autofill
end
-- Author: @Jumpathy
-- Name: team.lua
-- Description: Team channel system

return function(config)
	if(not config.Teams.TeamChat) then
		return
	end
	
	local players = game:GetService("Players")
	local localPlayer = players.LocalPlayer

	local autofill = {}
	local env
	autofill.beginsWith = ""
	autofill.endsWith = nil
	autofill.security = "internal"

	autofill.onCapture = function(matches,environment)
		if(not env) then
			env = environment
		end
		
		local gsub,fill,callback = {},{},nil
		if(matches:sub(1,1) == "/") then
			local commandName = matches:split("/")[2]
			if(commandName:find(" ")) then
				commandName = commandName:split(" ")[1]
				if(commandName == "t" or commandName == "team") then
					if(localPlayer.Team ~= nil and (not localPlayer.Neutral)) then
						gsub["/" .. commandName .. " "] = ""
						callback = function()
							local teamPrefix = environment.localization:getMessagePrefix("Team")
							environment:setChannel(teamPrefix,false,nil,{team = localPlayer.Team})
						end
					end
				end
			end
		end
		if(#fill == 0) then
			fill = nil
		end
		return gsub,fill,callback
	end

	localPlayer.Changed:Connect(function()
		if(localPlayer.Team == nil and localPlayer.Neutral) then
			if(env and env:getExtraData()) then
				if(env:getExtraData().team) then
					env:setChannel(nil)
				end
			end
		end
	end)

	return autofill
end
-- Author: @Jumpathy
-- Name: emoji.lua
-- Description: Emoji autofill system

return function(config)
	local list = require(script.Parent.Parent.Parent:WaitForChild("lists"):WaitForChild("emojiList"))
	local autofill = {}
	local allowedEmojis;
	
	autofill.beginsWith = ":"
	autofill.endsWith = ":"
	autofill.security = "internal"

	local network;
	local customEmojis;
	autofill.onCapture = function(matches,environment)
		network = environment.network
		if customEmojis then
			if not allowedEmojis then
				allowedEmojis = network:invoke("getAllowedEmojis")
			end
		end
		local gsub = {}
		local fill = {}
		for _,match in pairs(matches) do
			if(match.hasClosing) then
				local replacement = list:findDirect(match.text)
				if(replacement) then
					local hasCustomEmoji = false
					if allowedEmojis then
						for emojiName,emojiImage in pairs(allowedEmojis) do
							if(emojiName:sub(1,#match.text) == match.text) then
								hasCustomEmoji = true
							end
						end
					end
					if not hasCustomEmoji then
						gsub[(":%s:"):format(match.text)] = replacement
					end
				end
			else
				for _,emojiMatch in pairs(list.search(match.text)) do
					table.insert(fill,{
						text = (":%s: %s"):format(unpack(emojiMatch)),
						autofillBar = match.before .. ":" .. emojiMatch[1] .. ":",
						gsub = {(":%s"):format(match.text),emojiMatch[2].." "}
					})
				end
				if allowedEmojis then
					for emojiName,emojiData in pairs(allowedEmojis) do
						if(emojiName:sub(1,#match.text) == match.text) then
							table.insert(fill,1,{
								text = (":%s: "):format(emojiName),
								autofillBar = match.before .. ":" .. emojiName .. ":",
								gsub = {(":%s"):format(match.text),(":%s:"):format(emojiName)},
								onCreated = function(parent)
									local emojiImage = typeof(emojiData) == "table" and emojiData.Image or emojiData
									local object = parent.Label
									local textBounds = object.TextBounds
									local emoji = Instance.new("ImageLabel")
									emoji.Parent = object
									emoji.Position = UDim2.new(0,textBounds.X,0.5,0)
									emoji.Image = emojiImage
									emoji.BackgroundTransparency = 1
									emoji.AnchorPoint = Vector2.new(0,0.5)
									emoji.Size = UDim2.fromOffset(object.TextSize - 2,object.TextSize - 2)
									emoji.ScaleType = environment.config.Messages.CustomEmojis.ScaleType
									if typeof(emojiData) == "table" then
										environment.animateCustomEmoji(emoji,emojiData)
									end
									environment.onEmoji:Fire(emoji)
								end,
							})
						end
					end
				end
			end
		end
		return gsub,fill
	end

	if config.Messages.CustomEmojis and config.Messages.CustomEmojis.Enabled then
		customEmojis = true
		task.spawn(function()
			while task.wait(10) do
				if network then
					allowedEmojis = network:invoke("getAllowedEmojis")
				end
			end
		end)
	end

	return autofill
end
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
-- Author: @Jumpathy
-- Name: autofill.lua
-- Description: Autofilling scripting-end system

local userInput = game:GetService("UserInputService")
local collectionService = game:GetService("CollectionService")

local new = function(options,font)
	local object = Instance.new("TextButton")
	object.Name = "Object"
	object.Text = ""
	object.TextTransparency = 0.75
	object.AutoButtonColor = false
	object.Active = false
	object.BackgroundColor3 = options.BackgroundColor
	object.BackgroundTransparency = 1
	object.Selectable = false
	object.Size = UDim2.new(1, -10, 0, 20)

	local corner = Instance.new("UICorner")
	corner.Name = "Corner"
	corner.Parent = object

	local label = Instance.new("TextLabel")
	label.Name = "Label"
	label.Font = font
	label.TextColor3 = options.TextColor
	label.TextSize = 14
	label.TextWrapped = true
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.AnchorPoint = Vector2.new(0.5, 0)
	label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	label.BackgroundTransparency = 1
	label.Position = UDim2.fromScale(0.5, 0)
	label.Size = UDim2.new(1, -15, 0, 20)
	label.Parent = object
	collectionService:AddTag(label,"ChatbarFont")
	
	return object
end

return function(environment,chatbox)
	local colorOptions = environment.config.UI.ColorOptions
	local font = environment.config.UI.Fonts.TextFont

	environment.utility.childAdded(environment.addons:WaitForChild("Autofills"),function(child)
		child.Parent = script.Parent:WaitForChild("autofills")
	end)
	
	local mainUi = environment.mainUi
	local autofillContainer,scroller,chatboxAutofill,selected = nil,nil,nil,nil
	local buttons,fills,options,pointers,held,heldGeneral = {},{},{},{},{},{}
	local pointer = 0
	
	local inBounds = function(gui1,gui2) 
		local gui1_topLeft = gui1.AbsolutePosition
		local gui1_bottomRight = gui1_topLeft + gui1.AbsoluteSize
		local gui2_topLeft = gui2.AbsolutePosition
		local gui2_bottomRight = gui2_topLeft + gui2.AbsoluteSize
		return ((gui1_topLeft.x < gui2_bottomRight.x and gui1_bottomRight.x > gui2_topLeft.x) and (gui1_topLeft.y < gui2_bottomRight.y and gui1_bottomRight.y > gui2_topLeft.y))
	end
	
	local returnTrue = function()
		return true
	end

	local new_button = function(text,order)
		local template = new(colorOptions.Buttons.AutofillButton,font)
		template.LayoutOrder = order
		template.Label.Text = text
		return template
	end

	local clearAutofill = function()
		for _,obj in pairs(scroller:GetChildren()) do
			if(obj:IsA("TextButton")) then
				obj:Destroy()
			end
		end
	end
	
	local moveToCanvas = function(button)
		local s = button.AbsoluteSize.Y
		local currentPos = scroller.CanvasPosition.Y
		local base = (scroller.AbsoluteSize.Y + (scroller.AbsolutePosition.Y))
		environment.utility:tween({scroller,0.1,{
			CanvasPosition =  Vector2.new(0,((
				currentPos + (button.AbsolutePosition.Y - base)
			)+s))
		}})
	end

	local hovering = function(button)
		chatboxAutofill.Text = fills[button]
		selected = options[button]
		if(not inBounds(scroller,button)) then
			moveToCanvas(button)
		end
	end

	local handleMouseInput = function(button,inFrame)
		if(inFrame) then
			hovering(button)
			for _,btn in pairs(buttons) do
				environment.utility:tween({btn,0.01,{
					["BackgroundTransparency"] = ((inFrame and (btn == button)) and 0.5 or 1)
				}})
			end
		end
	end

	if(not mainUi) then
		local conn
		conn = game:GetService("RunService").Heartbeat:Connect(function()
			mainUi = environment.mainUi
			if(mainUi) then
				conn:Disconnect()
				autofillContainer = mainUi.autofillContainer
				scroller = autofillContainer.Container:WaitForChild("Scroller")
				chatboxAutofill = chatbox:WaitForChild("Bar")
			end
		end)
	end

	local picked = function(option,wasTabbed)
		if(option.gsub) then
			chatbox.Text = chatbox.Text:gsub(unpack(option.gsub))
		end
		chatbox:CaptureFocus()
		chatbox.CursorPosition = 10000
		if wasTabbed then
			task.wait()
			chatbox.Text = chatbox.Text:sub(1,#chatbox.Text - 1)
		end
	end

	local api,last = {},nil

	function api:fill(main)
		environment.autofillOpen = #main >= 1
		clearAutofill()
		buttons = {}
		fills = {}
		options = {}
		chatboxAutofill.Text = ""
		selected = nil
		pointer = 0
		pointers = {}
		last = tick()
				
		for key,option in pairs(main) do
			local button = new_button(option.text,key)
			button.Name = option.text
			button.Parent = scroller
			pointers[key] = button
			options[button] = option
			local changed,clicked = nil,nil
			changed = button.Changed:Connect(function()
				if(button:GetFullName() == button.Name) then
					clicked:Disconnect()
					changed:Disconnect()
				end
			end)
			clicked = button.MouseButton1Click:Connect(function()
				picked(option)
			end)
			table.insert(buttons,button)
			fills[button] = option.autofillBar
			local lastState
			environment.mouseMoved[button] = function(position)
				local inBounds = false
				if(position.X <= (button.AbsolutePosition.X + button.AbsoluteSize.X)) then
					if(position.X >= (button.AbsolutePosition.X)) then
						if(position.Y >= (button.AbsolutePosition.Y - button.AbsoluteSize.Y/2)) then
							if(position.Y <= (button.AbsolutePosition.Y + button.AbsoluteSize.Y/2)) then
								inBounds = true
							end
						end
					end
				end
				if(inBounds ~= lastState) then
					lastState = inBounds
					handleMouseInput(button,inBounds)
				end
			end
			if(key == 1) then
				lastState = true
				handleMouseInput(button,true)
			end
		end
		
		local contentSize = scroller.Layout.AbsoluteContentSize.Y
		local buttonLimit = 8
		local ySize = math.clamp(contentSize,0,(20 * buttonLimit) + (2 * buttonLimit))
		scroller.Size = UDim2.new(1,-10,0,ySize)
		scroller.CanvasSize = UDim2.new(1,0,0,contentSize)
		
		local baseSize = UDim2.new(1,0,0,ySize + (#main >= 1 and 8 or 0))
		scroller.Parent.Size = baseSize
		scroller.Parent.Parent.Size = baseSize
		
		for key,option in pairs(main) do
			local button = pointers[key]
			if option.onCreated then
				option.onCreated(button)
			end
		end
	end
	
	local lapse = function(input,callback,otherCondition)
		held[input] = true
		heldGeneral[input.KeyCode] = true
		otherCondition = otherCondition or returnTrue
		local began = tick()
		while(held[input] and otherCondition()) do
			local elapsed = tick() - began
			callback()
			task.wait(math.clamp((0.5 - (elapsed / 4)),0.1,math.huge))
		end
	end
	
	userInput.InputEnded:Connect(function(input)
		held[input] = nil
		heldGeneral[input.KeyCode] = nil
	end)
	
	userInput.InputBegan:Connect(function(input,gameProcessed)
		if(chatbox:IsFocused()) then
			local current = last
			if(input.KeyCode == Enum.KeyCode.Right or input.KeyCode == Enum.KeyCode.Tab) then
				if(selected ~= nil) then
					picked(selected,input.KeyCode == Enum.KeyCode.Tab)
				end
			elseif(input.KeyCode == Enum.KeyCode.Down and not heldGeneral[input.KeyCode]) then
				if(#pointers >= 1) then
					lapse(input,function()
						pointer = math.clamp(pointer + 1,1,#pointers)
						handleMouseInput(pointers[pointer],true)
					end,function()
						return(#pointers >= 1 and last == current)
					end)
				end
			elseif(input.KeyCode == Enum.KeyCode.Up and not heldGeneral[input.KeyCode]) then
				if(#pointers >= 1) then
					lapse(input,function()
						pointer = math.clamp(pointer - 1,1,#pointers)
						handleMouseInput(pointers[pointer],true)
					end,function()
						return(#pointers >= 1 and last == current)
					end)
				end
			end
		end
	end)

	return api
end
-- Author: @Jumpathy
-- Name: manager.lua
-- Description: Autofill manager

local runService = game:GetService("RunService")
local heartbeat = runService.Heartbeat

return function(api,fills,box,environment)
	local justReplaced
	
	local autofills = {}
	
	for _,autofill in pairs(fills) do
		if(autofill.priority == nil) then
			autofill.priority = 3
		end
		table.insert(autofills,autofill)
	end
	
	table.sort(autofills,function(autofill1,autofill2)
		return autofill1.priority < autofill2.priority
	end)
				
	local security = function(fill)
		if(fill.security == "internal") then -- external autofills can also use this, 
			-- I just keep it on the low because it gives them internal API access and it
			-- is unstable if you don't know what you're doing.
			return environment
		end
	end

	local capture = function(text,fill,matches,...)
		local wasReplaced = false
		local gsub,toFill,callback,endAt = fill.onCapture(matches,...)
		if(gsub) then
			for pattern,replace in pairs(gsub) do
				text = text:gsub(pattern,replace)
				wasReplaced = true
			end
			justReplaced = text
			if(wasReplaced) then
				heartbeat:Wait() --> fixes some weird bug on mobile somehow :shrug:
				box.Text = text
			end
		end
		if(toFill) then
			api:fill(toFill)
		end
		if(callback) then
			callback()
		end
		if endAt then
			box.CursorPosition = endAt
		end
	end
	
	box:GetPropertyChangedSignal("Text"):Connect(function()
		api:fill({})
		local length = utf8.len(utf8.nfcnormalize(box.Text))
		if(length <= environment.config.Messages.MaximumLength and (box.Text ~= justReplaced)) then
			local text = box.Text
			for _,fill in pairs(autofills) do
				if(fill.beginsWith ~= "") then
					if(text:find(fill.beginsWith)) then
						if fill.isCommandFill and #text == #fill.beginsWith and text == fill.beginsWith then
							capture(text,fill,{},security(fill))
						else
							local matches = {}
							local found,beginAt = 1,1
							repeat
								local startIdx,endIdx = text:find(fill.beginsWith,beginAt)
								if(endIdx and (endIdx < #text)) then
									local ending = fill.endsWith
									local split = text:sub(endIdx+1,#text):split(((ending ~= "" and ending) or nil))
									local between = split[1]
									if(#between:gsub(" ","") >= 1 or (fill.ignoreSpaces)) then
										table.insert(matches,{
											text = between,
											before = text:sub(1,startIdx-1),
											hasClosing = (#split >= 2)
										})
									end
								end
								found = (endIdx and 1 or 0)
								beginAt = (endIdx and endIdx + 1 or beginAt)
							until(found == 0)
							if(#matches >= 1) then
								capture(text,fill,matches,security(fill))
							end
						end
					end
				else
					capture(text,fill,text,security(fill))
				end
			end
		end
	end)
end
local languages = {
	"fr-fr","tr-tr","ka-ge","kk-kz","bn-bd","uk-ua","sl-sl","ru","de","it-it","si-lk",
	"bg-bg","sk-sk","cs-cz","pt","sq-al","de-de","fr","hu-hu","th-th","sv-se","ja","ko",
	"it","es","my-mm","ro-ro","zh-cn","fil-ph","ko-kr","hi-in","sr-rs","pl-pl","bs-ba",
	"hr-hr","ja-jp","el-gr","lv-lv","fi-fi","et-ee","zh-cjv","pt-br","vi-vn","da-dk",
	"ar-001","id-id","zh-tw","nb-no","km-kh","ru-ru","es-es","nl-nl","lt-lt","en-us",
	"ms-my"
}

local indexes = {}
local languageHolder = script.Parent:WaitForChild("languages")

for _,language in pairs(languages) do
	indexes[language] = require(languageHolder:WaitForChild(language))
end

local keys = {}

for language,values in pairs(indexes) do
	for key,value in pairs(values) do
		keys[key] = keys[key] or {}
		keys[key][language] = value
	end
end

local entries = {}

for key,values in pairs(keys) do
	table.insert(entries,{
		Key = key,
		Values = values
	})
end

return function()
	local localizationTable = Instance.new("LocalizationTable")
	localizationTable.Name = "ChatLocalization"
	localizationTable:SetEntries(entries)
	return localizationTable,entries
end
-- Author: @Jumpathy
-- Name: history.lua
-- Description: Ctrl+Y / Ctrl+Z support
-- Credit: @boatbomber for TextBox+'s undo/redo system base

return function(box,api)
	-------- Services: --------

	local userInput = game:GetService("UserInputService")
	local runService = game:GetService("RunService")

	-------- Variables: --------

	local lastChange,lastSnap,lastText = tick(),tick(),""
	local holdingCtrl,held,controller,ignores,stacks = false,{},{},{},{
		undo = {},
		redo = {}
	}

	-------- Functions: --------

	local apply = function(waypoint)
		for property,value in pairs(waypoint) do
			box[property] = (property == "Text" and api:CalculateText(value) or value)
		end
	end

	-------- History controller: --------

	function controller:snap()
		table.insert(stacks.undo,{
			Text = api:GetText(),
			CursorPosition = box.CursorPosition,
			SelectionStart = box.SelectionStart
		})
		if(#stacks.redo > 0) then
			stacks.redo = {}
		end
		while(#stacks.undo > 30) do
			table.remove(stacks.undo,1)
		end
	end

	controller[Enum.KeyCode.Z] = function()
		if(#stacks.undo > 1) then
			local waypoint = stacks.undo[#stacks.undo - 1]
			apply(waypoint)
			ignores[box] = true
			table.insert(stacks.redo,stacks.undo[#stacks.undo])
			table.remove(stacks.undo,#stacks.undo)
		end
	end

	controller[Enum.KeyCode.Y] = function()
		if(#stacks.redo > 0) then
			local waypoint = stacks.redo[#stacks.redo]
			apply(waypoint)
			ignores[box] = true
			table.insert(stacks.undo,waypoint)
			table.remove(stacks.redo,#stacks.redo)
		end
	end

	-------- Connections: --------

	userInput.InputBegan:Connect(function(input)
		if(box:IsFocused()) then
			if(input.KeyCode == Enum.KeyCode.LeftControl or input.KeyCode == Enum.KeyCode.RightControl) then
				if(not holdingCtrl) then
					holdingCtrl = true
					local signal
					signal = input.Changed:Connect(function()
						if(input.UserInputState == Enum.UserInputState.End) then
							signal:Disconnect()
							holdingCtrl = false
						end
					end)
				end
			elseif(input.KeyCode == Enum.KeyCode.Y or input.KeyCode == Enum.KeyCode.Z) then
				if(holdingCtrl and not held[input.KeyCode]) then
					local signal
					held[input] = true
					held[input.KeyCode] = true
					signal = input.Changed:Connect(function()
						if(input.UserInputState == Enum.UserInputState.End) then
							signal:Disconnect()
							held[input] = false
							held[input.KeyCode] = false
						end
					end)
					local began = tick()
					while(held[input]) do
						local elapsed = tick() - began
						controller[input.KeyCode]()
						task.wait(math.clamp((0.5 - (elapsed / 8)),0.1,math.huge))
					end
				end
			end
		end
	end)

	box:GetPropertyChangedSignal("Text"):Connect(function()
		lastChange = tick()
	end)

	runService.Heartbeat:Connect(function()
		if(lastText == box.Text) then
			return
		end
		if(ignores[box]) then
			ignores[box] = nil
			lastText = box.Text
			return
		end
		if(tick() - lastChange > 0.5) or (tick() - lastSnap > 2) or (math.abs(#lastText - #box.Text) > 10) then
			lastSnap = tick()
			lastText = box.Text
			controller:snap()
		end
	end)

	controller:snap()
end
-- Author: @Jumpathy
-- Name: privacy.lua
-- Description: Make sure user privacy settings are kept in check

local privacy = {}
local players = game:GetService("Players")
local guiService = game:GetService("GuiService")
local runService = game:GetService("RunService")
local chatService = game:GetService("Chat")

privacy.isXbox = guiService:IsTenFootInterface()

local success,canClientChat = pcall(function()
	return chatService:CanUserChatAsync(players.LocalPlayer.UserId)
end)
local canChat = success and (runService:IsStudio() or canClientChat)
if(canChat == false) then
	privacy.chatDisabled = true
elseif(privacy.isXbox) then
	privacy.chatDisabled = true
end

return privacy
-- Author: @Jumpathy
-- Name: bubbleChat.lua
-- Description: Bubble chat bc yes

local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local playerGui = localPlayer.PlayerGui

local bubbleChat = {}
local billboard = require(script.Parent:WaitForChild("billboard"))

function bubbleChat.init(config,network,environment)
	billboard.init(config,network,environment)
	local newBillboard = function(player)
		billboard:holster(player)
	end
	players.PlayerAdded:Connect(newBillboard)
	for _,player in pairs(players:GetPlayers()) do
		task.spawn(newBillboard,player)
	end
	
	environment.billboard = billboard
end

return bubbleChat
-- Author: @Jumpathy
-- Name: ui.lua
-- Description: Making ui work :sunglo:

return {
	init = function(c)
		local config = c.Config
		local textService = game:GetService("TextService")
		local tweenService = game:GetService("TweenService")
		local runService = game:GetService("RunService")
		
		local padding = config.Padding
		local tweenInfo = TweenInfo.new(0.3,config.EasingStyle,Enum.EasingDirection.Out,0,true,0.3)
		local label = Instance.new("TextLabel")
		label.RichText = true
		
		local getTextContent = function(text)
			label.Text = text
			return label.ContentText
		end
		
		local getBounds = function(text,font)
			return textService:GetTextSize(getTextContent(text),config.TextSize,(font or config.BubbleFont),Vector2.new(250,math.huge))
		end
		
		local pad = function(x,y)
			x += padding * 2
			y += padding * 2
			return x,y
		end
		
		local create = function(text,parent,font)
			local bounds = getBounds(text,font)
			local bubble,edge,label,caret = Instance.new("Frame"),Instance.new("UICorner"),Instance.new("TextLabel"),Instance.new("ImageLabel")
			
			bubble.Name = "bubble"
			bubble.AnchorPoint = Vector2.new(0.5,1)
			bubble.BackgroundColor3 = config.BubbleBackgroundColor
			bubble.Position = UDim2.new(0.5,0,0.9,0)
			bubble.Size = UDim2.fromOffset(pad(bounds.X,bounds.Y))
			
			edge.CornerRadius = UDim.new(0,5)
			edge.Name = "edge"
			edge.Parent = bubble
			
			label.Name = "Label"
			label.Parent = bubble
			label.AnchorPoint = Vector2.new(0.5,0.5)
			label.BackgroundColor3 = Color3.fromRGB(0,0,0)
			label.BackgroundTransparency = 1
			label.Position = UDim2.new(0.5,0,0.5,0)
			label.Size = UDim2.new(1,0,1,0)
			label.Font = font or config.BubbleFont
			label.Text = text
			label.TextColor3 = config.BubbleTextColor
			label.TextSize = config.TextSize
			label.TextWrapped = true
			label.RichText = true
			
			caret.Name = "caret"
			caret.Parent = bubble
			caret.AnchorPoint = Vector2.new(0.5,0)
			caret.BackgroundTransparency = 1
			caret.Position = UDim2.new(0.5,0,0.99,0)
			caret.Size = UDim2.new(0,5,0,5)
			caret.Image = "rbxasset://textures/ui/InGameChat/Caret.png"
			caret.ImageColor3 = config.BubbleBackgroundColor
			if(parent) then
				bubble.Parent = parent
			end
			
			return bubble
		end
		
		local newDot = function(x)
			local dot = Instance.new("Frame")
			local corner = Instance.new("UICorner")
			
			dot.Size = UDim2.fromOffset(x/4,x/4)
			dot.BackgroundColor3 = config.TypingIndicatorColor
			dot.Name = "TypingDot"
			dot:SetAttribute("TypingIndicator",true)
			
			corner.Parent = dot
			corner.CornerRadius = UDim.new(1,0)
			
			return dot
		end
		
		local animateIndicator = function(dots)
			-- recursive tweening bc the inf loop has undesirable behavior for me (after like 5 minutes of tweening they all line up for some reason)
			local base = {}
			local goals = {}
			
			for key,dot in pairs(dots) do
				if(dot:GetFullName() ~= dot.Name) then
					base[dot] = base[dot] or dot.Position
					local newPos = base[dot] - UDim2.fromOffset(0,5)
					goals[dot] = {
						startAt = base[dot],
						endAt = newPos
					}
				end
			end
			
			local lerp = function(a, b, t)
				return a + (b - a) * t
			end
						
			local customTween = function(object,length,goal,transparency)
				for i = 1,15 do
					local newPos = object.Position:Lerp(goal,i/15)
					object.Position = newPos
					object.BackgroundTransparency = lerp(math.min(transparency,object.BackgroundTransparency),math.max(transparency,object.BackgroundTransparency),i/15)
					task.wait(length/15)
				end
			end
			
			task.spawn(function()
				local doEnd = false
				while(not doEnd) do
					for key,dot in pairs(dots) do
						if(dot:GetFullName() ~= dot.Name) then
							customTween(dot,0.2,goals[dot]["endAt"],0.6)
							task.spawn(customTween,dot,0.2,goals[dot]["startAt"],0)
						else
							doEnd = true
							break
						end
					end
				end
			end)
		end
		
		local typingIndicator = function(parent)
			local bubble = create("......",nil,Enum.Font.GothamMedium)
			local dots = {}
			
			local xSize = bubble.AbsoluteSize.X
			bubble.Size += UDim2.fromOffset(15,0)
			bubble.Label:Destroy()
			
			local container = Instance.new("Frame")
			container.Parent = bubble
			container.Size = UDim2.fromScale(1,0.5)
			container.Position = UDim2.fromScale(0.5,0.5)
			container.AnchorPoint = Vector2.new(0.5,0.5)
			container.BackgroundTransparency = 1
			
			local layout = Instance.new("UIListLayout")
			layout.Parent = container
			layout.Padding = UDim.new(0,5)
			layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			layout.VerticalAlignment = Enum.VerticalAlignment.Center
			layout.FillDirection = Enum.FillDirection.Horizontal
			
			for i = 1,3 do
				local dot = newDot(xSize)
				dot.Parent = container
				dot.Name = i
				dots[i] = dot
			end
			
			for _,dot in pairs(dots) do
				dot.AnchorPoint = Vector2.new(0,0.5)
				dot.Position = UDim2.new(0,dot.AbsolutePosition.X,0.5,0)
			end
			
			layout:Destroy()
			animateIndicator(dots)
			
			bubble.Parent = parent
			return bubble
		end
		
		local billboard = function(name,player)
			local billboard = Instance.new("BillboardGui")
			local container = Instance.new("Frame")
			
			billboard.Name = name
			billboard.Active = true
			billboard.MaxDistance = config.MaxDistance or 40
			billboard.Size = UDim2.new(20, 0, 20, 0)
			billboard.StudsOffset = Vector3.new(0, 9.5, 2)
			
			container.Name = "Container"
			container.Parent = billboard
			container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			container.BackgroundTransparency = 1.000
			container.Size = UDim2.new(1, 0, 1, 0)
			return billboard
		end
		
		return {
			bubble = {
				new = create
			},
			typingIndicator = {
				new = typingIndicator
			},
			billboard = {
				new = billboard
			}
		}
	end,
}
-- Author: @Jumpathy
-- Name: stack.lua
-- Description: Bubble chat 'stacks'

return function(environment)
	local stack = {}
	local tweenService = game:GetService("TweenService")

	local tween = function(object,properties,config)
		local isCustom = config.Custom
		local tweenInfo;
		if isCustom then
			tweenInfo = TweenInfo.new(0.1,config.EasingStyle,Enum.EasingDirection.Out)
		else
			tweenInfo = TweenInfo.new(0.1,(environment.bubbleChatAnimationStyle or environment.config.BubbleChat.Config.EasingStyle),Enum.EasingDirection.Out)
		end
		tweenService:Create(object,tweenInfo,properties):Play()
	end

	local fade = function(object,config)
		if(object:IsA("Frame")) then
			tween(object,{
				["BackgroundTransparency"] = 1
			},config)
		elseif(object:IsA("ImageLabel")) then
			tween(object,{
				["ImageTransparency"] = 1
			},config)
		elseif(object:IsA("TextLabel")) then
			tween(object,{
				["TextTransparency"] = 1
			},config)
		end
	end

	function stack.init(c)
		local configuration = c.Config
		local constructor = {}

		function constructor.new(gui,conf)
			local config = conf or configuration
			if conf then
				config.Custom = true
			end
			local stack = {
				queue = {}
			}

			function stack:update()
				local basePosition,yHeight = UDim2.fromScale(0.5,0.9),0
				for key,object in pairs(stack.queue) do
					environment.tweenPosition(object,basePosition - UDim2.fromOffset(0,yHeight),Enum.EasingDirection.Out,config.EasingStyle,config.Length,true)
					object.caret.Visible = (key == 1)
					yHeight += (object.AbsoluteSize.Y + 4)
				end
			end

			function stack:remove(ui,internal)
				local key = table.find(stack.queue,ui)
				if(key) then
					table.remove(stack.queue,key)
					local newQueue = {}
					for _,v in pairs(stack.queue) do
						table.insert(newQueue,v)
					end
					stack.queue = newQueue
					stack:update()
					if not internal then
						for guid,obj in pairs(environment.betterchatv3bubbles) do
							if(obj == ui) then
								environment.betterchatv3bubbles[guid] = nil
								environment.stacks[guid] = nil
							end
						end
					end
				end
			end

			function stack:fade(ui,len)
				for _,obj in pairs(ui:GetDescendants()) do
					fade(obj,config)
				end
				fade(ui,config)
				task.delay(len or 0.15,function()
					ui:Destroy()
				end)
			end

			function stack:push(ui,exception)
				table.insert(stack.queue,1,ui)
				stack:update()
				if(#stack.queue > config.MaxMessages) then
					while(#stack.queue > config.MaxMessages) do
						local gui = stack.queue[#stack.queue]
						stack:fade(gui)
						stack:remove(gui)
					end
				end
				if(not exception) then
					task.delay(config.FadeoutTime,function()
						if(ui:GetFullName() ~= ui.Name) then
							stack:fade(ui)
							stack:remove(ui)
						end
					end)
				end
			end

			function stack:Destroy()
				for _,obj in pairs(stack.queue) do
					obj:Destroy()
				end
				for k,v in pairs(stack) do
					stack[k] = nil
				end
				stack = nil
			end
			
			return stack
		end

		return constructor
	end

	return stack
end
-- Author: @Jumpathy
-- Name: billboard.lua
-- Description: Billboard gui for bubble chat lol
-- Small credits:
-- @McThor2 - [Math help](https://devforum.roblox.com/t/raycast-between-2-attachments/976915/8)
-- @sleitnick - [Raycasting help](https://devforum.roblox.com/t/detect-if-player-is-looking-at-object/1479746/5)

local billboard = {}
local useRaycastingToDetermineVisibility = true
local collectionService = game:GetService("CollectionService")
local connections = {}

local onDescendant = function(object,callback)
	for _,descendant in pairs(object:GetDescendants()) do
		task.spawn(callback,descendant)
	end
	return object.DescendantAdded:Connect(callback)
end

function billboard.init(config,network,environment)
	local httpService = game:GetService("HttpService")	
	config.Config.Offsets = config.Config.Offsets or {
		OtherPlayers = Vector3.new(0,10.5,0.1),
		LocalPlayer = Vector3.new(0,9.5,2)
	}
	
	local offsets = config.Config.Offsets 
	
	environment.holstered = {}
	local ui = require(script.Parent:WaitForChild("ui")).init(config)
	local stackModule = require(script.Parent:WaitForChild("stack"))(environment).init(config)
	local padding = config.Config.Padding
	local camera = workspace.CurrentCamera
	local billboardData = {}

	local players = game:GetService("Players")
	local localPlayer = players.LocalPlayer

	local containerGui = Instance.new("ScreenGui")
	containerGui.Name = "bubbleChat"
	containerGui.Parent = localPlayer.PlayerGui
	containerGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
	containerGui.ResetOnSpawn = false
	environment.bubbleChatContainer = containerGui

	local linkAlwaysOnTop = function(gui,adornee)
		local raycastParams = RaycastParams.new()
		raycastParams.IgnoreWater = true
		raycastParams.FilterType = Enum.RaycastFilterType.Exclude
		raycastParams.FilterDescendantsInstances = {adornee.Parent}
		billboardData[gui] = {
			adornee = adornee,
			params = raycastParams
		}
	end

	camera.Changed:Connect(function()
		pcall(function()
			for gui,billboard in pairs(billboardData) do
				if gui:GetFullName() == gui.Name then
					if environment.debugging then
						environment:debugLog("Billboard",billboard,"has ceased to exist")
					end
					billboardData[gui] = nil
				else
					if(billboard.adornee and not gui.Adornee) then
						gui.Adornee = billboard.adornee
					end
					local result = (billboard.adornee.Position - camera.CFrame.Position)
					if(result.magnitude < gui.MaxDistance) then
						local vector,inViewport = camera:WorldToViewportPoint(billboard.adornee.Position)
						local onScreen = inViewport and vector.Z > 0
						if(onScreen) then
							local raycastResult = workspace:Raycast(camera.CFrame.Position,result,billboard.params)
							gui.AlwaysOnTop = not raycastResult
						else
							gui.AlwaysOnTop = false
						end
					end
				end
			end
		end)
	end)

	function billboard:holster(player)
		local isLocalPlayer = (player == localPlayer)
		local connections = {}
		local linked = {}
		local typingIndicator,gui,stack,lastState = nil,nil,nil,nil
		local link = function(signal)
			table.insert(connections,signal)
		end
		
		link(player.Changed:Connect(function()
			if(player:GetFullName() == player.Name) then
				if environment.debugging then
					environment:debugLog(player,"has been completely removed")
				end
				for _,connection in pairs(connections) do
					connection:Disconnect()
				end
				connections = nil
				linked = nil
			end
		end))

		local onCharacter = function(character)
			gui = ui.billboard.new(tostring(player.UserId),player)
			gui.Parent = containerGui
			gui.Adornee = character:WaitForChild("Head")
			gui.StudsOffset = isLocalPlayer and offsets.LocalPlayer or offsets.OtherPlayers
			
			typingIndicator = ui.typingIndicator.new(gui.Container)
			typingIndicator.Visible = false
			stack = stackModule.new(gui)
			linked[character] = gui

			if(useRaycastingToDetermineVisibility) then
				linkAlwaysOnTop(gui,gui.Adornee)
			end

			local objs = {}

			local newColor = function(obj,propertyName)
				local bgColor = player:GetAttribute("BubbleBackgroundColor")
				local indicatorColor = player:GetAttribute("TypingIndicatorColor")
				local textColor = player:GetAttribute("BubbleTextColor")

				if(obj and obj:GetFullName() ~= obj.Name) then
					if obj:GetAttribute("TypingIndicator") then
						obj[propertyName] = indicatorColor
					else
						local success,hasText = pcall(function()
							return obj.Text
						end)
						if success then
							obj["TextColor3"] = textColor
						else
							obj[propertyName] = bgColor
						end
					end
				else 
					objs[obj] = nil
				end
			end

			connections[character] = connections[character] or {}

			table.insert(connections[character],onDescendant(gui,function(object)
				pcall(function()
					if object.BackgroundColor3 then
						objs[object] = "BackgroundColor3"
						if object.ImageColor3 and not object:GetAttribute("IsEmoji") then
							objs[object] = "ImageColor3"
						end
					end
				end)
				if objs[object] then
					newColor(object,objs[object])
				end
			end))

			local update = function()
				for obj,property in pairs(objs) do
					newColor(obj,property)
				end
			end

			table.insert(connections[character],player:GetAttributeChangedSignal("BubbleBackgroundColor"):Connect(update))
			table.insert(connections[character],player:GetAttributeChangedSignal("TypingIndicatorColor"):Connect(update))
			table.insert(connections[character],player:GetAttributeChangedSignal("BubbleTextColor"):Connect(update))
		end

		local onRemoving = function(character)
			if environment.debugging then
				environment:debugLog(player.Name,"is unloading their character, now disconnecting events")
			end
			if(linked[character]) then
				linked[character]:Destroy()
				linked[character] = nil
				stack:Destroy()
				lastState = nil
				if connections[character] then
					for _,connection in pairs(connections[character]) do
						connection:Disconnect()
					end
					connections[character] = nil
				end
			end
		end

		link(player.CharacterAdded:Connect(onCharacter))
		link(player.CharacterRemoving:Connect(onRemoving))
		if(player.Character) then
			task.spawn(onCharacter,player.Character)
		end

		if(config.Config.TypingIndicator) then
			link(network.onClientEvent("typingIndicator",function(p,state) 
				if(p == player and p.Character) then
					if(lastState ~= state) then
						lastState = state
						if(state and p:GetAttribute("TypingIndicatorEnabled")) then
							typingIndicator.Visible = true
							stack:push(typingIndicator,true)
						else
							typingIndicator.Visible = false
							stack:remove(typingIndicator)
						end
					end
				end 
			end))
		end

		environment.betterchatv3bubbles = {}
		environment.stacks = {}

		link(network.onClientEvent("editMessage",function(data)
			if(environment.betterchatv3bubbles[data.guid]) then
				local stack = environment.stacks[data.guid]
				if not stack then
					return
				end
				stack:remove(environment.betterchatv3bubbles[data.guid],true)
				stack:fade(environment.betterchatv3bubbles[data.guid],0)					
				if not data.deleted then
					local gui = linked[data.player.Character]					
					local text = data.message .. environment.editedStamp
					local guid = data.guid

					if data.customEmojis then
						local sample = ui.bubble.new(text,gui.Container)
						text = environment:processEmojis(sample.Label,data,text)
						sample:Destroy()
					end

					local bubble = ui.bubble.new(text,gui.Container)
					environment.betterchatv3bubbles[guid] = bubble
					stack:push(
						bubble,false,guid					
					)

					if(data.customEmojis) then	
						environment:attachCustomEmojis(bubble.Label,text,data.customEmojis,data.spacing,function(pos)
							pos += UDim2.fromOffset(padding,padding)
							return pos
						end)
					end
				end
			end
		end))

		link(network.onClientEvent("receiveMessage",function(data)
			if environment.debugging and data.is_singular then
				local msg = data.messages[1]
				if(msg.player == player) then
					environment:debugLog("received",msg.id,"from",msg.player,"transmitting now..")
				end
			end
			if(data.is_singular and data.messages[1].player == player and (environment.bubbleChatEnabled) and player.Character) then
				data.messages[1] = environment.processData(data.messages[1],"bubbleChat")
				local markdownEnabled = data.messages[1]["markdownEnabled"]
				local data = data.messages[1]
				local msg = data["message"]
				if(not environment.mutelist[player.UserId]) then
					local text = markdownEnabled and environment.richText:markdown(msg) or environment.richText:escape(msg)
					if environment.debugging then
						environment:debugLog(data.id,"has",text,"as contents")
					end
					if(data.customEmojis) then
						local sample = ui.bubble.new(text,gui.Container)
						text = environment:processEmojis(sample.Label,data,msg)
						sample:Destroy()
					end
					local bubble = ui.bubble.new(text,gui.Container)
					environment.betterchatv3bubbles[data.guid] = bubble
					environment.stacks[data.guid] = stack
					if environment.debugging then
						environment:debugLog(data.id,"is being pushed to the stack")
					end
					stack:push(
						bubble,false,data["guid"]						
					)
					if(data.customEmojis) then
						environment:attachCustomEmojis(bubble.Label,msg,data.customEmojis,data.spacing,function(pos)
							pos += UDim2.fromOffset(padding,padding)
							return pos
						end)
					end
				end
			end
		end))

		environment.holstered[player] = {
			setTypingIndicatorVisible = function(self,state)
				typingIndicator.Visible = state
				if(lastState ~= state) then
					lastState = state
					if(state) then
						stack:push(typingIndicator,true)
					else
						stack:remove(typingIndicator)
					end
				end
			end,
			createMessage = function(self,text)
				local revisible = false
				if lastState then
					revisible = true
					environment.holstered[player]:setTypingIndicatorVisible(false)
				end
				local guid = httpService:GenerateGUID()
				local bubble = ui.bubble.new(text,gui.Container)
				environment.betterchatv3bubbles[guid] = bubble
				environment.stacks[guid] = stack
				stack:push(
					bubble,false,guid					
				)
				if revisible then
					environment.holstered[player]:setTypingIndicatorVisible(true)
				end
			end,
			getUi = function()
				return ui
			end,
		}
	end

	function billboard:create(part,adornee,options)
		options = options or {}
		local gui = ui.billboard.new(httpService:GenerateGUID())
		gui.Parent = containerGui
		gui.Adornee = adornee or part
		gui.StudsOffset = Vector3.new(0,10.5,0.1)

		local typingIndicator = ui.typingIndicator.new(gui.Container)
		typingIndicator.Visible = false

		if(useRaycastingToDetermineVisibility) then
			linkAlwaysOnTop(gui,gui.Adornee)
		end

		local objs = {}

		local bubbleBackgroundColor = config.Config.BubbleBackgroundColor
		local typingIndicatorColor = config.Config.TypingIndicatorColor
		local bubbleTextColor = config.Config.BubbleTextColor

		local newColor = function(obj,propertyName)
			local bgColor = bubbleBackgroundColor
			local indicatorColor = typingIndicatorColor
			local textColor = bubbleTextColor

			if(obj and obj:GetFullName() ~= obj.Name) then
				if obj:GetAttribute("TypingIndicator") then
					obj[propertyName] = indicatorColor
				else
					local success,hasText = pcall(function()
						return obj.Text
					end)
					if success then
						obj["TextColor3"] = textColor
					else
						obj[propertyName] = bgColor
					end
				end
			else 
				objs[obj] = nil
			end
		end

		onDescendant(gui,function(object)
			pcall(function()
				if object.BackgroundColor3 then
					objs[object] = "BackgroundColor3"
					if object.ImageColor3 and not object:GetAttribute("IsEmoji") then
						objs[object] = "ImageColor3"
					end
				end
			end)
			if objs[object] then
				newColor(object,objs[object])
			end
		end)

		local update = function()
			for obj,property in pairs(objs) do
				newColor(obj,property)
			end
		end

		local stack = stackModule.new(gui,{
			FadeoutTime = options.FadeoutTime or config.Config.FadeoutTime,
			MaxMessages = options.MaxMessages or config.Config.MaxMessages,
			EasingStyle = options.EasingStyle or config.Config.EasingStyle,
			Length = options.Length or config.Config.Length
		})

		local lastState = false

		return {
			createMessage = function(self,text)
				local revisible = false
				if lastState then
					revisible = true
					self:setTypingIndicatorVisible(false)
				end
				local guid = httpService:GenerateGUID()
				local bubble = ui.bubble.new(text,gui.Container)
				environment.betterchatv3bubbles[guid] = bubble
				environment.stacks[guid] = stack
				stack:push(
					bubble,false,guid					
				)
				if revisible then
					self:setTypingIndicatorVisible(true)
				end
				return {
					Destroy = function()
						stack:fade(bubble)
						stack:remove(bubble)
					end
				}
			end,
			setColors = function(self,colors)
				bubbleBackgroundColor = colors.BubbleBackgroundColor or bubbleBackgroundColor
				typingIndicatorColor = colors.TypingIndicatorColor or typingIndicatorColor
				bubbleTextColor = colors.BubbleTextColor or bubbleTextColor
				update()
			end,
			setTypingIndicatorVisible = function(self,state)
				typingIndicator.Visible = state
				if(lastState ~= state) then
					lastState = state
					if(state) then
						stack:push(typingIndicator,true)
					else
						stack:remove(typingIndicator)
					end
				end
			end,
			getUi = function()
				return gui
			end,
		}
	end
end

return billboard
