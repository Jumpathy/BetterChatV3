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
-- Name: profile.lua
-- Description: User profiles using ProfileService (used for group chat saves and stuff like that)
-- Credit: @loleris - ProfileService (https://devforum.roblox.com/t/save-your-player-data-with-profileservice-datastore-module/667805)

local module = function()
	-- local Madwork = _G.Madwork
--[[
{Madwork}

-[ProfileService]---------------------------------------
	(STANDALONE VERSION)
	DataStore profiles - universal session-locked savable table API
	
	Official documentation:
		https://madstudioroblox.github.io/ProfileService/

	DevForum discussion:
		https://devforum.roblox.com/t/ProfileService/667805
	
	WARNINGS FOR "Profile.Data" VALUES:
	 	! Do not create numeric tables with gaps - attempting to replicate such tables will result in an error;
		! Do not create mixed tables (some values indexed by number and others by string key), as only
		     the data indexed by number will be replicated.
		! Do not index tables by anything other than numbers and strings.
		! Do not reference Roblox Instances
		! Do not reference userdata (Vector3, Color3, CFrame...) - Serialize userdata before referencing
		! Do not reference functions
		
	WARNING: Calling ProfileStore:LoadProfileAsync() with a "profile_key" which wasn't released in the SAME SESSION will result
		in an error! If you want to "ProfileStore:LoadProfileAsync()" instead of using the already loaded profile, :Release()
		the old Profile object.
		
	Members:
	
		ProfileService.ServiceLocked         [bool]
		
		ProfileService.IssueSignal           [ScriptSignal] (error_message, profile_store_name, profile_key)
		ProfileService.CorruptionSignal      [ScriptSignal] (profile_store_name, profile_key)
		ProfileService.CriticalStateSignal   [ScriptSignal] (is_critical_state)
	
	Functions:
	
		ProfileService.GetProfileStore(profile_store_index, profile_template) --> [ProfileStore]
			profile_store_index   [string] -- DataStore name
			OR
			profile_store_index   [table]: -- Allows the developer to define more GlobalDataStore variables
				{
					Name = "StoreName", -- [string] -- DataStore name
					-- Optional arguments:
					Scope = "StoreScope", -- [string] -- DataStore scope
				}
			profile_template      [table] -- Profiles will default to given table (hard-copy) when no data was saved previously

		ProfileService.IsLive() --> [bool] -- (CAN YIELD!!!)
			-- Returns true if ProfileService is connected to live Roblox DataStores
				
	Members [ProfileStore]:
	
		ProfileStore.Mock   [ProfileStore] -- Reflection of ProfileStore methods, but the methods will use a mock DataStore
		
	Methods [ProfileStore]:
	
		ProfileStore:LoadProfileAsync(profile_key, not_released_handler) --> [Profile] or nil -- not_released_handler(place_id, game_job_id)
			profile_key            [string] -- DataStore key
			not_released_handler   nil or []: -- Defaults to "ForceLoad"
				[string] "ForceLoad" -- Force loads profile on first call
				OR
				[string] "Steal" -- Steals the profile ignoring it's session lock
				OR
				[function] (place_id, game_job_id) --> [string] "Repeat", "Cancel", "ForceLoad" or "Steal"
					place_id      [number] or nil
					game_job_id   [string] or nil

				-- not_released_handler [function] will be triggered in cases where the profile is not released by a session. This
				--	function may yield for as long as desirable and must return one of three string values:

						["Repeat"] - ProfileService will repeat the profile loading proccess and may trigger the release handler again
						["Cancel"] - ProfileStore:LoadProfileAsync() will immediately return nil
						["ForceLoad"] - ProfileService will repeat the profile loading call, but will return Profile object afterwards
							and release the profile for another session that has loaded the profile
						["Steal"] - The profile will usually be loaded immediately, ignoring an existing remote session lock and applying
							a session lock for this session.

		ProfileStore:GlobalUpdateProfileAsync(profile_key, update_handler) --> [GlobalUpdates] or nil
			-- Returns GlobalUpdates object if update was successful, otherwise returns nil
			profile_key      [string] -- DataStore key
			update_handler   [function] (global_updates [GlobalUpdates])
			
		ProfileStore:ViewProfileAsync(profile_key, version) --> [Profile] or nil
			-- Reads profile without requesting a session lock; Data will not be saved and profile doesn't need to be released
			profile_key   [string] -- DataStore key
			version       nil or [string] -- DataStore key version

		ProfileStore:ProfileVersionQuery(profile_key, sort_direction, min_date, max_date) --> [ProfileVersionQuery]
			profile_key      [string]
			sort_direction   nil or [Enum.SortDirection]
			min_date         nil or [DateTime]
			max_date         nil or [DateTime]
			
		ProfileStore:WipeProfileAsync(profile_key) --> is_wipe_successful [bool]
			-- Completely wipes out profile data from the DataStore / mock DataStore with no way to recover it.
						
		* Parameter description for "ProfileStore:GlobalUpdateProfileAsync()":
		
			profile_key      [string] -- DataStore key
			update_handler   [function] (GlobalUpdates) -- This function gains access to GlobalUpdates object methods
				(update_handler can't yield)

	Methods [ProfileVersionQuery]:

		ProfileVersionQuery:NextAsync() --> [Profile] or nil -- (Yields)
			-- Returned profile has the same rules as profile returned by :ViewProfileAsync()
		
	Members [Profile]:
	
		Profile.Data              [table] -- Writable table that gets saved automatically and once the profile is released
		Profile.MetaData          [table] (Read-only) -- Information about this profile
		
			Profile.MetaData.ProfileCreateTime   [number] (Read-only) -- os.time() timestamp of profile creation
			Profile.MetaData.SessionLoadCount    [number] (Read-only) -- Amount of times the profile was loaded
			Profile.MetaData.ActiveSession       [table] (Read-only) {place_id, game_job_id} / nil -- Set to a session link if a
				game session is currently having this profile loaded; nil if released
			Profile.MetaData.MetaTags            [table] {["tag_name"] = tag_value, ...} -- Saved and auto-saved just like Profile.Data
			Profile.MetaData.MetaTagsLatest      [table] (Read-only) -- Latest version of MetaData.MetaTags that was definetly saved to DataStore
				(You can use Profile.MetaData.MetaTagsLatest for product purchase save confirmation, but create a system to clear old tags after
				they pile up)

		Profile.MetaTagsUpdated   [ScriptSignal] (meta_tags_latest) -- Fires after every auto-save, after
			--	Profile.MetaData.MetaTagsLatest has been updated with the version that's guaranteed to be saved;
			--  .MetaTagsUpdated will fire regardless of whether .MetaTagsLatest changed after update;
			--	.MetaTagsUpdated may fire after the Profile is released - changes to Profile.Data are not saved
			--	after release.

		Profile.RobloxMetaData    [table] -- Writable table that gets saved automatically and once the profile is released
		Profile.UserIds           [table] -- (Read-only) -- {user_id [number], ...} -- User ids associated with this profile

		Profile.KeyInfo           [DataStoreKeyInfo]
		Profile.KeyInfoUpdated    [ScriptSignal] (key_info [DataStoreKeyInfo])
		
		Profile.GlobalUpdates     [GlobalUpdates]
		
	Methods [Profile]:
	
		-- SAFE METHODS - Will not error after profile expires:
		Profile:IsActive() --> [bool] -- Returns true while the profile is active and can be written to
			
		Profile:GetMetaTag(tag_name) --> value [any]
			tag_name   [string]
		
		Profile:Reconcile() -- Fills in missing (nil) [string_key] = [value] pairs to the Profile.Data structure
		
		Profile:ListenToRelease(listener) --> [ScriptConnection] (place_id / nil, game_job_id / nil)
			-- WARNING: Profiles can be released externally if another session force-loads
			--	this profile - use :ListenToRelease() to handle player leaving cleanup.
			
		Profile:Release() -- Call after the session has finished working with this profile
			e.g., after the player leaves (Profile object will become expired) (Does not yield)

		Profile:ListenToHopReady(listener) --> [ScriptConnection] () -- Passed listener will be executed after the releasing UpdateAsync call finishes;
			--	Wrap universe teleport requests with this method AFTER releasing the profile to improve session lock sharing between universe places;
			--  :ListenToHopReady() will usually call the listener in around a second, but may ocassionally take up to 7 seconds when a release happens
			--	next to an auto-update in regular usage scenarios.

		Profile:AddUserId(user_id) -- Associates user_id with profile (GDPR compliance)
			user_id   [number]

		Profile:RemoveUserId(user_id) -- Unassociates user_id with profile (safe function)
			user_id   [number]

		Profile:Identify() --> [string] -- Returns a string containing DataStore name, scope and key; Used for debug;
			-- Example return: "[Store:"GameData";Scope:"Live";Key:"Player_2312310"]"
		
		Profile:SetMetaTag(tag_name, value) -- Equivalent of Profile.MetaData.MetaTags[tag_name] = value
			tag_name   [string]
			value      [any]
		
		Profile:Save() -- Call to quickly progress global update state or to speed up save validation processes (Does not yield)

		-- VIEW-MODE ONLY:

		Profile:ClearGlobalUpdates() -- Clears all global updates data from a profile payload

		Profile:OverwriteAsync() -- (Yields) Saves the profile payload to the DataStore and removes the session lock
		
	Methods [GlobalUpdates]:
	
	-- ALWAYS PUBLIC:
		GlobalUpdates:GetActiveUpdates() --> [table] {{update_id, update_data [table]}, ...}
		GlobalUpdates:GetLockedUpdates() --> [table] {{update_id, update_data [table]}, ...}
		
	-- ONLY WHEN FROM "Profile.GlobalUpdates":
		GlobalUpdates:ListenToNewActiveUpdate(listener) --> [ScriptConnection] (update_id, update_data)
			update_data   [table]
		GlobalUpdates:ListenToNewLockedUpdate(listener) --> [ScriptConnection] (update_id, update_data)
			update_data   [table]
		GlobalUpdates:LockActiveUpdate(update_id)  -- WARNING: will error after profile expires
		GlobalUpdates:ClearLockedUpdate(update_id) -- WARNING: will error after profile expires
		
	-- EXPOSED TO "update_handler" DURING ProfileStore:GlobalUpdateProfileAsync() CALL
		GlobalUpdates:AddActiveUpdate(update_data)
			update_data   [table]
		GlobalUpdates:ChangeActiveUpdate(update_id, update_data)
			update_data   [table]
		GlobalUpdates:ClearActiveUpdate(update_id)
		
--]]

	local SETTINGS = {

		AutoSaveProfiles = 30, -- Seconds (This value may vary - ProfileService will split the auto save load evenly in the given time)
		RobloxWriteCooldown = 7, -- Seconds between successive DataStore calls for the same key
		ForceLoadMaxSteps = 8, -- Steps taken before ForceLoad request steals the active session for a profile
		AssumeDeadSessionLock = 30 * 60, -- (seconds) If a profile hasn't been updated for 30 minutes, assume the session lock is dead
		-- As of writing, os.time() is not completely reliable, so we can only assume session locks are dead after a significant amount of time.

		IssueCountForCriticalState = 5, -- Issues to collect to announce critical state
		IssueLast = 120, -- Seconds
		CriticalStateLast = 120, -- Seconds

		MetaTagsUpdatedValues = { -- Technical stuff - do not alter
			ProfileCreateTime = true,
			SessionLoadCount = true,
			ActiveSession = true,
			ForceLoadSession = true,
			LastUpdate = true,
		},

	}

	local Madwork -- Standalone Madwork reference for portable version of ProfileService
	do

		local MadworkScriptSignal = {}

		local FreeRunnerThread = nil

		local function AcquireRunnerThreadAndCallEventHandler(fn, ...)
			local acquired_runner_thread = FreeRunnerThread
			FreeRunnerThread = nil
			fn(...)
			FreeRunnerThread = acquired_runner_thread
		end

		local function RunEventHandlerInFreeThread(...)
			AcquireRunnerThreadAndCallEventHandler(...)
			while true do
				AcquireRunnerThreadAndCallEventHandler(coroutine.yield())
			end
		end

		-- ScriptConnection object:

		local ScriptConnection = {
		--[[
			_listener = listener,
			_script_signal = script_signal,
			_disconnect_listener = disconnect_listener,
			_disconnect_param = disconnect_param,
			
			_next = next_script_connection,
			_is_connected = is_connected,
		--]]
		}
		ScriptConnection.__index = ScriptConnection

		function ScriptConnection:Disconnect()

			if self._is_connected == false then
				return
			end

			self._is_connected = false
			self._script_signal._listener_count -= 1

			if self._script_signal._head == self then
				self._script_signal._head = self._next
			else
				local prev = self._script_signal._head
				while prev ~= nil and prev._next ~= self do
					prev = prev._next
				end
				if prev ~= nil then
					prev._next = self._next
				end
			end

			if self._disconnect_listener ~= nil then
				if not FreeRunnerThread then
					FreeRunnerThread = coroutine.create(RunEventHandlerInFreeThread)
				end
				task.spawn(FreeRunnerThread, self._disconnect_listener, self._disconnect_param)
				self._disconnect_listener = nil
			end

		end

		-- ScriptSignal object:

		local ScriptSignal = {
		--[[
			_head = nil,
			_listener_count = 0,
		--]]
		}
		ScriptSignal.__index = ScriptSignal

		function ScriptSignal:Connect(listener, disconnect_listener, disconnect_param) --> [ScriptConnection]

			local script_connection = {
				_listener = listener,
				_script_signal = self,
				_disconnect_listener = disconnect_listener,
				_disconnect_param = disconnect_param,

				_next = self._head,
				_is_connected = true,
			}
			setmetatable(script_connection, ScriptConnection)

			self._head = script_connection
			self._listener_count += 1

			return script_connection

		end

		function ScriptSignal:GetListenerCount() --> [number]
			return self._listener_count
		end

		function ScriptSignal:Fire(...)
			local item = self._head
			while item ~= nil do
				if item._is_connected == true then
					if not FreeRunnerThread then
						FreeRunnerThread = coroutine.create(RunEventHandlerInFreeThread)
					end
					task.spawn(FreeRunnerThread, item._listener, ...)
				end
				item = item._next
			end
		end

		function ScriptSignal:FireUntil(continue_callback, ...)
			local item = self._head
			while item ~= nil do
				if item._is_connected == true then
					item._listener(...)
					if continue_callback() ~= true then
						return
					end
				end
				item = item._next
			end
		end

		function MadworkScriptSignal.NewScriptSignal() --> [ScriptSignal]
			return {
				_head = nil,
				_listener_count = 0,
				Connect = ScriptSignal.Connect,
				GetListenerCount = ScriptSignal.GetListenerCount,
				Fire = ScriptSignal.Fire,
				FireUntil = ScriptSignal.FireUntil,
			}
		end

		-- Madwork framework namespace:

		Madwork = {
			NewScriptSignal = MadworkScriptSignal.NewScriptSignal,
			ConnectToOnClose = function(task, run_in_studio_mode)
				if game:GetService("RunService"):IsStudio() == false or run_in_studio_mode == true then
					game:BindToClose(task)
				end
			end,
		}

	end

	----- Service Table -----

	local ProfileService = {

		ServiceLocked = false, -- Set to true once the server is shutting down

		IssueSignal = Madwork.NewScriptSignal(), -- (error_message, profile_store_name, profile_key) -- Fired when a DataStore API call throws an error
		CorruptionSignal = Madwork.NewScriptSignal(), -- (profile_store_name, profile_key) -- Fired when DataStore key returns a value that has
		-- all or some of it's profile components set to invalid data types. E.g., accidentally setting Profile.Data to a noon table value

		CriticalState = false, -- Set to true while DataStore service is throwing too many errors
		CriticalStateSignal = Madwork.NewScriptSignal(), -- (is_critical_state) -- Fired when CriticalState is set to true
		-- (You may alert players with this, or set up analytics)

		ServiceIssueCount = 0,

		_active_profile_stores = {}, -- {profile_store, ...}

		_auto_save_list = {}, -- {profile, ...} -- loaded profile table which will be circularly auto-saved

		_issue_queue = {}, -- [table] {issue_time, ...}
		_critical_state_start = 0, -- [number] 0 = no critical state / os.clock() = critical state start

		-- Debug:
		_mock_data_store = {},
		_user_mock_data_store = {},

		_use_mock_data_store = false,

	}

--[[
	Saved profile structure:
	
	DataStoreProfile = {
		Data = {},
		MetaData = {
			ProfileCreateTime = 0,
			SessionLoadCount = 0,
			ActiveSession = {place_id, game_job_id} / nil,
			ForceLoadSession = {place_id, game_job_id} / nil,
			MetaTags = {},
			LastUpdate = 0, -- os.time()
		},
		RobloxMetaData = {},
		UserIds = {},
		GlobalUpdates = {
			update_index,
			{
				{update_id, version_id, update_locked, update_data},
				...
			}
		},
	}
	
	OR
	
	DataStoreProfile = {
		GlobalUpdates = {
			update_index,
			{
				{update_id, version_id, update_locked, update_data},
				...
			}
		},
	}
--]]

	----- Private Variables -----

	local ActiveProfileStores = ProfileService._active_profile_stores
	local AutoSaveList = ProfileService._auto_save_list
	local IssueQueue = ProfileService._issue_queue

	local DataStoreService = game:GetService("DataStoreService")
	local RunService = game:GetService("RunService")

	local PlaceId = game.PlaceId
	local JobId = game.JobId

	local AutoSaveIndex = 1 -- Next profile to auto save
	local LastAutoSave = os.clock()

	local LoadIndex = 0

	local ActiveProfileLoadJobs = 0 -- Number of active threads that are loading in profiles
	local ActiveProfileSaveJobs = 0 -- Number of active threads that are saving profiles

	local CriticalStateStart = 0 -- os.clock()

	local IsStudio = RunService:IsStudio()
	local IsLiveCheckActive = false

	local UseMockDataStore = false
	local MockDataStore = ProfileService._mock_data_store -- Mock data store used when API access is disabled

	local UserMockDataStore = ProfileService._user_mock_data_store -- Separate mock data store accessed via ProfileStore.Mock
	local UseMockTag = {}

	local CustomWriteQueue = {
	--[[
		[store] = {
			[key] = {
				LastWrite = os.clock(),
				Queue = {callback, ...},
				CleanupJob = nil,
			},
			...
		},
		...
	--]]
	}

	----- Utils -----

	local function DeepCopyTable(t)
		local copy = {}
		for key, value in pairs(t) do
			if type(value) == "table" then
				copy[key] = DeepCopyTable(value)
			else
				copy[key] = value
			end
		end
		return copy
	end

	local function ReconcileTable(target, template)
		for k, v in pairs(template) do
			if type(k) == "string" then -- Only string keys will be reconciled
				if target[k] == nil then
					if type(v) == "table" then
						target[k] = DeepCopyTable(v)
					else
						target[k] = v
					end
				elseif type(target[k]) == "table" and type(v) == "table" then
					ReconcileTable(target[k], v)
				end
			end
		end
	end

	----- Private functions -----

	local function IdentifyProfile(store_name, store_scope, key)
		return string.format(
			"[Store:\"%s\";%sKey:\"%s\"]",
			store_name,
			store_scope ~= nil and string.format("Scope:\"%s\";", store_scope) or "",
			key
		)
	end

	local function CustomWriteQueueCleanup(store, key)
		if CustomWriteQueue[store] ~= nil then
			CustomWriteQueue[store][key] = nil
			if next(CustomWriteQueue[store]) == nil then
				CustomWriteQueue[store] = nil
			end
		end
	end

	local function CustomWriteQueueMarkForCleanup(store, key)
		if CustomWriteQueue[store] ~= nil then
			if CustomWriteQueue[store][key] ~= nil then

				local queue_data = CustomWriteQueue[store][key]
				local queue = queue_data.Queue

				if queue_data.CleanupJob == nil then

					queue_data.CleanupJob = RunService.Heartbeat:Connect(function()
						if os.clock() - queue_data.LastWrite > SETTINGS.RobloxWriteCooldown and #queue == 0 then
							queue_data.CleanupJob:Disconnect()
							CustomWriteQueueCleanup(store, key)
						end
					end)

				end

			elseif next(CustomWriteQueue[store]) == nil then
				CustomWriteQueue[store] = nil
			end
		end
	end

	local function CustomWriteQueueAsync(callback, store, key) --> ... -- Passed return from callback

		if CustomWriteQueue[store] == nil then
			CustomWriteQueue[store] = {}
		end
		if CustomWriteQueue[store][key] == nil then
			CustomWriteQueue[store][key] = {LastWrite = 0, Queue = {}, CleanupJob = nil}
		end

		local queue_data = CustomWriteQueue[store][key]
		local queue = queue_data.Queue

		-- Cleanup job:

		if queue_data.CleanupJob ~= nil then
			queue_data.CleanupJob:Disconnect()
			queue_data.CleanupJob = nil
		end

		-- Queue logic:

		if os.clock() - queue_data.LastWrite > SETTINGS.RobloxWriteCooldown and #queue == 0 then
			queue_data.LastWrite = os.clock()
			return callback()
		else
			table.insert(queue, callback)
			while true do
				if os.clock() - queue_data.LastWrite > SETTINGS.RobloxWriteCooldown and queue[1] == callback then
					table.remove(queue, 1)
					queue_data.LastWrite = os.clock()
					return callback()
				end
				task.wait()
			end
		end

	end

	local function IsCustomWriteQueueEmptyFor(store, key) --> is_empty [bool]
		local lookup = CustomWriteQueue[store]
		if lookup ~= nil then
			lookup = lookup[key]
			return lookup == nil or #lookup.Queue == 0
		end
		return true
	end

	local function WaitForLiveAccessCheck() -- This function was created to prevent the ProfileService module yielding execution when required
		while IsLiveCheckActive == true do
			task.wait()
		end
	end

	local function WaitForPendingProfileStore(profile_store)
		while profile_store._is_pending == true do
			task.wait()
		end
	end

	local function RegisterIssue(error_message, store_name, store_scope, profile_key) -- Called when a DataStore API call errors
		warn("[ProfileService]: DataStore API error " .. IdentifyProfile(store_name, store_scope, profile_key) .. " - \"" .. tostring(error_message) .. "\"")
		table.insert(IssueQueue, os.clock()) -- Adding issue time to queue
		ProfileService.IssueSignal:Fire(tostring(error_message), store_name, profile_key)
	end

	local function RegisterCorruption(store_name, store_scope, profile_key) -- Called when a corrupted profile is loaded
		warn("[ProfileService]: Resolved profile corruption " .. IdentifyProfile(store_name, store_scope, profile_key))
		ProfileService.CorruptionSignal:Fire(store_name, profile_key)
	end

	local function NewMockDataStoreKeyInfo(params)

		local version_id_string = tostring(params.VersionId or 0)
		local meta_data = params.MetaData or {}
		local user_ids = params.UserIds or {}

		return {
			CreatedTime = params.CreatedTime,
			UpdatedTime = params.UpdatedTime,
			Version = string.rep("0", 16) .. "."
				.. string.rep("0", 10 - string.len(version_id_string)) .. version_id_string
				.. "." .. string.rep("0", 16) .. "." .. "01",

			GetMetadata = function()
				return DeepCopyTable(meta_data)
			end,

			GetUserIds = function()
				return DeepCopyTable(user_ids)
			end,
		}

	end

	local function MockUpdateAsync(mock_data_store, profile_store_name, key, transform_function, is_get_call) --> loaded_data, key_info

		local profile_store = mock_data_store[profile_store_name]

		if profile_store == nil then
			profile_store = {}
			mock_data_store[profile_store_name] = profile_store
		end

		local epoch_time = math.floor(os.time() * 1000)
		local mock_entry = profile_store[key]
		local mock_entry_was_nil = false

		if mock_entry == nil then
			mock_entry_was_nil = true
			if is_get_call ~= true then
				mock_entry = {
					Data = nil,
					CreatedTime = epoch_time,
					UpdatedTime = epoch_time,
					VersionId = 0,
					UserIds = {},
					MetaData = {},
				}
				profile_store[key] = mock_entry
			end
		end

		local mock_key_info = mock_entry_was_nil == false and NewMockDataStoreKeyInfo(mock_entry) or nil

		local transform, user_ids, roblox_meta_data = transform_function(mock_entry and mock_entry.Data, mock_key_info)

		if transform == nil then
			return nil
		else
			if mock_entry ~= nil and is_get_call ~= true then
				mock_entry.Data = transform
				mock_entry.UserIds = DeepCopyTable(user_ids or {})
				mock_entry.MetaData = DeepCopyTable(roblox_meta_data or {})
				mock_entry.VersionId += 1
				mock_entry.UpdatedTime = epoch_time
			end

			return DeepCopyTable(transform), mock_entry ~= nil and NewMockDataStoreKeyInfo(mock_entry) or nil
		end

	end

	local function IsThisSession(session_tag)
		return session_tag[1] == PlaceId and session_tag[2] == JobId
	end

--[[
update_settings = {
	ExistingProfileHandle = function(latest_data),
	MissingProfileHandle = function(latest_data),
	EditProfile = function(lastest_data),
}
--]]
	local function StandardProfileUpdateAsyncDataStore(profile_store, profile_key, update_settings, is_user_mock, is_get_call, version) --> loaded_data, key_info
		local loaded_data, key_info
		local success, error_message = pcall(function()
			local transform_function = function(latest_data)

				local missing_profile = false
				local data_corrupted = false
				local global_updates_data = {0, {}}

				if latest_data == nil then
					missing_profile = true
				elseif type(latest_data) ~= "table" then
					missing_profile = true
					data_corrupted = true
				end

				if type(latest_data) == "table" then
					-- Case #1: Profile was loaded
					if type(latest_data.Data) == "table"
						and type(latest_data.MetaData) == "table"
						and type(latest_data.GlobalUpdates) == "table" then

						latest_data.WasCorrupted = false -- Must be set to false if set previously
						global_updates_data = latest_data.GlobalUpdates
						if update_settings.ExistingProfileHandle ~= nil then
							update_settings.ExistingProfileHandle(latest_data)
						end
						-- Case #2: Profile was not loaded but GlobalUpdate data exists
					elseif latest_data.Data == nil
						and latest_data.MetaData == nil
						and type(latest_data.GlobalUpdates) == "table" then

						latest_data.WasCorrupted = false -- Must be set to false if set previously
						global_updates_data = latest_data.GlobalUpdates or global_updates_data
						missing_profile = true
					else
						missing_profile = true
						data_corrupted = true
					end
				end

				-- Case #3: Profile was not created or corrupted and no GlobalUpdate data exists
				if missing_profile == true then
					latest_data = {
						-- Data = nil,
						-- MetaData = nil,
						GlobalUpdates = global_updates_data,
					}
					if update_settings.MissingProfileHandle ~= nil then
						update_settings.MissingProfileHandle(latest_data)
					end
				end

				-- Editing profile:
				if update_settings.EditProfile ~= nil then
					update_settings.EditProfile(latest_data)
				end

				-- Data corruption handling (Silently override with empty profile) (Also run Case #1)
				if data_corrupted == true then
					latest_data.WasCorrupted = true -- Temporary tag that will be removed on first save
				end

				return latest_data, latest_data.UserIds, latest_data.RobloxMetaData
			end
			if is_user_mock == true then -- Used when the profile is accessed through ProfileStore.Mock
				loaded_data, key_info = MockUpdateAsync(UserMockDataStore, profile_store._profile_store_lookup, profile_key, transform_function, is_get_call)
				task.wait() -- Simulate API call yield
			elseif UseMockDataStore == true then -- Used when API access is disabled
				loaded_data, key_info = MockUpdateAsync(MockDataStore, profile_store._profile_store_lookup, profile_key, transform_function, is_get_call)
				task.wait() -- Simulate API call yield
			else
				loaded_data, key_info = CustomWriteQueueAsync(
					function() -- Callback
						if is_get_call == true then
							local get_data, get_key_info
							if version ~= nil then
								local success, error_message = pcall(function()
									get_data, get_key_info = profile_store._global_data_store:GetVersionAsync(profile_key, version)
								end)
								if success == false and type(error_message) == "string" and string.find(error_message, "not valid") ~= nil then
									warn("[ProfileService]: Passed version argument is not valid; Traceback:\n" .. debug.traceback())
								end
							else
								get_data, get_key_info = profile_store._global_data_store:GetAsync(profile_key)
							end
							get_data = transform_function(get_data)
							return get_data, get_key_info
						else
							return profile_store._global_data_store:UpdateAsync(profile_key, transform_function)
						end
					end,
					profile_store._profile_store_lookup, -- Store
					profile_key -- Key
				)
			end
		end)
		if success == true and type(loaded_data) == "table" then
			-- Corruption handling:
			if loaded_data.WasCorrupted == true and is_get_call ~= true then
				RegisterCorruption(
					profile_store._profile_store_name,
					profile_store._profile_store_scope,
					profile_key
				)
			end
			-- Return loaded_data:
			return loaded_data, key_info
		else
			RegisterIssue(
				(error_message ~= nil) and error_message or "Undefined error",
				profile_store._profile_store_name,
				profile_store._profile_store_scope,
				profile_key
			)
			-- Return nothing:
			return nil
		end
	end

	local function RemoveProfileFromAutoSave(profile)
		local auto_save_index = table.find(AutoSaveList, profile)
		if auto_save_index ~= nil then
			table.remove(AutoSaveList, auto_save_index)
			if auto_save_index < AutoSaveIndex then
				AutoSaveIndex = AutoSaveIndex - 1 -- Table contents were moved left before AutoSaveIndex so move AutoSaveIndex left as well
			end
			if AutoSaveList[AutoSaveIndex] == nil then -- AutoSaveIndex was at the end of the AutoSaveList - reset to 1
				AutoSaveIndex = 1
			end
		end
	end

	local function AddProfileToAutoSave(profile) -- Notice: Makes sure this profile isn't auto-saved too soon
		-- Add at AutoSaveIndex and move AutoSaveIndex right:
		table.insert(AutoSaveList, AutoSaveIndex, profile)
		if #AutoSaveList > 1 then
			AutoSaveIndex = AutoSaveIndex + 1
		elseif #AutoSaveList == 1 then
			-- First profile created - make sure it doesn't get immediately auto saved:
			LastAutoSave = os.clock()
		end
	end

	local function ReleaseProfileInternally(profile)
		-- 1) Remove profile object from ProfileService references: --
		-- Clear reference in ProfileStore:
		local profile_store = profile._profile_store
		local loaded_profiles = profile._is_user_mock == true and profile_store._mock_loaded_profiles or profile_store._loaded_profiles
		loaded_profiles[profile._profile_key] = nil
		if next(profile_store._loaded_profiles) == nil and next(profile_store._mock_loaded_profiles) == nil then -- ProfileStore has turned inactive
			local index = table.find(ActiveProfileStores, profile_store)
			if index ~= nil then
				table.remove(ActiveProfileStores, index)
			end
		end
		-- Clear auto update reference:
		RemoveProfileFromAutoSave(profile)
		-- 2) Trigger release listeners: --
		local place_id
		local game_job_id
		local active_session = profile.MetaData.ActiveSession
		if active_session ~= nil then
			place_id = active_session[1]
			game_job_id = active_session[2]
		end
		profile._release_listeners:Fire(place_id, game_job_id)
	end

	local function CheckForNewGlobalUpdates(profile, old_global_updates_data, new_global_updates_data)
		local global_updates_object = profile.GlobalUpdates -- [GlobalUpdates]
		local pending_update_lock = global_updates_object._pending_update_lock -- {update_id, ...}
		local pending_update_clear = global_updates_object._pending_update_clear -- {update_id, ...}
		-- "old_" or "new_" global_updates_data = {update_index, {{update_id, version_id, update_locked, update_data}, ...}}
		for _, new_global_update in ipairs(new_global_updates_data[2]) do
			-- Find old global update with the same update_id:
			local old_global_update
			for _, global_update in ipairs(old_global_updates_data[2]) do
				if global_update[1] == new_global_update[1] then
					old_global_update = global_update
					break
				end
			end
			-- A global update is new when it didn't exist before or its version_id or update_locked state changed:
			local is_new = false
			if old_global_update == nil or new_global_update[2] > old_global_update[2] or new_global_update[3] ~= old_global_update[3] then
				is_new = true
			end
			if is_new == true then
				-- Active global updates:
				if new_global_update[3] == false then
					-- Check if update is not pending to be locked: (Preventing firing new active update listeners more than necessary)
					local is_pending_lock = false
					for _, update_id in ipairs(pending_update_lock) do
						if new_global_update[1] == update_id then
							is_pending_lock = true
							break
						end
					end
					if is_pending_lock == false then
						-- Trigger new active update listeners:
						global_updates_object._new_active_update_listeners:Fire(new_global_update[1], new_global_update[4])
					end
				end
				-- Locked global updates:
				if new_global_update[3] == true then
					-- Check if update is not pending to be cleared: (Preventing firing new locked update listeners after marking a locked update for clearing)
					local is_pending_clear = false
					for _, update_id in ipairs(pending_update_clear) do
						if new_global_update[1] == update_id then
							is_pending_clear = true
							break
						end
					end
					if is_pending_clear == false then
						-- Trigger new locked update listeners:

						global_updates_object._new_locked_update_listeners:FireUntil(
							function()
								-- Check if listener marked the update to be cleared:
								-- Normally there should be only one listener per profile for new locked global updates, but
								-- in case several listeners are connected we will not trigger more listeners after one listener
								-- marks the locked global update to be cleared.
								return table.find(pending_update_clear, new_global_update[1]) == nil
							end,
							new_global_update[1], new_global_update[4]
						)

					end
				end
			end
		end
	end

	local function SaveProfileAsync(profile, release_from_session, is_overwriting)
		if type(profile.Data) ~= "table" then
			RegisterCorruption(
				profile._profile_store._profile_store_name,
				profile._profile_store._profile_store_scope,
				profile._profile_key
			)
			error("[ProfileService]: PROFILE DATA CORRUPTED DURING RUNTIME! Profile: " .. profile:Identify())
		end
		if release_from_session == true and is_overwriting ~= true then
			ReleaseProfileInternally(profile)
		end
		ActiveProfileSaveJobs = ActiveProfileSaveJobs + 1
		local last_session_load_count = profile.MetaData.SessionLoadCount
		-- Compare "SessionLoadCount" when writing to profile to prevent a rare case of repeat last save when the profile is loaded on the same server again
		local repeat_save_flag = true -- Released Profile save calls have to repeat until they succeed
		while repeat_save_flag == true do
			if release_from_session ~= true then
				repeat_save_flag = false
			end
			local loaded_data, key_info = StandardProfileUpdateAsyncDataStore(
				profile._profile_store,
				profile._profile_key,
				{
					ExistingProfileHandle = nil,
					MissingProfileHandle = nil,
					EditProfile = function(latest_data)

						local session_owns_profile = false
						local force_load_pending = false

						if is_overwriting ~= true then
							-- 1) Check if this session still owns the profile: --
							local active_session = latest_data.MetaData.ActiveSession
							local force_load_session = latest_data.MetaData.ForceLoadSession
							local session_load_count = latest_data.MetaData.SessionLoadCount

							if type(active_session) == "table" then
								session_owns_profile = IsThisSession(active_session) and session_load_count == last_session_load_count
							end
							if type(force_load_session) == "table" then
								force_load_pending = not IsThisSession(force_load_session)
							end
						else
							session_owns_profile = true
						end

						if session_owns_profile == true then -- We may only edit the profile if this session has ownership of the profile

							if is_overwriting ~= true then
								-- 2) Manage global updates: --
								local latest_global_updates_data = latest_data.GlobalUpdates -- {update_index, {{update_id, version_id, update_locked, update_data}, ...}}
								local latest_global_updates_list = latest_global_updates_data[2]

								local global_updates_object = profile.GlobalUpdates -- [GlobalUpdates]
								local pending_update_lock = global_updates_object._pending_update_lock -- {update_id, ...}
								local pending_update_clear = global_updates_object._pending_update_clear -- {update_id, ...}
								-- Active update locking:
								for i = 1, #latest_global_updates_list do
									for _, lock_id in ipairs(pending_update_lock) do
										if latest_global_updates_list[i][1] == lock_id then
											latest_global_updates_list[i][3] = true
											break
										end
									end
								end
								-- Locked update clearing:
								for _, clear_id in ipairs(pending_update_clear) do
									for i = 1, #latest_global_updates_list do
										if latest_global_updates_list[i][1] == clear_id and latest_global_updates_list[i][3] == true then
											table.remove(latest_global_updates_list, i)
											break
										end
									end
								end
							end

							-- 3) Save profile data: --
							latest_data.Data = profile.Data
							latest_data.RobloxMetaData = profile.RobloxMetaData
							latest_data.UserIds = profile.UserIds

							if is_overwriting ~= true then
								latest_data.MetaData.MetaTags = profile.MetaData.MetaTags -- MetaData.MetaTags is the only actively savable component of MetaData
								latest_data.MetaData.LastUpdate = os.time()
								if release_from_session == true or force_load_pending == true then
									latest_data.MetaData.ActiveSession = nil
								end
							else
								latest_data.MetaData = profile.MetaData
								latest_data.MetaData.ActiveSession = nil
								latest_data.MetaData.ForceLoadSession = nil
								latest_data.GlobalUpdates = profile.GlobalUpdates._updates_latest
							end

						end
					end,
				},
				profile._is_user_mock
			)
			if loaded_data ~= nil and key_info ~= nil then
				if is_overwriting == true then
					break
				end
				repeat_save_flag = false
				-- 4) Set latest data in profile: --
				-- Updating DataStoreKeyInfo:
				profile.KeyInfo = key_info
				-- Setting global updates:
				local global_updates_object = profile.GlobalUpdates -- [GlobalUpdates]
				local old_global_updates_data = global_updates_object._updates_latest
				local new_global_updates_data = loaded_data.GlobalUpdates
				global_updates_object._updates_latest = new_global_updates_data
				-- Setting MetaData:
				local session_meta_data = profile.MetaData
				local latest_meta_data = loaded_data.MetaData
				for key in pairs(SETTINGS.MetaTagsUpdatedValues) do
					session_meta_data[key] = latest_meta_data[key]
				end
				session_meta_data.MetaTagsLatest = latest_meta_data.MetaTags
				-- 5) Check if session still owns the profile: --
				local active_session = loaded_data.MetaData.ActiveSession
				local session_load_count = loaded_data.MetaData.SessionLoadCount
				local session_owns_profile = false
				if type(active_session) == "table" then
					session_owns_profile = IsThisSession(active_session) and session_load_count == last_session_load_count
				end
				local is_active = profile:IsActive()
				if session_owns_profile == true then
					-- 6) Check for new global updates: --
					if is_active == true then -- Profile could've been released before the saving thread finished
						CheckForNewGlobalUpdates(profile, old_global_updates_data, new_global_updates_data)
					end
				else
					-- Session no longer owns the profile:
					-- 7) Release profile if it hasn't been released yet: --
					if is_active == true then
						ReleaseProfileInternally(profile)
					end
					-- Cleanup reference in custom write queue:
					CustomWriteQueueMarkForCleanup(profile._profile_store._profile_store_lookup, profile._profile_key)
					-- Hop ready listeners:
					if profile._hop_ready == false then
						profile._hop_ready = true
						profile._hop_ready_listeners:Fire()
					end
				end
				-- Signaling MetaTagsUpdated listeners after a possible external profile release was handled:
				profile.MetaTagsUpdated:Fire(profile.MetaData.MetaTagsLatest)
				-- Signaling KeyInfoUpdated listeners:
				profile.KeyInfoUpdated:Fire(key_info)
			elseif repeat_save_flag == true then
				task.wait() -- Prevent infinite loop in case DataStore API does not yield
			end
		end
		ActiveProfileSaveJobs = ActiveProfileSaveJobs - 1
	end

	----- Public functions -----

	-- GlobalUpdates object:

	local GlobalUpdates = {
	--[[
		_updates_latest = {}, -- [table] {update_index, {{update_id, version_id, update_locked, update_data}, ...}}
		_pending_update_lock = {update_id, ...} / nil, -- [table / nil]
		_pending_update_clear = {update_id, ...} / nil, -- [table / nil]
		
		_new_active_update_listeners = [ScriptSignal] / nil, -- [table / nil]
		_new_locked_update_listeners = [ScriptSignal] / nil, -- [table / nil]
		
		_profile = Profile / nil, -- [Profile / nil]
		
		_update_handler_mode = true / nil, -- [bool / nil]
	--]]
	}
	GlobalUpdates.__index = GlobalUpdates

	-- ALWAYS PUBLIC:
	function GlobalUpdates:GetActiveUpdates() --> [table] {{update_id, update_data}, ...}
		local query_list = {}
		for _, global_update in ipairs(self._updates_latest[2]) do
			if global_update[3] == false then
				local is_pending_lock = false
				if self._pending_update_lock ~= nil then
					for _, update_id in ipairs(self._pending_update_lock) do
						if global_update[1] == update_id then
							is_pending_lock = true -- Exclude global updates pending to be locked
							break
						end
					end
				end
				if is_pending_lock == false then
					table.insert(query_list, {global_update[1], global_update[4]})
				end
			end
		end
		return query_list
	end

	function GlobalUpdates:GetLockedUpdates() --> [table] {{update_id, update_data}, ...}
		local query_list = {}
		for _, global_update in ipairs(self._updates_latest[2]) do
			if global_update[3] == true then
				local is_pending_clear = false
				if self._pending_update_clear ~= nil then
					for _, update_id in ipairs(self._pending_update_clear) do
						if global_update[1] == update_id then
							is_pending_clear = true -- Exclude global updates pending to be cleared
							break
						end
					end
				end
				if is_pending_clear == false then
					table.insert(query_list, {global_update[1], global_update[4]})
				end
			end
		end
		return query_list
	end

	-- ONLY WHEN FROM "Profile.GlobalUpdates":
	function GlobalUpdates:ListenToNewActiveUpdate(listener) --> [ScriptConnection] listener(update_id, update_data)
		if type(listener) ~= "function" then
			error("[ProfileService]: Only a function can be set as listener in GlobalUpdates:ListenToNewActiveUpdate()")
		end
		local profile = self._profile
		if self._update_handler_mode == true then
			error("[ProfileService]: Can't listen to new global updates in ProfileStore:GlobalUpdateProfileAsync()")
		elseif self._new_active_update_listeners == nil then
			error("[ProfileService]: Can't listen to new global updates in view mode")
		elseif profile:IsActive() == false then -- Check if profile is expired
			return { -- Do not connect listener if the profile is expired
				Disconnect = function() end,
			}
		end
		-- Connect listener:
		return self._new_active_update_listeners:Connect(listener)
	end

	function GlobalUpdates:ListenToNewLockedUpdate(listener) --> [ScriptConnection] listener(update_id, update_data)
		if type(listener) ~= "function" then
			error("[ProfileService]: Only a function can be set as listener in GlobalUpdates:ListenToNewLockedUpdate()")
		end
		local profile = self._profile
		if self._update_handler_mode == true then
			error("[ProfileService]: Can't listen to new global updates in ProfileStore:GlobalUpdateProfileAsync()")
		elseif self._new_locked_update_listeners == nil then
			error("[ProfileService]: Can't listen to new global updates in view mode")
		elseif profile:IsActive() == false then -- Check if profile is expired
			return { -- Do not connect listener if the profile is expired
				Disconnect = function() end,
			}
		end
		-- Connect listener:
		return self._new_locked_update_listeners:Connect(listener)
	end

	function GlobalUpdates:LockActiveUpdate(update_id)
		if type(update_id) ~= "number" then
			error("[ProfileService]: Invalid update_id")
		end
		local profile = self._profile
		if self._update_handler_mode == true then
			error("[ProfileService]: Can't lock active global updates in ProfileStore:GlobalUpdateProfileAsync()")
		elseif self._pending_update_lock == nil then
			error("[ProfileService]: Can't lock active global updates in view mode")
		elseif profile:IsActive() == false then -- Check if profile is expired
			error("[ProfileService]: PROFILE EXPIRED - Can't lock active global updates")
		end
		-- Check if global update exists with given update_id
		local global_update_exists = nil
		for _, global_update in ipairs(self._updates_latest[2]) do
			if global_update[1] == update_id then
				global_update_exists = global_update
				break
			end
		end
		if global_update_exists ~= nil then
			local is_pending_lock = false
			for _, lock_update_id in ipairs(self._pending_update_lock) do
				if update_id == lock_update_id then
					is_pending_lock = true -- Exclude global updates pending to be locked
					break
				end
			end
			if is_pending_lock == false and global_update_exists[3] == false then -- Avoid id duplicates in _pending_update_lock
				table.insert(self._pending_update_lock, update_id)
			end
		else
			error("[ProfileService]: Passed non-existant update_id")
		end
	end

	function GlobalUpdates:ClearLockedUpdate(update_id)
		if type(update_id) ~= "number" then
			error("[ProfileService]: Invalid update_id")
		end
		local profile = self._profile
		if self._update_handler_mode == true then
			error("[ProfileService]: Can't clear locked global updates in ProfileStore:GlobalUpdateProfileAsync()")
		elseif self._pending_update_clear == nil then
			error("[ProfileService]: Can't clear locked global updates in view mode")
		elseif profile:IsActive() == false then -- Check if profile is expired
			error("[ProfileService]: PROFILE EXPIRED - Can't clear locked global updates")
		end
		-- Check if global update exists with given update_id
		local global_update_exists = nil
		for _, global_update in ipairs(self._updates_latest[2]) do
			if global_update[1] == update_id then
				global_update_exists = global_update
				break
			end
		end
		if global_update_exists ~= nil then
			local is_pending_clear = false
			for _, clear_update_id in ipairs(self._pending_update_clear) do
				if update_id == clear_update_id then
					is_pending_clear = true -- Exclude global updates pending to be cleared
					break
				end
			end
			if is_pending_clear == false and global_update_exists[3] == true then -- Avoid id duplicates in _pending_update_clear
				table.insert(self._pending_update_clear, update_id)
			end
		else
			error("[ProfileService]: Passed non-existant update_id")
		end
	end

	-- EXPOSED TO "update_handler" DURING ProfileStore:GlobalUpdateProfileAsync() CALL
	function GlobalUpdates:AddActiveUpdate(update_data)
		if type(update_data) ~= "table" then
			error("[ProfileService]: Invalid update_data")
		end
		if self._new_active_update_listeners ~= nil then
			error("[ProfileService]: Can't add active global updates in loaded Profile; Use ProfileStore:GlobalUpdateProfileAsync()")
		elseif self._update_handler_mode ~= true then
			error("[ProfileService]: Can't add active global updates in view mode; Use ProfileStore:GlobalUpdateProfileAsync()")
		end
		-- self._updates_latest = {}, -- [table] {update_index, {{update_id, version_id, update_locked, update_data}, ...}}
		local updates_latest = self._updates_latest
		local update_index = updates_latest[1] + 1 -- Incrementing global update index
		updates_latest[1] = update_index
		-- Add new active global update:
		table.insert(updates_latest[2], {update_index, 1, false, update_data})
	end

	function GlobalUpdates:ChangeActiveUpdate(update_id, update_data)
		if type(update_id) ~= "number" then
			error("[ProfileService]: Invalid update_id")
		end
		if type(update_data) ~= "table" then
			error("[ProfileService]: Invalid update_data")
		end
		if self._new_active_update_listeners ~= nil then
			error("[ProfileService]: Can't change active global updates in loaded Profile; Use ProfileStore:GlobalUpdateProfileAsync()")
		elseif self._update_handler_mode ~= true then
			error("[ProfileService]: Can't change active global updates in view mode; Use ProfileStore:GlobalUpdateProfileAsync()")
		end
		-- self._updates_latest = {}, -- [table] {update_index, {{update_id, version_id, update_locked, update_data}, ...}}
		local updates_latest = self._updates_latest
		local get_global_update = nil
		for _, global_update in ipairs(updates_latest[2]) do
			if update_id == global_update[1] then
				get_global_update = global_update
				break
			end
		end
		if get_global_update ~= nil then
			if get_global_update[3] == true then
				error("[ProfileService]: Can't change locked global update")
			end
			get_global_update[2] = get_global_update[2] + 1 -- Increment version id
			get_global_update[4] = update_data -- Set new global update data
		else
			error("[ProfileService]: Passed non-existant update_id")
		end
	end

	function GlobalUpdates:ClearActiveUpdate(update_id)
		if type(update_id) ~= "number" then
			error("[ProfileService]: Invalid update_id argument")
		end
		if self._new_active_update_listeners ~= nil then
			error("[ProfileService]: Can't clear active global updates in loaded Profile; Use ProfileStore:GlobalUpdateProfileAsync()")
		elseif self._update_handler_mode ~= true then
			error("[ProfileService]: Can't clear active global updates in view mode; Use ProfileStore:GlobalUpdateProfileAsync()")
		end
		-- self._updates_latest = {}, -- [table] {update_index, {{update_id, version_id, update_locked, update_data}, ...}}
		local updates_latest = self._updates_latest
		local get_global_update_index = nil
		local get_global_update = nil
		for index, global_update in ipairs(updates_latest[2]) do
			if update_id == global_update[1] then
				get_global_update_index = index
				get_global_update = global_update
				break
			end
		end
		if get_global_update ~= nil then
			if get_global_update[3] == true then
				error("[ProfileService]: Can't clear locked global update")
			end
			table.remove(updates_latest[2], get_global_update_index) -- Remove active global update
		else
			error("[ProfileService]: Passed non-existant update_id")
		end
	end

	-- Profile object:

	local Profile = {
	--[[
		Data = {}, -- [table] -- Loaded once after ProfileStore:LoadProfileAsync() finishes
		MetaData = {}, -- [table] -- Updated with every auto-save
		GlobalUpdates = GlobalUpdates, -- [GlobalUpdates]
		
		_profile_store = ProfileStore, -- [ProfileStore]
		_profile_key = "", -- [string]
		
		_release_listeners = [ScriptSignal] / nil, -- [table / nil]
		_hop_ready_listeners = [ScriptSignal] / nil, -- [table / nil]
		_hop_ready = false,
		
		_view_mode = true / nil, -- [bool] or nil
		
		_load_timestamp = os.clock(),
		
		_is_user_mock = false, -- ProfileStore.Mock
		_mock_key_info = {},
	--]]
	}
	Profile.__index = Profile

	function Profile:IsActive() --> [bool]
		local loaded_profiles = self._is_user_mock == true and self._profile_store._mock_loaded_profiles or self._profile_store._loaded_profiles
		return loaded_profiles[self._profile_key] == self
	end

	function Profile:GetMetaTag(tag_name) --> value
		local meta_data = self.MetaData
		if meta_data == nil then
			return nil
			-- error("[ProfileService]: This Profile hasn't been loaded before - MetaData not available")
		end
		return self.MetaData.MetaTags[tag_name]
	end

	function Profile:SetMetaTag(tag_name, value)
		if type(tag_name) ~= "string" then
			error("[ProfileService]: tag_name must be a string")
		elseif string.len(tag_name) == 0 then
			error("[ProfileService]: Invalid tag_name")
		end
		self.MetaData.MetaTags[tag_name] = value
	end

	function Profile:Reconcile()
		ReconcileTable(self.Data, self._profile_store._profile_template)
	end

	function Profile:ListenToRelease(listener) --> [ScriptConnection] (place_id / nil, game_job_id / nil)
		if type(listener) ~= "function" then
			error("[ProfileService]: Only a function can be set as listener in Profile:ListenToRelease()")
		end
		if self._view_mode == true then
			return {Disconnect = function() end}
		end
		if self:IsActive() == false then
			-- Call release listener immediately if profile is expired
			local place_id
			local game_job_id
			local active_session = self.MetaData.ActiveSession
			if active_session ~= nil then
				place_id = active_session[1]
				game_job_id = active_session[2]
			end
			listener(place_id, game_job_id)
			return {Disconnect = function() end}
		else
			return self._release_listeners:Connect(listener)
		end
	end

	function Profile:Save()
		if self._view_mode == true then
			error("[ProfileService]: Can't save Profile in view mode - Should you be calling :OverwriteAsync() instead?")
		end
		if self:IsActive() == false then
			warn("[ProfileService]: Attempted saving an inactive profile "
				.. self:Identify() .. "; Traceback:\n" .. debug.traceback())
			return
		end
		-- Reject save request if a save is already pending in the queue - this will prevent the user from
		--	unecessary API request spam which we could not meaningfully execute anyways!
		if IsCustomWriteQueueEmptyFor(self._profile_store._profile_store_lookup, self._profile_key) == true then
			-- We don't want auto save to trigger too soon after manual saving - this will reset the auto save timer:
			RemoveProfileFromAutoSave(self)
			AddProfileToAutoSave(self)
			-- Call save function in a new thread:
			task.spawn(SaveProfileAsync, self)
		end
	end

	function Profile:Release()
		if self._view_mode == true then
			return
		end
		if self:IsActive() == true then
			task.spawn(SaveProfileAsync, self, true) -- Call save function in a new thread with release_from_session = true
		end
	end

	function Profile:ListenToHopReady(listener) --> [ScriptConnection] ()
		if type(listener) ~= "function" then
			error("[ProfileService]: Only a function can be set as listener in Profile:ListenToHopReady()")
		end
		if self._view_mode == true then
			return {Disconnect = function() end}
		end
		if self._hop_ready == true then
			task.spawn(listener)
			return {Disconnect = function() end}
		else
			return self._hop_ready_listeners:Connect(listener)
		end
	end

	function Profile:AddUserId(user_id) -- Associates user_id with profile (GDPR compliance)

		if type(user_id) ~= "number" or user_id % 1 ~= 0 then
			warn("[ProfileService]: Invalid UserId argument for :AddUserId() ("
				.. tostring(user_id) .. "); Traceback:\n" .. debug.traceback())
			return
		end

		if user_id < 0 and self._is_user_mock ~= true and UseMockDataStore ~= true then
			return -- Avoid giving real Roblox APIs negative UserId's
		end

		if table.find(self.UserIds, user_id) == nil then
			table.insert(self.UserIds, user_id)
		end

	end

	function Profile:RemoveUserId(user_id) -- Unassociates user_id with profile (safe function)

		if type(user_id) ~= "number" or user_id % 1 ~= 0 then
			warn("[ProfileService]: Invalid UserId argument for :RemoveUserId() ("
				.. tostring(user_id) .. "); Traceback:\n" .. debug.traceback())
			return
		end

		local index = table.find(self.UserIds, user_id)

		if index ~= nil then
			table.remove(self.UserIds, index)
		end

	end

	function Profile:Identify() --> [string]
		return IdentifyProfile(
			self._profile_store._profile_store_name,
			self._profile_store._profile_store_scope,
			self._profile_key
		)
	end

	function Profile:ClearGlobalUpdates() -- Clears all global updates data from a profile payload

		if self._view_mode ~= true then
			error("[ProfileService]: :ClearGlobalUpdates() can only be used in view mode")
		end

		local global_updates_object = {
			_updates_latest = {0, {}},
			_profile = self,
		}
		setmetatable(global_updates_object, GlobalUpdates)

		self.GlobalUpdates = global_updates_object

	end

	function Profile:OverwriteAsync() -- Saves the profile to the DataStore and removes the session lock

		if self._view_mode ~= true then
			error("[ProfileService]: :OverwriteAsync() can only be used in view mode")
		end

		SaveProfileAsync(self, nil, true)

	end

	-- ProfileVersionQuery object:

	local ProfileVersionQuery = {
	--[[
		_profile_store = profile_store,
		_profile_key = profile_key,
		_sort_direction = sort_direction,
		_min_date = min_date,
		_max_date = max_date,

		_query_pages = pages, -- [DataStoreVersionPages]
		_query_index = index, -- [number]
		_query_failure = false,

		_is_query_yielded = false,
		_query_queue = {},
	--]]
	}
	ProfileVersionQuery.__index = ProfileVersionQuery

	function ProfileVersionQuery:_MoveQueue()
		while #self._query_queue > 0 do
			local queue_entry = table.remove(self._query_queue, 1)
			task.spawn(queue_entry)
			if self._is_query_yielded == true then
				break
			end
		end
	end

	function ProfileVersionQuery:NextAsync(_is_stacking) --> [Profile] or nil

		if self._profile_store == nil then
			return nil
		end

		local profile
		local is_finished = false

		local function query_job()

			if self._query_failure == true then
				is_finished = true
				return
			end

			-- First "next" call loads version pages:

			if self._query_pages == nil then

				self._is_query_yielded = true
				task.spawn(function()
					profile = self:NextAsync(true)
					is_finished = true
				end)

				local list_success, error_message = pcall(function()
					self._query_pages = self._profile_store._global_data_store:ListVersionsAsync(
						self._profile_key,
						self._sort_direction,
						self._min_date,
						self._max_date
					)
					self._query_index = 0
				end)

				if list_success == false or self._query_pages == nil then
					warn("[ProfileService]: Version query fail - " .. tostring(error_message))
					self._query_failure = true
				end

				self._is_query_yielded = false
				self:_MoveQueue()

				return

			end

			local current_page = self._query_pages:GetCurrentPage()
			local next_item = current_page[self._query_index + 1]

			-- No more entries:

			if self._query_pages.IsFinished == true and next_item == nil then
				is_finished = true
				return
			end

			-- Load next page when this page is over:

			if next_item == nil then

				self._is_query_yielded = true
				task.spawn(function()
					profile = self:NextAsync(true)
					is_finished = true
				end)

				local success = pcall(function()
					self._query_pages:AdvanceToNextPageAsync()
					self._query_index = 0
				end)

				if success == false or #self._query_pages:GetCurrentPage() == 0 then
					self._query_failure = true
				end

				self._is_query_yielded = false
				self:_MoveQueue()

				return

			end

			-- Next page item:

			self._query_index += 1
			profile = self._profile_store:ViewProfileAsync(self._profile_key, next_item.Version)
			is_finished = true

		end

		if self._is_query_yielded == false then
			query_job()
		else
			if _is_stacking == true then
				table.insert(self._query_queue, 1, query_job)
			else
				table.insert(self._query_queue, query_job)
			end
		end

		while is_finished == false do
			task.wait()
		end

		return profile

	end

	-- ProfileStore object:

	local ProfileStore = {
	--[[
		Mock = {},
	
		_profile_store_name = "", -- [string] -- DataStore name
		_profile_store_scope = nil, -- [string] or [nil] -- DataStore scope
		_profile_store_lookup = "", -- [string] -- _profile_store_name .. "\0" .. (_profile_store_scope or "")
		
		_profile_template = {}, -- [table]
		_global_data_store = global_data_store, -- [GlobalDataStore] -- Object returned by DataStoreService:GetDataStore(_profile_store_name)
		
		_loaded_profiles = {[profile_key] = Profile, ...},
		_profile_load_jobs = {[profile_key] = {load_id, loaded_data}, ...},
		
		_mock_loaded_profiles = {[profile_key] = Profile, ...},
		_mock_profile_load_jobs = {[profile_key] = {load_id, loaded_data}, ...},
	--]]
	}
	ProfileStore.__index = ProfileStore

	function ProfileStore:LoadProfileAsync(profile_key, not_released_handler, _use_mock) --> [Profile / nil] not_released_handler(place_id, game_job_id)

		not_released_handler = not_released_handler or "ForceLoad"

		if self._profile_template == nil then
			error("[ProfileService]: Profile template not set - ProfileStore:LoadProfileAsync() locked for this ProfileStore")
		end
		if type(profile_key) ~= "string" then
			error("[ProfileService]: profile_key must be a string")
		elseif string.len(profile_key) == 0 then
			error("[ProfileService]: Invalid profile_key")
		end
		if type(not_released_handler) ~= "function" and not_released_handler ~= "ForceLoad" and not_released_handler ~= "Steal" then
			error("[ProfileService]: Invalid not_released_handler")
		end

		if ProfileService.ServiceLocked == true then
			return nil
		end

		WaitForPendingProfileStore(self)

		local is_user_mock = _use_mock == UseMockTag

		-- Check if profile with profile_key isn't already loaded in this session:
		for _, profile_store in ipairs(ActiveProfileStores) do
			if profile_store._profile_store_lookup == self._profile_store_lookup then
				local loaded_profiles = is_user_mock == true and profile_store._mock_loaded_profiles or profile_store._loaded_profiles
				if loaded_profiles[profile_key] ~= nil then
					error("[ProfileService]: Profile " .. IdentifyProfile(self._profile_store_name, self._profile_store_scope, profile_key) .. " is already loaded in this session")
					-- Are you using Profile:Release() properly?
				end
			end
		end

		ActiveProfileLoadJobs = ActiveProfileLoadJobs + 1
		local force_load = not_released_handler == "ForceLoad"
		local force_load_steps = 0
		local request_force_load = force_load -- First step of ForceLoad
		local steal_session = false -- Second step of ForceLoad
		local aggressive_steal = not_released_handler == "Steal" -- Developer invoked steal
		while ProfileService.ServiceLocked == false do
			-- Load profile:
			-- SPECIAL CASE - If LoadProfileAsync is called for the same key before another LoadProfileAsync finishes,
			-- yoink the DataStore return for the new call. The older call will return nil. This would prevent very rare
			-- game breaking errors where a player rejoins the server super fast.
			local profile_load_jobs = is_user_mock == true and self._mock_profile_load_jobs or self._profile_load_jobs
			local loaded_data, key_info
			local load_id = LoadIndex + 1
			LoadIndex = load_id
			local profile_load_job = profile_load_jobs[profile_key] -- {load_id, {loaded_data, key_info} or nil}
			if profile_load_job ~= nil then
				profile_load_job[1] = load_id -- Yoink load job
				while profile_load_job[2] == nil do -- Wait for job to finish
					task.wait()
				end
				if profile_load_job[1] == load_id then -- Load job hasn't been double-yoinked
					loaded_data, key_info = table.unpack(profile_load_job[2])
					profile_load_jobs[profile_key] = nil
				else
					ActiveProfileLoadJobs = ActiveProfileLoadJobs - 1
					return nil
				end
			else
				profile_load_job = {load_id, nil}
				profile_load_jobs[profile_key] = profile_load_job
				profile_load_job[2] = table.pack(StandardProfileUpdateAsyncDataStore(
					self,
					profile_key,
					{
						ExistingProfileHandle = function(latest_data)
							if ProfileService.ServiceLocked == false then
								local active_session = latest_data.MetaData.ActiveSession
								local force_load_session = latest_data.MetaData.ForceLoadSession
								-- IsThisSession(active_session)
								if active_session == nil then
									latest_data.MetaData.ActiveSession = {PlaceId, JobId}
									latest_data.MetaData.ForceLoadSession = nil
								elseif type(active_session) == "table" then
									if IsThisSession(active_session) == false then
										local last_update = latest_data.MetaData.LastUpdate
										if last_update ~= nil then
											if os.time() - last_update > SETTINGS.AssumeDeadSessionLock then
												latest_data.MetaData.ActiveSession = {PlaceId, JobId}
												latest_data.MetaData.ForceLoadSession = nil
												return
											end
										end
										if steal_session == true or aggressive_steal == true then
											local force_load_uninterrupted = false
											if force_load_session ~= nil then
												force_load_uninterrupted = IsThisSession(force_load_session)
											end
											if force_load_uninterrupted == true or aggressive_steal == true then
												latest_data.MetaData.ActiveSession = {PlaceId, JobId}
												latest_data.MetaData.ForceLoadSession = nil
											end
										elseif request_force_load == true then
											latest_data.MetaData.ForceLoadSession = {PlaceId, JobId}
										end
									else
										latest_data.MetaData.ForceLoadSession = nil
									end
								end
							end
						end,
						MissingProfileHandle = function(latest_data)
							latest_data.Data = DeepCopyTable(self._profile_template)
							latest_data.MetaData = {
								ProfileCreateTime = os.time(),
								SessionLoadCount = 0,
								ActiveSession = {PlaceId, JobId},
								ForceLoadSession = nil,
								MetaTags = {},
							}
						end,
						EditProfile = function(latest_data)
							if ProfileService.ServiceLocked == false then
								local active_session = latest_data.MetaData.ActiveSession
								if active_session ~= nil and IsThisSession(active_session) == true then
									latest_data.MetaData.SessionLoadCount = latest_data.MetaData.SessionLoadCount + 1
									latest_data.MetaData.LastUpdate = os.time()
								end
							end
						end,
					},
					is_user_mock
					))
				if profile_load_job[1] == load_id then -- Load job hasn't been yoinked
					loaded_data, key_info = table.unpack(profile_load_job[2])
					profile_load_jobs[profile_key] = nil
				else
					ActiveProfileLoadJobs = ActiveProfileLoadJobs - 1
					return nil -- Load job yoinked
				end
			end
			-- Handle load_data:
			if loaded_data ~= nil and key_info ~= nil then
				local active_session = loaded_data.MetaData.ActiveSession
				if type(active_session) == "table" then
					if IsThisSession(active_session) == true then
						-- Special component in MetaTags:
						loaded_data.MetaData.MetaTagsLatest = DeepCopyTable(loaded_data.MetaData.MetaTags)
						-- Case #1: Profile is now taken by this session:
						-- Create Profile object:
						local global_updates_object = {
							_updates_latest = loaded_data.GlobalUpdates,
							_pending_update_lock = {},
							_pending_update_clear = {},

							_new_active_update_listeners = Madwork.NewScriptSignal(),
							_new_locked_update_listeners = Madwork.NewScriptSignal(),

							_profile = nil,
						}
						setmetatable(global_updates_object, GlobalUpdates)
						local profile = {
							Data = loaded_data.Data,
							MetaData = loaded_data.MetaData,
							MetaTagsUpdated = Madwork.NewScriptSignal(),

							RobloxMetaData = loaded_data.RobloxMetaData or {},
							UserIds = loaded_data.UserIds or {},
							KeyInfo = key_info,
							KeyInfoUpdated = Madwork.NewScriptSignal(),

							GlobalUpdates = global_updates_object,

							_profile_store = self,
							_profile_key = profile_key,

							_release_listeners = Madwork.NewScriptSignal(),
							_hop_ready_listeners = Madwork.NewScriptSignal(),
							_hop_ready = false,

							_load_timestamp = os.clock(),

							_is_user_mock = is_user_mock,
						}
						setmetatable(profile, Profile)
						global_updates_object._profile = profile
						-- Referencing Profile object in ProfileStore:
						if next(self._loaded_profiles) == nil and next(self._mock_loaded_profiles) == nil then -- ProfileStore object was inactive
							table.insert(ActiveProfileStores, self)
						end
						if is_user_mock == true then
							self._mock_loaded_profiles[profile_key] = profile
						else
							self._loaded_profiles[profile_key] = profile
						end
						-- Adding profile to AutoSaveList;
						AddProfileToAutoSave(profile)
						-- Special case - finished loading profile, but session is shutting down:
						if ProfileService.ServiceLocked == true then
							SaveProfileAsync(profile, true) -- Release profile and yield until the DataStore call is finished
							profile = nil -- nil will be returned by this call
						end
						-- Return Profile object:
						ActiveProfileLoadJobs = ActiveProfileLoadJobs - 1
						return profile
					else
						-- Case #2: Profile is taken by some other session:
						if force_load == true then
							local force_load_session = loaded_data.MetaData.ForceLoadSession
							local force_load_uninterrupted = false
							if force_load_session ~= nil then
								force_load_uninterrupted = IsThisSession(force_load_session)
							end
							if force_load_uninterrupted == true then
								if request_force_load == false then
									force_load_steps = force_load_steps + 1
									if force_load_steps == SETTINGS.ForceLoadMaxSteps then
										steal_session = true
									end
								end
								task.wait() -- Overload prevention
							else
								-- Another session tried to force load this profile:
								ActiveProfileLoadJobs = ActiveProfileLoadJobs - 1
								return nil
							end
							request_force_load = false -- Only request a force load once
						elseif aggressive_steal == true then
							task.wait() -- Overload prevention
						else
							local handler_result = not_released_handler(active_session[1], active_session[2])
							if handler_result == "Repeat" then
								task.wait() -- Overload prevention
							elseif handler_result == "Cancel" then
								ActiveProfileLoadJobs = ActiveProfileLoadJobs - 1
								return nil
							elseif handler_result == "ForceLoad" then
								force_load = true
								request_force_load = true
								task.wait() -- Overload prevention
							elseif handler_result == "Steal" then
								aggressive_steal = true
								task.wait() -- Overload prevention
							else
								error(
									"[ProfileService]: Invalid return from not_released_handler (\"" .. tostring(handler_result) .. "\")(" .. type(handler_result) .. ");" ..
										"\n" .. IdentifyProfile(self._profile_store_name, self._profile_store_scope, profile_key) ..
										" Traceback:\n" .. debug.traceback()
								)
							end
						end
					end
				else
					ActiveProfileLoadJobs = ActiveProfileLoadJobs - 1
					return nil -- In this scenario it is likely the ProfileService.ServiceLocked flag was raised
				end
			else
				task.wait() -- Overload prevention
			end
		end
		ActiveProfileLoadJobs = ActiveProfileLoadJobs - 1
		return nil -- If loop breaks return nothing
	end

	function ProfileStore:GlobalUpdateProfileAsync(profile_key, update_handler, _use_mock) --> [GlobalUpdates / nil] (update_handler(GlobalUpdates))
		if type(profile_key) ~= "string" or string.len(profile_key) == 0 then
			error("[ProfileService]: Invalid profile_key")
		end
		if type(update_handler) ~= "function" then
			error("[ProfileService]: Invalid update_handler")
		end

		if ProfileService.ServiceLocked == true then
			return nil
		end

		WaitForPendingProfileStore(self)

		while ProfileService.ServiceLocked == false do
			-- Updating profile:
			local loaded_data = StandardProfileUpdateAsyncDataStore(
				self,
				profile_key,
				{
					ExistingProfileHandle = nil,
					MissingProfileHandle = nil,
					EditProfile = function(latest_data)
						-- Running update_handler:
						local global_updates_object = {
							_updates_latest = latest_data.GlobalUpdates,
							_update_handler_mode = true,
						}
						setmetatable(global_updates_object, GlobalUpdates)
						update_handler(global_updates_object)
					end,
				},
				_use_mock == UseMockTag
			)
			CustomWriteQueueMarkForCleanup(self._profile_store_lookup, profile_key)
			-- Handling loaded_data:
			if loaded_data ~= nil then
				-- Return GlobalUpdates object (Update successful):
				local global_updates_object = {
					_updates_latest = loaded_data.GlobalUpdates,
				}
				setmetatable(global_updates_object, GlobalUpdates)
				return global_updates_object
			else
				task.wait() -- Overload prevention
			end
		end
		return nil -- Return nothing (Update unsuccessful)
	end

	function ProfileStore:ViewProfileAsync(profile_key, version, _use_mock) --> [Profile / nil]
		if type(profile_key) ~= "string" or string.len(profile_key) == 0 then
			error("[ProfileService]: Invalid profile_key")
		end

		if ProfileService.ServiceLocked == true then
			return nil
		end

		WaitForPendingProfileStore(self)

		if version ~= nil and (_use_mock == UseMockTag or UseMockDataStore == true) then
			return nil -- No version support in mock mode
		end

		while ProfileService.ServiceLocked == false do
			-- Load profile:
			local loaded_data, key_info = StandardProfileUpdateAsyncDataStore(
				self,
				profile_key,
				{
					ExistingProfileHandle = nil,
					MissingProfileHandle = function(latest_data)
						latest_data.Data = DeepCopyTable(self._profile_template)
						latest_data.MetaData = {
							ProfileCreateTime = os.time(),
							SessionLoadCount = 0,
							ActiveSession = nil,
							ForceLoadSession = nil,
							MetaTags = {},
						}
					end,
					EditProfile = nil,
				},
				_use_mock == UseMockTag,
				true, -- Use :GetAsync()
				version -- DataStore key version
			)
			CustomWriteQueueMarkForCleanup(self._profile_store_lookup, profile_key)
			-- Handle load_data:
			if loaded_data ~= nil then
				if key_info == nil then
					return nil -- Load was successful, but the key was empty - return no profile object
				end
				-- Create Profile object:
				local global_updates_object = {
					_updates_latest = loaded_data.GlobalUpdates, -- {0, {}}
					_profile = nil,
				}
				setmetatable(global_updates_object, GlobalUpdates)
				local profile = {
					Data = loaded_data.Data,
					MetaData = loaded_data.MetaData,
					MetaTagsUpdated = Madwork.NewScriptSignal(),

					RobloxMetaData = loaded_data.RobloxMetaData or {},
					UserIds = loaded_data.UserIds or {},
					KeyInfo = key_info,
					KeyInfoUpdated = Madwork.NewScriptSignal(),

					GlobalUpdates = global_updates_object,

					_profile_store = self,
					_profile_key = profile_key,

					_view_mode = true,

					_load_timestamp = os.clock(),
				}
				setmetatable(profile, Profile)
				global_updates_object._profile = profile
				-- Returning Profile object:
				return profile
			else
				task.wait() -- Overload prevention
			end
		end
		return nil -- If loop breaks return nothing
	end

	function ProfileStore:ProfileVersionQuery(profile_key, sort_direction, min_date, max_date, _use_mock) --> [ProfileVersionQuery]
		if type(profile_key) ~= "string" or string.len(profile_key) == 0 then
			error("[ProfileService]: Invalid profile_key")
		end

		if ProfileService.ServiceLocked == true then
			return setmetatable({}, ProfileVersionQuery) -- Silently fail :Next() requests
		end

		WaitForPendingProfileStore(self)

		if _use_mock == UseMockTag or UseMockDataStore == true then
			error("[ProfileService]: :ProfileVersionQuery() is not supported in mock mode")
		end

		-- Type check:
		if sort_direction ~= nil and (typeof(sort_direction) ~= "EnumItem"
			or sort_direction.EnumType ~= Enum.SortDirection) then
			error("[ProfileService]: Invalid sort_direction (" .. tostring(sort_direction) .. ")")
		end

		if min_date ~= nil and typeof(min_date) ~= "DateTime" and typeof(min_date) ~= "number" then
			error("[ProfileService]: Invalid min_date (" .. tostring(min_date) .. ")")
		end

		if max_date ~= nil and typeof(max_date) ~= "DateTime" and typeof(max_date) ~= "number" then
			error("[ProfileService]: Invalid max_date (" .. tostring(max_date) .. ")")
		end

		min_date = typeof(min_date) == "DateTime" and min_date.UnixTimestampMillis or min_date
		max_date = typeof(max_date) == "DateTime" and max_date.UnixTimestampMillis or max_date

		local profile_version_query = {
			_profile_store = self,
			_profile_key = profile_key,
			_sort_direction = sort_direction,
			_min_date = min_date,
			_max_date = max_date,

			_query_pages = nil,
			_query_index = 0,
			_query_failure = false,

			_is_query_yielded = false,
			_query_queue = {},
		}
		setmetatable(profile_version_query, ProfileVersionQuery)

		return profile_version_query

	end

	function ProfileStore:WipeProfileAsync(profile_key, _use_mock) --> is_wipe_successful [bool]
		if type(profile_key) ~= "string" or string.len(profile_key) == 0 then
			error("[ProfileService]: Invalid profile_key")
		end

		if ProfileService.ServiceLocked == true then
			return false
		end

		WaitForPendingProfileStore(self)

		local wipe_status = false

		if _use_mock == UseMockTag then -- Used when the profile is accessed through ProfileStore.Mock
			local mock_data_store = UserMockDataStore[self._profile_store_lookup]
			if mock_data_store ~= nil then
				mock_data_store[profile_key] = nil
			end
			wipe_status = true
			task.wait() -- Simulate API call yield
		elseif UseMockDataStore == true then -- Used when API access is disabled
			local mock_data_store = MockDataStore[self._profile_store_lookup]
			if mock_data_store ~= nil then
				mock_data_store[profile_key] = nil
			end
			wipe_status = true
			task.wait() -- Simulate API call yield
		else
			wipe_status = pcall(function()
				self._global_data_store:RemoveAsync(profile_key)
			end)
		end

		CustomWriteQueueMarkForCleanup(self._profile_store_lookup, profile_key)

		return wipe_status
	end

	-- New ProfileStore:

	function ProfileService.GetProfileStore(profile_store_index, profile_template) --> [ProfileStore]

		local profile_store_name
		local profile_store_scope = nil

		-- Parsing profile_store_index:
		if type(profile_store_index) == "string" then
			-- profile_store_index as string:
			profile_store_name = profile_store_index
		elseif type(profile_store_index) == "table" then
			-- profile_store_index as table:
			profile_store_name = profile_store_index.Name
			profile_store_scope = profile_store_index.Scope
		else
			error("[ProfileService]: Invalid or missing profile_store_index")
		end

		-- Type checking:
		if profile_store_name == nil or type(profile_store_name) ~= "string" then
			error("[ProfileService]: Missing or invalid \"Name\" parameter")
		elseif string.len(profile_store_name) == 0 then
			error("[ProfileService]: ProfileStore name cannot be an empty string")
		end

		if profile_store_scope ~= nil and (type(profile_store_scope) ~= "string" or string.len(profile_store_scope) == 0) then
			error("[ProfileService]: Invalid \"Scope\" parameter")
		end

		if type(profile_template) ~= "table" then
			error("[ProfileService]: Invalid profile_template")
		end

		local profile_store
		profile_store = {
			Mock = {
				LoadProfileAsync = function(_, profile_key, not_released_handler)
					return profile_store:LoadProfileAsync(profile_key, not_released_handler, UseMockTag)
				end,
				GlobalUpdateProfileAsync = function(_, profile_key, update_handler)
					return profile_store:GlobalUpdateProfileAsync(profile_key, update_handler, UseMockTag)
				end,
				ViewProfileAsync = function(_, profile_key, version)
					return profile_store:ViewProfileAsync(profile_key, version, UseMockTag)
				end,
				FindProfileVersionAsync = function(_, profile_key, sort_direction, min_date, max_date)
					return profile_store:FindProfileVersionAsync(profile_key, sort_direction, min_date, max_date, UseMockTag)
				end,
				WipeProfileAsync = function(_, profile_key)
					return profile_store:WipeProfileAsync(profile_key, UseMockTag)
				end
			},

			_profile_store_name = profile_store_name,
			_profile_store_scope = profile_store_scope,
			_profile_store_lookup = profile_store_name .. "\0" .. (profile_store_scope or ""),

			_profile_template = profile_template,
			_global_data_store = nil,
			_loaded_profiles = {},
			_profile_load_jobs = {},
			_mock_loaded_profiles = {},
			_mock_profile_load_jobs = {},
			_is_pending = false,
		}
		setmetatable(profile_store, ProfileStore)

		local options = Instance.new("DataStoreOptions")
		options:SetExperimentalFeatures({v2 = true})

		if IsLiveCheckActive == true then
			profile_store._is_pending = true
			task.spawn(function()
				WaitForLiveAccessCheck()
				if UseMockDataStore == false then
					profile_store._global_data_store = DataStoreService:GetDataStore(profile_store_name, profile_store_scope, options)
				end
				profile_store._is_pending = false
			end)
		else
			if UseMockDataStore == false then
				profile_store._global_data_store = DataStoreService:GetDataStore(profile_store_name, profile_store_scope, options)
			end
		end

		return profile_store
	end

	function ProfileService.IsLive() --> [bool] -- (CAN YIELD!!!)

		WaitForLiveAccessCheck()

		return UseMockDataStore == false

	end

	----- Initialize -----

	if IsStudio == true then
		IsLiveCheckActive = true
		task.spawn(function()
			local status, message = pcall(function()
				-- This will error if current instance has no Studio API access:
				DataStoreService:GetDataStore("____PS"):SetAsync("____PS", os.time())
			end)
			local no_internet_access = status == false and string.find(message, "HTTP 404", 1, true) ~= nil
			if no_internet_access == true then
				warn("[ProfileService]: No internet access - check your network connection")
			end
			if status == false and
				(string.find(message, "403", 1, true) ~= nil or -- Cannot write to DataStore from studio if API access is not enabled
					string.find(message, "must publish", 1, true) ~= nil or -- Game must be published to access live keys
					no_internet_access == true) then -- No internet access

				UseMockDataStore = true
				ProfileService._use_mock_data_store = true
				print("[ProfileService]: Roblox API services unavailable - data will not be saved")
			else
				--print("[ProfileService]: Roblox API services available - data will be saved")
			end
			IsLiveCheckActive = false
		end)
	end

	----- Connections -----

	-- Auto saving and issue queue managing:
	RunService.Heartbeat:Connect(function()
		-- 1) Auto saving: --
		local auto_save_list_length = #AutoSaveList
		if auto_save_list_length > 0 then
			local auto_save_index_speed = SETTINGS.AutoSaveProfiles / auto_save_list_length
			local os_clock = os.clock()
			while os_clock - LastAutoSave > auto_save_index_speed do
				LastAutoSave = LastAutoSave + auto_save_index_speed
				local profile = AutoSaveList[AutoSaveIndex]
				if os_clock - profile._load_timestamp < SETTINGS.AutoSaveProfiles then
					-- This profile is freshly loaded - auto-saving immediately after loading will cause a warning in the log:
					profile = nil
					for _ = 1, auto_save_list_length - 1 do
						-- Move auto save index to the right:
						AutoSaveIndex = AutoSaveIndex + 1
						if AutoSaveIndex > auto_save_list_length then
							AutoSaveIndex = 1
						end
						profile = AutoSaveList[AutoSaveIndex]
						if os_clock - profile._load_timestamp >= SETTINGS.AutoSaveProfiles then
							break
						else
							profile = nil
						end
					end
				end
				-- Move auto save index to the right:
				AutoSaveIndex = AutoSaveIndex + 1
				if AutoSaveIndex > auto_save_list_length then
					AutoSaveIndex = 1
				end
				-- Perform save call:
				if profile ~= nil then
					task.spawn(SaveProfileAsync, profile) -- Auto save profile in new thread
				end
			end
		end
		-- 2) Issue queue: --
		-- Critical state handling:
		if ProfileService.CriticalState == false then
			if #IssueQueue >= SETTINGS.IssueCountForCriticalState then
				ProfileService.CriticalState = true
				ProfileService.CriticalStateSignal:Fire(true)
				CriticalStateStart = os.clock()
				warn("[ProfileService]: Entered critical state")
			end
		else
			if #IssueQueue >= SETTINGS.IssueCountForCriticalState then
				CriticalStateStart = os.clock()
			elseif os.clock() - CriticalStateStart > SETTINGS.CriticalStateLast then
				ProfileService.CriticalState = false
				ProfileService.CriticalStateSignal:Fire(false)
				warn("[ProfileService]: Critical state ended")
			end
		end
		-- Issue queue:
		while true do
			local issue_time = IssueQueue[1]
			if issue_time == nil then
				break
			elseif os.clock() - issue_time > SETTINGS.IssueLast then
				table.remove(IssueQueue, 1)
			else
				break
			end
		end
	end)

	-- Release all loaded profiles when the server is shutting down:
	task.spawn(function()
		WaitForLiveAccessCheck()
		Madwork.ConnectToOnClose(
			function()
				ProfileService.ServiceLocked = true
				-- 1) Release all active profiles: --
				-- Clone AutoSaveList to a new table because AutoSaveList changes when profiles are released:
				local on_close_save_job_count = 0
				local active_profiles = {}
				for index, profile in ipairs(AutoSaveList) do
					active_profiles[index] = profile
				end
				-- Release the profiles; Releasing profiles can trigger listeners that release other profiles, so check active state:
				for _, profile in ipairs(active_profiles) do
					if profile:IsActive() == true then
						on_close_save_job_count = on_close_save_job_count + 1
						task.spawn(function() -- Save profile on new thread
							SaveProfileAsync(profile, true)
							on_close_save_job_count = on_close_save_job_count - 1
						end)
					end
				end
				-- 2) Yield until all active profile jobs are finished: --
				while on_close_save_job_count > 0 or ActiveProfileLoadJobs > 0 or ActiveProfileSaveJobs > 0 do
					task.wait()
				end
				return -- We're done!
			end,
			UseMockDataStore == false -- Always run this OnClose task if using Roblox API services
		)
	end)

	return ProfileService
end

return function(config,cb)
	if config.User.SaveData.Advanced.HandleOwnData then
		local profiles = {
			raw = {}
		}
		
		local players = game:GetService("Players")
		local registered,registered2;
		local default = function() end
		
		local getProfile = function(plr)
			local attempts = 0
			if not registered then
				if(attempts > 10) then 
					attempts = -9999999999
					warn("[Handling own data, please call api:registerGetProfileFunction(<function>)")
				end
				attempts += 1
				repeat
					task.wait()
				until registered
			end
			local success,response = pcall(function()
				return registered(plr)
			end)
			if success and response then
				return true,response
			else
				warn("[failed to load profile for",plr,"?]")
				return false,nil
			end
		end
		
		local unload = function(plr)
			(registered2 or default)(plr)
		end

		function profiles:get(player)
			return getProfile(player)
		end
		
		function profiles.new()
			local playerAdded = function(plr)
				profiles.raw[plr] = ({getProfile(plr)})[2]
			end
			local disconnect = function(plr)
				unload(plr)
				profiles.raw[plr] = nil
			end
			players.PlayerRemoving:Connect(disconnect)
			players.PlayerAdded:Connect(playerAdded)
			for _,player in pairs(players:GetPlayers()) do
				task.spawn(playerAdded,player)
			end
		end
		
		function profiles:register(callback)
			registered = callback
		end
		
		function profiles:register2(callback)
			registered2 = callback
		end
		
		return profiles
	else
		local constructors
		local profiles,pending,initialized = {raw = {}},{},false
		local profileService = module()
		local players = game:GetService("Players")

		local handleRelease = function(player)
			player:Kick("[Data could not be loaded]")
		end

		function profiles:get(player)
			if(initialized) then
				if(not profiles.raw[player]) then
					local event = Instance.new("BindableEvent")
					task.delay(0,function()
						local running = coroutine.running()
						pending[player] = pending[player] or {}
						table.insert(pending[player],running)
						coroutine.yield()
						event:Fire()
					end)
					event.Event:Wait()
					event:Destroy()
				end
				local current = profiles.raw[player]
				return (current and true or false),(current and current["Data"] or nil)
			else
				return true,{}
			end
		end

		function profiles.new(name)
			initialized = true
			local profileStore = profileService.GetProfileStore(name,{})
			local playerAdded = function(player)
				local profile = profileStore:LoadProfileAsync("pl-"..tostring(player.UserId))
				if(profile ~= nil) then
					profile:AddUserId(player.UserId)
					profile:Reconcile()
					profile:ListenToRelease(function()
						profiles.raw[player] = nil
						handleRelease(player)
					end)
					if(player:GetFullName() ~= player.Name) then
						profiles.raw[player] = profile
					else
						profile:Release()
					end
				else
					handleRelease(player)
				end
				if(pending[player]) then
					for _,thread in pairs(pending[player]) do
						coroutine.resume(thread)
					end
					pending[player] = nil
				end
			end

			local disconnectProfile = function(player)
				if(profiles.raw[player] ~= nil) then
					profiles.raw[player]:Release()
				end
			end

			players.PlayerRemoving:Connect(disconnectProfile)
			players.PlayerAdded:Connect(playerAdded)
			for _,player in pairs(players:GetPlayers()) do
				task.spawn(playerAdded,player)
			end
		end

		return profiles
	end
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
--[[
	-------------------------------
	---       INFORMATION       ---
	-------------------------------
	
	Written by Haoqian He
	Edited/Forked by Scarious
	
	This is the forked version of the LibDeflate library by Haoqian He intended for luau. Credit for the original source code and such
	goes to their respective creators (basic credits can be viewed under CREDITS, and more expansive credits/licensing info can be viewed
	under LICENSING AND COPYRIGHT.
	
	Original documentation can be viewed here: https://safeteewow.github.io/LibDeflate/source/LibDeflate.lua.html
	
	You can access the LibDeflate library (and most LibDeflate methods seen in the original documentation) by using Compression.Library
	
	
	-------------------------------
	---      DOCUMENTATION      ---
	-------------------------------
	
	Compression Methods:
	
	Compression.Deflate.Compress(data, configs?)
	Compression.Zlib.Compress(data, configs?)
	
	
	Decompression Methods:
	
	Compression.Deflate.Decompress(compressedData)
	Compression.Zlib.Decompress(compressedData)
	
	
	USAGE:
	
		configs table:
	
		{
			level = 0; -- integer 0 -> 9 where 0 is no compression and 9 is most compression
			strategy = "" -- "huffman_only", "fixed", "dynamic"
		}
		
		note :: the higher the level, the slower the compression will be
			 :: configs table is optional, if not supplied (aka nil) default level+strategy will be used
			 
		
		methods:
		
		Method: Compression.Deflate.Compress(data, configs?):
	
			Description: Compresses a string using the raw deflate format
			
			Input:
				- String: data = The data to be compressed
				- table?: configs = The configuration table to control the compression
				
			Output:
				- String: compressedData = The compressed data
				- int: paddedBits = The number of bits padded at the end of the output


		Method: Compression.Deflate.Decompress(compressedData):
	
			Description: Decompresses a raw deflate compressed data.
			
			Input:
				- String: compressedData = The data to be decompressed
				
			Output:
				- String: data = The decompressed data



		Method: Compression.Zlib.Compress(data, configs?):
	
			Description: Compresses a string using the zlib format
			
			Input:
				- String: data = The data to be compressed
				- table?: configs = The configuration table to control the compression
				
			Output:
				- String: compressedData = The compressed data
				- int: paddedBits = The number of bits padded at the end of the output
		
		
		Method: Compression.Deflate.Decompress(compressedData):
	
			Description: Decompresses a zlib compressed data.
			
			Input:
				- String: compressedData = The data to be decompressed
				
			Output:
				- String: data = The decompressed data
		
		
	-------------------------------
	---         CREDITS         ---
	-------------------------------
	
	- LibDeflate Library: Haoqian He
	- zlib: Jean-loup Gailly and Mark Adler
	- puff: Mark Adler
	- LibCompress: jjsheets and Galmok (WoW)
	- 6bit encoding/decoding: WeakAuras2 (WoW)
	

	-------------------------------
	--- LICENSING AND COPYRIGHT ---
	-------------------------------

	LibDeflate 1.0.2-release <br>
	Pure Lua compressor and decompressor with high compression ratio using
	DEFLATE/zlib format.
	@file LibDeflate.lua
	@author Haoqian He (Github: SafeteeWoW; World of Warcraft: Safetyy-Illidan(US))
	@copyright LibDeflate <2018-2020> Haoqian He
	@license zlib License
	This library is implemented according to the following specifications.
	Report a bug if LibDeflate is not fully compliant with those specs.
	Both compressors and decompressors have been implemented in the library.
	1. RFC1950: DEFLATE Compressed Data Format Specification version 1.3
	https://tools.ietf.org/html/rfc1951
	2. RFC1951: ZLIB Compressed Data Format Specification version 3.3
	https://tools.ietf.org/html/rfc1950


	zlib License
	(C) 2018-2020 Haoqian He
	This software is provided 'as-is', without any express or implied
	warranty.  In no event will the authors be held liable for any damages
	arising from the use of this software.
	Permission is granted to anyone to use this software for any purpose,
	including commercial applications, and to alter it and redistribute it
	freely, subject to the following restrictions:
	1. The origin of this software must not be misrepresented; you must not
	   claim that you wrote the original software. If you use this software
	   in a product, an acknowledgment in the product documentation would be
	   appreciated but is not required.
	2. Altered source versions must be plainly marked as such, and must not be
	   misrepresented as being the original software.
	3. This notice may not be removed or altered from any source distribution.
	License History:
		1. GNU General Public License Version 3 in v1.0.0 and earlier versions.
		2. GNU Lesser General Public License Version 3 in v1.0.1
		3. the zlib License since v1.0.2
		
	Credits and Disclaimer:
	This library rewrites the code from the algorithm
	and the ideas of the following projects,
	and uses their code to help to test the correctness of this library,
	but their code is not included directly in the library itself.
	Their original licenses shall be comply when used:
		1. zlib, by Jean-loup Gailly (compression) and Mark Adler (decompression).
			http://www.zlib.net/
			Licensed under zlib License. http://www.zlib.net/zlib_license.html
			For the compression algorithm.
		2. puff, by Mark Adler. https://github.com/madler/zlib/tree/master/contrib/puff
			Licensed under zlib License. http://www.zlib.net/zlib_license.html
			For the decompression algorithm.
		3. LibCompress, by jjsheets and Galmok of European Stormrage (Horde)
			https://www.wowace.com/projects/libcompress
			Licensed under GPLv2.
			https://www.gnu.org/licenses/old-licenses/gpl-2.0.html
			For the code to create customized codec.
		4. WeakAuras2,
			https://github.com/WeakAuras/WeakAuras2
			Licensed under GPLv2.
			For the 6bit encoding and decoding.
]]

local Compression = {}
local LibDeflate = {}

Compression.Deflate = {}
Compression.Zlib = {}
Compression.Library = LibDeflate

--[[
	Method: Compression.Deflate.Compress
	
	Description: Compresses a string using the raw deflate format
	
	Input:
		- String: data = The data to be compressed
		- table?: configs = The configuration table to control the compression
		
	Output:
		- String: compressedData = The compressed data
		- int: paddedBits = The number of bits padded at the end of the output
		
	For more information see:
		- LibDeflate:CompressDeflate
		- compression_configs
]]

function Compression.Deflate.Compress(data, configs)
	return LibDeflate:CompressDeflate(data, configs)
end


--[[
	Method: Compression.Deflate.Decompress
	
	Description: Decompresses a raw deflate compressed data.
	
	Input:
		- String: compressedData = The data to be decompressed
		
	Output:
		- String: data = The decompressed data
		
	For more information see:
		- LibDeflate:DecompressDeflate
		- compression_configs
]]

function Compression.Deflate.Decompress(compressedData)
	return LibDeflate:DecompressDeflate(compressedData)
end



--[[
	Method: Compression.Zlib.Compress
	
	Description: Compresses a string using the zlib format
	
	Input:
		- String: data = The data to be compressed
		- table?: configs = The configuration table to control the compression
		
	Output:
		- String: compressedData = The compressed data
		- int: paddedBits = The number of bits padded at the end of the output
		
	For more information see:
		- LibDeflate:CompressZlib
		- compression_configs
]]

function Compression.Zlib.Compress(data, configs)
	return LibDeflate:CompressZlib(data, configs)
end


--[[
	Method: Compression.Deflate.Decompress
	
	Description: Decompresses a zlib compressed data.
	
	Input:
		- String: compressedData = The data to be decompressed
		
	Output:
		- String: data = The decompressed data
		
	For more information see:
		- LibDeflate:DecompressZlib
		- compression_configs
]]

function Compression.Zlib.Decompress(compressedData)
	return LibDeflate:DecompressZlib(compressedData)
end





--[[

	LIBDEFLATE LIBRARY:

]]


do
	-- Semantic version. all lowercase.
	-- Suffix can be alpha1, alpha2, beta1, beta2, rc1, rc2, etc.
	-- NOTE: Two version numbers needs to modify.
	-- 1. On the top of LibDeflate.lua
	-- 2. _VERSION
	-- 3. _MINOR
	
	-- version to store the official version of LibDeflate
	local _VERSION = "1.0.2-release"
	
	-- When MAJOR is changed, I should name it as LibDeflate2
	local _MAJOR = "LibDeflate"
	
	-- Update this whenever a new version, for LibStub version registration.
	-- 0 : v0.x
	-- 1 : v1.0.0
	-- 2 : v1.0.1
	-- 3 : v1.0.2
	local _MINOR = 3
	
	local _COPYRIGHT =
		"LibDeflate ".._VERSION
		.." Copyright (C) 2018-2020 Haoqian He."
		.." Licensed under the zlib License"
	
	-- Register in the World of Warcraft library "LibStub" if detected.
	LibDeflate = {}
	
	LibDeflate._VERSION = _VERSION
	LibDeflate._MAJOR = _MAJOR
	LibDeflate._MINOR = _MINOR
	LibDeflate._COPYRIGHT = _COPYRIGHT
end

-- localize Lua api for faster access.
local assert = assert
local error = error
local pairs = pairs
local string_byte = string.byte
local string_char = string.char
local string_find = string.find
local string_gsub = string.gsub
local string_sub = string.sub
local table_concat = table.concat
local table_sort = table.sort
local tostring = tostring
local type = type

-- Converts i to 2^i, (0<=i<=32)
-- This is used to implement bit left shift and bit right shift.
-- "x >> y" in C:   "(x-x%_pow2[y])/_pow2[y]" in Lua
-- "x << y" in C:   "x*_pow2[y]" in Lua
local _pow2 = {}

-- Converts any byte to a character, (0<=byte<=255)
local _byte_to_char = {}

-- _reverseBitsTbl[len][val] stores the bit reverse of
-- the number with bit length "len" and value "val"
-- For example, decimal number 6 with bits length 5 is binary 00110
-- It's reverse is binary 01100,
-- which is decimal 12 and 12 == _reverseBitsTbl[5][6]
-- 1<=len<=9, 0<=val<=2^len-1
-- The reason for 1<=len<=9 is that the max of min bitlen of huffman code
-- of a huffman alphabet is 9?
local _reverse_bits_tbl = {}

-- Convert a LZ77 length (3<=len<=258) to
-- a deflate literal/LZ77_length code (257<=code<=285)
local _length_to_deflate_code = {}

-- convert a LZ77 length (3<=len<=258) to
-- a deflate literal/LZ77_length code extra bits.
local _length_to_deflate_extra_bits = {}

-- Convert a LZ77 length (3<=len<=258) to
-- a deflate literal/LZ77_length code extra bit length.
local _length_to_deflate_extra_bitlen = {}

-- Convert a small LZ77 distance (1<=dist<=256) to a deflate code.
local _dist256_to_deflate_code = {}

-- Convert a small LZ77 distance (1<=dist<=256) to
-- a deflate distance code extra bits.
local _dist256_to_deflate_extra_bits = {}

-- Convert a small LZ77 distance (1<=dist<=256) to
-- a deflate distance code extra bit length.
local _dist256_to_deflate_extra_bitlen = {}

-- Convert a literal/LZ77_length deflate code to LZ77 base length
-- The key of the table is (code - 256), 257<=code<=285
local _literal_deflate_code_to_base_len = {
	3, 4, 5, 6, 7, 8, 9, 10, 11, 13, 15, 17, 19, 23, 27, 31,
	35, 43, 51, 59, 67, 83, 99, 115, 131, 163, 195, 227, 258,
}

-- Convert a literal/LZ77_length deflate code to base LZ77 length extra bits
-- The key of the table is (code - 256), 257<=code<=285
local _literal_deflate_code_to_extra_bitlen = {
	0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2,
	3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 0,
}

-- Convert a distance deflate code to base LZ77 distance. (0<=code<=29)
local _dist_deflate_code_to_base_dist = {
	[0] = 1, 2, 3, 4, 5, 7, 9, 13, 17, 25, 33, 49, 65, 97, 129, 193,
	257, 385, 513, 769, 1025, 1537, 2049, 3073, 4097, 6145,
	8193, 12289, 16385, 24577,
}

-- Convert a distance deflate code to LZ77 bits length. (0<=code<=29)
local _dist_deflate_code_to_extra_bitlen = {
	[0] = 0, 0, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6,
	7, 7, 8, 8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 13,
}

-- The code order of the first huffman header in the dynamic deflate block.
-- See the page 12 of RFC1951
local _rle_codes_huffman_bitlen_order = {16, 17, 18,
	0, 8, 7, 9, 6, 10, 5, 11, 4, 12, 3, 13, 2, 14, 1, 15,
}

-- The following tables are used by fixed deflate block.
-- The value of these tables are assigned at the bottom of the source.

-- The huffman code of the literal/LZ77_length deflate codes,
-- in fixed deflate block.
local _fix_block_literal_huffman_code

-- Convert huffman code of the literal/LZ77_length to deflate codes,
-- in fixed deflate block.
local _fix_block_literal_huffman_to_deflate_code

-- The bit length of the huffman code of literal/LZ77_length deflate codes,
-- in fixed deflate block.
local _fix_block_literal_huffman_bitlen

-- The count of each bit length of the literal/LZ77_length deflate codes,
-- in fixed deflate block.
local _fix_block_literal_huffman_bitlen_count

-- The huffman code of the distance deflate codes,
-- in fixed deflate block.
local _fix_block_dist_huffman_code

-- Convert huffman code of the distance to deflate codes,
-- in fixed deflate block.
local _fix_block_dist_huffman_to_deflate_code

-- The bit length of the huffman code of the distance deflate codes,
-- in fixed deflate block.
local _fix_block_dist_huffman_bitlen

-- The count of each bit length of the huffman code of
-- the distance deflate codes,
-- in fixed deflate block.
local _fix_block_dist_huffman_bitlen_count

for i = 0, 255 do
	_byte_to_char[i] = string_char(i)
end

do
	local pow = 1
	for i = 0, 32 do
		_pow2[i] = pow
		pow = pow * 2
	end
end

for i = 1, 9 do
	_reverse_bits_tbl[i] = {}
	for j=0, _pow2[i+1]-1 do
		local reverse = 0
		local value = j
		for _ = 1, i do
			-- The following line is equivalent to "res | (code %2)" in C.
			reverse = reverse - reverse%2
			+ (((reverse%2==1) or (value % 2) == 1) and 1 or 0)
			value = (value-value%2)/2
			reverse = reverse * 2
		end
		_reverse_bits_tbl[i][j] = (reverse-reverse%2)/2
	end
end

-- The source code is written according to the pattern in the numbers
-- in RFC1951 Page10.
do
	local a = 18
	local b = 16
	local c = 265
	local bitlen = 1
	for len = 3, 258 do
		if len <= 10 then
			_length_to_deflate_code[len] = len + 254
			_length_to_deflate_extra_bitlen[len] = 0
		elseif len == 258 then
			_length_to_deflate_code[len] = 285
			_length_to_deflate_extra_bitlen[len] = 0
		else
			if len > a then
				a = a + b
				b = b * 2
				c = c + 4
				bitlen = bitlen + 1
			end
			local t = len-a-1+b/2
			_length_to_deflate_code[len] = (t-(t%(b/8)))/(b/8) + c
			_length_to_deflate_extra_bitlen[len] = bitlen
			_length_to_deflate_extra_bits[len] = t % (b/8)
		end
	end
end

-- The source code is written according to the pattern in the numbers
-- in RFC1951 Page11.
do
	_dist256_to_deflate_code[1] = 0
	_dist256_to_deflate_code[2] = 1
	_dist256_to_deflate_extra_bitlen[1] = 0
	_dist256_to_deflate_extra_bitlen[2] = 0
	
	local a = 3
	local b = 4
	local code = 2
	local bitlen = 0
	for dist = 3, 256 do
		if dist > b then
			a = a * 2
			b = b * 2
			code = code + 2
			bitlen = bitlen + 1
		end
		_dist256_to_deflate_code[dist] = (dist <= a) and code or (code+1)
		_dist256_to_deflate_extra_bitlen[dist] = (bitlen < 0) and 0 or bitlen
		if b >= 8 then
			_dist256_to_deflate_extra_bits[dist] = (dist-b/2-1) % (b/4)
		end
	end
end

--- Calculate the Adler-32 checksum of the string. <br>
-- See RFC1950 Page 9 https://tools.ietf.org/html/rfc1950 for the
-- definition of Adler-32 checksum.
-- @param str [string] the input string to calcuate its Adler-32 checksum.
-- @return [integer] The Adler-32 checksum, which is greater or equal to 0,
-- and less than 2^32 (4294967296).
function LibDeflate:Adler32(str)
	-- This function is loop unrolled by better performance.
	--
	-- Here is the minimum code:
	--
	-- local a = 1
	-- local b = 0
	-- for i=1, #str do
	-- 		local s = string.byte(str, i, i)
	-- 		a = (a+s)%65521
	-- 		b = (b+a)%65521
	-- 		end
	-- return b*65536+a
	if type(str) ~= "string" then
		error(("Usage: LibDeflate:Adler32(str):"
			.." 'str' - string expected got '%s'."):format(type(str)), 2)
	end
	local strlen = #str
	
	local i = 1
	local a = 1
	local b = 0
	while i <= strlen - 15 do
		local x1, x2, x3, x4, x5, x6, x7, x8,
		x9, x10, x11, x12, x13, x14, x15, x16 = string_byte(str, i, i+15)
		b = (b+16*a+16*x1+15*x2+14*x3+13*x4+12*x5+11*x6+10*x7+9*x8+8*x9
			+7*x10+6*x11+5*x12+4*x13+3*x14+2*x15+x16)%65521
		a = (a+x1+x2+x3+x4+x5+x6+x7+x8+x9+x10+x11+x12+x13+x14+x15+x16)%65521
		i =  i + 16
	end
	while (i <= strlen) do
		local x = string_byte(str, i, i)
		a = (a + x) % 65521
		b = (b + a) % 65521
		i = i + 1
	end
	return (b*65536+a) % 4294967296
end

-- Compare adler32 checksum.
-- adler32 should be compared with a mod to avoid sign problem
-- 4072834167 (unsigned) is the same adler32 as -222133129
local function IsEqualAdler32(actual, expected)
	return (actual % 4294967296) == (expected % 4294967296)
end

--- Create a preset dictionary.
--
-- This function is not fast, and the memory consumption of the produced
-- dictionary is about 50 times of the input string. Therefore, it is suggestted
-- to run this function only once in your program.
--
-- It is very important to know that if you do use a preset dictionary,
-- compressors and decompressors MUST USE THE SAME dictionary. That is,
-- dictionary must be created using the same string. If you update your program
-- with a new dictionary, people with the old version won't be able to transmit
-- data with people with the new version. Therefore, changing the dictionary
-- must be very careful.
--
-- The parameters "strlen" and "adler32" add a layer of verification to ensure
-- the parameter "str" is not modified unintentionally during the program
-- development.
--
-- @usage local dict_str = "1234567890"
--
-- -- print(dict_str:len(), LibDeflate:Adler32(dict_str))
-- -- Hardcode the print result below to verify it to avoid acciently
-- -- modification of 'str' during the program development.
-- -- string length: 10, Adler-32: 187433486,
-- -- Don't calculate string length and its Adler-32 at run-time.
--
-- local dict = LibDeflate:CreateDictionary(dict_str, 10, 187433486)
--
-- @param str [string] The string used as the preset dictionary. <br>
-- You should put stuffs that frequently appears in the dictionary
-- string and preferablely put more frequently appeared stuffs toward the end
-- of the string. <br>
-- Empty string and string longer than 32768 bytes are not allowed.
-- @param strlen [integer] The length of 'str'. Please pass in this parameter
-- as a hardcoded constant, in order to verify the content of 'str'. The value
-- of this parameter should be known before your program runs.
-- @param adler32 [integer] The Adler-32 checksum of 'str'. Please pass in this
-- parameter as a hardcoded constant, in order to verify the content of 'str'.
-- The value of this parameter should be known before your program runs.
-- @return  [table] The dictionary used for preset dictionary compression and
-- decompression.
-- @raise error if 'strlen' does not match the length of 'str',
-- or if 'adler32' does not match the Adler-32 checksum of 'str'.
function LibDeflate:CreateDictionary(str, strlen, adler32)
	if type(str) ~= "string" then
		error(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32):"
			.." 'str' - string expected got '%s'."):format(type(str)), 2)
	end
	if type(strlen) ~= "number" then
		error(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32):"
			.." 'strlen' - number expected got '%s'."):format(
				type(strlen)), 2)
	end
	if type(adler32) ~= "number" then
		error(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32):"
			.." 'adler32' - number expected got '%s'."):format(
				type(adler32)), 2)
	end
	if strlen ~= #str then
		error(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32):"
			.." 'strlen' does not match the actual length of 'str'."
			.." 'strlen': %u, '#str': %u ."
			.." Please check if 'str' is modified unintentionally.")
			:format(strlen, #str))
	end
	if strlen == 0 then
		error(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32):"
			.." 'str' - Empty string is not allowed."), 2)
	end
	if strlen > 32768 then
		error(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32):"
			.." 'str' - string longer than 32768 bytes is not allowed."
			.." Got %d bytes."):format(strlen), 2)
	end
	local actual_adler32 = self:Adler32(str)
	if not IsEqualAdler32(adler32, actual_adler32) then
		error(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32):"
			.." 'adler32' does not match the actual adler32 of 'str'."
			.." 'adler32': %u, 'Adler32(str)': %u ."
			.." Please check if 'str' is modified unintentionally.")
			:format(adler32, actual_adler32))
	end
	
	local dictionary = {}
	dictionary.adler32 = adler32
	dictionary.hash_tables = {}
	dictionary.string_table = {}
	dictionary.strlen = strlen
	local string_table = dictionary.string_table
	local hash_tables = dictionary.hash_tables
	string_table[1] = string_byte(str, 1, 1)
	string_table[2] = string_byte(str, 2, 2)
	if strlen >= 3 then
		local i = 1
		local hash = string_table[1]*256+string_table[2]
		while i <= strlen - 2 - 3 do
			local x1, x2, x3, x4 = string_byte(str, i+2, i+5)
			string_table[i+2] = x1
			string_table[i+3] = x2
			string_table[i+4] = x3
			string_table[i+5] = x4
			hash = (hash*256+x1)%16777216
			local t = hash_tables[hash]
			if not t then t = {}; hash_tables[hash] = t end
			t[#t+1] = i-strlen
			i = i + 1
			hash = (hash*256+x2)%16777216
			t = hash_tables[hash]
			if not t then t = {}; hash_tables[hash] = t end
			t[#t+1] = i-strlen
			i = i + 1
			hash = (hash*256+x3)%16777216
			t = hash_tables[hash]
			if not t then t = {}; hash_tables[hash] = t end
			t[#t+1] = i-strlen
			i = i + 1
			hash = (hash*256+x4)%16777216
			t = hash_tables[hash]
			if not t then t = {}; hash_tables[hash] = t end
			t[#t+1] = i-strlen
			i = i + 1
		end
		while i <= strlen - 2 do
			local x = string_byte(str, i+2)
			string_table[i+2] = x
			hash = (hash*256+x)%16777216
			local t = hash_tables[hash]
			if not t then t = {}; hash_tables[hash] = t end
			t[#t+1] = i-strlen
			i = i + 1
		end
	end
	return dictionary
end

-- Check if the dictionary is valid.
-- @param dictionary The preset dictionary for compression and decompression.
-- @return true if valid, false if not valid.
-- @return if not valid, the error message.
local function IsValidDictionary(dictionary)
	if type(dictionary) ~= "table" then
		return false, ("'dictionary' - table expected got '%s'.")
		:format(type(dictionary))
	end
	if type(dictionary.adler32) ~= "number"
		or type(dictionary.string_table) ~= "table"
		or type(dictionary.strlen) ~= "number"
		or dictionary.strlen <= 0
		or dictionary.strlen > 32768
		or dictionary.strlen ~= #dictionary.string_table
		or type(dictionary.hash_tables) ~= "table"
	then
		return false, ("'dictionary' - corrupted dictionary.")
		:format(type(dictionary))
	end
	return true, ""
end

--[[
	key of the configuration table is the compression level,
	and its value stores the compression setting.
	These numbers come from zlib source code.
	Higher compression level usually means better compression.
	(Because LibDeflate uses a simplified version of zlib algorithm,
	there is no guarantee that higher compression level does not create
	bigger file than lower level, but I can say it's 99% likely)
	Be careful with the high compression level. This is a pure lua
	implementation compressor/decompressor, which is significant slower than
	a C/C++ equivalant compressor/decompressor. Very high compression level
	costs significant more CPU time, and usually compression size won't be
	significant smaller when you increase compression level by 1, when the
	level is already very high. Benchmark yourself if you can afford it.
	See also https://github.com/madler/zlib/blob/master/doc/algorithm.txt,
	https://github.com/madler/zlib/blob/master/deflate.c for more information.
	The meaning of each field:
	@field 1 use_lazy_evaluation:
		true/false. Whether the program uses lazy evaluation.
		See what is "lazy evaluation" in the link above.
		lazy_evaluation improves ratio, but relatively slow.
	@field 2 good_prev_length:
		Only effective if lazy is set, Only use 1/4 of max_chain,
		if prev length of lazy match is above this.
	@field 3 max_insert_length/max_lazy_match:
		If not using lazy evaluation,
		insert new strings in the hash table only if the match length is not
		greater than this length.
		If using lazy evaluation, only continue lazy evaluation,
		if previous match length is strictly smaller than this value.
	@field 4 nice_length:
		Number. Don't continue to go down the hash chain,
		if match length is above this.
	@field 5 max_chain:
		Number. The maximum number of hash chains we look.
--]]
local _compression_level_configs = {
	[0] = {false, nil, 0, 0, 0}, -- level 0, no compression
	[1] = {false, nil, 4, 8, 4}, -- level 1, similar to zlib level 1
	[2] = {false, nil, 5, 18, 8}, -- level 2, similar to zlib level 2
	[3] = {false, nil, 6, 32, 32},	-- level 3, similar to zlib level 3
	[4] = {true, 4,	4, 16, 16},	-- level 4, similar to zlib level 4
	[5] = {true, 8,	16,	32,	32}, -- level 5, similar to zlib level 5
	[6] = {true, 8,	16,	128, 128}, -- level 6, similar to zlib level 6
	[7] = {true, 8,	32,	128, 256}, -- (SLOW) level 7, similar to zlib level 7
	[8] = {true, 32, 128, 258, 1024} , --(SLOW) level 8,similar to zlib level 8
	[9] = {true, 32, 258, 258, 4096},
	-- (VERY SLOW) level 9, similar to zlib level 9
}

-- Check if the compression/decompression arguments is valid
-- @param str The input string.
-- @param check_dictionary if true, check if dictionary is valid.
-- @param dictionary The preset dictionary for compression and decompression.
-- @param check_configs if true, check if config is valid.
-- @param configs The compression configuration table
-- @return true if valid, false if not valid.
-- @return if not valid, the error message.
local function IsValidArguments(str,
	check_dictionary, dictionary,
	check_configs, configs)
	
	if type(str) ~= "string" then
		return false,
			("'str' - string expected got '%s'."):format(type(str))
	end
	if check_dictionary then
		local dict_valid, dict_err = IsValidDictionary(dictionary)
		if not dict_valid then
			return false, dict_err
		end
	end
	if check_configs then
		local type_configs = type(configs)
		if type_configs ~= "nil" and type_configs ~= "table" then
			return false,
				("'configs' - nil or table expected got '%s'.")
			:format(type(configs))
		end
		if type_configs == "table" then
			for k, v in pairs(configs) do
				if k ~= "level" and k ~= "strategy" then
					return false,
						("'configs' - unsupported table key in the configs: '%s'.")
					:format(k)
				elseif k == "level" and not _compression_level_configs[v] then
					return false,
						("'configs' - unsupported 'level': %s."):format(tostring(v))
				elseif k == "strategy" and v ~= "fixed" and v ~= "huffman_only"
					and v ~= "dynamic" then
					-- random_block_type is for testing purpose
					return false, ("'configs' - unsupported 'strategy': '%s'.")
					:format(tostring(v))
				end
			end
		end
	end
	return true, ""
end



--[[ --------------------------------------------------------------------------
	Compress code
--]] --------------------------------------------------------------------------

-- partial flush to save memory
local _FLUSH_MODE_MEMORY_CLEANUP = 0
-- full flush with partial bytes
local _FLUSH_MODE_OUTPUT = 1
-- write bytes to get to byte boundary
local _FLUSH_MODE_BYTE_BOUNDARY = 2
-- no flush, just get num of bits written so far
local _FLUSH_MODE_NO_FLUSH = 3

--[[
	Create an empty writer to easily write stuffs as the unit of bits.
	Return values:
	1. WriteBits(code, bitlen):
	2. WriteString(str):
	3. Flush(mode):
--]]
local function CreateWriter()
	local buffer_size = 0
	local cache = 0
	local cache_bitlen = 0
	local total_bitlen = 0
	local buffer = {}
	-- When buffer is big enough, flush into result_buffer to save memory.
	local result_buffer = {}
	
	-- Write bits with value "value" and bit length of "bitlen" into writer.
	-- @param value: The value being written
	-- @param bitlen: The bit length of "value"
	-- @return nil
	local function WriteBits(value, bitlen)
		cache = cache + value * _pow2[cache_bitlen]
		cache_bitlen = cache_bitlen + bitlen
		total_bitlen = total_bitlen + bitlen
		-- Only bulk to buffer every 4 bytes. This is quicker.
		if cache_bitlen >= 32 then
			buffer_size = buffer_size + 1
			buffer[buffer_size] =
				_byte_to_char[cache % 256]
				.._byte_to_char[((cache-cache%256)/256 % 256)]
				.._byte_to_char[((cache-cache%65536)/65536 % 256)]
				.._byte_to_char[((cache-cache%16777216)/16777216 % 256)]
			local rshift_mask = _pow2[32 - cache_bitlen + bitlen]
			cache = (value - value%rshift_mask)/rshift_mask
			cache_bitlen = cache_bitlen - 32
		end
	end
	
	-- Write the entire string into the writer.
	-- @param str The string being written
	-- @return nil
	local function WriteString(str)
		for _ = 1, cache_bitlen, 8 do
			buffer_size = buffer_size + 1
			buffer[buffer_size] = string_char(cache % 256)
			cache = (cache-cache%256)/256
		end
		cache_bitlen = 0
		buffer_size = buffer_size + 1
		buffer[buffer_size] = str
		total_bitlen = total_bitlen + #str*8
	end
	
	-- Flush current stuffs in the writer and return it.
	-- This operation will free most of the memory.
	-- @param mode See the descrtion of the constant and the source code.
	-- @return The total number of bits stored in the writer right now.
	-- for byte boundary mode, it includes the padding bits.
	-- for output mode, it does not include padding bits.
	-- @return Return the outputs if mode is output.
	local function FlushWriter(mode)
		if mode == _FLUSH_MODE_NO_FLUSH then
			return total_bitlen
		end
		
		if mode == _FLUSH_MODE_OUTPUT
			or mode == _FLUSH_MODE_BYTE_BOUNDARY then
			-- Full flush, also output cache.
			-- Need to pad some bits if cache_bitlen is not multiple of 8.
			local padding_bitlen = (8 - cache_bitlen % 8) % 8
			
			if cache_bitlen > 0 then
				-- padding with all 1 bits, mainly because "\000" is not
				-- good to be tranmitted. I do this so "\000" is a little bit
				-- less frequent.
				cache = cache - _pow2[cache_bitlen]
				+ _pow2[cache_bitlen+padding_bitlen]
				for _ = 1, cache_bitlen, 8 do
					buffer_size = buffer_size + 1
					buffer[buffer_size] = _byte_to_char[cache % 256]
					cache = (cache-cache%256)/256
				end
				
				cache = 0
				cache_bitlen = 0
			end
			if mode == _FLUSH_MODE_BYTE_BOUNDARY then
				total_bitlen = total_bitlen + padding_bitlen
				return total_bitlen
			end
		end
		
		local flushed = table_concat(buffer)
		buffer = {}
		buffer_size = 0
		result_buffer[#result_buffer+1] = flushed
		
		if mode == _FLUSH_MODE_MEMORY_CLEANUP then
			return total_bitlen
		else
			return total_bitlen, table_concat(result_buffer)
		end
	end
	
	return WriteBits, WriteString, FlushWriter
end

-- Push an element into a max heap
-- @param heap A max heap whose max element is at index 1.
-- @param e The element to be pushed. Assume element "e" is a table
--  and comparison is done via its first entry e[1]
-- @param heap_size current number of elements in the heap.
--  NOTE: There may be some garbage stored in
--  heap[heap_size+1], heap[heap_size+2], etc..
-- @return nil
local function MinHeapPush(heap, e, heap_size)
	heap_size = heap_size + 1
	heap[heap_size] = e
	local value = e[1]
	local pos = heap_size
	local parent_pos = (pos-pos%2)/2
	
	while (parent_pos >= 1 and heap[parent_pos][1] > value) do
		local t = heap[parent_pos]
		heap[parent_pos] = e
		heap[pos] = t
		pos = parent_pos
		parent_pos = (parent_pos-parent_pos%2)/2
	end
end

-- Pop an element from a max heap
-- @param heap A max heap whose max element is at index 1.
-- @param heap_size current number of elements in the heap.
-- @return the poped element
-- Note: This function does not change table size of "heap" to save CPU time.
local function MinHeapPop(heap, heap_size)
	local top = heap[1]
	local e = heap[heap_size]
	local value = e[1]
	heap[1] = e
	heap[heap_size] = top
	heap_size = heap_size - 1
	
	local pos = 1
	local left_child_pos = pos * 2
	local right_child_pos = left_child_pos + 1
	
	while (left_child_pos <= heap_size) do
		local left_child = heap[left_child_pos]
		if (right_child_pos <= heap_size
			and heap[right_child_pos][1] < left_child[1]) then
			local right_child = heap[right_child_pos]
			if right_child[1] < value then
				heap[right_child_pos] = e
				heap[pos] = right_child
				pos = right_child_pos
				left_child_pos = pos * 2
				right_child_pos = left_child_pos + 1
			else
				break
			end
		else
			if left_child[1] < value then
				heap[left_child_pos] = e
				heap[pos] = left_child
				pos = left_child_pos
				left_child_pos = pos * 2
				right_child_pos = left_child_pos + 1
			else
				break
			end
		end
	end
	
	return top
end

-- Deflate defines a special huffman tree, which is unique once the bit length
-- of huffman code of all symbols are known.
-- @param bitlen_count Number of symbols with a specific bitlen
-- @param symbol_bitlen The bit length of a symbol
-- @param max_symbol The max symbol among all symbols,
--		which is (number of symbols - 1)
-- @param max_bitlen The max huffman bit length among all symbols.
-- @return The huffman code of all symbols.
local function GetHuffmanCodeFromBitlen(bitlen_counts, symbol_bitlens
	, max_symbol, max_bitlen)
	local huffman_code = 0
	local next_codes = {}
	local symbol_huffman_codes = {}
	for bitlen = 1, max_bitlen do
		huffman_code = (huffman_code+(bitlen_counts[bitlen-1] or 0))*2
		next_codes[bitlen] = huffman_code
	end
	for symbol = 0, max_symbol do
		local bitlen = symbol_bitlens[symbol]
		if bitlen then
			huffman_code = next_codes[bitlen]
			next_codes[bitlen] = huffman_code + 1
			
			-- Reverse the bits of huffman code,
			-- because most signifant bits of huffman code
			-- is stored first into the compressed data.
			-- @see RFC1951 Page5 Section 3.1.1
			if bitlen <= 9 then -- Have cached reverse for small bitlen.
				symbol_huffman_codes[symbol] =
					_reverse_bits_tbl[bitlen][huffman_code]
			else
				local reverse = 0
				for _ = 1, bitlen do
					reverse = reverse - reverse%2
					+ (((reverse%2==1)
						or (huffman_code % 2) == 1) and 1 or 0)
					huffman_code = (huffman_code-huffman_code%2)/2
					reverse = reverse*2
				end
				symbol_huffman_codes[symbol] = (reverse-reverse%2)/2
			end
		end
	end
	return symbol_huffman_codes
end

-- A helper function to sort heap elements
-- a[1], b[1] is the huffman frequency
-- a[2], b[2] is the symbol value.
local function SortByFirstThenSecond(a, b)
	return a[1] < b[1] or
		(a[1] == b[1] and a[2] < b[2])
end

-- Calculate the huffman bit length and huffman code.
-- @param symbol_count: A table whose table key is the symbol, and table value
--		is the symbol frenquency (nil means 0 frequency).
-- @param max_bitlen: See description of return value.
-- @param max_symbol: The maximum symbol
-- @return a table whose key is the symbol, and the value is the huffman bit
--		bit length. We guarantee that all bit length <= max_bitlen.
--		For 0<=symbol<=max_symbol, table value could be nil if the frequency
--		of the symbol is 0 or nil.
-- @return a table whose key is the symbol, and the value is the huffman code.
-- @return a number indicating the maximum symbol whose bitlen is not 0.
local function GetHuffmanBitlenAndCode(symbol_counts, max_bitlen, max_symbol)
	local heap_size
	local max_non_zero_bitlen_symbol = -1
	local leafs = {}
	local heap = {}
	local symbol_bitlens = {}
	local symbol_codes = {}
	local bitlen_counts = {}
	
	--[[
		tree[1]: weight, temporarily used as parent and bitLengths
		tree[2]: symbol
		tree[3]: left child
		tree[4]: right child
	--]]
	local number_unique_symbols = 0
	for symbol, count in pairs(symbol_counts) do
		number_unique_symbols = number_unique_symbols + 1
		leafs[number_unique_symbols] = {count, symbol}
	end
	
	if (number_unique_symbols == 0) then
		-- no code.
		return {}, {}, -1
	elseif (number_unique_symbols == 1) then
		-- Only one code. In this case, its huffman code
		-- needs to be assigned as 0, and bit length is 1.
		-- This is the only case that the return result
		-- represents an imcomplete huffman tree.
		local symbol = leafs[1][2]
		symbol_bitlens[symbol] = 1
		symbol_codes[symbol] = 0
		return symbol_bitlens, symbol_codes, symbol
	else
		table_sort(leafs, SortByFirstThenSecond)
		heap_size = number_unique_symbols
		for i = 1, heap_size do
			heap[i] = leafs[i]
		end
		
		while (heap_size > 1) do
			-- Note: pop does not change table size of heap
			local leftChild = MinHeapPop(heap, heap_size)
			heap_size = heap_size - 1
			local rightChild = MinHeapPop(heap, heap_size)
			heap_size = heap_size - 1
			local newNode =
			{leftChild[1]+rightChild[1], -1, leftChild, rightChild}
			MinHeapPush(heap, newNode, heap_size)
			heap_size = heap_size + 1
		end
		
		-- Number of leafs whose bit length is greater than max_len.
		local number_bitlen_overflow = 0
		
		-- Calculate bit length of all nodes
		local fifo = {heap[1], 0, 0, 0} -- preallocate some spaces.
		local fifo_size = 1
		local index = 1
		heap[1][1] = 0
		while (index <= fifo_size) do -- Breath first search
			local e = fifo[index]
			local bitlen = e[1]
			local symbol = e[2]
			local left_child = e[3]
			local right_child = e[4]
			if left_child then
				fifo_size = fifo_size + 1
				fifo[fifo_size] = left_child
				left_child[1] = bitlen + 1
			end
			if right_child then
				fifo_size = fifo_size + 1
				fifo[fifo_size] = right_child
				right_child[1] = bitlen + 1
			end
			index = index + 1
			
			if (bitlen > max_bitlen) then
				number_bitlen_overflow = number_bitlen_overflow + 1
				bitlen = max_bitlen
			end
			if symbol >= 0 then
				symbol_bitlens[symbol] = bitlen
				max_non_zero_bitlen_symbol =
					(symbol > max_non_zero_bitlen_symbol)
					and symbol or max_non_zero_bitlen_symbol
				bitlen_counts[bitlen] = (bitlen_counts[bitlen] or 0) + 1
			end
		end
		
		-- Resolve bit length overflow
		-- @see ZLib/trees.c:gen_bitlen(s, desc), for reference
		if (number_bitlen_overflow > 0) then
			repeat
				local bitlen = max_bitlen - 1
				while ((bitlen_counts[bitlen] or 0) == 0) do
					bitlen = bitlen - 1
				end
				-- move one leaf down the tree
				bitlen_counts[bitlen] = bitlen_counts[bitlen] - 1
				-- move one overflow item as its brother
				bitlen_counts[bitlen+1] = (bitlen_counts[bitlen+1] or 0) + 2
				bitlen_counts[max_bitlen] = bitlen_counts[max_bitlen] - 1
				number_bitlen_overflow = number_bitlen_overflow - 2
			until (number_bitlen_overflow <= 0)
			
			index = 1
			for bitlen = max_bitlen, 1, -1 do
				local n = bitlen_counts[bitlen] or 0
				while (n > 0) do
					local symbol = leafs[index][2]
					symbol_bitlens[symbol] = bitlen
					n = n - 1
					index = index + 1
				end
			end
		end
		
		symbol_codes = GetHuffmanCodeFromBitlen(bitlen_counts, symbol_bitlens,
			max_symbol, max_bitlen)
		return symbol_bitlens, symbol_codes, max_non_zero_bitlen_symbol
	end
end

-- Calculate the first huffman header in the dynamic huffman block
-- @see RFC1951 Page 12
-- @param lcode_bitlen: The huffman bit length of literal/LZ77_length.
-- @param max_non_zero_bitlen_lcode: The maximum literal/LZ77_length symbol
--		whose huffman bit length is not zero.
-- @param dcode_bitlen: The huffman bit length of LZ77 distance.
-- @param max_non_zero_bitlen_dcode: The maximum LZ77 distance symbol
--		whose huffman bit length is not zero.
-- @return The run length encoded codes.
-- @return The extra bits. One entry for each rle code that needs extra bits.
--		(code == 16 or 17 or 18).
-- @return The count of appearance of each rle codes.
local function RunLengthEncodeHuffmanBitlen(
	lcode_bitlens,
	max_non_zero_bitlen_lcode,
	dcode_bitlens,
	max_non_zero_bitlen_dcode)
	local rle_code_tblsize = 0
	local rle_codes = {}
	local rle_code_counts = {}
	local rle_extra_bits_tblsize = 0
	local rle_extra_bits = {}
	local prev = nil
	local count = 0
	
	-- If there is no distance code, assume one distance code of bit length 0.
	-- RFC1951: One distance code of zero bits means that
	-- there are no distance codes used at all (the data is all literals).
	max_non_zero_bitlen_dcode = (max_non_zero_bitlen_dcode < 0)
	and 0 or max_non_zero_bitlen_dcode
	local max_code = max_non_zero_bitlen_lcode+max_non_zero_bitlen_dcode+1
	
	for code = 0, max_code+1 do
		local len = (code <= max_non_zero_bitlen_lcode)
		and (lcode_bitlens[code] or 0)
		or ((code <= max_code)
			and (dcode_bitlens[code-max_non_zero_bitlen_lcode-1] or 0) or nil)
		if len == prev then
			count = count + 1
			if len ~= 0 and count == 6 then
				rle_code_tblsize = rle_code_tblsize + 1
				rle_codes[rle_code_tblsize] = 16
				rle_extra_bits_tblsize = rle_extra_bits_tblsize + 1
				rle_extra_bits[rle_extra_bits_tblsize] = 3
				rle_code_counts[16] = (rle_code_counts[16] or 0) + 1
				count = 0
			elseif len == 0 and count == 138 then
				rle_code_tblsize = rle_code_tblsize + 1
				rle_codes[rle_code_tblsize] = 18
				rle_extra_bits_tblsize = rle_extra_bits_tblsize + 1
				rle_extra_bits[rle_extra_bits_tblsize] = 127
				rle_code_counts[18] = (rle_code_counts[18] or 0) + 1
				count = 0
			end
		else
			if count == 1 then
				rle_code_tblsize = rle_code_tblsize + 1
				rle_codes[rle_code_tblsize] = prev
				rle_code_counts[prev] = (rle_code_counts[prev] or 0) + 1
			elseif count == 2 then
				rle_code_tblsize = rle_code_tblsize + 1
				rle_codes[rle_code_tblsize] = prev
				rle_code_tblsize = rle_code_tblsize + 1
				rle_codes[rle_code_tblsize] = prev
				rle_code_counts[prev] = (rle_code_counts[prev] or 0) + 2
			elseif count >= 3 then
				rle_code_tblsize = rle_code_tblsize + 1
				local rleCode = (prev ~= 0) and 16 or (count <= 10 and 17 or 18)
				rle_codes[rle_code_tblsize] = rleCode
				rle_code_counts[rleCode] = (rle_code_counts[rleCode] or 0) + 1
				rle_extra_bits_tblsize = rle_extra_bits_tblsize + 1
				rle_extra_bits[rle_extra_bits_tblsize] =
					(count <= 10) and (count - 3) or (count - 11)
			end
			
			prev = len
			if len and len ~= 0 then
				rle_code_tblsize = rle_code_tblsize + 1
				rle_codes[rle_code_tblsize] = len
				rle_code_counts[len] = (rle_code_counts[len] or 0) + 1
				count = 0
			else
				count = 1
			end
		end
	end
	
	return rle_codes, rle_extra_bits, rle_code_counts
end

-- Load the string into a table, in order to speed up LZ77.
-- Loop unrolled 16 times to speed this function up.
-- @param str The string to be loaded.
-- @param t The load destination
-- @param start str[index] will be the first character to be loaded.
-- @param end str[index] will be the last character to be loaded
-- @param offset str[index] will be loaded into t[index-offset]
-- @return t
local function LoadStringToTable(str, t, start, stop, offset)
	local i = start - offset
	while i <= stop - 15 - offset do
		t[i], t[i+1], t[i+2], t[i+3], t[i+4], t[i+5], t[i+6], t[i+7], t[i+8],
			t[i+9], t[i+10], t[i+11], t[i+12], t[i+13], t[i+14], t[i+15] =
			string_byte(str, i + offset, i + 15 + offset)
		i = i + 16
	end
	while (i <= stop - offset) do
		t[i] = string_byte(str, i + offset, i + offset)
		i = i + 1
	end
	return t
end

-- Do LZ77 process. This function uses the majority of the CPU time.
-- @see zlib/deflate.c:deflate_fast(), zlib/deflate.c:deflate_slow()
-- @see https://github.com/madler/zlib/blob/master/doc/algorithm.txt
-- This function uses the algorithms used above. You should read the
-- algorithm.txt above to understand what is the hash function and the
-- lazy evaluation.
--
-- The special optimization used here is hash functions used here.
-- The hash function is just the multiplication of the three consective
-- characters. So if the hash matches, it guarantees 3 characters are matched.
-- This optimization can be implemented because Lua table is a hash table.
--
-- @param level integer that describes compression level.
-- @param string_table table that stores the value of string to be compressed.
--			The index of this table starts from 1.
--			The caller needs to make sure all values needed by this function
--			are loaded.
--			Assume "str" is the origin input string into the compressor
--			str[block_start]..str[block_end+3] needs to be loaded into
--			string_table[block_start-offset]..string_table[block_end-offset]
--			If dictionary is presented, the last 258 bytes of the dictionary
--			needs to be loaded into sing_table[-257..0]
--			(See more in the description of offset.)
-- @param hash_tables. The table key is the hash value (0<=hash<=16777216=256^3)
--			The table value is an array0 that stores the indexes of the
--			input data string to be compressed, such that
--			hash == str[index]*str[index+1]*str[index+2]
--			Indexes are ordered in this array.
-- @param block_start The indexes of the input data string to be compressed.
--				that starts the LZ77 block.
-- @param block_end The indexes of the input data string to be compressed.
--				that stores the LZ77 block.
-- @param offset str[index] is stored in string_table[index-offset],
--			This offset is mainly an optimization to limit the index
--			of string_table, so lua can access this table quicker.
-- @param dictionary See LibDeflate:CreateDictionary
-- @return literal/LZ77_length deflate codes.
-- @return the extra bits of literal/LZ77_length deflate codes.
-- @return the count of each literal/LZ77 deflate code.
-- @return LZ77 distance deflate codes.
-- @return the extra bits of LZ77 distance deflate codes.
-- @return the count of each LZ77 distance deflate code.
local function GetBlockLZ77Result(level, string_table, hash_tables, block_start,
	block_end, offset, dictionary)
	local config = _compression_level_configs[level]
	local config_use_lazy
	, config_good_prev_length
	, config_max_lazy_match
	, config_nice_length
	, config_max_hash_chain =
		config[1], config[2], config[3], config[4], config[5]
	
	local config_max_insert_length = (not config_use_lazy)
	and config_max_lazy_match or 2147483646
	local config_good_hash_chain =
		(config_max_hash_chain-config_max_hash_chain%4/4)
	
	local hash
	
	local dict_hash_tables
	local dict_string_table
	local dict_string_len = 0
	
	if dictionary then
		dict_hash_tables = dictionary.hash_tables
		dict_string_table = dictionary.string_table
		dict_string_len = dictionary.strlen
		assert(block_start == 1)
		if block_end >= block_start and dict_string_len >= 2 then
			hash = dict_string_table[dict_string_len-1]*65536
			+ dict_string_table[dict_string_len]*256 + string_table[1]
			local t = hash_tables[hash]
			if not t then t = {}; hash_tables[hash] = t end
			t[#t+1] = -1
		end
		if block_end >= block_start+1 and dict_string_len >= 1 then
			hash = dict_string_table[dict_string_len]*65536
			+ string_table[1]*256 + string_table[2]
			local t = hash_tables[hash]
			if not t then t = {}; hash_tables[hash] = t end
			t[#t+1] = 0
		end
	end
	
	local dict_string_len_plus3 = dict_string_len + 3
	
	hash = (string_table[block_start-offset] or 0)*256
	+ (string_table[block_start+1-offset] or 0)
	
	local lcodes = {}
	local lcode_tblsize = 0
	local lcodes_counts = {}
	local dcodes = {}
	local dcodes_tblsize = 0
	local dcodes_counts = {}
	
	local lextra_bits = {}
	local lextra_bits_tblsize = 0
	local dextra_bits = {}
	local dextra_bits_tblsize = 0
	
	local match_available = false
	local prev_len
	local prev_dist
	local cur_len = 0
	local cur_dist = 0
	
	local index = block_start
	local index_end = block_end + (config_use_lazy and 1 or 0)
	
	-- the zlib source code writes separate code for lazy evaluation and
	-- not lazy evaluation, which is easier to understand.
	-- I put them together, so it is a bit harder to understand.
	-- because I think this is easier for me to maintain it.
	while (index <= index_end) do
		local string_table_index = index - offset
		local offset_minus_three = offset - 3
		prev_len = cur_len
		prev_dist = cur_dist
		cur_len = 0
		
		hash = (hash*256+(string_table[string_table_index+2] or 0))%16777216
		
		local chain_index
		local cur_chain
		local hash_chain = hash_tables[hash]
		local chain_old_size
		if not hash_chain then
			chain_old_size = 0
			hash_chain = {}
			hash_tables[hash] = hash_chain
			if dict_hash_tables then
				cur_chain = dict_hash_tables[hash]
				chain_index = cur_chain and #cur_chain or 0
			else
				chain_index = 0
			end
		else
			chain_old_size = #hash_chain
			cur_chain = hash_chain
			chain_index = chain_old_size
		end
		
		if index <= block_end then
			hash_chain[chain_old_size+1] = index
		end
		
		if (chain_index > 0 and index + 2 <= block_end
			and (not config_use_lazy or prev_len < config_max_lazy_match)) then
			
			local depth =
				(config_use_lazy and prev_len >= config_good_prev_length)
				and config_good_hash_chain or config_max_hash_chain
			
			local max_len_minus_one = block_end - index
			max_len_minus_one = (max_len_minus_one >= 257) and 257 or max_len_minus_one
			max_len_minus_one = max_len_minus_one + string_table_index
			local string_table_index_plus_three = string_table_index + 3
			
			while chain_index >= 1 and depth > 0 do
				local prev = cur_chain[chain_index]
				
				if index - prev > 32768 then
					break
				end
				if prev < index then
					local sj = string_table_index_plus_three
					
					if prev >= -257 then
						local pj = prev - offset_minus_three
						while (sj <= max_len_minus_one
							and string_table[pj]
							== string_table[sj]) do
							sj = sj + 1
							pj = pj + 1
						end
					else
						local pj = dict_string_len_plus3 + prev
						while (sj <= max_len_minus_one
							and dict_string_table[pj]
							== string_table[sj]) do
							sj = sj + 1
							pj = pj + 1
						end
					end
					local j = sj - string_table_index
					if j > cur_len then
						cur_len = j
						cur_dist = index - prev
					end
					if cur_len >= config_nice_length then
						break
					end
				end
				
				chain_index = chain_index - 1
				depth = depth - 1
				if chain_index == 0 and prev > 0 and dict_hash_tables then
					cur_chain = dict_hash_tables[hash]
					chain_index = cur_chain and #cur_chain or 0
				end
			end
		end
		
		if not config_use_lazy then
			prev_len, prev_dist = cur_len, cur_dist
		end
		if ((not config_use_lazy or match_available)
			and (prev_len > 3 or (prev_len == 3 and prev_dist < 4096))
			and cur_len <= prev_len )then
			local code = _length_to_deflate_code[prev_len]
			local length_extra_bits_bitlen =
				_length_to_deflate_extra_bitlen[prev_len]
			local dist_code, dist_extra_bits_bitlen, dist_extra_bits
			if prev_dist <= 256 then -- have cached code for small distance.
				dist_code = _dist256_to_deflate_code[prev_dist]
				dist_extra_bits = _dist256_to_deflate_extra_bits[prev_dist]
				dist_extra_bits_bitlen =
					_dist256_to_deflate_extra_bitlen[prev_dist]
			else
				dist_code = 16
				dist_extra_bits_bitlen = 7
				local a = 384
				local b = 512
				
				while true do
					if prev_dist <= a then
						dist_extra_bits = (prev_dist-(b/2)-1) % (b/4)
						break
					elseif prev_dist <= b then
						dist_extra_bits = (prev_dist-(b/2)-1) % (b/4)
						dist_code = dist_code + 1
						break
					else
						dist_code = dist_code + 2
						dist_extra_bits_bitlen = dist_extra_bits_bitlen + 1
						a = a*2
						b = b*2
					end
				end
			end
			lcode_tblsize = lcode_tblsize + 1
			lcodes[lcode_tblsize] = code
			lcodes_counts[code] = (lcodes_counts[code] or 0) + 1
			
			dcodes_tblsize = dcodes_tblsize + 1
			dcodes[dcodes_tblsize] = dist_code
			dcodes_counts[dist_code] = (dcodes_counts[dist_code] or 0) + 1
			
			if length_extra_bits_bitlen > 0 then
				local lenExtraBits = _length_to_deflate_extra_bits[prev_len]
				lextra_bits_tblsize = lextra_bits_tblsize + 1
				lextra_bits[lextra_bits_tblsize] = lenExtraBits
			end
			if dist_extra_bits_bitlen > 0 then
				dextra_bits_tblsize = dextra_bits_tblsize + 1
				dextra_bits[dextra_bits_tblsize] = dist_extra_bits
			end
			
			for i=index+1, index+prev_len-(config_use_lazy and 2 or 1) do
				hash = (hash*256+(string_table[i-offset+2] or 0))%16777216
				if prev_len <= config_max_insert_length then
					hash_chain = hash_tables[hash]
					if not hash_chain then
						hash_chain = {}
						hash_tables[hash] = hash_chain
					end
					hash_chain[#hash_chain+1] = i
				end
			end
			index = index + prev_len - (config_use_lazy and 1 or 0)
			match_available = false
		elseif (not config_use_lazy) or match_available then
			local code = string_table[config_use_lazy
			and (string_table_index-1) or string_table_index]
			lcode_tblsize = lcode_tblsize + 1
			lcodes[lcode_tblsize] = code
			lcodes_counts[code] = (lcodes_counts[code] or 0) + 1
			index = index + 1
		else
			match_available = true
			index = index + 1
		end
	end
	
	-- Write "end of block" symbol
	lcode_tblsize = lcode_tblsize + 1
	lcodes[lcode_tblsize] = 256
	lcodes_counts[256] = (lcodes_counts[256] or 0) + 1
	
	return lcodes, lextra_bits, lcodes_counts, dcodes, dextra_bits
	, dcodes_counts
end

-- Get the header data of dynamic block.
-- @param lcodes_count The count of each literal/LZ77_length codes.
-- @param dcodes_count The count of each Lz77 distance codes.
-- @return a lots of stuffs.
-- @see RFC1951 Page 12
local function GetBlockDynamicHuffmanHeader(lcodes_counts, dcodes_counts)
	local lcodes_huffman_bitlens, lcodes_huffman_codes
	, max_non_zero_bitlen_lcode =
		GetHuffmanBitlenAndCode(lcodes_counts, 15, 285)
	local dcodes_huffman_bitlens, dcodes_huffman_codes
	, max_non_zero_bitlen_dcode =
		GetHuffmanBitlenAndCode(dcodes_counts, 15, 29)
	
	local rle_deflate_codes, rle_extra_bits, rle_codes_counts =
		RunLengthEncodeHuffmanBitlen(lcodes_huffman_bitlens
			,max_non_zero_bitlen_lcode, dcodes_huffman_bitlens
			, max_non_zero_bitlen_dcode)
	
	local rle_codes_huffman_bitlens, rle_codes_huffman_codes =
		GetHuffmanBitlenAndCode(rle_codes_counts, 7, 18)
	
	local HCLEN = 0
	for i = 1, 19 do
		local symbol = _rle_codes_huffman_bitlen_order[i]
		local length = rle_codes_huffman_bitlens[symbol] or 0
		if length ~= 0 then
			HCLEN = i
		end
	end
	
	HCLEN = HCLEN - 4
	local HLIT = max_non_zero_bitlen_lcode + 1 - 257
	local HDIST = max_non_zero_bitlen_dcode + 1 - 1
	if HDIST < 0 then HDIST = 0 end
	
	return HLIT, HDIST, HCLEN, rle_codes_huffman_bitlens
	, rle_codes_huffman_codes, rle_deflate_codes, rle_extra_bits
	, lcodes_huffman_bitlens, lcodes_huffman_codes
	, dcodes_huffman_bitlens, dcodes_huffman_codes
end

-- Get the size of dynamic block without writing any bits into the writer.
-- @param ... Read the source code of GetBlockDynamicHuffmanHeader()
-- @return the bit length of the dynamic block
local function GetDynamicHuffmanBlockSize(lcodes, dcodes, HCLEN
	, rle_codes_huffman_bitlens, rle_deflate_codes
	, lcodes_huffman_bitlens, dcodes_huffman_bitlens)
	
	local block_bitlen = 17 -- 1+2+5+5+4
	block_bitlen = block_bitlen + (HCLEN+4)*3
	
	for i = 1, #rle_deflate_codes do
		local code = rle_deflate_codes[i]
		block_bitlen = block_bitlen + rle_codes_huffman_bitlens[code]
		if code >= 16 then
			block_bitlen = block_bitlen +
				((code == 16) and 2 or (code == 17 and 3 or 7))
		end
	end
	
	local length_code_count = 0
	for i = 1, #lcodes do
		local code = lcodes[i]
		local huffman_bitlen = lcodes_huffman_bitlens[code]
		block_bitlen = block_bitlen + huffman_bitlen
		if code > 256 then -- Length code
			length_code_count = length_code_count + 1
			if code > 264 and code < 285 then -- Length code with extra bits
				local extra_bits_bitlen =
					_literal_deflate_code_to_extra_bitlen[code-256]
				block_bitlen = block_bitlen + extra_bits_bitlen
			end
			local dist_code = dcodes[length_code_count]
			local dist_huffman_bitlen = dcodes_huffman_bitlens[dist_code]
			block_bitlen = block_bitlen + dist_huffman_bitlen
			
			if dist_code > 3 then -- dist code with extra bits
				local dist_extra_bits_bitlen = (dist_code-dist_code%2)/2 - 1
				block_bitlen = block_bitlen + dist_extra_bits_bitlen
			end
		end
	end
	return block_bitlen
end

-- Write dynamic block.
-- @param ... Read the source code of GetBlockDynamicHuffmanHeader()
local function CompressDynamicHuffmanBlock(WriteBits, is_last_block
	, lcodes, lextra_bits, dcodes, dextra_bits, HLIT, HDIST, HCLEN
	, rle_codes_huffman_bitlens, rle_codes_huffman_codes
	, rle_deflate_codes, rle_extra_bits
	, lcodes_huffman_bitlens, lcodes_huffman_codes
	, dcodes_huffman_bitlens, dcodes_huffman_codes)
	
	WriteBits(is_last_block and 1 or 0, 1) -- Last block identifier
	WriteBits(2, 2) -- Dynamic Huffman block identifier
	
	WriteBits(HLIT, 5)
	WriteBits(HDIST, 5)
	WriteBits(HCLEN, 4)
	
	for i = 1, HCLEN+4 do
		local symbol = _rle_codes_huffman_bitlen_order[i]
		local length = rle_codes_huffman_bitlens[symbol] or 0
		WriteBits(length, 3)
	end
	
	local rleExtraBitsIndex = 1
	for i=1, #rle_deflate_codes do
		local code = rle_deflate_codes[i]
		WriteBits(rle_codes_huffman_codes[code]
			, rle_codes_huffman_bitlens[code])
		if code >= 16 then
			local extraBits = rle_extra_bits[rleExtraBitsIndex]
			WriteBits(extraBits, (code == 16) and 2 or (code == 17 and 3 or 7))
			rleExtraBitsIndex = rleExtraBitsIndex + 1
		end
	end
	
	local length_code_count = 0
	local length_code_with_extra_count = 0
	local dist_code_with_extra_count = 0
	
	for i=1, #lcodes do
		local deflate_codee = lcodes[i]
		local huffman_code = lcodes_huffman_codes[deflate_codee]
		local huffman_bitlen = lcodes_huffman_bitlens[deflate_codee]
		WriteBits(huffman_code, huffman_bitlen)
		if deflate_codee > 256 then -- Length code
			length_code_count = length_code_count + 1
			if deflate_codee > 264 and deflate_codee < 285 then
				-- Length code with extra bits
				length_code_with_extra_count = length_code_with_extra_count + 1
				local extra_bits = lextra_bits[length_code_with_extra_count]
				local extra_bits_bitlen =
					_literal_deflate_code_to_extra_bitlen[deflate_codee-256]
				WriteBits(extra_bits, extra_bits_bitlen)
			end
			-- Write distance code
			local dist_deflate_code = dcodes[length_code_count]
			local dist_huffman_code = dcodes_huffman_codes[dist_deflate_code]
			local dist_huffman_bitlen =
				dcodes_huffman_bitlens[dist_deflate_code]
			WriteBits(dist_huffman_code, dist_huffman_bitlen)
			
			if dist_deflate_code > 3 then -- dist code with extra bits
				dist_code_with_extra_count = dist_code_with_extra_count + 1
				local dist_extra_bits = dextra_bits[dist_code_with_extra_count]
				local dist_extra_bits_bitlen =
					(dist_deflate_code-dist_deflate_code%2)/2 - 1
				WriteBits(dist_extra_bits, dist_extra_bits_bitlen)
			end
		end
	end
end

-- Get the size of fixed block without writing any bits into the writer.
-- @param lcodes literal/LZ77_length deflate codes
-- @param decodes LZ77 distance deflate codes
-- @return the bit length of the fixed block
local function GetFixedHuffmanBlockSize(lcodes, dcodes)
	local block_bitlen = 3
	local length_code_count = 0
	for i=1, #lcodes do
		local code = lcodes[i]
		local huffman_bitlen = _fix_block_literal_huffman_bitlen[code]
		block_bitlen = block_bitlen + huffman_bitlen
		if code > 256 then -- Length code
			length_code_count = length_code_count + 1
			if code > 264 and code < 285 then -- Length code with extra bits
				local extra_bits_bitlen =
					_literal_deflate_code_to_extra_bitlen[code-256]
				block_bitlen = block_bitlen + extra_bits_bitlen
			end
			local dist_code = dcodes[length_code_count]
			block_bitlen = block_bitlen + 5
			
			if dist_code > 3 then -- dist code with extra bits
				local dist_extra_bits_bitlen =
					(dist_code-dist_code%2)/2 - 1
				block_bitlen = block_bitlen + dist_extra_bits_bitlen
			end
		end
	end
	return block_bitlen
end

-- Write fixed block.
-- @param lcodes literal/LZ77_length deflate codes
-- @param decodes LZ77 distance deflate codes
local function CompressFixedHuffmanBlock(WriteBits, is_last_block,
	lcodes, lextra_bits, dcodes, dextra_bits)
	WriteBits(is_last_block and 1 or 0, 1) -- Last block identifier
	WriteBits(1, 2) -- Fixed Huffman block identifier
	local length_code_count = 0
	local length_code_with_extra_count = 0
	local dist_code_with_extra_count = 0
	for i=1, #lcodes do
		local deflate_code = lcodes[i]
		local huffman_code = _fix_block_literal_huffman_code[deflate_code]
		local huffman_bitlen = _fix_block_literal_huffman_bitlen[deflate_code]
		WriteBits(huffman_code, huffman_bitlen)
		if deflate_code > 256 then -- Length code
			length_code_count = length_code_count + 1
			if deflate_code > 264 and deflate_code < 285 then
				-- Length code with extra bits
				length_code_with_extra_count = length_code_with_extra_count + 1
				local extra_bits = lextra_bits[length_code_with_extra_count]
				local extra_bits_bitlen =
					_literal_deflate_code_to_extra_bitlen[deflate_code-256]
				WriteBits(extra_bits, extra_bits_bitlen)
			end
			-- Write distance code
			local dist_code = dcodes[length_code_count]
			local dist_huffman_code = _fix_block_dist_huffman_code[dist_code]
			WriteBits(dist_huffman_code, 5)
			
			if dist_code > 3 then -- dist code with extra bits
				dist_code_with_extra_count = dist_code_with_extra_count + 1
				local dist_extra_bits = dextra_bits[dist_code_with_extra_count]
				local dist_extra_bits_bitlen = (dist_code-dist_code%2)/2 - 1
				WriteBits(dist_extra_bits, dist_extra_bits_bitlen)
			end
		end
	end
end

-- Get the size of store block without writing any bits into the writer.
-- @param block_start The start index of the origin input string
-- @param block_end The end index of the origin input string
-- @param Total bit lens had been written into the compressed result before,
-- because store block needs to shift to byte boundary.
-- @return the bit length of the fixed block
local function GetStoreBlockSize(block_start, block_end, total_bitlen)
	assert(block_end-block_start+1 <= 65535)
	local block_bitlen = 3
	total_bitlen = total_bitlen + 3
	local padding_bitlen = (8-total_bitlen%8)%8
	block_bitlen = block_bitlen + padding_bitlen
	block_bitlen = block_bitlen + 32
	block_bitlen = block_bitlen + (block_end - block_start + 1) * 8
	return block_bitlen
end

-- Write the store block.
-- @param ... lots of stuffs
-- @return nil
local function CompressStoreBlock(WriteBits, WriteString, is_last_block, str
	, block_start, block_end, total_bitlen)
	assert(block_end-block_start+1 <= 65535)
	WriteBits(is_last_block and 1 or 0, 1) -- Last block identifer.
	WriteBits(0, 2) -- Store block identifier.
	total_bitlen = total_bitlen + 3
	local padding_bitlen = (8-total_bitlen%8)%8
	if padding_bitlen > 0 then
		WriteBits(_pow2[padding_bitlen]-1, padding_bitlen)
	end
	local size = block_end - block_start + 1
	WriteBits(size, 16)
	
	-- Write size's one's complement
	local comp = (255 - size % 256) + (255 - (size-size%256)/256)*256
	WriteBits(comp, 16)
	
	WriteString(str:sub(block_start, block_end))
end

-- Do the deflate
-- Currently using a simple way to determine the block size
-- (This is why the compression ratio is little bit worse than zlib when
-- the input size is very large
-- The first block is 64KB, the following block is 32KB.
-- After each block, there is a memory cleanup operation.
-- This is not a fast operation, but it is needed to save memory usage, so
-- the memory usage does not grow unboundly. If the data size is less than
-- 64KB, then memory cleanup won't happen.
-- This function determines whether to use store/fixed/dynamic blocks by
-- calculating the block size of each block type and chooses the smallest one.
local function Deflate(configs, WriteBits, WriteString, FlushWriter, str
	, dictionary)
	local string_table = {}
	local hash_tables = {}
	local is_last_block = nil
	local block_start
	local block_end
	local bitlen_written
	local total_bitlen = FlushWriter(_FLUSH_MODE_NO_FLUSH)
	local strlen = #str
	local offset
	
	local level
	local strategy
	if configs then
		if configs.level then
			level = configs.level
		end
		if configs.strategy then
			strategy = configs.strategy
		end
	end
	
	if not level then
		if strlen < 2048 then
			level = 7
		elseif strlen > 65536 then
			level = 3
		else
			level = 5
		end
	end
	
	while not is_last_block do
		if not block_start then
			block_start = 1
			block_end = 64*1024 - 1
			offset = 0
		else
			block_start = block_end + 1
			block_end = block_end + 32*1024
			offset = block_start - 32*1024 - 1
		end
		
		if block_end >= strlen then
			block_end = strlen
			is_last_block = true
		else
			is_last_block = false
		end
		
		local lcodes, lextra_bits, lcodes_counts, dcodes, dextra_bits
		, dcodes_counts
		
		local HLIT, HDIST, HCLEN, rle_codes_huffman_bitlens
		, rle_codes_huffman_codes, rle_deflate_codes
		, rle_extra_bits, lcodes_huffman_bitlens, lcodes_huffman_codes
		, dcodes_huffman_bitlens, dcodes_huffman_codes
		
		local dynamic_block_bitlen
		local fixed_block_bitlen
		local store_block_bitlen
		
		if level ~= 0 then
			
			-- GetBlockLZ77 needs block_start to block_end+3 to be loaded.
			LoadStringToTable(str, string_table, block_start, block_end + 3
				, offset)
			if block_start == 1 and dictionary then
				local dict_string_table = dictionary.string_table
				local dict_strlen = dictionary.strlen
				for i=0, (-dict_strlen+1)<-257
					and -257 or (-dict_strlen+1), -1 do
					string_table[i] = dict_string_table[dict_strlen+i]
				end
			end
			
			if strategy == "huffman_only" then
				lcodes = {}
				LoadStringToTable(str, lcodes, block_start, block_end
					, block_start-1)
				lextra_bits = {}
				lcodes_counts = {}
				lcodes[block_end - block_start+2] = 256 -- end of block
				for i=1, block_end - block_start+2 do
					local code = lcodes[i]
					lcodes_counts[code] = (lcodes_counts[code] or 0) + 1
				end
				dcodes = {}
				dextra_bits = {}
				dcodes_counts = {}
			else
				lcodes, lextra_bits, lcodes_counts, dcodes, dextra_bits
				, dcodes_counts = GetBlockLZ77Result(level, string_table
					, hash_tables, block_start, block_end, offset, dictionary
				)
			end
			
			HLIT, HDIST, HCLEN, rle_codes_huffman_bitlens
			, rle_codes_huffman_codes, rle_deflate_codes
			, rle_extra_bits, lcodes_huffman_bitlens, lcodes_huffman_codes
			, dcodes_huffman_bitlens, dcodes_huffman_codes =
				GetBlockDynamicHuffmanHeader(lcodes_counts, dcodes_counts)
			dynamic_block_bitlen = GetDynamicHuffmanBlockSize(
				lcodes, dcodes, HCLEN, rle_codes_huffman_bitlens
				, rle_deflate_codes, lcodes_huffman_bitlens
				, dcodes_huffman_bitlens)
			fixed_block_bitlen = GetFixedHuffmanBlockSize(lcodes, dcodes)
		end
		
		store_block_bitlen = GetStoreBlockSize(block_start, block_end
			, total_bitlen)
		
		local min_bitlen = store_block_bitlen
		min_bitlen = (fixed_block_bitlen and fixed_block_bitlen < min_bitlen)
		and fixed_block_bitlen or min_bitlen
		min_bitlen = (dynamic_block_bitlen
			and dynamic_block_bitlen < min_bitlen)
		and dynamic_block_bitlen or min_bitlen
		
		if level == 0 or (strategy ~= "fixed" and strategy ~= "dynamic" and
			store_block_bitlen == min_bitlen) then
			CompressStoreBlock(WriteBits, WriteString, is_last_block
				, str, block_start, block_end, total_bitlen)
			total_bitlen = total_bitlen + store_block_bitlen
		elseif strategy ~= "dynamic" and (
			strategy == "fixed" or fixed_block_bitlen == min_bitlen) then
			CompressFixedHuffmanBlock(WriteBits, is_last_block,
				lcodes, lextra_bits, dcodes, dextra_bits)
			total_bitlen = total_bitlen + fixed_block_bitlen
		elseif strategy == "dynamic" or dynamic_block_bitlen == min_bitlen then
			CompressDynamicHuffmanBlock(WriteBits, is_last_block, lcodes
				, lextra_bits, dcodes, dextra_bits, HLIT, HDIST, HCLEN
				, rle_codes_huffman_bitlens, rle_codes_huffman_codes
				, rle_deflate_codes, rle_extra_bits
				, lcodes_huffman_bitlens, lcodes_huffman_codes
				, dcodes_huffman_bitlens, dcodes_huffman_codes)
			total_bitlen = total_bitlen + dynamic_block_bitlen
		end
		
		if is_last_block then
			bitlen_written = FlushWriter(_FLUSH_MODE_NO_FLUSH)
		else
			bitlen_written = FlushWriter(_FLUSH_MODE_MEMORY_CLEANUP)
		end
		
		assert(bitlen_written == total_bitlen)
		
		-- Memory clean up, so memory consumption does not always grow linearly
		-- , even if input string is > 64K.
		-- Not a very efficient operation, but this operation won't happen
		-- when the input data size is less than 64K.
		if not is_last_block then
			local j
			if dictionary and block_start == 1 then
				j = 0
				while (string_table[j]) do
					string_table[j] = nil
					j = j - 1
				end
			end
			dictionary = nil
			j = 1
			for i = block_end-32767, block_end do
				string_table[j] = string_table[i-offset]
				j = j + 1
			end
			
			for k, t in pairs(hash_tables) do
				local tSize = #t
				if tSize > 0 and block_end+1 - t[1] > 32768 then
					if tSize == 1 then
						hash_tables[k] = nil
					else
						local new = {}
						local newSize = 0
						for i = 2, tSize do
							j = t[i]
							if block_end+1 - j <= 32768 then
								newSize = newSize + 1
								new[newSize] = j
							end
						end
						hash_tables[k] = new
					end
				end
			end
		end
	end
end

--- The description to compression configuration table. <br>
-- Any field can be nil to use its default. <br>
-- Table with keys other than those below is an invalid table.
-- @class table
-- @name compression_configs
-- @field level The compression level ranged from 0 to 9. 0 is no compression.
-- 9 is the slowest but best compression. Use nil for default level.
-- @field strategy The compression strategy. "fixed" to only use fixed deflate
-- compression block. "dynamic" to only use dynamic block. "huffman_only" to
-- do no LZ77 compression. Only do huffman compression.


-- @see LibDeflate:CompressDeflate(str, configs)
-- @see LibDeflate:CompressDeflateWithDict(str, dictionary, configs)
local function CompressDeflateInternal(str, dictionary, configs)
	local WriteBits, WriteString, FlushWriter = CreateWriter()
	Deflate(configs, WriteBits, WriteString, FlushWriter, str, dictionary)
	local total_bitlen, result = FlushWriter(_FLUSH_MODE_OUTPUT)
	local padding_bitlen = (8-total_bitlen%8)%8
	return result, padding_bitlen
end

-- @see LibDeflate:CompressZlib
-- @see LibDeflate:CompressZlibWithDict
local function CompressZlibInternal(str, dictionary, configs)
	local WriteBits, WriteString, FlushWriter = CreateWriter()
	
	local CM = 8 -- Compression method
	local CINFO = 7 --Window Size = 32K
	local CMF = CINFO*16+CM
	WriteBits(CMF, 8)
	
	local FDIST = dictionary and 1 or 0
	local FLEVEL = 2 -- Default compression
	local FLG = FLEVEL*64+FDIST*32
	local FCHECK = (31-(CMF*256+FLG)%31)
	-- The FCHECK value must be such that CMF and FLG,
	-- when viewed as a 16-bit unsigned integer stored
	-- in MSB order (CMF*256 + FLG), is a multiple of 31.
	FLG = FLG + FCHECK
	WriteBits(FLG, 8)
	
	if FDIST == 1 then
		local adler32 = dictionary.adler32
		local byte0 = adler32 % 256
		adler32 = (adler32 - byte0) / 256
		local byte1 = adler32 % 256
		adler32 = (adler32 - byte1) / 256
		local byte2 = adler32 % 256
		adler32 = (adler32 - byte2) / 256
		local byte3 = adler32 % 256
		WriteBits(byte3, 8)
		WriteBits(byte2, 8)
		WriteBits(byte1, 8)
		WriteBits(byte0, 8)
	end
	
	Deflate(configs, WriteBits, WriteString, FlushWriter, str, dictionary)
	FlushWriter(_FLUSH_MODE_BYTE_BOUNDARY)
	
	local adler32 = LibDeflate:Adler32(str)
	
	-- Most significant byte first
	local byte3 = adler32%256
	adler32 = (adler32 - byte3) / 256
	local byte2 = adler32%256
	adler32 = (adler32 - byte2) / 256
	local byte1 = adler32%256
	adler32 = (adler32 - byte1) / 256
	local byte0 = adler32%256
	
	WriteBits(byte0, 8)
	WriteBits(byte1, 8)
	WriteBits(byte2, 8)
	WriteBits(byte3, 8)
	local total_bitlen, result = FlushWriter(_FLUSH_MODE_OUTPUT)
	local padding_bitlen = (8-total_bitlen%8)%8
	return result, padding_bitlen
end

--- Compress using the raw deflate format.
-- @param str [string] The data to be compressed.
-- @param configs [table/nil] The configuration table to control the compression
-- . If nil, use the default configuration.
-- @return [string] The compressed data.
-- @return [integer] The number of bits padded at the end of output.
-- 0 <= bits < 8  <br>
-- This means the most significant "bits" of the last byte of the returned
-- compressed data are padding bits and they don't affect decompression.
-- You don't need to use this value unless you want to do some postprocessing
-- to the compressed data.
-- @see compression_configs
-- @see LibDeflate:DecompressDeflate
function LibDeflate:CompressDeflate(str, configs)
	local arg_valid, arg_err = IsValidArguments(str, false, nil, true, configs)
	if not arg_valid then
		error(("Usage: LibDeflate:CompressDeflate(str, configs): "
			..arg_err), 2)
	end
	return CompressDeflateInternal(str, nil, configs)
end

--- Compress using the raw deflate format with a preset dictionary.
-- @param str [string] The data to be compressed.
-- @param dictionary [table] The preset dictionary produced by
-- LibDeflate:CreateDictionary
-- @param configs [table/nil] The configuration table to control the compression
-- . If nil, use the default configuration.
-- @return [string] The compressed data.
-- @return [integer] The number of bits padded at the end of output.
-- 0 <= bits < 8  <br>
-- This means the most significant "bits" of the last byte of the returned
-- compressed data are padding bits and they don't affect decompression.
-- You don't need to use this value unless you want to do some postprocessing
-- to the compressed data.
-- @see compression_configs
-- @see LibDeflate:CreateDictionary
-- @see LibDeflate:DecompressDeflateWithDict
function LibDeflate:CompressDeflateWithDict(str, dictionary, configs)
	local arg_valid, arg_err = IsValidArguments(str, true, dictionary
		, true, configs)
	if not arg_valid then
		error(("Usage: LibDeflate:CompressDeflateWithDict"
			.."(str, dictionary, configs): "
			..arg_err), 2)
	end
	return CompressDeflateInternal(str, dictionary, configs)
end

--- Compress using the zlib format.
-- @param str [string] the data to be compressed.
-- @param configs [table/nil] The configuration table to control the compression
-- . If nil, use the default configuration.
-- @return [string] The compressed data.
-- @return [integer] The number of bits padded at the end of output.
-- Should always be 0.
-- Zlib formatted compressed data never has padding bits at the end.
-- @see compression_configs
-- @see LibDeflate:DecompressZlib
function LibDeflate:CompressZlib(str, configs)
	local arg_valid, arg_err = IsValidArguments(str, false, nil, true, configs)
	if not arg_valid then
		error(("Usage: LibDeflate:CompressZlib(str, configs): "
			..arg_err), 2)
	end
	return CompressZlibInternal(str, nil, configs)
end

--- Compress using the zlib format with a preset dictionary.
-- @param str [string] the data to be compressed.
-- @param dictionary [table] A preset dictionary produced
-- by LibDeflate:CreateDictionary()
-- @param configs [table/nil] The configuration table to control the compression
-- . If nil, use the default configuration.
-- @return [string] The compressed data.
-- @return [integer] The number of bits padded at the end of output.
-- Should always be 0.
-- Zlib formatted compressed data never has padding bits at the end.
-- @see compression_configs
-- @see LibDeflate:CreateDictionary
-- @see LibDeflate:DecompressZlibWithDict
function LibDeflate:CompressZlibWithDict(str, dictionary, configs)
	local arg_valid, arg_err = IsValidArguments(str, true, dictionary
		, true, configs)
	if not arg_valid then
		error(("Usage: LibDeflate:CompressZlibWithDict"
			.."(str, dictionary, configs): "
			..arg_err), 2)
	end
	return CompressZlibInternal(str, dictionary, configs)
end

--[[ --------------------------------------------------------------------------
	Decompress code
--]] --------------------------------------------------------------------------

--[[
	Create a reader to easily reader stuffs as the unit of bits.
	Return values:
	1. ReadBits(bitlen)
	2. ReadBytes(bytelen, buffer, buffer_size)
	3. Decode(huffman_bitlen_count, huffman_symbol, min_bitlen)
	4. ReaderBitlenLeft()
	5. SkipToByteBoundary()
--]]
local function CreateReader(input_string)
	local input = input_string
	local input_strlen = #input_string
	local input_next_byte_pos = 1
	local cache_bitlen = 0
	local cache = 0
	
	-- Read some bits.
	-- To improve speed, this function does not
	-- check if the input has been exhausted.
	-- Use ReaderBitlenLeft() < 0 to check it.
	-- @param bitlen the number of bits to read
	-- @return the data is read.
	local function ReadBits(bitlen)
		local rshift_mask = _pow2[bitlen]
		local code
		if bitlen <= cache_bitlen then
			code = cache % rshift_mask
			cache = (cache - code) / rshift_mask
			cache_bitlen = cache_bitlen - bitlen
		else -- Whether input has been exhausted is not checked.
			local lshift_mask = _pow2[cache_bitlen]
			local byte1, byte2, byte3, byte4 = string_byte(input
				, input_next_byte_pos, input_next_byte_pos+3)
			-- This requires lua number to be at least double ()
			cache = cache + ((byte1 or 0)+(byte2 or 0)*256
				+ (byte3 or 0)*65536+(byte4 or 0)*16777216)*lshift_mask
			input_next_byte_pos = input_next_byte_pos + 4
			cache_bitlen = cache_bitlen + 32 - bitlen
			code = cache % rshift_mask
			cache = (cache - code) / rshift_mask
		end
		return code
	end
	
	-- Read some bytes from the reader.
	-- Assume reader is on the byte boundary.
	-- @param bytelen The number of bytes to be read.
	-- @param buffer The byte read will be stored into this buffer.
	-- @param buffer_size The buffer will be modified starting from
	--	buffer[buffer_size+1], ending at buffer[buffer_size+bytelen-1]
	-- @return the new buffer_size
	local function ReadBytes(bytelen, buffer, buffer_size)
		assert(cache_bitlen % 8 == 0)
		
		local byte_from_cache = (cache_bitlen/8 < bytelen)
		and (cache_bitlen/8) or bytelen
		for _=1, byte_from_cache do
			local byte = cache % 256
			buffer_size = buffer_size + 1
			buffer[buffer_size] = string_char(byte)
			cache = (cache - byte) / 256
		end
		cache_bitlen = cache_bitlen - byte_from_cache*8
		bytelen = bytelen - byte_from_cache
		if (input_strlen - input_next_byte_pos - bytelen + 1) * 8
			+ cache_bitlen < 0 then
			return -1 -- out of input
		end
		for i=input_next_byte_pos, input_next_byte_pos+bytelen-1 do
			buffer_size = buffer_size + 1
			buffer[buffer_size] = string_sub(input, i, i)
		end
		
		input_next_byte_pos = input_next_byte_pos + bytelen
		return buffer_size
	end
	
	-- Decode huffman code
	-- To improve speed, this function does not check
	-- if the input has been exhausted.
	-- Use ReaderBitlenLeft() < 0 to check it.
	-- Credits for Mark Adler. This code is from puff:Decode()
	-- @see puff:Decode(...)
	-- @param huffman_bitlen_count
	-- @param huffman_symbol
	-- @param min_bitlen The minimum huffman bit length of all symbols
	-- @return The decoded deflate code.
	--	Negative value is returned if decoding fails.
	local function Decode(huffman_bitlen_counts, huffman_symbols, min_bitlen)
		local code = 0
		local first = 0
		local index = 0
		local count
		if min_bitlen > 0 then
			if cache_bitlen < 15 and input then
				local lshift_mask = _pow2[cache_bitlen]
				local byte1, byte2, byte3, byte4 =
					string_byte(input, input_next_byte_pos
						, input_next_byte_pos+3)
				-- This requires lua number to be at least double ()
				cache = cache + ((byte1 or 0)+(byte2 or 0)*256
					+(byte3 or 0)*65536+(byte4 or 0)*16777216)*lshift_mask
				input_next_byte_pos = input_next_byte_pos + 4
				cache_bitlen = cache_bitlen + 32
			end
			
			local rshift_mask = _pow2[min_bitlen]
			cache_bitlen = cache_bitlen - min_bitlen
			code = cache % rshift_mask
			cache = (cache - code) / rshift_mask
			-- Reverse the bits
			code = _reverse_bits_tbl[min_bitlen][code]
			
			count = huffman_bitlen_counts[min_bitlen]
			if code < count then
				return huffman_symbols[code]
			end
			index = count
			first = count * 2
			code = code * 2
		end
		
		for bitlen = min_bitlen+1, 15 do
			local bit
			bit = cache % 2
			cache = (cache - bit) / 2
			cache_bitlen = cache_bitlen - 1
			
			code = (bit==1) and (code + 1 - code % 2) or code
			count = huffman_bitlen_counts[bitlen] or 0
			local diff = code - first
			if diff < count then
				return huffman_symbols[index + diff]
			end
			index = index + count
			first = first + count
			first = first * 2
			code = code * 2
		end
		-- invalid literal/length or distance code
		-- in fixed or dynamic block (run out of code)
		return -10
	end
	
	local function ReaderBitlenLeft()
		return (input_strlen - input_next_byte_pos + 1) * 8 + cache_bitlen
	end
	
	local function SkipToByteBoundary()
		local skipped_bitlen = cache_bitlen%8
		local rshift_mask = _pow2[skipped_bitlen]
		cache_bitlen = cache_bitlen - skipped_bitlen
		cache = (cache - cache % rshift_mask) / rshift_mask
	end
	
	return ReadBits, ReadBytes, Decode, ReaderBitlenLeft, SkipToByteBoundary
end

-- Create a deflate state, so I can pass in less arguments to functions.
-- @param str the whole string to be decompressed.
-- @param dictionary The preset dictionary. nil if not provided.
--		This dictionary should be produced by LibDeflate:CreateDictionary(str)
-- @return The decomrpess state.
local function CreateDecompressState(str, dictionary)
	local ReadBits, ReadBytes, Decode, ReaderBitlenLeft
	, SkipToByteBoundary = CreateReader(str)
	local state =
	{
		ReadBits = ReadBits,
		ReadBytes = ReadBytes,
		Decode = Decode,
		ReaderBitlenLeft = ReaderBitlenLeft,
		SkipToByteBoundary = SkipToByteBoundary,
		buffer_size = 0,
		buffer = {},
		result_buffer = {},
		dictionary = dictionary,
	}
	return state
end

-- Get the stuffs needed to decode huffman codes
-- @see puff.c:construct(...)
-- @param huffman_bitlen The huffman bit length of the huffman codes.
-- @param max_symbol The maximum symbol
-- @param max_bitlen The min huffman bit length of all codes
-- @return zero or positive for success, negative for failure.
-- @return The count of each huffman bit length.
-- @return A table to convert huffman codes to deflate codes.
-- @return The minimum huffman bit length.
local function GetHuffmanForDecode(huffman_bitlens, max_symbol, max_bitlen)
	local huffman_bitlen_counts = {}
	local min_bitlen = max_bitlen
	for symbol = 0, max_symbol do
		local bitlen = huffman_bitlens[symbol] or 0
		min_bitlen = (bitlen > 0 and bitlen < min_bitlen)
		and bitlen or min_bitlen
		huffman_bitlen_counts[bitlen] = (huffman_bitlen_counts[bitlen] or 0)+1
	end
	
	if huffman_bitlen_counts[0] == max_symbol+1 then -- No Codes
		return 0, huffman_bitlen_counts, {}, 0 -- Complete, but decode will fail
	end
	
	local left = 1
	for len = 1, max_bitlen do
		left = left * 2
		left = left - (huffman_bitlen_counts[len] or 0)
		if left < 0 then
			return left -- Over-subscribed, return negative
		end
	end
	
	-- Generate offsets info symbol table for each length for sorting
	local offsets = {}
	offsets[1] = 0
	for len = 1, max_bitlen-1 do
		offsets[len + 1] = offsets[len] + (huffman_bitlen_counts[len] or 0)
	end
	
	local huffman_symbols = {}
	for symbol = 0, max_symbol do
		local bitlen = huffman_bitlens[symbol] or 0
		if bitlen ~= 0 then
			local offset = offsets[bitlen]
			huffman_symbols[offset] = symbol
			offsets[bitlen] = offsets[bitlen] + 1
		end
	end
	
	-- Return zero for complete set, positive for incomplete set.
	return left, huffman_bitlen_counts, huffman_symbols, min_bitlen
end

-- Decode a fixed or dynamic huffman blocks, excluding last block identifier
-- and block type identifer.
-- @see puff.c:codes()
-- @param state decompression state that will be modified by this function.
--	@see CreateDecompressState
-- @param ... Read the source code
-- @return 0 on success, other value on failure.
local function DecodeUntilEndOfBlock(state, lcodes_huffman_bitlens
	, lcodes_huffman_symbols, lcodes_huffman_min_bitlen
	, dcodes_huffman_bitlens, dcodes_huffman_symbols
	, dcodes_huffman_min_bitlen)
	local buffer, buffer_size, ReadBits, Decode, ReaderBitlenLeft
	, result_buffer =
		state.buffer, state.buffer_size, state.ReadBits, state.Decode
	, state.ReaderBitlenLeft, state.result_buffer
	local dictionary = state.dictionary
	local dict_string_table
	local dict_strlen
	
	local buffer_end = 1
	if dictionary and not buffer[0] then
		-- If there is a dictionary, copy the last 258 bytes into
		-- the string_table to make the copy in the main loop quicker.
		-- This is done only once per decompression.
		dict_string_table = dictionary.string_table
		dict_strlen = dictionary.strlen
		buffer_end = -dict_strlen + 1
		for i=0, (-dict_strlen+1)<-257 and -257 or (-dict_strlen+1), -1 do
			buffer[i] = _byte_to_char[dict_string_table[dict_strlen+i]]
		end
	end
	
	repeat
		local symbol = Decode(lcodes_huffman_bitlens
			, lcodes_huffman_symbols, lcodes_huffman_min_bitlen)
		if symbol < 0 or symbol > 285 then
			-- invalid literal/length or distance code in fixed or dynamic block
			return -10
		elseif symbol < 256 then -- Literal
			buffer_size = buffer_size + 1
			buffer[buffer_size] = _byte_to_char[symbol]
		elseif symbol > 256 then -- Length code
			symbol = symbol - 256
			local bitlen = _literal_deflate_code_to_base_len[symbol]
			bitlen = (symbol >= 8)
			and (bitlen
				+ ReadBits(_literal_deflate_code_to_extra_bitlen[symbol]))
			or bitlen
			symbol = Decode(dcodes_huffman_bitlens, dcodes_huffman_symbols
				, dcodes_huffman_min_bitlen)
			if symbol < 0 or symbol > 29 then
				-- invalid literal/length or distance code in fixed or dynamic block
				return -10
			end
			local dist = _dist_deflate_code_to_base_dist[symbol]
			dist = (dist > 4) and (dist
			+ ReadBits(_dist_deflate_code_to_extra_bitlen[symbol])) or dist
			
			local char_buffer_index = buffer_size-dist+1
			if char_buffer_index < buffer_end then
				-- distance is too far back in fixed or dynamic block
				return -11
			end
			if char_buffer_index >= -257 then
				for _=1, bitlen do
					buffer_size = buffer_size + 1
					buffer[buffer_size] = buffer[char_buffer_index]
					char_buffer_index = char_buffer_index + 1
				end
			else
				char_buffer_index = dict_strlen + char_buffer_index
				for _=1, bitlen do
					buffer_size = buffer_size + 1
					buffer[buffer_size] =
						_byte_to_char[dict_string_table[char_buffer_index]]
					char_buffer_index = char_buffer_index + 1
				end
			end
		end
		
		if ReaderBitlenLeft() < 0 then
			return 2 -- available inflate data did not terminate
		end
		
		if buffer_size >= 65536 then
			result_buffer[#result_buffer+1] =
				table_concat(buffer, "", 1, 32768)
			for i=32769, buffer_size do
				buffer[i-32768] = buffer[i]
			end
			buffer_size = buffer_size - 32768
			buffer[buffer_size+1] = nil
			-- NOTE: buffer[32769..end] and buffer[-257..0] are not cleared.
			-- This is why "buffer_size" variable is needed.
		end
	until symbol == 256
	
	state.buffer_size = buffer_size
	
	return 0
end

-- Decompress a store block
-- @param state decompression state that will be modified by this function.
-- @return 0 if succeeds, other value if fails.
local function DecompressStoreBlock(state)
	local buffer, buffer_size, ReadBits, ReadBytes, ReaderBitlenLeft
	, SkipToByteBoundary, result_buffer =
		state.buffer, state.buffer_size, state.ReadBits, state.ReadBytes
	, state.ReaderBitlenLeft, state.SkipToByteBoundary, state.result_buffer
	
	SkipToByteBoundary()
	local bytelen = ReadBits(16)
	if ReaderBitlenLeft() < 0 then
		return 2 -- available inflate data did not terminate
	end
	local bytelenComp = ReadBits(16)
	if ReaderBitlenLeft() < 0 then
		return 2 -- available inflate data did not terminate
	end
	
	if bytelen % 256 + bytelenComp % 256 ~= 255 then
		return -2 -- Not one's complement
	end
	if (bytelen-bytelen % 256)/256
		+ (bytelenComp-bytelenComp % 256)/256 ~= 255 then
		return -2 -- Not one's complement
	end
	
	-- Note that ReadBytes will skip to the next byte boundary first.
	buffer_size = ReadBytes(bytelen, buffer, buffer_size)
	if buffer_size < 0 then
		return 2 -- available inflate data did not terminate
	end
	
	-- memory clean up when there are enough bytes in the buffer.
	if buffer_size >= 65536 then
		result_buffer[#result_buffer+1] = table_concat(buffer, "", 1, 32768)
		for i=32769, buffer_size do
			buffer[i-32768] = buffer[i]
		end
		buffer_size = buffer_size - 32768
		buffer[buffer_size+1] = nil
	end
	state.buffer_size = buffer_size
	return 0
end

-- Decompress a fixed block
-- @param state decompression state that will be modified by this function.
-- @return 0 if succeeds other value if fails.
local function DecompressFixBlock(state)
	return DecodeUntilEndOfBlock(state
		, _fix_block_literal_huffman_bitlen_count
		, _fix_block_literal_huffman_to_deflate_code, 7
		, _fix_block_dist_huffman_bitlen_count
		, _fix_block_dist_huffman_to_deflate_code, 5)
end

-- Decompress a dynamic block
-- @param state decompression state that will be modified by this function.
-- @return 0 if success, other value if fails.
local function DecompressDynamicBlock(state)
	local ReadBits, Decode = state.ReadBits, state.Decode
	local nlen = ReadBits(5) + 257
	local ndist = ReadBits(5) + 1
	local ncode = ReadBits(4) + 4
	if nlen > 286 or ndist > 30 then
		-- dynamic block code description: too many length or distance codes
		return -3
	end
	
	local rle_codes_huffman_bitlens = {}
	
	for i = 1, ncode do
		rle_codes_huffman_bitlens[_rle_codes_huffman_bitlen_order[i]] =
			ReadBits(3)
	end
	
	local rle_codes_err, rle_codes_huffman_bitlen_counts,
	rle_codes_huffman_symbols, rle_codes_huffman_min_bitlen =
		GetHuffmanForDecode(rle_codes_huffman_bitlens, 18, 7)
	if rle_codes_err ~= 0 then -- Require complete code set here
		-- dynamic block code description: code lengths codes incomplete
		return -4
	end
	
	local lcodes_huffman_bitlens = {}
	local dcodes_huffman_bitlens = {}
	-- Read length/literal and distance code length tables
	local index = 0
	while index < nlen + ndist do
		local symbol -- Decoded value
		local bitlen -- Last length to repeat
		
		symbol = Decode(rle_codes_huffman_bitlen_counts
			, rle_codes_huffman_symbols, rle_codes_huffman_min_bitlen)
		
		if symbol < 0 then
			return symbol -- Invalid symbol
		elseif symbol < 16 then
			if index < nlen then
				lcodes_huffman_bitlens[index] = symbol
			else
				dcodes_huffman_bitlens[index-nlen] = symbol
			end
			index = index + 1
		else
			bitlen = 0
			if symbol == 16 then
				if index == 0 then
					-- dynamic block code description: repeat lengths
					-- with no first length
					return -5
				end
				if index-1 < nlen then
					bitlen = lcodes_huffman_bitlens[index-1]
				else
					bitlen = dcodes_huffman_bitlens[index-nlen-1]
				end
				symbol = 3 + ReadBits(2)
			elseif symbol == 17 then -- Repeat zero 3..10 times
				symbol = 3 + ReadBits(3)
			else -- == 18, repeat zero 11.138 times
				symbol = 11 + ReadBits(7)
			end
			if index + symbol > nlen + ndist then
				-- dynamic block code description:
				-- repeat more than specified lengths
				return -6
			end
			while symbol > 0 do -- Repeat last or zero symbol times
				symbol = symbol - 1
				if index < nlen then
					lcodes_huffman_bitlens[index] = bitlen
				else
					dcodes_huffman_bitlens[index-nlen] = bitlen
				end
				index = index + 1
			end
		end
	end
	
	if (lcodes_huffman_bitlens[256] or 0) == 0 then
		-- dynamic block code description: missing end-of-block code
		return -9
	end
	
	local lcodes_err, lcodes_huffman_bitlen_counts
	, lcodes_huffman_symbols, lcodes_huffman_min_bitlen =
		GetHuffmanForDecode(lcodes_huffman_bitlens, nlen-1, 15)
	--dynamic block code description: invalid literal/length code lengths,
	-- Incomplete code ok only for single length 1 code
	if (lcodes_err ~=0 and (lcodes_err < 0
		or nlen ~= (lcodes_huffman_bitlen_counts[0] or 0)
		+(lcodes_huffman_bitlen_counts[1] or 0))) then
		return -7
	end
	
	local dcodes_err, dcodes_huffman_bitlen_counts
	, dcodes_huffman_symbols, dcodes_huffman_min_bitlen =
		GetHuffmanForDecode(dcodes_huffman_bitlens, ndist-1, 15)
	-- dynamic block code description: invalid distance code lengths,
	-- Incomplete code ok only for single length 1 code
	if (dcodes_err ~=0 and (dcodes_err < 0
		or ndist ~= (dcodes_huffman_bitlen_counts[0] or 0)
		+ (dcodes_huffman_bitlen_counts[1] or 0))) then
		return -8
	end
	
	-- Build buffman table for literal/length codes
	return DecodeUntilEndOfBlock(state, lcodes_huffman_bitlen_counts
		, lcodes_huffman_symbols, lcodes_huffman_min_bitlen
		, dcodes_huffman_bitlen_counts, dcodes_huffman_symbols
		, dcodes_huffman_min_bitlen)
end

-- Decompress a deflate stream
-- @param state: a decompression state
-- @return the decompressed string if succeeds. nil if fails.
local function Inflate(state)
	local ReadBits = state.ReadBits
	
	local is_last_block
	while not is_last_block do
		is_last_block = (ReadBits(1) == 1)
		local block_type = ReadBits(2)
		local status
		if block_type == 0 then
			status = DecompressStoreBlock(state)
		elseif block_type == 1 then
			status = DecompressFixBlock(state)
		elseif block_type == 2 then
			status = DecompressDynamicBlock(state)
		else
			return nil, -1 -- invalid block type (type == 3)
		end
		if status ~= 0 then
			return nil, status
		end
	end
	
	state.result_buffer[#state.result_buffer+1] =
		table_concat(state.buffer, "", 1, state.buffer_size)
	local result = table_concat(state.result_buffer)
	return result
end

-- @see LibDeflate:DecompressDeflate(str)
-- @see LibDeflate:DecompressDeflateWithDict(str, dictionary)
local function DecompressDeflateInternal(str, dictionary)
	local state = CreateDecompressState(str, dictionary)
	local result, status = Inflate(state)
	if not result then
		return nil, status
	end
	
	local bitlen_left = state.ReaderBitlenLeft()
	local bytelen_left = (bitlen_left - bitlen_left % 8) / 8
	return result, bytelen_left
end

-- @see LibDeflate:DecompressZlib(str)
-- @see LibDeflate:DecompressZlibWithDict(str)
local function DecompressZlibInternal(str, dictionary)
	local state = CreateDecompressState(str, dictionary)
	local ReadBits = state.ReadBits
	
	local CMF = ReadBits(8)
	if state.ReaderBitlenLeft() < 0 then
		return nil, 2 -- available inflate data did not terminate
	end
	local CM = CMF % 16
	local CINFO = (CMF - CM) / 16
	if CM ~= 8 then
		return nil, -12 -- invalid compression method
	end
	if CINFO > 7 then
		return nil, -13 -- invalid window size
	end
	
	local FLG = ReadBits(8)
	if state.ReaderBitlenLeft() < 0 then
		return nil, 2 -- available inflate data did not terminate
	end
	if (CMF*256+FLG)%31 ~= 0 then
		return nil, -14 -- invalid header checksum
	end
	
	local FDIST = ((FLG-FLG%32)/32 % 2)
	local FLEVEL = ((FLG-FLG%64)/64 % 4) -- luacheck: ignore FLEVEL
	
	if FDIST == 1 then
		if not dictionary then
			return nil, -16 -- need dictonary, but dictionary is not provided.
		end
		local byte3 = ReadBits(8)
		local byte2 = ReadBits(8)
		local byte1 = ReadBits(8)
		local byte0 = ReadBits(8)
		local actual_adler32 = byte3*16777216+byte2*65536+byte1*256+byte0
		if state.ReaderBitlenLeft() < 0 then
			return nil, 2 -- available inflate data did not terminate
		end
		if not IsEqualAdler32(actual_adler32, dictionary.adler32) then
			return nil, -17 -- dictionary adler32 does not match
		end
	end
	local result, status = Inflate(state)
	if not result then
		return nil, status
	end
	state.SkipToByteBoundary()
	
	local adler_byte0 = ReadBits(8)
	local adler_byte1 = ReadBits(8)
	local adler_byte2 = ReadBits(8)
	local adler_byte3 = ReadBits(8)
	if state.ReaderBitlenLeft() < 0 then
		return nil, 2 -- available inflate data did not terminate
	end
	
	local adler32_expected = adler_byte0*16777216
	+ adler_byte1*65536 + adler_byte2*256 + adler_byte3
	local adler32_actual = LibDeflate:Adler32(result)
	if not IsEqualAdler32(adler32_expected, adler32_actual) then
		return nil, -15 -- Adler32 checksum does not match
	end
	
	local bitlen_left = state.ReaderBitlenLeft()
	local bytelen_left = (bitlen_left - bitlen_left % 8) / 8
	return result, bytelen_left
end

--- Decompress a raw deflate compressed data.
-- @param str [string] The data to be decompressed.
-- @return [string/nil] If the decompression succeeds, return the decompressed
-- data. If the decompression fails, return nil. You should check if this return
-- value is non-nil to know if the decompression succeeds.
-- @return [integer] If the decompression succeeds, return the number of
-- unprocessed bytes in the input compressed data. This return value is a
-- positive integer if the input data is a valid compressed data appended by an
-- arbitary non-empty string. This return value is 0 if the input data does not
-- contain any extra bytes.<br>
-- If the decompression fails (The first return value of this function is nil),
-- this return value is undefined.
-- @see LibDeflate:CompressDeflate
function LibDeflate:DecompressDeflate(str)
	local arg_valid, arg_err = IsValidArguments(str)
	if not arg_valid then
		error(("Usage: LibDeflate:DecompressDeflate(str): "
			..arg_err), 2)
	end
	return DecompressDeflateInternal(str)
end

--- Decompress a raw deflate compressed data with a preset dictionary.
-- @param str [string] The data to be decompressed.
-- @param dictionary [table] The preset dictionary used by
-- LibDeflate:CompressDeflateWithDict when the compressed data is produced.
-- Decompression and compression must use the same dictionary.
-- Otherwise wrong decompressed data could be produced without generating any
-- error.
-- @return [string/nil] If the decompression succeeds, return the decompressed
-- data. If the decompression fails, return nil. You should check if this return
-- value is non-nil to know if the decompression succeeds.
-- @return [integer] If the decompression succeeds, return the number of
-- unprocessed bytes in the input compressed data. This return value is a
-- positive integer if the input data is a valid compressed data appended by an
-- arbitary non-empty string. This return value is 0 if the input data does not
-- contain any extra bytes.<br>
-- If the decompression fails (The first return value of this function is nil),
-- this return value is undefined.
-- @see LibDeflate:CompressDeflateWithDict
function LibDeflate:DecompressDeflateWithDict(str, dictionary)
	local arg_valid, arg_err = IsValidArguments(str, true, dictionary)
	if not arg_valid then
		error(("Usage: LibDeflate:DecompressDeflateWithDict(str, dictionary): "
			..arg_err), 2)
	end
	return DecompressDeflateInternal(str, dictionary)
end

--- Decompress a zlib compressed data.
-- @param str [string] The data to be decompressed
-- @return [string/nil] If the decompression succeeds, return the decompressed
-- data. If the decompression fails, return nil. You should check if this return
-- value is non-nil to know if the decompression succeeds.
-- @return [integer] If the decompression succeeds, return the number of
-- unprocessed bytes in the input compressed data. This return value is a
-- positive integer if the input data is a valid compressed data appended by an
-- arbitary non-empty string. This return value is 0 if the input data does not
-- contain any extra bytes.<br>
-- If the decompression fails (The first return value of this function is nil),
-- this return value is undefined.
-- @see LibDeflate:CompressZlib
function LibDeflate:DecompressZlib(str)
	local arg_valid, arg_err = IsValidArguments(str)
	if not arg_valid then
		error(("Usage: LibDeflate:DecompressZlib(str): "
			..arg_err), 2)
	end
	return DecompressZlibInternal(str)
end

--- Decompress a zlib compressed data with a preset dictionary.
-- @param str [string] The data to be decompressed
-- @param dictionary [table] The preset dictionary used by
-- LibDeflate:CompressDeflateWithDict when the compressed data is produced.
-- Decompression and compression must use the same dictionary.
-- Otherwise wrong decompressed data could be produced without generating any
-- error.
-- @return [string/nil] If the decompression succeeds, return the decompressed
-- data. If the decompression fails, return nil. You should check if this return
-- value is non-nil to know if the decompression succeeds.
-- @return [integer] If the decompression succeeds, return the number of
-- unprocessed bytes in the input compressed data. This return value is a
-- positive integer if the input data is a valid compressed data appended by an
-- arbitary non-empty string. This return value is 0 if the input data does not
-- contain any extra bytes.<br>
-- If the decompression fails (The first return value of this function is nil),
-- this return value is undefined.
-- @see LibDeflate:CompressZlibWithDict
function LibDeflate:DecompressZlibWithDict(str, dictionary)
	local arg_valid, arg_err = IsValidArguments(str, true, dictionary)
	if not arg_valid then
		error(("Usage: LibDeflate:DecompressZlibWithDict(str, dictionary): "
			..arg_err), 2)
	end
	return DecompressZlibInternal(str, dictionary)
end

-- Calculate the huffman code of fixed block
do
	_fix_block_literal_huffman_bitlen = {}
	for sym=0, 143 do
		_fix_block_literal_huffman_bitlen[sym] = 8
	end
	for sym=144, 255 do
		_fix_block_literal_huffman_bitlen[sym] = 9
	end
	for sym=256, 279 do
		_fix_block_literal_huffman_bitlen[sym] = 7
	end
	for sym=280, 287 do
		_fix_block_literal_huffman_bitlen[sym] = 8
	end
	
	_fix_block_dist_huffman_bitlen = {}
	for dist=0, 31 do
		_fix_block_dist_huffman_bitlen[dist] = 5
	end
	local status
	status, _fix_block_literal_huffman_bitlen_count
	, _fix_block_literal_huffman_to_deflate_code =
		GetHuffmanForDecode(_fix_block_literal_huffman_bitlen, 287, 9)
	assert(status == 0)
	status, _fix_block_dist_huffman_bitlen_count,
		_fix_block_dist_huffman_to_deflate_code =
		GetHuffmanForDecode(_fix_block_dist_huffman_bitlen, 31, 5)
	assert(status == 0)
	
	_fix_block_literal_huffman_code =
		GetHuffmanCodeFromBitlen(_fix_block_literal_huffman_bitlen_count
			, _fix_block_literal_huffman_bitlen, 287, 9)
	_fix_block_dist_huffman_code =
		GetHuffmanCodeFromBitlen(_fix_block_dist_huffman_bitlen_count
			, _fix_block_dist_huffman_bitlen, 31, 5)
end

-- Prefix encoding algorithm
-- Credits to LibCompress.
-- The code has been rewritten by the author of LibDeflate.
------------------------------------------------------------------------------

-- to be able to match any requested byte value, the search
-- string must be preprocessed characters to escape with %:
-- ( ) . % + - * ? [ ] ^ $
-- "illegal" byte values:
-- 0 is replaces %z
local _gsub_escape_table = {
	["\000"] = "%z", ["("] = "%(", [")"] = "%)", ["."] = "%.",
	["%"] = "%%", ["+"] = "%+", ["-"] = "%-", ["*"] = "%*",
	["?"] = "%?", ["["] = "%[", ["]"] = "%]", ["^"] = "%^",
	["$"] = "%$",
}

local function escape_for_gsub(str)
	return str:gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", _gsub_escape_table)
end

--- Create a custom codec with encoder and decoder. <br>
-- This codec is used to convert an input string to make it not contain
-- some specific bytes.
-- This created codec and the parameters of this function do NOT take
-- localization into account. One byte (0-255) in the string is exactly one
-- character (0-255).
-- Credits to LibCompress.
-- The code has been rewritten by the author of LibDeflate. <br>
-- @param reserved_chars [string] The created encoder will ensure encoded
-- data does not contain any single character in reserved_chars. This parameter
-- should be non-empty.
-- @param escape_chars [string] The escape character(s) used in the created
-- codec. The codec converts any character included in reserved\_chars /
-- escape\_chars / map\_chars to (one escape char + one character not in
-- reserved\_chars / escape\_chars / map\_chars).
-- You usually only need to provide a length-1 string for this parameter.
-- Length-2 string is only needed when
-- reserved\_chars + escape\_chars + map\_chars is longer than 127.
-- This parameter should be non-empty.
-- @param map_chars [string] The created encoder will map every
-- reserved\_chars:sub(i, i) (1 <= i <= #map\_chars) to map\_chars:sub(i, i).
-- This parameter CAN be empty string.
-- @return [table/nil] If the codec cannot be created, return nil.<br>
-- If the codec can be created according to the given
-- parameters, return the codec, which is a encode/decode table.
-- The table contains two functions: <br>
-- t:Encode(str) returns the encoded string. <br>
-- t:Decode(str) returns the decoded string if succeeds. nil if fails.
-- @return [nil/string] If the codec is successfully created, return nil.
-- If not, return a string that describes the reason why the codec cannot be
-- created.
-- @usage
-- -- Create an encoder/decoder that maps all "\000" to "\003",
-- -- and escape "\001" (and "\002" and "\003") properly
-- local codec = LibDeflate:CreateCodec("\000\001", "\002", "\003")
--
-- local encoded = codec:Encode(SOME_STRING)
-- -- "encoded" does not contain "\000" or "\001"
-- local decoded = codec:Decode(encoded)
-- -- assert(decoded == SOME_STRING)
function LibDeflate:CreateCodec(reserved_chars, escape_chars
	, map_chars)
	if type(reserved_chars) ~= "string"
		or type(escape_chars) ~= "string"
		or type(map_chars) ~= "string" then
		error(
			"Usage: LibDeflate:CreateCodec(reserved_chars,"
			.." escape_chars, map_chars):"
			.." All arguments must be string.", 2)
	end
	
	if escape_chars == "" then
		return nil, "No escape characters supplied."
	end
	if #reserved_chars < #map_chars then
		return nil, "The number of reserved characters must be"
		.." at least as many as the number of mapped chars."
	end
	if reserved_chars == "" then
		return nil, "No characters to encode."
	end
	
	local encode_bytes = reserved_chars..escape_chars..map_chars
	-- build list of bytes not available as a suffix to a prefix byte
	local taken = {}
	for i = 1, #encode_bytes do
		local byte = string_byte(encode_bytes, i, i)
		if taken[byte] then
			return nil, "There must be no duplicate characters in the"
			.." concatenation of reserved_chars, escape_chars and"
			.." map_chars."
		end
		taken[byte] = true
	end
	
	local decode_patterns = {}
	local decode_repls = {}
	
	-- the encoding can be a single gsub
	-- , but the decoding can require multiple gsubs
	local encode_search = {}
	local encode_translate = {}
	
	-- map single byte to single byte
	if #map_chars > 0 then
		local decode_search = {}
		local decode_translate = {}
		for i = 1, #map_chars do
			local from = string_sub(reserved_chars, i, i)
			local to = string_sub(map_chars, i, i)
			encode_translate[from] = to
			encode_search[#encode_search+1] = from
			decode_translate[to] = from
			decode_search[#decode_search+1] = to
		end
		decode_patterns[#decode_patterns+1] =
			"([".. escape_for_gsub(table_concat(decode_search)).."])"
		decode_repls[#decode_repls+1] = decode_translate
	end
	
	local escape_char_index = 1
	local escape_char = string_sub(escape_chars
		, escape_char_index, escape_char_index)
	-- map single byte to double-byte
	local r = 0 -- suffix char value to the escapeChar
	
	local decode_search = {}
	local decode_translate = {}
	for i = 1, #encode_bytes do
		local c = string_sub(encode_bytes, i, i)
		if not encode_translate[c] then
			while r >= 256 or taken[r] do
				r = r + 1
				if r > 255 then -- switch to next escapeChar
					decode_patterns[#decode_patterns+1] =
						escape_for_gsub(escape_char)
						.."(["
						.. escape_for_gsub(table_concat(decode_search)).."])"
					decode_repls[#decode_repls+1] = decode_translate
					
					escape_char_index = escape_char_index + 1
					escape_char = string_sub(escape_chars, escape_char_index
						, escape_char_index)
					r = 0
					decode_search = {}
					decode_translate = {}
					
					if not escape_char or escape_char == "" then
						-- actually I don't need to check
						-- "not ecape_char", but what if Lua changes
						-- the behavior of string.sub() in the future?
						-- we are out of escape chars and we need more!
						return nil, "Out of escape characters."
					end
				end
			end
			
			local char_r = _byte_to_char[r]
			encode_translate[c] = escape_char..char_r
			encode_search[#encode_search+1] = c
			decode_translate[char_r] = c
			decode_search[#decode_search+1] = char_r
			r = r + 1
		end
		if i == #encode_bytes then
			decode_patterns[#decode_patterns+1] =
				escape_for_gsub(escape_char).."(["
				.. escape_for_gsub(table_concat(decode_search)).."])"
			decode_repls[#decode_repls+1] = decode_translate
		end
	end
	
	local codec = {}
	
	local encode_pattern = "(["
	.. escape_for_gsub(table_concat(encode_search)).."])"
	local encode_repl = encode_translate
	
	function codec:Encode(str)
		if type(str) ~= "string" then
			error(("Usage: codec:Encode(str):"
				.." 'str' - string expected got '%s'."):format(type(str)), 2)
		end
		return string_gsub(str, encode_pattern, encode_repl)
	end
	
	local decode_tblsize = #decode_patterns
	local decode_fail_pattern = "(["
	.. escape_for_gsub(reserved_chars).."])"
	
	function codec:Decode(str)
		if type(str) ~= "string" then
			error(("Usage: codec:Decode(str):"
				.." 'str' - string expected got '%s'."):format(type(str)), 2)
		end
		if string_find(str, decode_fail_pattern) then
			return nil
		end
		for i = 1, decode_tblsize do
			str = string_gsub(str, decode_patterns[i], decode_repls[i])
		end
		return str
	end
	
	return codec
end

local _addon_channel_codec


-- Credits to WeakAuras2 and Galmok for the 6 bit encoding algorithm.
-- The code has been rewritten by the author of LibDeflate.
-- The result of encoding will be 25% larger than the
-- origin string, but every single byte of the encoding result will be
-- printable characters as the following.
local _byte_to_6bit_char = {
	[0]="a", "b", "c", "d", "e", "f", "g", "h",
	"i", "j", "k", "l", "m", "n", "o", "p",
	"q", "r", "s", "t", "u", "v", "w", "x",
	"y", "z", "A", "B", "C", "D", "E", "F",
	"G", "H", "I", "J", "K", "L", "M", "N",
	"O", "P", "Q", "R", "S", "T", "U", "V",
	"W", "X", "Y", "Z", "0", "1", "2", "3",
	"4", "5", "6", "7", "8", "9", "(", ")",
}

local _6bit_to_byte = {
	[97]=0,[98]=1,[99]=2,[100]=3,[101]=4,[102]=5,[103]=6,[104]=7,
	[105]=8,[106]=9,[107]=10,[108]=11,[109]=12,[110]=13,[111]=14,[112]=15,
	[113]=16,[114]=17,[115]=18,[116]=19,[117]=20,[118]=21,[119]=22,[120]=23,
	[121]=24,[122]=25,[65]=26,[66]=27,[67]=28,[68]=29,[69]=30,[70]=31,
	[71]=32,[72]=33,[73]=34,[74]=35,[75]=36,[76]=37,[77]=38,[78]=39,
	[79]=40,[80]=41,[81]=42,[82]=43,[83]=44,[84]=45,[85]=46,[86]=47,
	[87]=48,[88]=49,[89]=50,[90]=51,[48]=52,[49]=53,[50]=54,[51]=55,
	[52]=56,[53]=57,[54]=58,[55]=59,[56]=60,[57]=61,[40]=62,[41]=63,
}

--- Encode the string to make it printable. <br>
--
-- Credit to WeakAuras2, this function is equivalant to the implementation
-- it is using right now. <br>
-- The code has been rewritten by the author of LibDeflate. <br>
-- The encoded string will be 25% larger than the origin string. However, every
-- single byte of the encoded string will be one of 64 printable ASCII
-- characters, which are can be easier copied, pasted and displayed.
-- (26 lowercase letters, 26 uppercase letters, 10 numbers digits,
-- left parenthese, or right parenthese)
-- @param str [string] The string to be encoded.
-- @return [string] The encoded string.
function LibDeflate:EncodeForPrint(str)
	if type(str) ~= "string" then
		error(("Usage: LibDeflate:EncodeForPrint(str):"
			.." 'str' - string expected got '%s'."):format(type(str)), 2)
	end
	local strlen = #str
	local strlenMinus2 = strlen - 2
	local i = 1
	local buffer = {}
	local buffer_size = 0
	while i <= strlenMinus2 do
		local x1, x2, x3 = string_byte(str, i, i+2)
		i = i + 3
		local cache = x1+x2*256+x3*65536
		local b1 = cache % 64
		cache = (cache - b1) / 64
		local b2 = cache % 64
		cache = (cache - b2) / 64
		local b3 = cache % 64
		local b4 = (cache - b3) / 64
		buffer_size = buffer_size + 1
		buffer[buffer_size] =
			_byte_to_6bit_char[b1].._byte_to_6bit_char[b2]
			.._byte_to_6bit_char[b3].._byte_to_6bit_char[b4]
	end
	
	local cache = 0
	local cache_bitlen = 0
	while i <= strlen do
		local x = string_byte(str, i, i)
		cache = cache + x * _pow2[cache_bitlen]
		cache_bitlen = cache_bitlen + 8
		i = i + 1
	end
	while cache_bitlen > 0 do
		local bit6 = cache % 64
		buffer_size = buffer_size + 1
		buffer[buffer_size] = _byte_to_6bit_char[bit6]
		cache = (cache - bit6) / 64
		cache_bitlen = cache_bitlen - 6
	end
	
	return table_concat(buffer)
end

--- Decode the printable string produced by LibDeflate:EncodeForPrint.
-- "str" will have its prefixed and trailing control characters or space
-- removed before it is decoded, so it is easier to use if "str" comes form
-- user copy and paste with some prefixed or trailing spaces.
-- Then decode fails if the string contains any characters cant be produced by
-- LibDeflate:EncodeForPrint. That means, decode fails if the string contains a
-- characters NOT one of 26 lowercase letters, 26 uppercase letters,
-- 10 numbers digits, left parenthese, or right parenthese.
-- @param str [string] The string to be decoded
-- @return [string/nil] The decoded string if succeeds. nil if fails.
function LibDeflate:DecodeForPrint(str)
	if type(str) ~= "string" then
		error(("Usage: LibDeflate:DecodeForPrint(str):"
			.." 'str' - string expected got '%s'."):format(type(str)), 2)
	end
	str = str:gsub("^[%c ]+", "")
	str = str:gsub("[%c ]+$", "")
	
	local strlen = #str
	if strlen == 1 then
		return nil
	end
	local strlenMinus3 = strlen - 3
	local i = 1
	local buffer = {}
	local buffer_size = 0
	while i <= strlenMinus3 do
		local x1, x2, x3, x4 = string_byte(str, i, i+3)
		x1 = _6bit_to_byte[x1]
		x2 = _6bit_to_byte[x2]
		x3 = _6bit_to_byte[x3]
		x4 = _6bit_to_byte[x4]
		if not (x1 and x2 and x3 and x4) then
			return nil
		end
		i = i + 4
		local cache = x1+x2*64+x3*4096+x4*262144
		local b1 = cache % 256
		cache = (cache - b1) / 256
		local b2 = cache % 256
		local b3 = (cache - b2) / 256
		buffer_size = buffer_size + 1
		buffer[buffer_size] =
			_byte_to_char[b1].._byte_to_char[b2].._byte_to_char[b3]
	end
	
	local cache  = 0
	local cache_bitlen = 0
	while i <= strlen do
		local x = string_byte(str, i, i)
		x =  _6bit_to_byte[x]
		if not x then
			return nil
		end
		cache = cache + x * _pow2[cache_bitlen]
		cache_bitlen = cache_bitlen + 6
		i = i + 1
	end
	
	while cache_bitlen >= 8 do
		local byte = cache % 256
		buffer_size = buffer_size + 1
		buffer[buffer_size] = _byte_to_char[byte]
		cache = (cache - byte) / 256
		cache_bitlen = cache_bitlen - 8
	end
	
	return table_concat(buffer)
end

local function InternalClearCache()
	_addon_channel_codec = nil
end

-- For test. Don't use the functions in this table for real application.
-- Stuffs in this table is subject to change.
LibDeflate.internals = {
	LoadStringToTable = LoadStringToTable,
	IsValidDictionary = IsValidDictionary,
	IsEqualAdler32 = IsEqualAdler32,
	_byte_to_6bit_char = _byte_to_6bit_char,
	_6bit_to_byte = _6bit_to_byte,
	InternalClearCache = InternalClearCache,
}

return Compression
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
-- Credit: @ForeverHD (topbarPlus)
-- Name: icons.lua
-- Description: Topbar icons for the chat

local replicatedStorage = game:GetService("ReplicatedStorage")
local runService = game:GetService("RunService")
local starterGui = game:GetService("StarterGui")

return function(environment)
	shared.newConfig = environment.config;
	local topbarPlusReference = replicatedStorage:FindFirstChild("TopbarPlusReference")
	local iconModule = script.Parent:WaitForChild("TopbarPlus"):WaitForChild("Icon")
	if(topbarPlusReference) then
		iconModule = topbarPlusReference.Value
	end

	local icon = require(iconModule)
	local callback = environment.toggleSettingsMenu
	local settingIcon = icon.new():setImage(environment.config.SettingsMenu.TopbarButton.Icon)
	settingIcon.selected:Connect(callback)
	settingIcon.deselected:Connect(callback)
	if(environment.config.SettingsMenu.ApiEnabledAndUIDisabled == true) then
		settingIcon:setEnabled(false)
	end
	
	if(not environment.config.SettingsMenu.TopbarButton.Enabled) then
		settingIcon:setEnabled(false)
	end
	
	environment.settingIcon = settingIcon
	
	function environment:toggleSettingsTopbar()
		settingIcon:deselect()
	end
	
	function environment:openSettingsMenu()
		settingIcon:select()
	end
end

--[[
	
	The majority of this code is an interface designed to make it easy for you to
	work with TopbarPlus (most methods for instance reference :modifyTheme()).
	The processing overhead mainly consists of applying themes and calculating 
	appearance (such as size and width of labels) which is handled in about
	200 lines of code here and the Widget UI module. This has been achieved
	in v3 by outsourcing a majority of previous calculations to inbuilt Roblox
	features like UIListLayouts.


	v3 provides inbuilt support for controllers (simply press DPadUp),
	touch devices (phones, tablets , etc), localization (automatic resizing
	of widgets, autolocalize for relevant labels), backwards compatability
	with the old topbar, and more.


	My primary goals for the v3 re-write have been to:
		
	1. Improve code readability and organisation (reduced lines of code within
	   Icon+IconController from 3200 to ~950, separated UI elements, etc)
		
	2. Improve ease-of-use (themes now actually make sense and can account
	   for any modifications you want, converted to a package for
	   quick installation and easy-comparisons of new updates, etc)
	
	3. Provide support for all key features of the new Roblox topbar
	   while improving performance of the module (deferring and collecting
	   changes then calling as a singular, utilizing inbuilt Roblox features
	   such as UILIstLayouts, etc)

--]]



-- SERVICES
local LocalizationService = game:GetService("LocalizationService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TextService = game:GetService("TextService")
local StarterGui = game:GetService("StarterGui")
local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")



-- REFERENCE HANDLER
-- Multiple Icons packages may exist at runtime (for instance if the developer additionally uses HD Admin)
-- therefore this ensures that the first required package becomes the dominant and only functioning module
local iconModule = script
local dependencies = script.Parent:WaitForChild("Dependencies")
local Reference = require(dependencies.Reference)
local referenceObject = Reference.getObject()
local leadPackage = referenceObject and referenceObject.Value
if leadPackage and leadPackage ~= iconModule then
	return require(leadPackage)
end
if not referenceObject then
	Reference.addToReplicatedStorage()
end



-- MODULES
local Signal = require(dependencies.Packages.GoodSignal)
local Janitor = require(dependencies.Packages.Janitor)
local Utility = require(dependencies.Utility)
local Attribute = require(dependencies.Attribute)
local Themes = require(dependencies.Features.Themes)
local Gamepad = require(dependencies.Features.Gamepad)
local Overflow = require(dependencies.Features.Overflow)
local Icon = {}
Icon.__index = Icon



--- LOCAL
local localPlayer = Players.LocalPlayer
local themes = dependencies.Features.Themes
local playerGui = localPlayer:WaitForChild("PlayerGui")
local iconsDict = {}
local anyIconSelected = Signal.new()
local elements = dependencies.Elements
local totalCreatedIcons = 0



-- PRESETUP
-- This is only used to determine if we need to apply the old topbar theme
-- I'll be removing this and associated functions once all games have
-- fully transitioned over to the new topbar
if GuiService.TopbarInset.Height == 0 then
	GuiService:GetPropertyChangedSignal("TopbarInset"):Wait()
end



-- PUBLIC VARIABLES
Icon.baseDisplayOrderChanged = Signal.new()
Icon.baseDisplayOrder = 10
Icon.baseTheme = require(themes.Parent.ThemeModules.Default)
Icon.isOldTopbar = GuiService.TopbarInset.Height == 36
Icon.iconsDictionary = iconsDict
Icon.container = require(elements.Container)(Icon)
Icon.topbarEnabled = true
Icon.iconAdded = Signal.new()
Icon.iconRemoved = Signal.new()
Icon.iconChanged = Signal.new()



-- PUBLIC FUNCTIONS
function Icon.getIcons()
	return Icon.iconsDictionary
end

function Icon.getIconByUID(UID)
	local match = Icon.iconsDictionary[UID]
	if match then
		return match
	end
end

function Icon.getIcon(nameOrUID)
	local match = Icon.getIconByUID(nameOrUID)
	if match then
		return match
	end
	for _, icon in pairs(iconsDict) do
		if icon.name == nameOrUID then
			return icon
		end
	end
end

function Icon.setTopbarEnabled(bool, isInternal)
	if typeof(bool) ~= "boolean" then
		bool = Icon.topbarEnabled
	end
	if not isInternal then
		Icon.topbarEnabled = bool
	end
	for _, screenGui in pairs(Icon.container) do
		screenGui.Enabled = bool
	end
end

function Icon.modifyBaseTheme(modifications)
	modifications = Themes.getModifications(modifications)
	for _, modification in pairs(modifications) do
		for _, detail in pairs(Icon.baseTheme) do
			Themes.merge(detail, modification)
		end
	end
	for _, icon in pairs(iconsDict) do
		icon:setTheme(Icon.baseTheme)
	end
end

function Icon.setDisplayOrder(int)
	Icon.baseDisplayOrder = int
	Icon.baseDisplayOrderChanged:Fire(int)
end



-- SETUP
task.defer(Gamepad.start, Icon)
task.defer(Overflow.start, Icon)
for _, screenGui in pairs(Icon.container) do
	screenGui.Parent = playerGui
end
if Icon.isOldTopbar then
	Icon.modifyBaseTheme(require(themes.Parent.ThemeModules.Classic))
end



-- CONSTRUCTOR
function Icon.new()
	local self = {}
	setmetatable(self, Icon)

	--- Janitors (for cleanup)
	local janitor = Janitor.new()
	self.janitor = janitor
	self.themesJanitor = janitor:add(Janitor.new())
	self.singleClickJanitor = janitor:add(Janitor.new())
	self.captionJanitor = janitor:add(Janitor.new())
	self.joinJanitor = janitor:add(Janitor.new())
	self.menuJanitor = janitor:add(Janitor.new())
	self.dropdownJanitor = janitor:add(Janitor.new())

	-- Register
	local iconUID = Utility.generateUID()
	iconsDict[iconUID] = self
	janitor:add(function()
		iconsDict[iconUID] = nil
	end)

	-- Signals (events)
	self.selected = janitor:add(Signal.new())
	self.deselected = janitor:add(Signal.new())
	self.toggled = janitor:add(Signal.new())
	self.viewingStarted = janitor:add(Signal.new())
	self.viewingEnded = janitor:add(Signal.new())
	self.stateChanged = janitor:add(Signal.new())
	self.notified = janitor:add(Signal.new())
	self.noticeStarted = janitor:add(Signal.new())
	self.noticeChanged = janitor:add(Signal.new())
	self.endNotices = janitor:add(Signal.new())
	self.toggleKeyAdded = janitor:add(Signal.new())
	self.fakeToggleKeyChanged = janitor:add(Signal.new())
	self.alignmentChanged = janitor:add(Signal.new())
	self.updateSize = janitor:add(Signal.new())
	self.resizingComplete = janitor:add(Signal.new())
	self.joinedParent = janitor:add(Signal.new())
	self.menuSet = janitor:add(Signal.new())
	self.dropdownSet = janitor:add(Signal.new())
	self.updateMenu = janitor:add(Signal.new())
	self.startMenuUpdate = janitor:add(Signal.new())
	self.childThemeModified = janitor:add(Signal.new())
	self.indicatorSet = janitor:add(Signal.new())
	self.dropdownChildAdded = janitor:add(Signal.new())
	self.menuChildAdded = janitor:add(Signal.new())

	-- Properties
	self.iconModule = iconModule
	self.UID = iconUID
	self.isEnabled = true
	self.isSelected = false
	self.isViewing = false
	self.joinedFrame = false
	self.parentIconUID = false
	self.deselectWhenOtherIconSelected = true
	self.totalNotices = 0
	self.activeState = "Deselected"
	self.alignment = ""
	self.originalAlignment = ""
	self.appliedTheme = {}
	self.appearance = {}
	self.cachedInstances = {}
	self.cachedNamesToInstances = {}
	self.cachedCollectives = {}
	self.bindedToggleKeys = {}
	self.customBehaviours = {}
	self.toggleItems = {}
	self.bindedEvents = {}
	self.notices = {}
	self.menuIcons = {}
	self.dropdownIcons = {}
	self.childIconsDict = {}
	self.isOldTopbar = Icon.isOldTopbar
	self.creationTime = os.clock()

	-- Widget is the new name for an icon
	local widget = janitor:add(require(elements.Widget)(self, Icon))
	self.widget = widget
	self:setAlignment()
	
	-- It's important we set an order otherwise icons will not align
	-- correctly within menus
	totalCreatedIcons += 1
	local ourOrder = totalCreatedIcons
	self:setOrder(ourOrder)

	-- This applies the default them
	self:setTheme(Icon.baseTheme)

	-- Button Clicked (for states "Selected" and "Deselected")
	local clickRegion = self:getInstance("ClickRegion")
	local function handleToggle()
		if self.locked then
			return
		end
		if self.isSelected then
			self:deselect("User", self)
		else
			self:select("User", self)
		end
	end
	local isTouchTapping = false
	local isClicking = false
	clickRegion.MouseButton1Click:Connect(function()
		if isTouchTapping then
			return
		end
		isClicking = true
		task.delay(0.01, function()
			isClicking = false
		end)
		handleToggle()
	end)
	clickRegion.TouchTap:Connect(function()
		-- This resolves the bug report by @28Pixels:
		-- https://devforum.roblox.com/t/topbarplus/1017485/1104
		if isClicking then
			return
		end
		isTouchTapping = true
		task.delay(0.01, function()
			isTouchTapping = false
		end)
		handleToggle()
	end)

	-- Keys can be bound to toggle between Selected and Deselected
	janitor:add(UserInputService.InputBegan:Connect(function(input, touchingAnObject)
		if self.locked then
			return
		end
		if self.bindedToggleKeys[input.KeyCode] and not touchingAnObject then
			handleToggle()
		end
	end))

	-- Button Hovering (for state "Viewing")
	-- Hovering is a state only for devices with keyboards
	-- and controllers (not touchpads)
	local function viewingStarted(dontSetState)
		if self.locked then
			return
		end
		self.isViewing = true
		self.viewingStarted:Fire(true)
		if not dontSetState then
			self:setState("Viewing", "User", self)
		end
	end
	local function viewingEnded()
		if self.locked then
			return
		end
		self.isViewing = false
		self.viewingEnded:Fire(true)
		self:setState(nil, "User", self)
	end
	self.joinedParent:Connect(function()
		if self.isViewing then
			viewingEnded()
		end
	end)
	clickRegion.MouseEnter:Connect(function()
		local dontSetState = not UserInputService.KeyboardEnabled
		viewingStarted(dontSetState)
	end)
	local touchCount = 0
	janitor:add(UserInputService.TouchEnded:Connect(viewingEnded))
	clickRegion.MouseLeave:Connect(viewingEnded)
	clickRegion.SelectionGained:Connect(viewingStarted)
	clickRegion.SelectionLost:Connect(viewingEnded)
	clickRegion.MouseButton1Down:Connect(function()
		if not self.locked and UserInputService.TouchEnabled then
			touchCount += 1
			local myTouchCount = touchCount
			task.delay(0.2, function()
				if myTouchCount == touchCount then
					viewingStarted()
				end
			end)
		end
	end)
	clickRegion.MouseButton1Up:Connect(function()
		touchCount += 1
	end)

	-- Handle overlay on viewing
	local iconOverlay = self:getInstance("IconOverlay")
	self.viewingStarted:Connect(function()
		iconOverlay.Visible = not self.overlayDisabled
	end)
	self.viewingEnded:Connect(function()
		iconOverlay.Visible = false
	end)

	-- Deselect when another icon is selected
	janitor:add(anyIconSelected:Connect(function(incomingIcon)
		if incomingIcon ~= self and self.deselectWhenOtherIconSelected and incomingIcon.deselectWhenOtherIconSelected then
			self:deselect("AutoDeselect", incomingIcon)
		end
	end))

	-- This checks if the script calling this module is a descendant of a ScreenGui
	-- with 'ResetOnSpawn' set to true. If it is, then we destroy the icon the
	-- client respawns. This solves one of the most asked about questions on the post
	-- The only caveat this may not work if the player doesn't uniquely name their ScreenGui and the frames
	-- the LocalScript rests within
	local source =  debug.info(2, "s")
	local sourcePath = string.split(source, ".")
	local origin = game
	local originsScreenGui
	for i, sourceName in pairs(sourcePath) do
		origin = origin:FindFirstChild(sourceName)
		if not origin then
			break
		end
		if origin:IsA("ScreenGui") then
			originsScreenGui = origin
		end
	end
	if origin and originsScreenGui and originsScreenGui.ResetOnSpawn == true then
		Utility.localPlayerRespawned(function()
			self:destroy()
		end)
	end

	-- Additional children behaviour when toggled (mostly notices)
	local noticeLabel = self:getInstance("NoticeLabel")
	self.toggled:Connect(function(isSelected)
		self.noticeChanged:Fire(self.totalNotices)
		for childIconUID, _ in pairs(self.childIconsDict) do
			local childIcon = Icon.getIconByUID(childIconUID)
			childIcon.noticeChanged:Fire(childIcon.totalNotices)
			if not isSelected and childIcon.isSelected then
				-- If an icon within a menu or dropdown is also
				-- a dropdown or menu, then close it
				for _, _ in pairs(childIcon.childIconsDict) do
					childIcon:deselect("HideParentFeature", self)
				end
			end
		end
	end)
	
	-- This closes/reopens the chat or playerlist if the icon is a dropdown
	-- In the future I'd prefer to use the position+size of the chat
	-- to determine whether to close dropdown (instead of non-right-set)
	-- but for reasons mentioned here it's unreliable at the time of
	-- writing this: https://devforum.roblox.com/t/here/2794915
	-- I could also make this better by accounting for multiple
	-- dropdowns being open (not just this one) but this will work
	-- fine for almost every use case for now.
	self.selected:Connect(function()
		local isDropdown = #self.dropdownIcons > 0
		if isDropdown then
			if StarterGui:GetCore("ChatActive") and self.alignment ~= "Right" then
				self.chatWasPreviouslyActive = true
				StarterGui:SetCore("ChatActive", false)
			end
			if StarterGui:GetCoreGuiEnabled("PlayerList") and self.alignment ~= "Left" then
				self.playerlistWasPreviouslyActive = true
				StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
			end
		end
	end)
	self.deselected:Connect(function()
		if self.chatWasPreviouslyActive then
			self.chatWasPreviouslyActive = nil
			StarterGui:SetCore("ChatActive", true)
		end
		if self.playerlistWasPreviouslyActive then
			self.playerlistWasPreviouslyActive = nil
			StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
		end
	end)
	
	-- There's a rare occassion where the appearance is not
	-- fully set to deselected so this ensures the icons
	-- appearance is fully as it should be
	--print("self.activeState =", self.activeState)
	task.delay(0.1, function()
		if self.activeState == "Deselected" then
			self.stateChanged:Fire("Deselected")
			self:refresh()
		end
	end)
	
	-- Call icon added
	Icon.iconAdded:Fire(self)

	return self
end



-- METHODS
function Icon:setName(name)
	self.widget.Name = name
	self.name = name
	return self
end

function Icon:setState(incomingStateName, fromSource, sourceIcon)
	-- This is responsible for acknowleding a change in stage (such as from "Deselected" to "Viewing" when
	-- a users mouse enters the widget), then informing other systems of this state change to then act upon
	-- (such as the theme handler applying the theme which corresponds to that state).
	if not incomingStateName then
		incomingStateName = (self.isSelected and "Selected") or "Deselected"
	end
	local stateName = Utility.formatStateName(incomingStateName)
	local previousStateName = self.activeState
	if previousStateName == stateName then
		return
	end
	local currentIsSelected = self.isSelected
	self.activeState = stateName
	if stateName == "Deselected" then
		self.isSelected = false
		if currentIsSelected then
			self.toggled:Fire(false, fromSource, sourceIcon)
			self.deselected:Fire(fromSource, sourceIcon)
		end
		self:_setToggleItemsVisible(false, fromSource, sourceIcon)
	elseif stateName == "Selected" then
		self.isSelected = true
		if not currentIsSelected then
			self.toggled:Fire(true, fromSource, sourceIcon)
			self.selected:Fire(fromSource, sourceIcon)
			anyIconSelected:Fire(self, fromSource, sourceIcon)
		end
		self:_setToggleItemsVisible(true, fromSource, sourceIcon)
	end
	self.stateChanged:Fire(stateName, fromSource, sourceIcon)
end

function Icon:getInstance(name)
	-- This enables us to easily retrieve instances located within the icon simply by passing its name.
	-- Every important/significant instance is named uniquely therefore this is no worry of overlap.
	-- We cache the result for more performant retrieval in the future.
	local instance = self.cachedNamesToInstances[name]
	if instance then
		return instance
	end
	local function cacheInstance(childName, child)
		local currentCache = self.cachedInstances[child]
		if not currentCache then
			local collectiveName = child:GetAttribute("Collective")
			local cachedCollective = collectiveName and self.cachedCollectives[collectiveName]
			if cachedCollective then
				table.insert(cachedCollective, child)
			end
			self.cachedNamesToInstances[childName] = child
			self.cachedInstances[child] = true
			child.Destroying:Once(function()
				self.cachedNamesToInstances[childName] = nil
				self.cachedInstances[child] = nil
			end)
		end
	end
	local widget = self.widget
	cacheInstance("Widget", widget)
	if name == "Widget" then
		return widget
	end

	local returnChild
	local function scanChildren(parentInstance)
		for _, child in pairs(parentInstance:GetChildren()) do
			local widgetUID = child:GetAttribute("WidgetUID")
			if widgetUID and widgetUID ~= self.UID then
				-- This prevents instances within other icons from being recorded
				-- (for instance when other icons are added to this icons menu)
				continue
			end
			-- If the child is a fake placeholder instance (such as dropdowns, notices, etc)
			-- then its important we scan the real original instance instead of this clone
			local previousChild = child
			local realChild = Themes.getRealInstance(child)
			if realChild then
				child = realChild
			end
			-- Finally scan its children
			scanChildren(child)
			if child:IsA("GuiBase") or child:IsA("UIBase") or child:IsA("ValueBase") then
				local childName = child.Name
				cacheInstance(childName, child)
				if childName == name then
					returnChild = child
				end
			end
		end
	end
	scanChildren(widget)
	return returnChild
end

function Icon:getCollective(name)
	-- A collective is an array of instances within the Widget that have been
	-- grouped together based on a given name. This just makes it easy
	-- to act on multiple instances at once which share similar behaviours.
	-- For instance, if we want to change the icons corner size, all corner instances
	-- with the attribute "Collective" and value "WidgetCorner" could be updated
	-- instantly by doing Themes.apply(icon, "WidgetCorner", newSize)
	local collective = self.cachedCollectives[name]
	if collective then
		return collective
	end
	collective = {}
	for instance, _ in pairs(self.cachedInstances) do
		if instance:GetAttribute("Collective") == name then
			table.insert(collective, instance)
		end
	end
	self.cachedCollectives[name] = collective
	return collective
end

function Icon:getInstanceOrCollective(collectiveOrInstanceName)
	-- Similar to :getInstance but also accounts for 'Collectives', such as UICorners and returns
	-- an array of instances instead of a single instance
	local instances = {}
	local instance = self:getInstance(collectiveOrInstanceName)
	if instance then
		table.insert(instances, instance)
	end
	if #instances == 0 then
		instances = self:getCollective(collectiveOrInstanceName)
	end
	return instances
end

function Icon:getStateGroup(iconState)
	local chosenState = iconState or self.activeState
	local stateGroup = self.appearance[chosenState]
	if not stateGroup then
		stateGroup = {}
		self.appearance[chosenState] = stateGroup
	end
	return stateGroup
end

function Icon:refreshAppearance(instance, specificProperty)
	Themes.refresh(self, instance, specificProperty)
	return self
end

function Icon:refresh()
	self:refreshAppearance(self.widget)
	self.updateSize:Fire()
	return self
end

function Icon:updateParent()
	local parentIcon = Icon.getIconByUID(self.parentIconUID)
	if parentIcon then
		parentIcon.updateSize:Fire()
	end
end

function Icon:setBehaviour(collectiveOrInstanceName, property, callback, refreshAppearance)
	-- You can specify your own custom callback to handle custom logic just before
	-- an instances property is changed by using :setBehaviour()
	local key = collectiveOrInstanceName.."-"..property
	self.customBehaviours[key] = callback
	if refreshAppearance then
		local instances = self:getInstanceOrCollective(collectiveOrInstanceName)
		for _, instance in pairs(instances) do
			self:refreshAppearance(instance, property)
		end
	end
end

function Icon:modifyTheme(modifications, modificationUID)
	local modificationUID = Themes.modify(self, modifications, modificationUID)
	return self, modificationUID
end

function Icon:modifyChildTheme(modifications, modificationUID)
	-- Same as modifyTheme except for its children (i.e. icons
	-- within its dropdown or menu)
	self.childModifications = modifications
	self.childModificationsUID = modificationUID
	for childIconUID, _ in pairs(self.childIconsDict) do
		local childIcon = Icon.getIconByUID(childIconUID)
		childIcon:modifyTheme(modifications, modificationUID)
	end
	self.childThemeModified:Fire()
	return self
end

function Icon:removeModification(modificationUID)
	Themes.remove(self, modificationUID)
	return self
end

function Icon:removeModificationWith(instanceName, property, state)
	Themes.removeWith(self, instanceName, property, state)
	return self
end

function Icon:setTheme(theme)
	Themes.set(self, theme)
	return self
end

function Icon:setEnabled(bool)
	self.isEnabled = bool
	self.widget.Visible = bool
	self:updateParent()
	return self
end

function Icon:select(fromSource, sourceIcon)
	self:setState("Selected", fromSource, sourceIcon)
	return self
end

function Icon:deselect(fromSource, sourceIcon)
	self:setState("Deselected", fromSource, sourceIcon)
	return self
end

function Icon:notify(customClearSignal, noticeId)
	-- Generates a notification which appears in the top right of the icon. Useful for example for prompting
	-- users of changes/updates within your UI such as a Catalog
	-- 'customClearSignal' is a signal object (e.g. icon.deselected) or
	-- Roblox event (e.g. Instance.new("BindableEvent").Event)
	local notice = self.notice
	if not notice then
		notice = require(elements.Notice)(self, Icon)
		self.notice = notice
	end
	self.noticeStarted:Fire(customClearSignal, noticeId)
	return self
end

function Icon:clearNotices()
	self.endNotices:Fire()
	return self
end

function Icon:disableOverlay(bool)
	self.overlayDisabled = bool
	return self
end
Icon.disableStateOverlay = Icon.disableOverlay

function Icon:setImage(imageId, iconState)
	self:modifyTheme({"IconImage", "Image", imageId, iconState})
	return self
end

function Icon:setLabel(text, iconState)
	self:modifyTheme({"IconLabel", "Text", text, iconState})
	return self
end

function Icon:setOrder(int, iconState)
	self:modifyTheme({"Widget", "LayoutOrder", int, iconState})
	return self
end

function Icon:setCornerRadius(udim, iconState)
	self:modifyTheme({"IconCorners", "CornerRadius", udim, iconState})
	return self
end

function Icon:align(leftCenterOrRight, isFromParentIcon)
	-- Determines the side of the screen the icon will be ordered
	local direction = tostring(leftCenterOrRight):lower()
	if direction == "mid" or direction == "centre" then
		direction = "center"
	end
	if direction ~= "left" and direction ~= "center" and direction ~= "right" then
		direction = "left"
	end
	local screenGui = (direction == "center" and Icon.container.TopbarCentered) or Icon.container.TopbarStandard
	local holders = screenGui.Holders
	local finalDirection = string.upper(string.sub(direction, 1, 1))..string.sub(direction, 2)
	if not isFromParentIcon then
		self.originalAlignment = finalDirection
	end
	local joinedFrame = self.joinedFrame
	local alignmentHolder = holders[finalDirection]
	self.screenGui = screenGui
	self.alignmentHolder = alignmentHolder
	if not self.isDestroyed then
		self.widget.Parent = joinedFrame or alignmentHolder
	end
	self.alignment = finalDirection
	self.alignmentChanged:Fire(finalDirection)
	Icon.iconChanged:Fire(self)
	return self
end
Icon.setAlignment = Icon.align

function Icon:setLeft()
	self:setAlignment("Left")
	return self
end

function Icon:setMid()
	self:setAlignment("Center")
	return self
end

function Icon:setRight()
	self:setAlignment("Right")
	return self
end

function Icon:setWidth(offsetMinimum, iconState)
	-- This sets a minimum X offset size for the widget, useful
	-- for example if you're constantly changing the label
	-- but don't want the icon to resize every time
	local newSize = UDim2.fromOffset(offsetMinimum, self.widget.Size.Y.Offset)
	self:modifyTheme({"Widget", "Size", newSize, iconState})
	self:modifyTheme({"Widget", "DesiredWidth", offsetMinimum, iconState})
	return self
end

function Icon:setImageScale(number, iconState)
	self:modifyTheme({"IconImageScale", "Value", number, iconState})
	return self
end

function Icon:setImageRatio(number, iconState)
	self:modifyTheme({"IconImageRatio", "AspectRatio", number, iconState})
	return self
end

function Icon:setTextSize(number, iconState)
	self:modifyTheme({"IconLabel", "TextSize", number, iconState})
	return self
end

function Icon:setTextFont(font, fontWeight, fontStyle, iconState)
	fontWeight = fontWeight or Enum.FontWeight.Regular
	fontStyle = fontStyle or Enum.FontStyle.Normal
	local fontFace
	local fontType = typeof(font)
	if fontType == "number" then
		fontFace = Font.fromId(font, fontWeight, fontStyle)
	elseif fontType == "EnumItem" then
		fontFace = Font.fromEnum(font)
	elseif fontType == "string" then
		if not font:match("rbxasset") then
			fontFace = Font.fromName(font, fontWeight, fontStyle)
		end
	end
	if not fontFace then
		fontFace = Font.new(font, fontWeight, fontStyle)
	end
	self:modifyTheme({"IconLabel", "FontFace", fontFace, iconState})
	return self
end

function Icon:bindToggleItem(guiObjectOrLayerCollector)
	if not guiObjectOrLayerCollector:IsA("GuiObject") and not guiObjectOrLayerCollector:IsA("LayerCollector") then
		error("Toggle item must be a GuiObject or LayerCollector!")
	end
	self.toggleItems[guiObjectOrLayerCollector] = true
	self:_updateSelectionInstances()
	return self
end

function Icon:unbindToggleItem(guiObjectOrLayerCollector)
	self.toggleItems[guiObjectOrLayerCollector] = nil
	self:_updateSelectionInstances()
	return self
end

function Icon:_updateSelectionInstances()
	-- This is to assist with controller navigation and selection
	-- It converts the value true to an array
	for guiObjectOrLayerCollector, _ in pairs(self.toggleItems) do
		local buttonInstancesArray = {}
		for _, instance in pairs(guiObjectOrLayerCollector:GetDescendants()) do
			if (instance:IsA("TextButton") or instance:IsA("ImageButton")) and instance.Active then
				table.insert(buttonInstancesArray, instance)
			end
		end
		self.toggleItems[guiObjectOrLayerCollector] = buttonInstancesArray
	end
end

function Icon:_setToggleItemsVisible(bool, fromSource, sourceIcon)
	for toggleItem, _ in pairs(self.toggleItems) do
		if not sourceIcon or sourceIcon == self or sourceIcon.toggleItems[toggleItem] == nil then
			local property = "Visible"
			if toggleItem:IsA("LayerCollector") then
				property = "Enabled"
			end
			toggleItem[property] = bool
		end
	end
end

function Icon:bindEvent(iconEventName, eventFunction)
	local event = self[iconEventName]
	assert(event and typeof(event) == "table" and event.Connect, "argument[1] must be a valid topbarplus icon event name!")
	assert(typeof(eventFunction) == "function", "argument[2] must be a function!")
	self.bindedEvents[iconEventName] = event:Connect(function(...)
		eventFunction(self, ...)
	end)
	return self
end

function Icon:unbindEvent(iconEventName)
	local eventConnection = self.bindedEvents[iconEventName]
	if eventConnection then
		eventConnection:Disconnect()
		self.bindedEvents[iconEventName] = nil
	end
	return self
end

function Icon:bindToggleKey(keyCodeEnum)
	assert(typeof(keyCodeEnum) == "EnumItem", "argument[1] must be a KeyCode EnumItem!")
	self.bindedToggleKeys[keyCodeEnum] = true
	self.toggleKeyAdded:Fire(keyCodeEnum)
	self:setCaption("_hotkey_")
	return self
end

function Icon:unbindToggleKey(keyCodeEnum)
	assert(typeof(keyCodeEnum) == "EnumItem", "argument[1] must be a KeyCode EnumItem!")
	self.bindedToggleKeys[keyCodeEnum] = nil
	return self
end

function Icon:call(callback, ...)
	local packedArgs = table.pack(...)
	task.spawn(function()
		callback(self, table.unpack(packedArgs))
	end)
	return self
end

function Icon:addToJanitor(callback)
	self.janitor:add(callback)
	return self
end

function Icon:lock()
	-- This disables all user inputs related to the icon (such as clicking buttons, pressing keys, etc)
	local clickRegion = self:getInstance("ClickRegion")
	clickRegion.Visible = false
	self.locked = true
	return self
end

function Icon:unlock()
	local clickRegion = self:getInstance("ClickRegion")
	clickRegion.Visible = true
	self.locked = false
	return self
end

function Icon:debounce(seconds)
	self:lock()
	task.wait(seconds)
	self:unlock()
	return self
end

function Icon:autoDeselect(bool)
	-- When set to true the icon will deselect itself automatically whenever
	-- another icon is selected
	if bool == nil then
		bool = true
	end
	self.deselectWhenOtherIconSelected = bool
	return self
end

function Icon:oneClick(bool)
	-- When set to true the icon will automatically deselect when selected, this creates
	-- the effect of a single click button
	local singleClickJanitor = self.singleClickJanitor
	singleClickJanitor:clean()
	if bool or bool == nil then
		singleClickJanitor:add(self.selected:Connect(function()
			self:deselect("OneClick", self)
		end))
	end
	self.oneClickEnabled = true
	return self
end

function Icon:setCaption(text)
	if text == "_hotkey_" and (self.captionText) then
		return self
	end
	local captionJanitor = self.captionJanitor
	self.captionJanitor:clean()
	if not text or text == "" then
		self.caption = nil
		self.captionText = nil
		return self
	end
	local caption = captionJanitor:add(require(elements.Caption)(self))
	caption:SetAttribute("CaptionText", text)
	self.caption = caption
	self.captionText = text
	return self
end

function Icon:setCaptionHint(keyCodeEnum)
	assert(typeof(keyCodeEnum) == "EnumItem", "argument[1] must be a KeyCode EnumItem!")
	self.fakeToggleKey = keyCodeEnum
	self.fakeToggleKeyChanged:Fire(keyCodeEnum)
	self:setCaption("_hotkey_")
	return self
end

function Icon:leave()
	local joinJanitor = self.joinJanitor
	joinJanitor:clean()
	return self
end

function Icon:joinMenu(parentIcon)
	Utility.joinFeature(self, parentIcon, parentIcon.menuIcons, parentIcon:getInstance("Menu"))
	parentIcon.menuChildAdded:Fire(self)
	return self
end

function Icon:setMenu(arrayOfIcons)
	self.menuSet:Fire(arrayOfIcons)
	return self
end

function Icon:setFrozenMenu(arrayOfIcons)
	self:freezeMenu(arrayOfIcons)
	self:setMenu(arrayOfIcons)
end

function Icon:freezeMenu()
	-- A frozen menu is a menu which is permanently locked in the
	-- the selected state (with its toggle hidden)
	self:select("FrozenMenu", self)
	self:bindEvent("deselected", function(icon)
		icon:select("FrozenMenu", self)
	end)
	self:modifyTheme({"IconSpot", "Visible", false})
end

function Icon:joinDropdown(parentIcon)
	parentIcon:getDropdown()
	Utility.joinFeature(self, parentIcon, parentIcon.dropdownIcons, parentIcon:getInstance("DropdownScroller"))
	parentIcon.dropdownChildAdded:Fire(self)
	return self
end

function Icon:getDropdown()
	local dropdown = self.dropdown
	if not dropdown then
		dropdown = require(elements.Dropdown)(self)
		self.dropdown = dropdown
		self:clipOutside(dropdown)
	end
	return dropdown
end

function Icon:setDropdown(arrayOfIcons)
	self:getDropdown()
	self.dropdownSet:Fire(arrayOfIcons)
	return self
end

function Icon:clipOutside(instance)
	-- This is essential for items such as notices and dropdowns which will exceed the bounds of the widget. This is an issue
	-- because the widget must have ClipsDescendents enabled to hide items for instance when the menu is closing or opening.
	-- This creates an invisible frame which matches the size and position of the instance, then the instance is parented outside of
	-- the widget and tracks the clone to match its size and position. In order for themes, etc to work the applying system checks
	-- to see if an instance is a clone, then if it is, it applies it to the original instance instead of the clone.
	local instanceClone = Utility.clipOutside(self, instance)
	self:refreshAppearance(instance)
	return self, instanceClone
end

function Icon:setIndicator(keyCode)
	-- An indicator is a direction button prompt with an image of the given keycode. This is useful for instance
	-- with controllers to show the user what button to press to highlight the topbar. You don't need
	-- to set an indicator for controllers as this is handled internally within the Gamepad module
	local indicator = self.indicator
	if not indicator then
		indicator = self.janitor:add(require(elements.Indicator)(self, Icon))
		self.indicator = indicator
	end
	self.indicatorSet:Fire(keyCode)
end



-- DESTROY/CLEANUP
function Icon:destroy()
	if self.isDestroyed then
		return
	end
	self:clearNotices()
	if self.parentIconUID then
		self:leave()
	end
	self.isDestroyed = true
	self.janitor:clean()
	Icon.iconRemoved:Fire(self)
end
Icon.Destroy = Icon.destroy



return Icon
return function(icon)

	-- Credit to lolmansReturn and Canary Software for
	-- retrieving these values
	local clickRegion = icon:getInstance("ClickRegion")
	local caption = Instance.new("CanvasGroup")
	caption.Name = "Caption"
	caption.AnchorPoint = Vector2.new(0.5, 0)
	caption.BackgroundTransparency = 1
	caption.BorderSizePixel = 0
	caption.GroupTransparency = 1
	caption.Position = UDim2.fromOffset(0, 0)
	caption.Visible = true
	caption.ZIndex = 30
	caption.Parent = clickRegion

	local box = Instance.new("Frame")
	box.Name = "Box"
	box.AutomaticSize = Enum.AutomaticSize.XY
	box.BackgroundColor3 = Color3.fromRGB(101, 102, 104)
	box.Position = UDim2.fromOffset(4, 7)
	box.ZIndex = 12
	box.Parent = caption

	local header = Instance.new("TextLabel")
	header.Name = "Header"
	header.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	header.Text = "Caption"
	header.TextColor3 = Color3.fromRGB(255, 255, 255)
	header.TextSize = 14
	header.TextTruncate = Enum.TextTruncate.None
	header.TextWrapped = false
	header.TextXAlignment = Enum.TextXAlignment.Left
	header.AutomaticSize = Enum.AutomaticSize.X
	header.BackgroundTransparency = 1
	header.LayoutOrder = 1
	header.Size = UDim2.fromOffset(0, 16)
	header.ZIndex = 18
	header.Parent = box

	local layout = Instance.new("UIListLayout")
	layout.Name = "Layout"
	layout.Padding = UDim.new(0, 8)
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	layout.Parent = box

	local UICorner = Instance.new("UICorner")
	UICorner.Name = "CaptionCorner"
	UICorner.Parent = box

	local padding = Instance.new("UIPadding")
	padding.Name = "Padding"
	padding.PaddingBottom = UDim.new(0, 12)
	padding.PaddingLeft = UDim.new(0, 12)
	padding.PaddingRight = UDim.new(0, 12)
	padding.PaddingTop = UDim.new(0, 12)
	padding.Parent = box

	local hotkeys = Instance.new("Frame")
	hotkeys.Name = "Hotkeys"
	hotkeys.AutomaticSize = Enum.AutomaticSize.Y
	hotkeys.BackgroundTransparency = 1
	hotkeys.LayoutOrder = 3
	hotkeys.Size = UDim2.fromScale(1, 0)
	hotkeys.Visible = false
	hotkeys.Parent = box

	local layout1 = Instance.new("UIListLayout")
	layout1.Name = "Layout1"
	layout1.Padding = UDim.new(0, 6)
	layout1.FillDirection = Enum.FillDirection.Vertical
	layout1.HorizontalAlignment = Enum.HorizontalAlignment.Center
	layout1.HorizontalFlex = Enum.UIFlexAlignment.None
	layout1.ItemLineAlignment = Enum.ItemLineAlignment.Automatic
	layout1.VerticalFlex = Enum.UIFlexAlignment.None
	layout1.SortOrder = Enum.SortOrder.LayoutOrder
	layout1.Parent = hotkeys

	local keyTag1 = Instance.new("ImageLabel")
	keyTag1.Name = "Key1"
	keyTag1.Image = "rbxasset://textures/ui/Controls/key_single.png"
	keyTag1.ImageTransparency = 0.7
	keyTag1.ScaleType = Enum.ScaleType.Slice
	keyTag1.SliceCenter = Rect.new(5, 5, 23, 24)
	keyTag1.AutomaticSize = Enum.AutomaticSize.X
	keyTag1.BackgroundTransparency = 1
	keyTag1.LayoutOrder = 1
	keyTag1.Size = UDim2.fromOffset(0, 30)
	keyTag1.ZIndex = 15
	keyTag1.Parent = hotkeys

	local inset = Instance.new("UIPadding")
	inset.Name = "Inset"
	inset.PaddingLeft = UDim.new(0, 8)
	inset.PaddingRight = UDim.new(0, 8)
	inset.Parent = keyTag1

	local labelContent = Instance.new("TextLabel")
	labelContent.AutoLocalize = false
	labelContent.Name = "LabelContent"
	labelContent.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	labelContent.Text = ""
	labelContent.TextColor3 = Color3.fromRGB(189, 190, 190)
	labelContent.TextSize = 14
	labelContent.AutomaticSize = Enum.AutomaticSize.X
	labelContent.BackgroundTransparency = 1
	labelContent.Position = UDim2.fromOffset(0, -1)
	labelContent.Size = UDim2.fromScale(1, 1)
	labelContent.ZIndex = 16
	labelContent.Parent = keyTag1
	
	local caret = Instance.new("ImageLabel")
	caret.Name = "Caret"
	caret.Image = "rbxasset://LuaPackages/Packages/_Index/UIBlox/UIBlox/AppImageAtlas/img_set_1x_1.png"
	caret.ImageColor3 = Color3.fromRGB(101, 102, 104)
	caret.ImageRectOffset = Vector2.new(260, 440)
	caret.ImageRectSize = Vector2.new(16, 8)
	caret.AnchorPoint = Vector2.new(0, 0.5)
	caret.BackgroundTransparency = 1
	caret.Position = UDim2.new(0, 0, 0, 4)
	caret.Rotation = 180
	caret.Size = UDim2.fromOffset(16, 8)
	caret.ZIndex = 12
	caret.Parent = caption

	local dropShadow = Instance.new("ImageLabel")
	dropShadow.Name = "DropShadow"
	dropShadow.Image = "rbxasset://LuaPackages/Packages/_Index/UIBlox/UIBlox/AppImageAtlas/img_set_1x_1.png"
	dropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	dropShadow.ImageRectOffset = Vector2.new(217, 486)
	dropShadow.ImageRectSize = Vector2.new(25, 25)
	dropShadow.ImageTransparency = 0.45
	dropShadow.ScaleType = Enum.ScaleType.Slice
	dropShadow.SliceCenter = Rect.new(12, 12, 13, 13)
	dropShadow.BackgroundTransparency = 1
	dropShadow.Position = UDim2.fromOffset(0, 5)
	dropShadow.Size = UDim2.new(1, 0, 0, 48)
	dropShadow.Parent = caption
	box:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		dropShadow.Size = UDim2.new(1, 0, 0, box.AbsoluteSize.Y + 8)
	end)
	
	-- It's important we match the sizes as this is not
	-- handles within clipOutside (as it assumes the sizes
	-- are already the same)
	local captionJanitor = icon.captionJanitor
	local _, captionClone = icon:clipOutside(caption)
	captionClone.AutomaticSize = Enum.AutomaticSize.None
	local function matchSize()
		local absolute = caption.AbsoluteSize
		captionClone.Size = UDim2.fromOffset(absolute.X, absolute.Y)
	end
	captionJanitor:add(caption:GetPropertyChangedSignal("AbsoluteSize"):Connect(matchSize))
	matchSize()
	
	
	
	local isCompletelyEnabled = false
	-- This handles the appearing/disappearing/positioning of the caption
	local captionHeader = caption.Box.Header
	local UserInputService = game:GetService("UserInputService")
	local function updateHotkey(keyCodeEnum)
		local hasKeyboard = UserInputService.KeyboardEnabled
		local text = caption:GetAttribute("CaptionText") or ""
		local hideHeader = text == "_hotkey_"
		if not hasKeyboard and hideHeader then
			icon:setCaption()
			return
		end
		captionHeader.Text = text
		captionHeader.Visible = not hideHeader
		if keyCodeEnum then
			labelContent.Text = keyCodeEnum.Name
			hotkeys.Visible = true
		end
		if not hasKeyboard then
			hotkeys.Visible = false
		end
	end
	caption:GetAttributeChangedSignal("CaptionText"):Connect(updateHotkey)

	local EASING_STYLE = Enum.EasingStyle.Quad
	local TWEEN_SPEED = 0.2
	local TWEEN_INFO_IN = TweenInfo.new(TWEEN_SPEED, EASING_STYLE, Enum.EasingDirection.In)
	local TWEEN_INFO_OUT = TweenInfo.new(TWEEN_SPEED, EASING_STYLE, Enum.EasingDirection.Out)
	local TweenService = game:GetService("TweenService")
	local RunService = game:GetService("RunService")
	local function getCaptionPosition(customEnabled)
		local enabled = if customEnabled ~= nil then customEnabled else isCompletelyEnabled
		local yOut = 2
		local yIn = yOut + 8
		local yOffset = if enabled then yIn else yOut
		return UDim2.new(0.5, 0, 1, yOffset)
	end
	local function updatePosition(forcedEnabled)
		
		-- Ignore changes if not enabled to reduce redundant calls
		if not isCompletelyEnabled then
			return
		end
		
		-- Currently the one thing which isn't accounted for are the bounds of the screen
		-- This would be an issue if someone sets a long caption text for the left or
		-- right most icon
		local enabled = if forcedEnabled ~= nil then forcedEnabled else isCompletelyEnabled
		local startPosition = getCaptionPosition(not enabled)
		local endPosition = getCaptionPosition(enabled)
		
		-- It's essential we reset the carets position to prevent the x sizing bounds
		-- of the caption from infinitely scaling up
		if enabled then
			local caretY = caret.Position.Y.Offset
			caret.Position = UDim2.fromOffset(0, caretY)
			caption.AutomaticSize = Enum.AutomaticSize.XY
			caption.Size = UDim2.fromOffset(32, 53)
		else
			local absolute = caption.AbsoluteSize
			caption.AutomaticSize = Enum.AutomaticSize.Y
			caption.Size = UDim2.fromOffset(absolute.X, absolute.Y)
		end
		
		-- We initially default to the opposite state
		local previousCaretX
		local function updateCaret()
			local caretX = clickRegion.AbsolutePosition.X - caption.AbsolutePosition.X + clickRegion.AbsoluteSize.X/2 - caret.AbsoluteSize.X/2
			local caretY = caret.Position.Y.Offset
			local newCaretPosition = UDim2.fromOffset(caretX, caretY)
			if previousCaretX ~= caretX then
				-- Again, it's essential we reset the caret if
				-- a difference in X position is detected otherwise
				-- a slight quirk with AutomaticCanvas can cause
				-- the caption to infinitely scale
				previousCaretX = caretX
				caret.Position = UDim2.fromOffset(0, caretY)
				task.wait()
			end
			caret.Position = newCaretPosition
		end
		captionClone.Position = startPosition
		updateCaret()
		
		-- Now we tween into the new state
		local tweenInfo = (enabled and TWEEN_INFO_IN) or TWEEN_INFO_OUT
		local tween = TweenService:Create(captionClone, tweenInfo, {Position = endPosition})
		local updateCaretConnection = RunService.Heartbeat:Connect(updateCaret)
		tween:Play()
		tween.Completed:Once(function()
			updateCaretConnection:Disconnect()
		end)
		
	end
	captionJanitor:add(clickRegion:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		updatePosition()
	end))
	updatePosition(false)
	
	captionJanitor:add(icon.toggleKeyAdded:Connect(updateHotkey))
	for keyCodeEnum, _ in pairs(icon.bindedToggleKeys) do
		updateHotkey(keyCodeEnum)
		break
	end
	captionJanitor:add(icon.fakeToggleKeyChanged:Connect(updateHotkey))
	local fakeToggleKey = icon.fakeToggleKey
	if fakeToggleKey then
		updateHotkey(fakeToggleKey)
	end

	local function setCaptionEnabled(enabled)
		if isCompletelyEnabled == enabled then
			return
		end
		local joinedFrame = icon.joinedFrame
		if joinedFrame and string.match(joinedFrame.Name, "Dropdown") then
			enabled = false
		end
		isCompletelyEnabled = enabled
		local newTransparency = (enabled and 0) or 1
		local tweenInfo = (enabled and TWEEN_INFO_IN) or TWEEN_INFO_OUT
		local tweenTransparency = TweenService:Create(caption, tweenInfo, {
			GroupTransparency = newTransparency
		})
		tweenTransparency:Play()
		updatePosition()
		updateHotkey()
	end
	
	local WAIT_DURATION = 0.5
	local RECOVER_PERIOD = 0.3
	local Icon = require(icon.iconModule)
	captionJanitor:add(icon.stateChanged:Connect(function(stateName)
		if stateName == "Viewing" then
			local lastClock = Icon.captionLastClosedClock
			local clockDifference = (lastClock and os.clock() - lastClock) or 999
			local waitDuration = (clockDifference < RECOVER_PERIOD and 0) or WAIT_DURATION
			task.delay(waitDuration, function()
				if icon.activeState == "Viewing" then
					setCaptionEnabled(true)
				end
			end)
		else
			Icon.captionLastClosedClock = os.clock()
			setCaptionEnabled(false)
		end
	end))
	
	return caption
end
return function(Icon)
	
	local GuiService = game:GetService("GuiService")
	local isOldTopbar = Icon.isOldTopbar
	local container = {}
	local guiInset = GuiService:GetGuiInset()
	local isConsoleScreen = GuiService:IsTenFootInterface()
	local startInset = if isOldTopbar then 12 else guiInset.Y - (44 + 2)
	if isConsoleScreen then
		startInset = 10
	end
	local screenGui = Instance.new("ScreenGui")
	screenGui:SetAttribute("StartInset", startInset)
	screenGui.Name = "TopbarStandard"
	screenGui.Enabled = true
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	screenGui.IgnoreGuiInset = true
	screenGui.ResetOnSpawn = false
	screenGui.ScreenInsets = Enum.ScreenInsets.TopbarSafeInsets
	container[screenGui.Name] = screenGui
	screenGui.DisplayOrder = Icon.baseDisplayOrder
	Icon.baseDisplayOrderChanged:Connect(function()
		screenGui.DisplayOrder = Icon.baseDisplayOrder
	end)

	local holders = Instance.new("Frame")
	local yDownOffset = if isOldTopbar then 2 else 0
	local ySizeOffset = -2
	if isConsoleScreen then
		yDownOffset += 13
		ySizeOffset = 50
	end
	holders.Name = "Holders"
	holders.BackgroundTransparency = 1
	holders.Position = UDim2.new(0, 0, 0, yDownOffset)
	holders.Size = UDim2.new(1, 0, 1, ySizeOffset)
	holders.Visible = true
	holders.ZIndex = 1
	holders.Parent = screenGui
	
	local screenGuiCenter = screenGui:Clone()
	local holdersCenter = screenGuiCenter.Holders
	local GuiService = game:GetService("GuiService")
	local function updateCenteredHoldersHeight()
		holdersCenter.Size = UDim2.new(1, 0, 0, GuiService.TopbarInset.Height+ySizeOffset)
	end
	screenGuiCenter.Name = "TopbarCentered"
	screenGuiCenter.ScreenInsets = Enum.ScreenInsets.None
	Icon.baseDisplayOrderChanged:Connect(function()
		screenGuiCenter.DisplayOrder = Icon.baseDisplayOrder
	end)
	container[screenGuiCenter.Name] = screenGuiCenter
	GuiService:GetPropertyChangedSignal("TopbarInset"):Connect(updateCenteredHoldersHeight)
	updateCenteredHoldersHeight()
	
	local screenGuiClipped = screenGui:Clone()
	screenGuiClipped.Name = screenGuiClipped.Name.."Clipped"
	screenGuiClipped.DisplayOrder += 1
	Icon.baseDisplayOrderChanged:Connect(function()
		screenGuiClipped.DisplayOrder = Icon.baseDisplayOrder + 1
	end)
	container[screenGuiClipped.Name] = screenGuiClipped
	
	local screenGuiCenterClipped = screenGuiCenter:Clone()
	screenGuiCenterClipped.Name = screenGuiCenterClipped.Name.."Clipped"
	screenGuiCenterClipped.DisplayOrder += 1
	Icon.baseDisplayOrderChanged:Connect(function()
		screenGuiCenterClipped.DisplayOrder = Icon.baseDisplayOrder + 1
	end)
	container[screenGuiCenterClipped.Name] = screenGuiCenterClipped
	
	if isOldTopbar then
		task.defer(function()
			local function decideToHideTopbar()
				if GuiService.MenuIsOpen then
					Icon.setTopbarEnabled(false, true)
				else
					Icon.setTopbarEnabled()
				end
			end
			GuiService:GetPropertyChangedSignal("MenuIsOpen"):Connect(decideToHideTopbar)
			decideToHideTopbar()
		end)
	end
	
	local holderReduction = -24
	local left = Instance.new("ScrollingFrame")
	left:SetAttribute("IsAHolder", true)
	left.Name = "Left"
	left.Position = UDim2.fromOffset(startInset, 0)
	left.Size = UDim2.new(1, holderReduction, 1, 0)
	left.BackgroundTransparency = 1
	left.Visible = true
	left.ZIndex = 1
	left.Active = false
	left.ClipsDescendants = true
	left.HorizontalScrollBarInset = Enum.ScrollBarInset.None
	left.CanvasSize = UDim2.new(0, 0, 1, -1) -- This -1 prevents a dropdown scrolling appearance bug
	left.AutomaticCanvasSize = Enum.AutomaticSize.X
	left.ScrollingDirection = Enum.ScrollingDirection.X
	left.ScrollBarThickness = 0
	left.BorderSizePixel = 0
	left.Selectable = false
	left.ScrollingEnabled = false--true
	left.ElasticBehavior = Enum.ElasticBehavior.Never
	left.Parent = holders
	
	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.Padding = UDim.new(0, startInset)
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
	UIListLayout.Parent = left
	
	local center = left:Clone()
	center.ScrollingEnabled = false
	center.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	center.Name = "Center"
	center.Parent = holdersCenter
	
	local right = left:Clone()
	right.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
	right.Name = "Right"
	right.AnchorPoint = Vector2.new(1, 0)
	right.Position = UDim2.new(1, -12, 0, 0)
	right.Parent = holders

	return container
end
return function(icon)
	
	local dropdown = Instance.new("Frame")
	dropdown.Name = "Dropdown"
	dropdown.AutomaticSize = Enum.AutomaticSize.XY
	dropdown.BackgroundTransparency = 1
	dropdown.BorderSizePixel = 0
	dropdown.AnchorPoint = Vector2.new(0.5, 0)
	dropdown.Position = UDim2.new(0.5, 0, 1, 10)
	dropdown.ZIndex = -2
	dropdown.ClipsDescendants = true
	dropdown.Parent = icon.widget

	local UICorner = Instance.new("UICorner")
	UICorner.Name = "DropdownCorner"
	UICorner.CornerRadius = UDim.new(0, 10)
	UICorner.Parent = dropdown

	local dropdownScroller = Instance.new("ScrollingFrame")
	dropdownScroller.Name = "DropdownScroller"
	dropdownScroller.AutomaticSize = Enum.AutomaticSize.X
	dropdownScroller.BackgroundTransparency = 1
	dropdownScroller.BorderSizePixel = 0
	dropdownScroller.AnchorPoint = Vector2.new(0, 0)
	dropdownScroller.Position = UDim2.new(0, 0, 0, 0)
	dropdownScroller.ZIndex = -1
	dropdownScroller.ClipsDescendants = true
	dropdownScroller.Visible = true
	dropdownScroller.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
	dropdownScroller.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
	dropdownScroller.Active = false
	dropdownScroller.ScrollingEnabled = true
	dropdownScroller.AutomaticCanvasSize = Enum.AutomaticSize.Y
	dropdownScroller.ScrollBarThickness = 5
	dropdownScroller.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
	dropdownScroller.ScrollBarImageTransparency = 0.8
	dropdownScroller.CanvasSize = UDim2.new(0, 0, 0, 0)
	dropdownScroller.Selectable = false
	dropdownScroller.Active = true
	dropdownScroller.Parent = dropdown
	
	local dropdownPadding = Instance.new("UIPadding")
	dropdownPadding.Name = "DropdownPadding"
	dropdownPadding.PaddingTop = UDim.new(0, 8)
	dropdownPadding.PaddingBottom = UDim.new(0, 8)
	dropdownPadding.Parent = dropdownScroller

	local dropdownList = Instance.new("UIListLayout")
	dropdownList.Name = "DropdownList"
	dropdownList.FillDirection = Enum.FillDirection.Vertical
	dropdownList.SortOrder = Enum.SortOrder.LayoutOrder
	dropdownList.HorizontalAlignment = Enum.HorizontalAlignment.Center
	dropdownList.HorizontalFlex = Enum.UIFlexAlignment.SpaceEvenly
	dropdownList.Parent = dropdownScroller
	
	local dropdownJanitor = icon.dropdownJanitor
	local Icon = require(icon.iconModule)
	icon.dropdownChildAdded:Connect(function(childIcon)
		-- Modify appearance of child when joined
		local _, modificationUID = childIcon:modifyTheme({
			{"Widget", "BorderSize", 0},
			{"IconCorners", "CornerRadius", UDim.new(0, 4)},
			{"Widget", "MinimumWidth", 190},
			{"Widget", "MinimumHeight", 56},
			{"IconLabel", "TextSize", 19},
			{"PaddingLeft", "Size", UDim2.fromOffset(25, 0)},
			{"Notice", "Position", UDim2.new(1, -24, 0, 5)},
			{"ContentsList", "HorizontalAlignment", Enum.HorizontalAlignment.Left},
			{"Selection", "Size", UDim2.new(1, -8, 1, -8)},
			{"Selection", "Position", UDim2.new(0, 4, 0, 4)},
		})
		task.defer(function()
			childIcon.joinJanitor:add(function()
				childIcon:removeModification(modificationUID)
			end)
		end)
	end)
	icon.dropdownSet:Connect(function(arrayOfIcons)
		-- Destroy any previous icons
		for i, otherIconUID in pairs(icon.dropdownIcons) do
			local otherIcon = Icon.getIconByUID(otherIconUID)
			otherIcon:destroy()
		end
		-- Add new icons
		local totalNewIcons = #arrayOfIcons
		if type(arrayOfIcons) == "table" then
			for i, otherIcon in pairs(arrayOfIcons) do
				otherIcon:joinDropdown(icon)
			end
		end
	end)

	-- Update visibiliy of dropdown
	local Utility = require(script.Parent.Parent.Utility)
	local function updateVisibility()
		--icon:modifyTheme({"Dropdown", "Visible", icon.isSelected})
		Utility.setVisible(dropdown, icon.isSelected, "InternalDropdown")
	end
	dropdownJanitor:add(icon.toggled:Connect(updateVisibility))
	updateVisibility()
	--task.delay(0.2, updateVisibility)
	
	-- This updates the scrolling frame to only display a scroll
	-- length equal to the distance produced by its MaxIcons
	local updateCount = 0
	local isUpdating = false
	local function updateMaxIcons()
		
		-- This prevents more than 1 update occurring every frame
		updateCount += 1
		if isUpdating then
			return
		end
		local myUpdateCount = updateCount
		isUpdating = true
		task.defer(function()
			isUpdating = false
			if updateCount ~= myUpdateCount then
				updateMaxIcons()
			end
		end)
			
		local maxIcons = dropdown:GetAttribute("MaxIcons")
		if not maxIcons then
			return
		end
		local orderedInstances = {}
		for _, child in pairs(dropdownScroller:GetChildren()) do
			if child:IsA("GuiObject") then
				table.insert(orderedInstances, {child, child.AbsolutePosition.Y})
			end
		end
		table.sort(orderedInstances, function(groupA, groupB)
			return groupA[2] < groupB[2]
		end)
		local totalHeight = 0
		local hasSetNextSelection = false
		for i = 1, maxIcons do
			local group = orderedInstances[i]
			if not group then
				break
			end
			local child = group[1]
			local height = child.AbsoluteSize.Y
			totalHeight += height
			local iconUID = child:GetAttribute("WidgetUID")
			local childIcon = iconUID and Icon.getIconByUID(iconUID)
			if childIcon then
				local nextSelection = nil
				if not hasSetNextSelection then
					hasSetNextSelection = true
					nextSelection = icon:getInstance("ClickRegion")
				end
				childIcon:getInstance("ClickRegion").NextSelectionUp = nextSelection
			end
		end
		totalHeight += dropdownPadding.PaddingTop.Offset
		totalHeight += dropdownPadding.PaddingBottom.Offset
		dropdownScroller.Size = UDim2.fromOffset(0, totalHeight)
	end
	dropdownJanitor:add(dropdownScroller:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(updateMaxIcons))
	dropdownJanitor:add(dropdownScroller.ChildAdded:Connect(updateMaxIcons))
	dropdownJanitor:add(dropdownScroller.ChildRemoved:Connect(updateMaxIcons))
	dropdownJanitor:add(dropdown:GetAttributeChangedSignal("MaxIcons"):Connect(updateMaxIcons))
	dropdownJanitor:add(icon.childThemeModified:Connect(updateMaxIcons))
	updateMaxIcons()
	
	return dropdown
end
return function(icon, Icon)

	local widget = icon.widget
	local contents = icon:getInstance("Contents")
	local indicator = Instance.new("Frame")
	indicator.Name = "Indicator"
	indicator.LayoutOrder = 9999999
	indicator.ZIndex = 6
	indicator.Size = UDim2.new(0, 42, 0, 42)
	indicator.BorderColor3 = Color3.fromRGB(0, 0, 0)
	indicator.BackgroundTransparency = 1
	indicator.Position = UDim2.new(1, 0, 0.5, 0)
	indicator.BorderSizePixel = 0
	indicator.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	indicator.Parent = contents

	local indicatorButton = Instance.new("Frame")
	indicatorButton.Name = "IndicatorButton"
	indicatorButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	indicatorButton.AnchorPoint = Vector2.new(0.5, 0.5)
	indicatorButton.BorderSizePixel = 0
	indicatorButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	indicatorButton.Parent = indicator
	
	local GuiService = game:GetService("GuiService")
	local GamepadService = game:GetService("GamepadService")
	local ourClickRegion = icon:getInstance("ClickRegion")
	local function selectionChanged()
		local selectedClickRegion = GuiService.SelectedObject
		if selectedClickRegion == ourClickRegion then
			indicatorButton.BackgroundTransparency = 1
			indicatorButton.Position = UDim2.new(0.5, -2, 0.5, 0)
			indicatorButton.Size = UDim2.fromScale(1.2, 1.2)
		else
			indicatorButton.BackgroundTransparency = 0.75
			indicatorButton.Position = UDim2.new(0.5, 2, 0.5, 0)
			indicatorButton.Size = UDim2.fromScale(1, 1)
		end
	end
	icon.janitor:add(GuiService:GetPropertyChangedSignal("SelectedObject"):Connect(selectionChanged))
	selectionChanged()

	local imageLabel = Instance.new("ImageLabel")
	imageLabel.LayoutOrder = 2
	imageLabel.ZIndex = 15
	imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	imageLabel.Size = UDim2.new(0.5, 0, 0.5, 0)
	imageLabel.BackgroundTransparency = 1
	imageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	imageLabel.Image = "rbxasset://textures/ui/Controls/XboxController/DPadUp@2x.png"
	imageLabel.Parent = indicatorButton

	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(1, 0)
	UICorner.Parent = indicatorButton

	local UserInputService = game:GetService("UserInputService")
	local function setIndicatorVisible(visibility)
		if visibility == nil then
			visibility = indicator.Visible
		end
		if GamepadService.GamepadCursorEnabled then
			visibility = false
		end
		if visibility then
			icon:modifyTheme({"PaddingRight", "Size", UDim2.new(0, 0, 1, 0)}, "IndicatorPadding")
		elseif indicator.Visible then
			icon:removeModification("IndicatorPadding")
		end
		icon:modifyTheme({"Indicator", "Visible", visibility})
		icon.updateSize:Fire()
	end
	icon.janitor:add(GamepadService:GetPropertyChangedSignal("GamepadCursorEnabled"):Connect(setIndicatorVisible))
	icon.indicatorSet:Connect(function(keyCode)
		local visibility = false
		if keyCode then
			imageLabel.Image = UserInputService:GetImageForKeyCode(keyCode)
			visibility = true
		end
		setIndicatorVisible(visibility)
	end)

	local function updateSize()
		local ySize = widget.AbsoluteSize.Y*0.96
		indicator.Size = UDim2.new(0, ySize, 0, ySize)
	end
	widget:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateSize)
	updateSize()

	return indicator
end
return function(icon)

	local menu = Instance.new("ScrollingFrame")
	menu.Name = "Menu"
	menu.BackgroundTransparency = 1
	menu.Visible = true
	menu.ZIndex = 1
	menu.Size = UDim2.fromScale(1, 1)
	menu.ClipsDescendants = true
	menu.TopImage = ""
	menu.BottomImage = ""
	menu.HorizontalScrollBarInset = Enum.ScrollBarInset.Always
	menu.CanvasSize = UDim2.new(0, 0, 1, -1) -- This -1 prevents a dropdown scrolling appearance bug
	menu.ScrollingEnabled = true
	menu.ScrollingDirection = Enum.ScrollingDirection.X
	menu.ZIndex = 20
	menu.ScrollBarThickness = 3
	menu.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
	menu.ScrollBarImageTransparency = 0.8
	menu.BorderSizePixel = 0
	menu.Selectable = false
	
	local Icon = require(icon.iconModule)
	local menuUIListLayout = Icon.container.TopbarStandard:FindFirstChild("UIListLayout", true):Clone()
	menuUIListLayout.Name = "MenuUIListLayout"
	menuUIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	menuUIListLayout.Parent = menu

	local menuGap = Instance.new("Frame")
	menuGap.Name = "MenuGap"
	menuGap.BackgroundTransparency = 1
	menuGap.Visible = false
	menuGap.AnchorPoint = Vector2.new(0, 0.5)
	menuGap.ZIndex = 5
	menuGap.Parent = menu
	
	local hasStartedMenu = false
	local Themes = require(script.Parent.Parent.Features.Themes)
	local function totalChildrenChanged()
		
		local menuJanitor = icon.menuJanitor
		local totalIcons = #icon.menuIcons
		if hasStartedMenu then
			if totalIcons <= 0 then
				menuJanitor:clean()
				hasStartedMenu = false
			end
			return
		end
		hasStartedMenu = true
		
		-- Listen for changes
		menuJanitor:add(icon.toggled:Connect(function()
			if #icon.menuIcons > 0 then
				icon.updateSize:Fire()
			end
		end))
		
		-- Modify appearance of menu icon when joined
		local _, modificationUID = icon:modifyTheme({
			{"Menu", "Active", true},
		})
		task.defer(function()
			menuJanitor:add(function()
				icon:removeModification(modificationUID)
			end)
		end)
		
		-- For right-aligned icons, this ensures their menus
		-- close button appear instantly when selected (instead
		-- of partially hidden from view)
		local previousCanvasX = menu.AbsoluteCanvasSize.X
		local function rightAlignCanvas()
			if icon.alignment == "Right" then
				local newCanvasX = menu.AbsoluteCanvasSize.X
				local difference = previousCanvasX - newCanvasX
				previousCanvasX = newCanvasX
				menu.CanvasPosition = Vector2.new(menu.CanvasPosition.X - difference, 0)
			end
		end
		menuJanitor:add(icon.selected:Connect(rightAlignCanvas))
		menuJanitor:add(menu:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(rightAlignCanvas))
		
		-- Apply a close selected image if the user hasn't applied thier own
		local stateGroup = icon:getStateGroup()
		local imageDeselected = Themes.getThemeValue(stateGroup, "IconImage", "Image", "Deselected")
		local imageSelected = Themes.getThemeValue(stateGroup, "IconImage", "Image", "Selected")
		if imageDeselected == imageSelected then
			local fontLink = "rbxasset://fonts/families/FredokaOne.json"
			local fontFace = Font.new(fontLink, Enum.FontWeight.Light, Enum.FontStyle.Normal)
			icon:removeModificationWith("IconLabel", "Text", "Viewing")
			icon:removeModificationWith("IconLabel", "Image", "Viewing")
			icon:modifyTheme({
				{"IconLabel", "FontFace", fontFace, "Selected"},
				{"IconLabel", "Text", "X", "Selected"},
				{"IconLabel", "TextSize", 20, "Selected"},
				{"IconLabel", "TextStrokeTransparency", 0.8, "Selected"},
				{"IconImage", "Image", "", "Selected"},
			})
		end

		-- Change order of spot when alignment changes
		local iconSpot = icon:getInstance("IconSpot")
		local menuGap = icon:getInstance("MenuGap")
		local function updateAlignent()
			local alignment = icon.alignment
			if alignment == "Right" then
				iconSpot.LayoutOrder = 99999
				menuGap.LayoutOrder = 99998
			else
				iconSpot.LayoutOrder = -99999
				menuGap.LayoutOrder = -99998
			end
		end
		menuJanitor:add(icon.alignmentChanged:Connect(updateAlignent))
		updateAlignent()
		
		-- This updates the scrolling frame to only display a scroll
		-- length equal to the distance produced by its MaxIcons
		menu:GetAttributeChangedSignal("MenuCanvasWidth"):Connect(function()
			local canvasWidth = menu:GetAttribute("MenuCanvasWidth")
			local canvasY = menu.CanvasSize.Y
			menu.CanvasSize = UDim2.new(0, canvasWidth, canvasY.Scale, canvasY.Offset)
		end)
		menuJanitor:add(icon.updateMenu:Connect(function()
			local maxIcons = menu:GetAttribute("MaxIcons")
			if not maxIcons then
				return
			end
			local orderedInstances = {}
			for _, child in pairs(menu:GetChildren()) do
				local widgetUID = child:GetAttribute("WidgetUID")
				if widgetUID and child.Visible then
					table.insert(orderedInstances, {child, child.AbsolutePosition.X})
				end
			end
			table.sort(orderedInstances, function(groupA, groupB)
				return groupA[2] < groupB[2]
			end)
			local totalWidth = 0
			for i = 1, maxIcons do
				local group = orderedInstances[i]
				if not group then
					break
				end
				local child = group[1]
				local width = child.AbsoluteSize.X + menuUIListLayout.Padding.Offset
				totalWidth += width
			end
			menu:SetAttribute("MenuWidth", totalWidth)
		end))
		local function startMenuUpdate()
			task.delay(0.1, function()
				icon.startMenuUpdate:Fire()
			end)
		end
		local iconButton = icon:getInstance("IconButton")
		local previousButtonWidth = iconButton.AbsoluteSize.X
		menuJanitor:add(menu.ChildAdded:Connect(startMenuUpdate))
		menuJanitor:add(menu.ChildRemoved:Connect(startMenuUpdate))
		menuJanitor:add(menu:GetAttributeChangedSignal("MaxIcons"):Connect(startMenuUpdate))
		menuJanitor:add(menu:GetAttributeChangedSignal("MaxWidth"):Connect(startMenuUpdate))
		startMenuUpdate()
	end
	
	icon.menuChildAdded:Connect(totalChildrenChanged)
	icon.menuSet:Connect(function(arrayOfIcons)
		-- Reset any previous icons
		for i, otherIconUID in pairs(icon.menuIcons) do
			local otherIcon = Icon.getIconByUID(otherIconUID)
			otherIcon:destroy()
		end
		-- Apply new icons
		local totalNewIcons = #arrayOfIcons
		if type(arrayOfIcons) == "table" then
			for i, otherIcon in pairs(arrayOfIcons) do
				otherIcon:joinMenu(icon)
			end
		end
	end)
	
	return menu
end
return function(Icon)

	-- Credit to lolmansReturn and Canary Software for
	-- retrieving these values
	local selectionContainer = Instance.new("Frame")
	selectionContainer.Name = "SelectionContainer"
	selectionContainer.Visible = false
	
	local selection = Instance.new("Frame")
	selection.Name = "Selection"
	selection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	selection.BackgroundTransparency = 1
	selection.BorderColor3 = Color3.fromRGB(0, 0, 0)
	selection.BorderSizePixel = 0
	selection.Parent = selectionContainer

	local UIStroke = Instance.new("UIStroke")
	UIStroke.Name = "UIStroke"
	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke.Color = Color3.fromRGB(255, 255, 255)
	UIStroke.Thickness = 3
	UIStroke.Parent = selection

	local selectionGradient = Instance.new("UIGradient")
	selectionGradient.Name = "SelectionGradient"
	selectionGradient.Parent = UIStroke

	local UICorner = Instance.new("UICorner")
	UICorner:SetAttribute("Collective", "IconCorners")
	UICorner.Name = "UICorner"
	UICorner.CornerRadius = UDim.new(1, 0)
	UICorner.Parent = selection
	
	local RunService = game:GetService("RunService")
	local GuiService = game:GetService("GuiService")
	local rotationSpeed = 1
	selection:GetAttributeChangedSignal("RotationSpeed"):Connect(function()
		rotationSpeed = selection:GetAttribute("RotationSpeed")
	end)
	RunService.Heartbeat:Connect(function()
		if not GuiService.SelectedObject then
			return
		end
		selectionGradient.Rotation = (os.clock() * rotationSpeed * 100) % 360
	end)

	return selectionContainer
	
end
-- I named this 'Widget' instead of 'Icon' to make a clear difference between the icon *object* and
-- the icon (aka Widget) instance.
-- This contains the core components of the icon such as the button, image, label and notice. It's
-- also responsible for handling the automatic resizing of the widget (based upon image visibility and text length)

return function(icon, Icon)

	local widget = Instance.new("Frame")
	widget:SetAttribute("WidgetUID", icon.UID)
	widget.Name = "Widget"
	widget.BackgroundTransparency = 1
	widget.Visible = true
	widget.ZIndex = 20
	widget.Active = false
	widget.ClipsDescendants = true

	local button = Instance.new("Frame")
	button.Name = "IconButton"
	button.Visible = true
	button.ZIndex = 2
	button.BorderSizePixel = 0
	button.Parent = widget
	button.ClipsDescendants = true
	button.Active = false -- This is essential for mobile scrollers to work when dragging
	icon.deselected:Connect(function()
		button.ClipsDescendants = true
	end)
	icon.selected:Connect(function()
		task.defer(function()
			icon.resizingComplete:Once(function()
				if icon.isSelected then
					button.ClipsDescendants = false
				end
			end)
		end)
	end)

	local iconCorner = Instance.new("UICorner")
	iconCorner:SetAttribute("Collective", "IconCorners")
	iconCorner.Parent = button

	local menu = require(script.Parent.Menu)(icon)
	local menuUIListLayout = menu.MenuUIListLayout
	local menuGap = menu.MenuGap
	menu.Parent = button

	local iconSpot = Instance.new("Frame")
	iconSpot.Name = "IconSpot"
	iconSpot.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
	iconSpot.BackgroundTransparency = 0.9
	iconSpot.Visible = true
	iconSpot.AnchorPoint = Vector2.new(0, 0.5)
	iconSpot.ZIndex = 5
	iconSpot.Parent = menu

	local iconSpotCorner = iconCorner:Clone()
	iconSpotCorner.Parent = iconSpot

	local overlay = iconSpot:Clone()
	overlay.Name = "IconOverlay"
	overlay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	overlay.ZIndex = iconSpot.ZIndex + 1
	overlay.Size = UDim2.new(1, 0, 1, 0)
	overlay.Position = UDim2.new(0, 0, 0, 0)
	overlay.AnchorPoint = Vector2.new(0, 0)
	overlay.Visible = false
	overlay.Parent = iconSpot

	local clickRegion = Instance.new("TextButton")
	clickRegion:SetAttribute("CorrespondingIconUID", icon.UID)
	clickRegion.Name = "ClickRegion"
	clickRegion.BackgroundTransparency = 1
	clickRegion.Visible = true
	clickRegion.Text = ""
	clickRegion.ZIndex = 20
	clickRegion.Selectable = true
	clickRegion.SelectionGroup = true
	clickRegion.Parent = iconSpot
	
	local Gamepad = require(script.Parent.Parent.Features.Gamepad)
	Gamepad.registerButton(clickRegion)

	local clickRegionCorner = iconCorner:Clone()
	clickRegionCorner.Parent = clickRegion

	local contents = Instance.new("Frame")
	contents.Name = "Contents"
	contents.BackgroundTransparency = 1
	contents.Size = UDim2.fromScale(1, 1)
	contents.Parent = iconSpot

	local contentsList = Instance.new("UIListLayout")
	contentsList.Name = "ContentsList"
	contentsList.FillDirection = Enum.FillDirection.Horizontal
	contentsList.VerticalAlignment = Enum.VerticalAlignment.Center
	contentsList.SortOrder = Enum.SortOrder.LayoutOrder
	contentsList.VerticalFlex = Enum.UIFlexAlignment.SpaceEvenly
	contentsList.Padding = UDim.new(0, 3)
	contentsList.Parent = contents

	local paddingLeft = Instance.new("Frame")
	paddingLeft.Name = "PaddingLeft"
	paddingLeft.LayoutOrder = 1
	paddingLeft.ZIndex = 5
	paddingLeft.BorderColor3 = Color3.fromRGB(0, 0, 0)
	paddingLeft.BackgroundTransparency = 1
	paddingLeft.BorderSizePixel = 0
	paddingLeft.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	paddingLeft.Parent = contents

	local paddingCenter = Instance.new("Frame")
	paddingCenter.Name = "PaddingCenter"
	paddingCenter.LayoutOrder = 3
	paddingCenter.ZIndex = 5
	paddingCenter.Size = UDim2.new(0, 0, 1, 0)
	paddingCenter.BorderColor3 = Color3.fromRGB(0, 0, 0)
	paddingCenter.BackgroundTransparency = 1
	paddingCenter.BorderSizePixel = 0
	paddingCenter.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	paddingCenter.Parent = contents

	local paddingRight = Instance.new("Frame")
	paddingRight.Name = "PaddingRight"
	paddingRight.LayoutOrder = 5
	paddingRight.ZIndex = 5
	paddingRight.BorderColor3 = Color3.fromRGB(0, 0, 0)
	paddingRight.BackgroundTransparency = 1
	paddingRight.BorderSizePixel = 0
	paddingRight.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	paddingRight.Parent = contents

	local iconLabelContainer = Instance.new("Frame")
	iconLabelContainer.Name = "IconLabelContainer"
	iconLabelContainer.LayoutOrder = 4
	iconLabelContainer.ZIndex = 3
	iconLabelContainer.AnchorPoint = Vector2.new(0, 0.5)
	iconLabelContainer.Size = UDim2.new(0, 0, 0.5, 0)
	iconLabelContainer.BackgroundTransparency = 1
	iconLabelContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
	iconLabelContainer.Parent = contents

	local iconLabel = Instance.new("TextLabel")
	local viewportX = workspace.CurrentCamera.ViewportSize.X+200
	iconLabel.Name = "IconLabel"
	iconLabel.LayoutOrder = 4
	iconLabel.ZIndex = 15
	iconLabel.AnchorPoint = Vector2.new(0, 0)
	iconLabel.Size = UDim2.new(0, viewportX, 1, 0)
	iconLabel.ClipsDescendants = false
	iconLabel.BackgroundTransparency = 1
	iconLabel.Position = UDim2.fromScale(0, 0)
	iconLabel.RichText = true
	iconLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	iconLabel.TextXAlignment = Enum.TextXAlignment.Left
	iconLabel.Text = ""
	iconLabel.TextWrapped = true
	iconLabel.TextWrap = true
	iconLabel.TextScaled = false
	iconLabel.Active = false
	iconLabel.AutoLocalize = true
	iconLabel.Parent = iconLabelContainer

	local iconImage = Instance.new("ImageLabel")
	iconImage.Name = "IconImage"
	iconImage.LayoutOrder = 2
	iconImage.ZIndex = 15
	iconImage.AnchorPoint = Vector2.new(0, 0.5)
	iconImage.Size = UDim2.new(0, 0, 0.5, 0)
	iconImage.BackgroundTransparency = 1
	iconImage.Position = UDim2.new(0, 11, 0.5, 0)
	iconImage.ScaleType = Enum.ScaleType.Stretch
	iconImage.Active = false
	iconImage.Parent = contents

	local iconImageCorner = iconCorner:Clone()
	iconImageCorner:SetAttribute("Collective", nil)
	iconImageCorner.CornerRadius = UDim.new(0, 0)
	iconImageCorner.Name = "IconImageCorner"
	iconImageCorner.Parent = iconImage

	local TweenService = game:GetService("TweenService")
	local resizingCount = 0
	local repeating = false
	local function handleLabelAndImageChangesUnstaggered(forceUpdateString)

		-- We defer changes by a frame to eliminate all but 1 requests which
		-- could otherwise stack up to 20+ requests in a single frame
		-- We then repeat again once to account for any final changes
		-- Deferring is also essential because properties are set immediately
		-- afterwards (therefore calculations will use the correct values)
		task.defer(function()
			local indicator = icon.indicator
			local usingIndicator = indicator and indicator.Visible
			local usingText = usingIndicator or iconLabel.Text ~= ""
			local usingImage = iconImage.Image ~= "" and iconImage.Image ~= nil
			local alignment = Enum.HorizontalAlignment.Center
			local NORMAL_BUTTON_SIZE = UDim2.fromScale(1, 1)
			local buttonSize = NORMAL_BUTTON_SIZE
			if usingImage and not usingText then
				iconLabelContainer.Visible = false
				iconImage.Visible = true
				paddingLeft.Visible = false
				paddingCenter.Visible = false
				paddingRight.Visible = false
			elseif not usingImage and usingText then
				iconLabelContainer.Visible = true
				iconImage.Visible = false
				paddingLeft.Visible = true
				paddingCenter.Visible = false
				paddingRight.Visible = true
			elseif usingImage and usingText then
				iconLabelContainer.Visible = true
				iconImage.Visible = true
				paddingLeft.Visible = true
				paddingCenter.Visible = not usingIndicator
				paddingRight.Visible = not usingIndicator
				alignment = Enum.HorizontalAlignment.Left
			end
			button.Size = buttonSize

			local function getItemWidth(item)
				local targetWidth = item:GetAttribute("TargetWidth") or item.AbsoluteSize.X
				return targetWidth
			end
			local contentsPadding = contentsList.Padding.Offset
			local initialWidgetWidth = contentsPadding --0
			local textWidth = iconLabel.TextBounds.X
			iconLabelContainer.Size = UDim2.new(0, textWidth, iconLabel.Size.Y.Scale, 0)
			for _, child in pairs(contents:GetChildren()) do
				if child:IsA("GuiObject") and child.Visible == true then
					local itemWidth = getItemWidth(child)
					initialWidgetWidth += itemWidth + contentsPadding
				end
			end
			local widgetMinimumWidth = widget:GetAttribute("MinimumWidth")
			local widgetMinimumHeight = widget:GetAttribute("MinimumHeight")
			local widgetBorderSize = widget:GetAttribute("BorderSize")
			local widgetWidth = math.clamp(initialWidgetWidth, widgetMinimumWidth, viewportX)
			local menuIcons = icon.menuIcons
			local additionalWidth = 0
			local hasMenu = #menuIcons > 0
			local showMenu = hasMenu and icon.isSelected
			if showMenu then
				for _, frame in pairs(menu:GetChildren()) do
					if frame ~= iconSpot and frame:IsA("GuiObject") and frame.Visible then
						additionalWidth += getItemWidth(frame) + menuUIListLayout.Padding.Offset
					end
				end
				if not iconSpot.Visible then
					widgetWidth -= (getItemWidth(iconSpot) + menuUIListLayout.Padding.Offset*2 + widgetBorderSize)
				end
				additionalWidth -= (widgetBorderSize*0.5)
				widgetWidth += additionalWidth - (widgetBorderSize*0.75)
			end
			menuGap.Visible = showMenu and iconSpot.Visible
			local desiredWidth = widget:GetAttribute("DesiredWidth")
			if desiredWidth and widgetWidth < desiredWidth then
				widgetWidth = desiredWidth
			end

			icon.updateMenu:Fire()
			local preWidth = math.max(widgetWidth-additionalWidth, widgetMinimumWidth)
			local spotWidth = preWidth-(widgetBorderSize*2)
			local menuWidth = menu:GetAttribute("MenuWidth")
			local totalMenuWidth = menuWidth and menuWidth + spotWidth + menuUIListLayout.Padding.Offset + 10
			if totalMenuWidth then
				local maxWidth = menu:GetAttribute("MaxWidth")
				if maxWidth then
					totalMenuWidth = math.max(maxWidth, widgetMinimumWidth)
				end
				menu:SetAttribute("MenuCanvasWidth", widgetWidth)
				if totalMenuWidth < widgetWidth then
					widgetWidth = totalMenuWidth
				end
			end

			local style = Enum.EasingStyle.Quint
			local direction = Enum.EasingDirection.Out
			local spotWidthMax = math.max(spotWidth, getItemWidth(iconSpot), iconSpot.AbsoluteSize.X)
			local widgetWidthMax = math.max(widgetWidth, getItemWidth(widget), widget.AbsoluteSize.X)
			local SPEED = 750
			local spotTweenInfo = TweenInfo.new(spotWidthMax/SPEED, style, direction)
			local widgetTweenInfo = TweenInfo.new(widgetWidthMax/SPEED, style, direction)
			TweenService:Create(iconSpot, spotTweenInfo, {
				Position = UDim2.new(0, widgetBorderSize, 0.5, 0),
				Size = UDim2.new(0, spotWidth, 1, -widgetBorderSize*2),
			}):Play()
			TweenService:Create(clickRegion, spotTweenInfo, {
				Size = UDim2.new(0, spotWidth, 1, 0),
			}):Play()
			local newWidgetSize = UDim2.fromOffset(widgetWidth, widgetMinimumHeight)
			local updateInstantly = widget.Size.Y.Offset ~= widgetMinimumHeight
			if updateInstantly then
				widget.Size = newWidgetSize
			end
			widget:SetAttribute("TargetWidth", newWidgetSize.X.Offset)
			local movingTween = TweenService:Create(widget, widgetTweenInfo, {
				Size = newWidgetSize,
			})
			movingTween:Play()
			resizingCount += 1
			for i = 1, widgetTweenInfo.Time * 100 do
				task.delay(i/100, function()
					Icon.iconChanged:Fire(icon)
				end)
			end
			task.delay(widgetTweenInfo.Time-0.2, function()
				resizingCount -= 1
				task.defer(function()
					if resizingCount == 0 then
						icon.resizingComplete:Fire()
					end
				end)
			end)
			icon:updateParent()
		end)
	end
	local Utility = require(script.Parent.Parent.Utility)
	local handleLabelAndImageChanges = Utility.createStagger(0.01, handleLabelAndImageChangesUnstaggered)
	local firstTimeSettingFontFace = true
	icon:setBehaviour("IconLabel", "Text", handleLabelAndImageChanges)
	icon:setBehaviour("IconLabel", "FontFace", function(value)
		local previousFontFace = iconLabel.FontFace
		if previousFontFace == value then
			return
		end
		task.spawn(function()
			--[[
			local fontLink = value.Family
			if string.match(fontLink, "rbxassetid://") then
				local ContentProvider = game:GetService("ContentProvider")
				local assets = {fontLink}
				ContentProvider:PreloadAsync(assets)
				print("FONT LOADED!!!")
			end--]]

			-- Afaik there's no way to determine when a Font Family has
			-- loaded (even with ContentProvider), so we just have to try
			-- a few times and hope it loads within the refresh period
			handleLabelAndImageChanges()
			if firstTimeSettingFontFace then
				firstTimeSettingFontFace = false
				for i = 1, 10 do
					task.wait(1)
					handleLabelAndImageChanges()
				end
			end
		end)
	end)
	local function updateBorderSize()
		task.defer(function()
			local borderOffset = widget:GetAttribute("BorderSize")
			local alignment = icon.alignment
			local alignmentOffset = (iconSpot.Visible == false and 0) or (alignment == "Right" and -borderOffset) or borderOffset
			menu.Position = UDim2.new(0, alignmentOffset, 0, 0)
			menuGap.Size = UDim2.fromOffset(borderOffset, 0)
			menuUIListLayout.Padding = UDim.new(0, 0)
			handleLabelAndImageChanges()
		end)
	end
	icon:setBehaviour("Widget", "BorderSize", updateBorderSize)
	icon:setBehaviour("IconSpot", "Visible", updateBorderSize)
	icon.startMenuUpdate:Connect(handleLabelAndImageChanges)
	icon.updateSize:Connect(handleLabelAndImageChanges)
	icon:setBehaviour("ContentsList", "HorizontalAlignment", handleLabelAndImageChanges)
	icon:setBehaviour("Widget", "Visible", handleLabelAndImageChanges)
	icon:setBehaviour("Widget", "DesiredWidth", handleLabelAndImageChanges)
	icon:setBehaviour("Widget", "MinimumWidth", handleLabelAndImageChanges)
	icon:setBehaviour("Widget", "MinimumHeight", handleLabelAndImageChanges)
	icon:setBehaviour("Indicator", "Visible", handleLabelAndImageChanges)
	icon:setBehaviour("IconImageRatio", "AspectRatio", handleLabelAndImageChanges)
	icon:setBehaviour("IconImage", "Image", function(value)
		local textureId = (tonumber(value) and "http://www.roblox.com/asset/?id="..value) or value or ""
		if iconImage.Image ~= textureId then
			handleLabelAndImageChanges()
		end
		return textureId
	end)
	icon.alignmentChanged:Connect(function(newAlignment)
		if newAlignment == "Center" then
			newAlignment = "Left"
		end
		menuUIListLayout.HorizontalAlignment = Enum.HorizontalAlignment[newAlignment]
		updateBorderSize()
	end)

	local iconImageScale = Instance.new("NumberValue")
	iconImageScale.Name = "IconImageScale"
	iconImageScale.Parent = iconImage
	iconImageScale:GetPropertyChangedSignal("Value"):Connect(function()
		iconImage.Size = UDim2.new(iconImageScale.Value, 0, iconImageScale.Value, 0)
	end)

	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	UIAspectRatioConstraint.Name = "IconImageRatio"
	UIAspectRatioConstraint.AspectType = Enum.AspectType.FitWithinMaxSize
	UIAspectRatioConstraint.DominantAxis = Enum.DominantAxis.Height
	UIAspectRatioConstraint.Parent = iconImage

	local iconGradient = Instance.new("UIGradient")
	iconGradient.Name = "IconGradient"
	iconGradient.Enabled = true
	iconGradient.Parent = button

	local iconSpotGradient = Instance.new("UIGradient")
	iconSpotGradient.Name = "IconSpotGradient"
	iconSpotGradient.Enabled = true
	iconSpotGradient.Parent = iconSpot

	return widget
end
return function(icon, Icon)

	local notice = Instance.new("Frame")
	notice.Name = "Notice"
	notice.ZIndex = 25
	notice.AutomaticSize = Enum.AutomaticSize.X
	notice.BorderColor3 = Color3.fromRGB(0, 0, 0)
	notice.BorderSizePixel = 0
	notice.BackgroundTransparency = 0.1
	notice.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	notice.Visible = false
	notice.Parent = icon.widget

	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(1, 0)
	UICorner.Parent = notice

	local UIStroke = Instance.new("UIStroke")
	UIStroke.Parent = notice

	local noticeLabel = Instance.new("TextLabel")
	noticeLabel.Name = "NoticeLabel"
	noticeLabel.ZIndex = 26
	noticeLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	noticeLabel.AutomaticSize = Enum.AutomaticSize.X
	noticeLabel.Size = UDim2.new(1, 0, 1, 0)
	noticeLabel.BackgroundTransparency = 1
	noticeLabel.Position = UDim2.new(0.5, 0, 0.515, 0)
	noticeLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	noticeLabel.FontSize = Enum.FontSize.Size14
	noticeLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
	noticeLabel.Text = "1"
	noticeLabel.TextWrapped = true
	noticeLabel.TextWrap = true
	noticeLabel.Font = Enum.Font.Arial
	noticeLabel.Parent = notice
	
	local iconModule = script.Parent.Parent
	local packages = iconModule.Packages
	local Janitor = require(packages.Janitor)
	local Signal = require(packages.GoodSignal)
	local Utility = require(iconModule.Utility)
	icon.noticeChanged:Connect(function(totalNotices)

		-- Notice amount
		if not totalNotices then
			return
		end
		local exceeded99 = totalNotices > 99
		local noticeDisplay = (exceeded99 and "99+") or totalNotices
		noticeLabel.Text = noticeDisplay
		if exceeded99 then
			noticeLabel.TextSize = 11
		end

		-- Should enable
		local enabled = true
		if totalNotices < 1 then
			enabled = false
		end
		local parentIcon = Icon.getIconByUID(icon.parentIconUID)
		local dropdownOrMenuActive = #icon.dropdownIcons > 0 or #icon.menuIcons > 0
		if icon.isSelected and dropdownOrMenuActive then
			enabled = false
		elseif parentIcon and not parentIcon.isSelected then
			enabled = false
		end
		Utility.setVisible(notice, enabled, "NoticeHandler")

	end)
	icon.noticeStarted:Connect(function(customClearSignal, noticeId)
	
		if not customClearSignal then
			customClearSignal = icon.deselected
		end
		local parentIcon = Icon.getIconByUID(icon.parentIconUID)
		if parentIcon then
			parentIcon:notify(customClearSignal)
		end
		
		local noticeJanitor = icon.janitor:add(Janitor.new())
		local noticeComplete = noticeJanitor:add(Signal.new())
		noticeJanitor:add(icon.endNotices:Connect(function()
			noticeComplete:Fire()
		end))
		noticeJanitor:add(customClearSignal:Connect(function()
			noticeComplete:Fire()
		end))
		noticeId = noticeId or Utility.generateUID()
		icon.notices[noticeId] = {
			completeSignal = noticeComplete,
			clearNoticeEvent = customClearSignal,
		}
		local noticeLabel = icon:getInstance("NoticeLabel")
		local function updateNotice()
			icon.noticeChanged:Fire(icon.totalNotices)
		end
		icon.notified:Fire(noticeId)
		icon.totalNotices += 1
		updateNotice()
		noticeComplete:Once(function()
			noticeJanitor:destroy()
			icon.totalNotices -= 1
			icon.notices[noticeId] = nil
			updateNotice()
		end)
	end)
	
	-- Establish the notice
	notice:SetAttribute("ClipToJoinedParent", true)
	icon:clipOutside(notice)
	
	return notice
end
-- As the name suggests, this handles everything related to gamepads
-- (i.e. Xbox or Playstation controllers) and their navigation
-- I created a separate module for gamepads (and not touchpads or
-- keyboards) because gamepads are greatly more unqiue and require
-- additional tailored programming



-- SERVICES
local GamepadService = game:GetService("GamepadService")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")



-- LOCAL
local Gamepad = {}
local Icon



-- FUNCTIONS
-- This is called upon the Icon initializing
function Gamepad.start(incomingIcon)
	
	-- Public variables
	Icon = incomingIcon
	Icon.highlightKey = Enum.KeyCode.DPadUp -- What controller key to highlight the topbar (or set to false to disable)
	Icon.highlightIcon = false -- Change to a specific icon if you'd like to highlight a specific icon instead of the left-most
	
	-- We defer so the developer can make changes before the
	-- gamepad controls are initialized
	task.delay(1, function()
		-- Some local utility
		local iconsDict = Icon.iconsDictionary
		local function getIconFromSelectedObject()
			local clickRegion = GuiService.SelectedObject
			local iconUID = clickRegion and clickRegion:GetAttribute("CorrespondingIconUID")
			local icon = iconUID and iconsDict[iconUID]
			return icon
		end
		
		-- This enables users to instantly open up their last selected icon
		local previousHighlightedIcon
		local iconDisplayingHighlightKey
		local usedIndicatorOnce = false
		local usedBOnce = false
		local Utility = require(script.Parent.Parent.Utility)
		local Selection = require(script.Parent.Parent.Elements.Selection)
		local function updateSelectedObject()
			local icon = getIconFromSelectedObject()
			local gamepadEnabled = UserInputService.GamepadEnabled
			if icon then
				if gamepadEnabled then
					local clickRegion = icon:getInstance("ClickRegion")
					local selection = icon.selection
					if not selection then
						selection = icon.janitor:add(Selection(Icon))
						selection:SetAttribute("IgnoreVisibilityUpdater", true)
						selection.Parent = icon.widget
						icon.selection = selection
						icon:refreshAppearance(selection) --icon:clipOutside(selection)
					end
					clickRegion.SelectionImageObject = selection.Selection
				end
				if previousHighlightedIcon and previousHighlightedIcon ~= icon then
					previousHighlightedIcon:setIndicator()
				end
				local newIndicator = if gamepadEnabled and not usedBOnce and not icon.parentIconUID then Enum.KeyCode.ButtonB else nil
				previousHighlightedIcon = icon
				Icon.lastHighlightedIcon = icon
				icon:setIndicator(newIndicator)
			else
				local newIndicator = if gamepadEnabled and not usedIndicatorOnce then Icon.highlightKey else nil
				if not previousHighlightedIcon then
					previousHighlightedIcon = Gamepad.getIconToHighlight()
				end
				if newIndicator == Icon.highlightKey then
					-- We only display the highlightKey once to show
					-- the user how to highlight the topbar icon
					usedIndicatorOnce = true
				else
					--usedBOnce = true
				end
				if previousHighlightedIcon then
					previousHighlightedIcon:setIndicator(newIndicator)
				end
			end
		end
		GuiService:GetPropertyChangedSignal("SelectedObject"):Connect(updateSelectedObject)

		-- This listens for a gamepad being present/added/removed
		local function checkGamepadEnabled()
			local gamepadEnabled = UserInputService.GamepadEnabled
			if not gamepadEnabled then
				usedIndicatorOnce = false
				usedBOnce = false
			end
			updateSelectedObject()
		end
		UserInputService:GetPropertyChangedSignal("GamepadEnabled"):Connect(checkGamepadEnabled)
		checkGamepadEnabled()

		-- This allows for easy highlighting of the topbar when the
		-- when ``Icon.highlightKey`` (i.e. DPadUp) is pressed.
		-- If you'd like to disable, do ``Icon.highlightKey = false``
		UserInputService.InputBegan:Connect(function(input, touchingAnObject)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				-- Sometimes the Roblox gamepad glitches when combined with a cursor
				-- This fixes that by unhighlighting if the cursor is pressed down
				-- (i.e. a mouse click)
				local icon = getIconFromSelectedObject()
				if icon then
					GuiService.SelectedObject = nil
				end
				return
			end
			if input.KeyCode ~= Icon.highlightKey then
				return
			end
			local iconToHighlight = Gamepad.getIconToHighlight()
			if iconToHighlight then
				if GamepadService.GamepadCursorEnabled then
					task.wait(0.2)
					GamepadService:DisableGamepadCursor()
				end
				local clickRegion = iconToHighlight:getInstance("ClickRegion")
				GuiService.SelectedObject = clickRegion
			end
		end)
	end)
end

function Gamepad.getIconToHighlight()
	-- If an icon has already been selected, returns the last selected icon
	-- Else if more than 0 icons, it selects the left-most icon
	local iconsDict = Icon.iconsDictionary
	local iconToHighlight = Icon.highlightIcon or Icon.lastHighlightedIcon
	if not iconToHighlight then
		local currentX
		for _, icon in pairs(iconsDict) do
			if icon.parentIconUID then
				continue
			end
			local thisX = icon.widget.AbsolutePosition.X
			if not currentX or thisX < currentX then
				iconToHighlight = icon
				currentX = iconToHighlight.widget.AbsolutePosition.X
			end
		end
	end
	return iconToHighlight
end

-- This called when the icon's ClickRegion is created
function Gamepad.registerButton(buttonInstance)
	-- This provides a basic level of support for controllers by making
	-- the icons easy to highlight via the virtual cursor, then
	-- when selected, focuses in on the selected icon and hops
	-- between other nearby icons simply by toggling the joystick
	local inputBegan = false
	buttonInstance.InputBegan:Connect(function(input)
		-- Two wait frames required to ensure inputBegan is detected within
		-- UserInputService.InputBegan. We do this because object.InputBegan
		-- does not return the correct input objects (unlike the service)
		inputBegan = true
		task.wait()
		task.wait()
		inputBegan = false
	end)
	local connection = UserInputService.InputBegan:Connect(function(input)
		task.wait()
		if input.KeyCode == Enum.KeyCode.ButtonA and inputBegan then
			-- We focus on an icon when selected via the virtual cursor
			task.wait(0.2)
			GamepadService:DisableGamepadCursor()
			GuiService.SelectedObject = buttonInstance
			return
		end
		local isSelected = GuiService.SelectedObject == buttonInstance
		local unselectKeyCodes = {"ButtonB", "ButtonSelect"}
		local keyName = input.KeyCode.Name
		if table.find(unselectKeyCodes, keyName) and isSelected then
			-- We unfocus when back button is pressed, but ignore
			-- if the virtual cursor is disabled otherwise it will be
			-- impossible to select the topbar
			if not(keyName == "ButtonSelect" and not GamepadService.GamepadCursorEnabled) then
				GuiService.SelectedObject = nil
			end
		end
	end)
	buttonInstance.Destroying:Once(function()
		connection:Disconnect()
	end)
end



return Gamepad
-- When designing your game for many devices and screen sizes, icons may occasionally
-- particularly for smaller devices like phones, overlap with other icons or the bounds
-- of the screen. The overflow handler solves this challenge by moving the out-of-bounds
-- icon into an overflow menu (with a limited scrolling canvas) preventing overlaps occuring



-- LOCAL
local Overflow = {}
local holders = {}
local orderedAvailableIcons = {}
local iconsDict
local currentCamera = workspace.CurrentCamera
local overflowIcons = {}
local overflowIconUIDs = {}
local Utility = require(script.Parent.Parent.Utility)
local Icon



-- FUNCTIONS
-- This is called upon the Icon initializing
function Overflow.start(incomingIcon)
	Icon = incomingIcon
	iconsDict = Icon.iconsDictionary
	local primaryScreenGui
	for _, screenGui in pairs(Icon.container) do
		if primaryScreenGui == nil and screenGui.ScreenInsets == Enum.ScreenInsets.TopbarSafeInsets then
			primaryScreenGui = screenGui
		end
		for _, holder in pairs(screenGui.Holders:GetChildren()) do
			if holder:GetAttribute("IsAHolder") then
				holders[holder.Name] = holder
			end
		end
	end

	-- We listen for changes in icons (such as them being added, removed,
	-- the setting of a different alignment, the widget size changing, etc)
	local beginOverflow = false
	local updateBoundaries = Utility.createStagger(0.1, function(ignoreAvailable)
		if not beginOverflow then
			return
		end
		if not ignoreAvailable then
			Overflow.updateAvailableIcons("Center")
		end
		Overflow.updateBoundary("Left")
		Overflow.updateBoundary("Right")
	end)
	task.delay(1, function()
		-- This is essential to prevent central icons begin added
		-- left or right due to incomplete UIListLayout calculations
		-- within the first few frames
		beginOverflow = true
		updateBoundaries()
	end)
	Icon.iconAdded:Connect(updateBoundaries)
	Icon.iconRemoved:Connect(updateBoundaries)
	Icon.iconChanged:Connect(updateBoundaries)
	currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
		updateBoundaries(true)
	end)
	primaryScreenGui:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		updateBoundaries(true)
	end)
end

function Overflow.getWidth(icon, getMaxWidth)
	local widget = icon.widget
	return widget:GetAttribute("TargetWidth") or widget.AbsoluteSize.X
end

function Overflow.getAvailableIcons(alignment)
	local ourOrderedIcons = orderedAvailableIcons[alignment]
	if not ourOrderedIcons then
		ourOrderedIcons = Overflow.updateAvailableIcons(alignment)
	end
	return ourOrderedIcons
end

function Overflow.updateAvailableIcons(alignment)

	-- We only track items that are directly on the topbar (i.e. not within a parent icon)
	local ourTotal = 0
	local holder = holders[alignment]
	local holderUIList = holder.UIListLayout
	local ourOrderedIcons = {}
	for _, icon in pairs(iconsDict) do
		local parentUID = icon.parentIconUID
		local isDirectlyOnTopbar = not parentUID or overflowIconUIDs[parentUID]
		local isOverflow = overflowIconUIDs[icon.UID]
		if isDirectlyOnTopbar and icon.alignment == alignment and not isOverflow then
			table.insert(ourOrderedIcons, icon)
			ourTotal += 1
		end
	end

	-- Ignore if no icons are available
	if ourTotal <= 0 then
		return {}
	end

	-- This sorts these icons by smallest order, or if equal, left-most position
	-- (even for the right alignment because all icons are sorted left-to-right)
	table.sort(ourOrderedIcons, function(iconA, iconB)
		local orderA = iconA.widget.LayoutOrder
		local orderB = iconB.widget.LayoutOrder
		local hasParentA = iconA.parentIconUID
		local hasParentB = iconB.parentIconUID
		if hasParentA == hasParentB then
			if orderA < orderB then
				return true
			end
			if orderA > orderB then
				return false
			end
			return iconA.widget.AbsolutePosition.X < iconB.widget.AbsolutePosition.X
		elseif hasParentB then
			return false
		elseif hasParentA then
			return true
		end
	end)

	-- Finish up
	orderedAvailableIcons[alignment] = ourOrderedIcons
	return ourOrderedIcons

end

function Overflow.getRealXPositions(alignment, orderedIcons)
	-- We calculate the the absolute position of icons instead of reading
	-- directly to determine where they would be if not within an overflow
	local joinOverflow = false
	local isLeft = alignment == "Left"
	local holder = holders[alignment]
	local holderXPos = holder.AbsolutePosition.X
	local holderXSize = holder.AbsoluteSize.X
	local holderUIList = holder.UIListLayout
	local topbarInset = holderUIList.Padding.Offset
	local absoluteX = (isLeft and holderXPos) or holderXPos + holderXSize
	local realXPositions = {}
	if isLeft then
		Utility.reverseTable(orderedIcons)
	end
	for i = #orderedIcons, 1, -1 do
		local icon = orderedIcons[i]
		local sizeX = Overflow.getWidth(icon)
		if not isLeft then
			absoluteX -= sizeX
		end
		realXPositions[icon.UID] = absoluteX
		if isLeft then
			absoluteX += sizeX
		end
		absoluteX += (isLeft and topbarInset) or -topbarInset
	end
	return realXPositions
end

function Overflow.updateBoundary(alignment)

	-- We only track items that are directly on the topbar (i.e. not within a parent icon) or within an overflow
	local holder = holders[alignment]
	local holderUIList = holder.UIListLayout
	local holderXPos = holder.AbsolutePosition.X
	local holderXSize = holder.AbsoluteSize.X
	local topbarInset = holderUIList.Padding.Offset
	local topbarPadding = holderUIList.Padding.Offset
	local BOUNDARY_GAP = topbarInset
	local ourOrderedIcons = Overflow.updateAvailableIcons(alignment)
	local boundWidth = 0
	local ourTotal = 0
	for _, icon in pairs(ourOrderedIcons) do
		boundWidth += Overflow.getWidth(icon) + topbarPadding
		ourTotal += 1
	end
	if ourTotal <= 0 then
		return
	end
	
	-- These are the icons with menus which icons will be moved into
	-- when overflowing
	local isCentral = alignment == "Central"
	local isLeft = alignment == "Left"
	local isRight = not isLeft
	local overflowIcon = overflowIcons[alignment]
	if not overflowIcon and not isCentral and #ourOrderedIcons > 0 then
		local order = (isLeft and -9999999) or 9999999
		overflowIcon = Icon.new()--:setLabel(`{alignment}`)
		overflowIcon:setImage(6069276526, "Deselected")
		overflowIcon:setName("Overflow"..alignment)
		overflowIcon:setOrder(order)
		overflowIcon:setAlignment(alignment)
		overflowIcon:autoDeselect(false)
		overflowIcon.isAnOverflow = true
		--overflowIcon:freezeMenu()
		overflowIcon:select("OverflowStart", overflowIcon)
		overflowIcon:setEnabled(false)
		overflowIcons[alignment] = overflowIcon
		overflowIconUIDs[overflowIcon.UID] = true
	end

	-- The default boundary is the point where both the left-most-right-icon
	-- and left-most-right-icon meet OR the opposite side of the screen
	local oppositeAlignment = (alignment == "Left" and "Right") or "Left"
	local oppositeOrderedIcons = Overflow.updateAvailableIcons(oppositeAlignment)
	local nearestOppositeIcon = (isLeft and oppositeOrderedIcons[1]) or (isRight and oppositeOrderedIcons[#oppositeOrderedIcons])
	local oppositeOverflowIcon = overflowIcons[oppositeAlignment]
	local boundary = (isLeft and holderXPos + holderXSize) or holderXPos
	if nearestOppositeIcon then
		local oppositeEndWidget = nearestOppositeIcon.widget
		local oppositeRealXPositions = Overflow.getRealXPositions(oppositeAlignment, oppositeOrderedIcons)
		local oppositeX = oppositeRealXPositions[nearestOppositeIcon.UID]
		local oppositeXSize = Overflow.getWidth(nearestOppositeIcon)
		boundary = (isLeft and oppositeX - BOUNDARY_GAP) or oppositeX + oppositeXSize + BOUNDARY_GAP
	end
	
	-- We get the left-most icon (if left alignment) or right-most-icon (if
	-- right alignment) of the central icons group to see if we need to change
	-- the boundary (if the central icon boundary is smaller than the alignment
	-- boundary then we use the central)
	local centerOrderedIcons = Overflow.getAvailableIcons("Center")
	local centerPos = (isLeft and 1) or #centerOrderedIcons
	local nearestCenterIcon = centerOrderedIcons[centerPos]
	local usingNearestCenter = false
	if nearestCenterIcon and not nearestCenterIcon.hasRelocatedInOverflow then
		local ourNearestIcon = (isLeft and ourOrderedIcons[#ourOrderedIcons]) or (isRight and ourOrderedIcons[1])
		local centralNearestXPos = nearestCenterIcon.widget.AbsolutePosition.X
		local ourNearestXPos = ourNearestIcon.widget.AbsolutePosition.X
		local ourNearestXSize = Overflow.getWidth(ourNearestIcon)
		local centerBoundary = (isLeft and centralNearestXPos-BOUNDARY_GAP) or centralNearestXPos + Overflow.getWidth(nearestCenterIcon) + BOUNDARY_GAP
		local removeBoundary = (isLeft and ourNearestXPos + ourNearestXSize) or ourNearestXPos
		if isLeft then
			if centerBoundary < removeBoundary then
				nearestCenterIcon:align("Left")
				nearestCenterIcon.hasRelocatedInOverflow = true
			end
		elseif isRight then
			if centerBoundary > removeBoundary then
				nearestCenterIcon:align("Right")
				nearestCenterIcon.hasRelocatedInOverflow = true
			end
		end
	end
	
	--[[
	This updates the maximum size of the overflow menus
	The menu determines its bounds from the smallest of either:
	 	1. The closest center-aligned icon (i.e. the boundary)
	 	2. The edge of the opposite overflow menu UNLESS...
	 	3. ... the edge exceeds more than half the screenGui
	--]]
	if overflowIcon then
		local menuBoundary = boundary
		local menu = overflowIcon:getInstance("Menu")
		local holderXEndPos = holderXPos + holderXSize
		local menuWidth = holderXSize
		if menu and oppositeOverflowIcon then
			local oppositeWidget = oppositeOverflowIcon.widget
			local oppositeXPos = oppositeWidget.AbsolutePosition.X
			local oppositeXSize = Overflow.getWidth(oppositeOverflowIcon)
			local oppositeBoundary = (isLeft and oppositeXPos - BOUNDARY_GAP) or oppositeXPos + oppositeXSize + BOUNDARY_GAP
			local oppositeMenu = oppositeOverflowIcon:getInstance("Menu")
			local isDominant = menu.AbsoluteCanvasSize.X >= oppositeMenu.AbsoluteCanvasSize.X
			if not usingNearestCenter then
				local halfwayXPos = holderXPos + holderXSize/2
				local halfwayBoundary = (isLeft and halfwayXPos - BOUNDARY_GAP/2) or halfwayXPos + BOUNDARY_GAP/2
				menuBoundary = halfwayBoundary
				if isDominant then
					menuBoundary = oppositeBoundary
				end
			end
			menuWidth = (isLeft and menuBoundary - holderXPos) or (holderXEndPos - menuBoundary)
		end
		local currentMaxWidth = menu and menu:GetAttribute("MaxWidth")
		menuWidth = Utility.round(menuWidth)
		if menu and currentMaxWidth ~= menuWidth then
			menu:SetAttribute("MaxWidth", menuWidth)
		end
	end

	-- Parent ALL icons of that alignment into the overflow if at least on
	-- sibling exceeds the bounds.
	-- We calculate the the absolute position of icons instead of reading
	-- directly to determine where they would be if not within an overflow
	local joinOverflow = false
	local realXPositions = Overflow.getRealXPositions(alignment, ourOrderedIcons)
	for i = #ourOrderedIcons, 1, -1 do
		local icon = ourOrderedIcons[i]
		local widgetX = Overflow.getWidth(icon)
		local xPos = realXPositions[icon.UID]
		if (isLeft and xPos + widgetX >= boundary) or (isRight and xPos <= boundary) then
			joinOverflow = true
		end
	end
	for i = #ourOrderedIcons, 1, -1 do
		local icon = ourOrderedIcons[i]
		local isOverflow = overflowIconUIDs[icon.UID]
		if not isOverflow then
			if joinOverflow and not icon.parentIconUID then
				icon:joinMenu(overflowIcon)
			elseif not joinOverflow and icon.parentIconUID then
				icon:leave()
			end
		end
	end
	
	-- Hide the overflows when not in use
	if overflowIcon.isEnabled ~= joinOverflow then
		overflowIcon:setEnabled(joinOverflow)
	end
	
	-- Have the menus auto selected
	if overflowIcon.isEnabled and not overflowIcon.overflowAlreadyOpened then
		overflowIcon.overflowAlreadyOpened = true
		overflowIcon:select()
	end

end



return Overflow
-- The functions here are dedicated solely to managing theme state
-- and updating the appearance of instances to match that state.
-- You don't need to use any of these functions, the useful ones
-- have been abstracted as icon methods



-- LOCAL
local Themes = {}
local Utility = require(script.Parent.Parent.Utility)
local baseTheme = require(script.Parent.ThemeModules.Default)



-- FUNCTIONS
function Themes.getThemeValue(stateGroup, instanceName, property, iconState)
	if stateGroup then
		for _, detail in pairs(stateGroup) do
			local checkingInstanceName, checkingPropertyName, checkingValue = unpack(detail)
			if instanceName == checkingInstanceName and property == checkingPropertyName then
				return checkingValue
			end
		end
	end
end

function Themes.getInstanceValue(instance, property)
	local success, value = pcall(function()
		return instance[property]
	end)
	if not success then
		value = instance:GetAttribute(property)
	end
	return value
end

function Themes.getRealInstance(instance)
	if not instance:GetAttribute("IsAClippedClone") then
		return
	end
	local originalInstance = instance:FindFirstChild("OriginalInstance")
	if not originalInstance then
		return
	end
	return originalInstance.Value
end

function Themes.getClippedClone(instance)
	if not instance:GetAttribute("HasAClippedClone") then
		return
	end
	local clippedClone = instance:FindFirstChild("ClippedClone")
	if not clippedClone then
		return
	end
	return clippedClone.Value
end

function Themes.refresh(icon, instance, specificProperty)
	-- Some instances such as notices need immediate refreshing upon creation as
	-- they're added in after the initial refresh period
	if specificProperty then
		local stateGroup = icon:getStateGroup()
		local value = Themes.getThemeValue(stateGroup, instance.Name, specificProperty) or Themes.getInstanceValue(instance, specificProperty)
		Themes.apply(icon, instance, specificProperty, value, true)
		return
	end
	-- If no property is specified we update all properties that exist within
	-- the applied theme appearance
	local stateGroup = icon:getStateGroup()
	if not stateGroup then
		return
	end
	local validInstances = {[instance.Name] = instance}
	for _, child in pairs(instance:GetDescendants()) do
		local collective = child:GetAttribute("Collective")
		if collective then
			validInstances[collective] = child
		end
		validInstances[child.Name] = child
	end
	for _, detail in pairs(stateGroup) do
		local checkingInstanceName, checkingPropertyName, checkingValue = unpack(detail)
		local instanceToUpdate = validInstances[checkingInstanceName]
		if instanceToUpdate then
			Themes.apply(icon, instanceToUpdate.Name, checkingPropertyName, checkingValue, true)
		end
	end
	return
end

function Themes.apply(icon, collectiveOrInstanceNameOrInstance, property, value, forceApply)
	-- This is responsible for **applying** appearance changes to instances within the icon
	-- however it IS NOT responsible for updating themes. Use :modifyTheme for that.
	-- This also calls callbacks given by :setBehaviour before applying these property changes
	-- to the given instances
	if icon.isDestroyed then
		return
	end
	local instances
	local collectiveOrInstanceName = collectiveOrInstanceNameOrInstance
	if typeof(collectiveOrInstanceNameOrInstance) == "Instance" then
		instances = {collectiveOrInstanceNameOrInstance}
		collectiveOrInstanceName = collectiveOrInstanceNameOrInstance.Name
	else
		instances = icon:getInstanceOrCollective(collectiveOrInstanceNameOrInstance)
	end
	local key = collectiveOrInstanceName.."-"..property
	local customBehaviour = icon.customBehaviours[key]
	for _, instance in pairs(instances) do
		local clippedClone = Themes.getClippedClone(instance)
		if clippedClone then
			-- This means theme effects are applied to both the original
			-- instance and its clone (instead of just the instance).
			-- This is important for some properties such as position
			-- and size which might be dictated by the clone
			table.insert(instances, clippedClone)
		end
	end
	for _, instance in pairs(instances) do
		if property == "Position" and Themes.getClippedClone(instance) then
			-- The clone manages the position of the real instance so ignore
			continue
		elseif property == "Size" and Themes.getRealInstance(instance) then
			-- The real instance manages the size of the clone so ignore
			continue
		end
		local currentValue = Themes.getInstanceValue(instance, property)
		if not forceApply and value == currentValue then
			continue
		end
		if customBehaviour then
			local newValue = customBehaviour(value, instance, property)
			if newValue ~= nil then
				value = newValue
			end
		end
		local success = pcall(function()
			instance[property] = value
		end)
		if not success then
			-- If property is not a real property, we set
			-- the value as an attribute instead. This is useful
			-- for instance in :setWidth where we also want to
			-- specify a desired width for every state which can
			-- then be easily read by the widget element
			instance:SetAttribute(property, value)
		end
	end
end

function Themes.getModifications(modifications)
	if typeof(modifications[1]) ~= "table" then
		-- This enables users to do :modifyTheme({a,b,c,d})
		-- in addition of :modifyTheme({{a,b,c,d}})
		modifications = {modifications}
	end
	return modifications
end

function Themes.merge(detail, modification, callback)
	local instanceName, property, value, stateName = table.unpack(modification)
	local checkingInstanceName, checkingPropertyName, _, checkingStateName = table.unpack(detail)
	if instanceName == checkingInstanceName and property == checkingPropertyName and Themes.statesMatch(stateName, checkingStateName) then
		detail[3] = value
		if callback then
			callback(detail)
		end
		return true
	end
	return false
end

function Themes.modify(icon, modifications, modificationsUID)
	-- This is what the 'old set' used to do (although for clarity that behaviour has now been
	-- split into two methods, .modifyTheme and .apply).
	-- modifyTheme is responsible for UPDATING the internal values within a theme for a particular
	-- state, then checking to see if the appearance of the icon needs to be updated.
	-- If no iconState is specified, the change is applied to both Deselected and Selected
	-- A modification can also be 'undone' using :removeModification and passing in
	-- the UID returned from this method
	task.spawn(function()
		modificationsUID = modificationsUID or Utility.generateUID()
		modifications = Themes.getModifications(modifications)
		for _, modification in pairs(modifications) do
			local instanceName, property, value, iconState = table.unpack(modification)
			if iconState == nil then
				-- If no state specified, apply to all states
				Themes.modify(icon, {instanceName, property, value, "Selected"}, modificationsUID)
				Themes.modify(icon, {instanceName, property, value, "Viewing"}, modificationsUID)
			end
			local chosenState = Utility.formatStateName(iconState or "Deselected")
			local stateGroup = icon:getStateGroup(chosenState)
			local function nowSetIt()
				if chosenState == icon.activeState then
					Themes.apply(icon, instanceName, property, value)
				end
			end
			local function updateRecord()
				for stateName, detail in pairs(stateGroup) do
					local didMerge = Themes.merge(detail, modification, function(detail)
						detail[5] = modificationsUID
						nowSetIt()
					end)
					if didMerge then
						return
					end
				end
				local detail = {instanceName, property, value, chosenState, modificationsUID}
				table.insert(stateGroup, detail)
				nowSetIt()
			end
			updateRecord()
		end
	end)
	return modificationsUID
end

function Themes.remove(icon, modificationsUID)
	for iconState, stateGroup in pairs(icon.appearance) do
		for i = #stateGroup, 1, -1 do
			local detail = stateGroup[i]
			local checkingUID = detail[5]
			if checkingUID == modificationsUID then
				table.remove(stateGroup, i)
			end
		end
	end
	Themes.rebuild(icon)
end

function Themes.removeWith(icon, instanceName, property, state)
	for iconState, stateGroup in pairs(icon.appearance) do
		if state == iconState or not state then
			for i = #stateGroup, 1, -1 do
				local detail = stateGroup[i]
				local detailName = detail[1]
				local detailProperty = detail[2]
				if detailName == instanceName and detailProperty == property then
					table.remove(stateGroup, i)
				end
			end
		end
	end
	Themes.rebuild(icon)
end

function Themes.change(icon)
	-- This changes the theme to the appearance of whatever
	-- state is currently active
	local stateGroup = icon:getStateGroup()
	for _, detail in pairs(stateGroup) do
		local instanceName, property, value = unpack(detail)
		Themes.apply(icon, instanceName, property, value)
	end
end

function Themes.set(icon, theme)
	-- This is responsible for processing the final appearance of a given theme (such as
	-- ensuring Deselected merge into missing Selected, saving that internal state,
	-- then checking to see if the appearance of the icon needs to be updated
	local themesJanitor = icon.themesJanitor
	themesJanitor:clean()
	themesJanitor:add(icon.stateChanged:Connect(function()
		Themes.change(icon)
	end))
	if typeof(theme) == "Instance" and theme:IsA("ModuleScript") then
		theme = require(theme)
	end
	icon.appliedTheme = theme
	Themes.rebuild(icon)
end

function Themes.statesMatch(state1, state2)
	-- States match if they have the same name OR if nil (because unspecified represents all states)
	local state1lower = (state1 and string.lower(state1))
	local state2lower = (state2 and string.lower(state2))
	return state1lower == state2lower or not state1 or not state2
end

function Themes.rebuild(icon)
	-- A note for my future self: this code can be optimised further by
	-- converting appearance into a instanceName-property dictionary
	-- as apposed to an array of every potential change. When converting
	-- in the future, .modify and .apply would also have to be updated.
	local appliedTheme = icon.appliedTheme
	local statesArray = {"Deselected", "Selected", "Viewing"}
	local function generateTheme()
		for _, stateName in pairs(statesArray) do
			-- This applies themes in layers
			-- The last layers take higher priority as they overwrite
			-- any duplicate earlier applied effects
			local stateAppearance = {}
			local function updateDetails(theme, incomingStateName)
				-- This ensures there's always a base 'default' layer
				if not theme then
					return
				end
				for _, detail in pairs(theme) do
					local modificationsUID = detail[5]
					local detailStateName = detail[4]
					if Themes.statesMatch(incomingStateName, detailStateName) then
						local key = detail[1].."-"..detail[2]
						local newDetail = Utility.copyTable(detail)
						newDetail[5] = modificationsUID
						stateAppearance[key] = newDetail
					end
				end
			end
			-- First we apply the base theme (i.e. the Default module)
			if stateName == "Selected" then
				updateDetails(baseTheme, "Deselected")
			end
			updateDetails(baseTheme, "Empty")
			updateDetails(baseTheme, stateName)
			-- Next we apply any custom themes by the games developer
			if appliedTheme ~= baseTheme then
				if stateName == "Selected" then
					updateDetails(appliedTheme, "Deselected")
				end
				updateDetails(baseTheme, "Empty")
				updateDetails(appliedTheme, stateName)
			end
			-- Finally we apply any modifications that have already been made
			-- Modifiers are all the changes made using icon:modifyTheme(...)
			local alreadyAppliedTheme = {}
			local alreadyAppliedGroup = icon.appearance[stateName]
			if alreadyAppliedGroup then
				for _, modifier in pairs(alreadyAppliedGroup) do
					local modificationsUID = modifier[5]
					if modificationsUID ~= nil then
						local modification = {modifier[1], modifier[2], modifier[3], stateName, modificationsUID}
						table.insert(alreadyAppliedTheme, modification)
					end
				end
			end
			updateDetails(alreadyAppliedTheme, stateName)
			-- This now converts it into our final appearance
			local finalStateAppearance = {}
			for _, detail in pairs(stateAppearance) do
				table.insert(finalStateAppearance, detail)
			end
			icon.appearance[stateName] = finalStateAppearance
		end
		Themes.change(icon)
	end
	generateTheme()
end



return Themes
-- This is to provide backwards compatability with the old Roblox
-- topbar while experiences transition over to the new topbar
-- You don't need to apply this yourself, topbarplus automatically
-- applies it if the old roblox topbar is detected


return {
	{"Selection", "Size", UDim2.new(1, -6, 1, -5)},
	{"Selection", "Position", UDim2.new(0, 3, 0, 3)},
	
	{"Widget", "MinimumWidth", 32, "Deselected"},
	{"Widget", "MinimumHeight", 32, "Deselected"},
	{"Widget", "BorderSize", 0, "Deselected"},
	{"IconCorners", "CornerRadius", UDim.new(0, 9), "Deselected"},
	{"IconButton", "BackgroundTransparency", 0.5, "Deselected"},
	{"IconLabel", "TextSize", 14, "Deselected"},
	{"Dropdown", "BackgroundTransparency", 0.5, "Deselected"},
	{"Notice", "Position", UDim2.new(1, -12, 0, -3), "Deselected"},
	{"Notice", "Size", UDim2.new(0, 15, 0, 15), "Deselected"},
	{"NoticeLabel", "TextSize", 11, "Deselected"},
	
	{"IconSpot", "BackgroundColor3", Color3.fromRGB(0, 0, 0), "Selected"},
	{"IconSpot", "BackgroundTransparency", 0.702, "Selected"},
	{"IconSpotGradient", "Enabled", false, "Selected"},
	{"IconOverlay", "BackgroundTransparency", 0.97, "Selected"},
	
}
-- Themes in v3 work simply by applying the value (agument[3])
-- to the property (agument[2]) of an instance within the icon which
-- matches the name of argument[1]. Argument[1] can also be used to
-- specify a collection of instances with a corresponding 'collective'
-- value. A colletive is simply an attribute applied to some instances
-- within the icon to group them together (such as "IconCorners").
-- If the property (argument[2]) does not exist within the instance,
-- it will instead be applied as an attribute on the instance:
-- (i.e. ``instance:SetAttribute(argument[2], [argument[3])``)
-- Use argument[4] to specify a state: "Deselected", "Selected"
-- or "Viewing". If argument[4] is empty the state will default
-- to "Deselected".
-- I've designed themes this way so you have full control over
-- the appearance of the widget and its descendants


return {
	
	-- When no state is specified the modification is applied to *all* states (Deselected, Selected and Viewing)
	{"IconCorners", "CornerRadius", UDim.new(1, 0)},
	{"Selection", "RotationSpeed", 1},
	{"Selection", "Size", UDim2.new(1, 0, 1, 1)},
	{"Selection", "Position", UDim2.new(0, 0, 0, 0)},
	{"SelectionGradient", "Color", ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(86, 86, 86)),
	})},
	
	-- When the icon is deselected
	{"IconImage", "Image", "", "Deselected"},
	{"IconLabel", "Text", "", "Deselected"},
	{"IconLabel", "Position", UDim2.fromOffset(0, 0), "Deselected"}, -- 0, -1
	{"Widget", "MinimumWidth", 44, "Deselected"},
	{"Widget", "MinimumHeight", 44, "Deselected"},
	{"Widget", "BorderSize", 4, "Deselected"},
	{"IconButton", "BackgroundColor3", Color3.fromRGB(0, 0, 0), "Deselected"},
	{"IconButton", "BackgroundTransparency", 0.3, "Deselected"},
	{"IconImageScale", "Value", 0.5, "Deselected"},
	{"IconImageCorner", "CornerRadius", UDim.new(0, 0), "Deselected"},
	{"IconImage", "ImageColor3", Color3.fromRGB(255, 255, 255), "Deselected"},
	{"IconImage", "ImageTransparency", 0, "Deselected"},
	{"IconLabel", "FontFace", Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal), "Deselected"},
	{"IconLabel", "TextSize", 16, "Deselected"},
	{"IconSpot", "BackgroundTransparency", 1, "Deselected"},
	{"IconOverlay", "BackgroundTransparency", 0.925, "Deselected"},
	{"IconSpotGradient", "Enabled", false, "Deselected"},
	{"IconGradient", "Enabled", false, "Deselected"},
	{"ClickRegion", "Active", true, "Deselected"},  -- This is set to false within scrollers to ensure scroller can be dragged on mobile
	{"Menu", "Active", false, "Deselected"},
	{"ContentsList", "HorizontalAlignment", Enum.HorizontalAlignment.Center, "Deselected"},
	{"Dropdown", "BackgroundColor3", Color3.fromRGB(0, 0, 0), "Deselected"},
	{"Dropdown", "BackgroundTransparency", 0.3, "Deselected"},
	{"Dropdown", "MaxIcons", 4, "Deselected"},
	{"Menu", "MaxIcons", 4, "Deselected"},
	{"Notice", "Position", UDim2.new(1, -12, 0, -1), "Deselected"},
	{"Notice", "Size", UDim2.new(0, 20, 0, 20), "Deselected"},
	{"NoticeLabel", "TextSize", 13, "Deselected"},
	{"PaddingLeft", "Size", UDim2.new(0, 9, 1, 0), "Deselected"},
	{"PaddingRight", "Size", UDim2.new(0, 11, 1, 0), "Deselected"},
	
	-- When the icon is selected
	-- Selected also inherits everything from Deselected if nothing is set
	{"IconSpot", "BackgroundTransparency", 0.7, "Selected"},
	{"IconSpot", "BackgroundColor3", Color3.fromRGB(255, 255, 255), "Selected"},
	{"IconSpotGradient", "Enabled", true, "Selected"},
	{"IconSpotGradient", "Rotation", 45, "Selected"},
	{"IconSpotGradient", "Color", ColorSequence.new(Color3.fromRGB(96, 98, 100), Color3.fromRGB(77, 78, 80)), "Selected"},
	
	
	-- When a cursor is hovering above, a controller highlighting, or touchpad (mobile) pressing (but not released)
	--{"IconSpot", "BackgroundTransparency", 0.75, "Viewing"},
	
}
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
local function runEventHandlerInFreeThread()
	-- Note: We cannot use the initial set of arguments passed to
	-- runEventHandlerInFreeThread for a call to the handler, because those
	-- arguments would stay on the stack for the duration of the thread's
	-- existence, temporarily leaking references. Without access to raw bytecode
	-- there's no way for us to clear the "..." references from the stack.
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
Connection.Destroy = Connection.Disconnect

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

function Signal.new()
	return setmetatable({
		_handlerListHead = false,
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
Signal.Destroy = Signal.DisconnectAll

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
				-- Get the freeRunnerThread to the first yield
				coroutine.resume(freeRunnerThread)
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

-- Implement Signal:Once() in terms of a connection which disconnects
-- itself before running the handler.
function Signal:Once(fn)
	local cn;
	cn = self:Connect(function(...)
		if cn._connected then
			cn:Disconnect()
		end
		fn(...)
	end)
	return cn
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
--[[
-------------------------------------
This package was modified by ForeverHD.

PACKAGE MODIFICATIONS:
	1. Added pascalCase aliases for all methods
	2. Modified behaviour of :add so that it takes both objects and promises (previously only objects)
	3. Slight change to how promises are tracked
	4. Added isAnInstanceBeingDestroyed check to line 228
	5. Added 'OriginalTraceback' to help determine where an error was added to the janitor
	6. Likely some additional changes which weren't record here
-------------------------------------
--]]



-- Janitor
-- Original by Validark
-- Modifications by pobammer
-- roblox-ts support by OverHash and Validark
-- LinkToInstance fixed by Elttob.

local RunService = game:GetService("RunService")
local Heartbeat = RunService.Heartbeat
local function getPromiseReference()
	if RunService:IsRunning() then
		local main = require(game:GetService("ReplicatedStorage").Framework)
		return main.modules.Promise
	end
end

local IndicesReference = newproxy(true)
getmetatable(IndicesReference).__tostring = function()
	return "IndicesReference"
end

local LinkToInstanceIndex = newproxy(true)
getmetatable(LinkToInstanceIndex).__tostring = function()
	return "LinkToInstanceIndex"
end

local METHOD_NOT_FOUND_ERROR = "Object %s doesn't have method %s, are you sure you want to add it? Traceback: %s"
local NOT_A_PROMISE = "Invalid argument #1 to 'Janitor:AddPromise' (Promise expected, got %s (%s))"

local Janitor = {
	IGNORE_MEMORY_DEBUG = true,
	ClassName = "Janitor";
	__index = {
		CurrentlyCleaning = true;
		[IndicesReference] = nil;
	};
}

local TypeDefaults = {
	["function"] = true;
	["Promise"] = "cancel";
	RBXScriptConnection = "Disconnect";
}

--[[**
	Instantiates a new Janitor object.
	@returns [t:Janitor]
**--]]
function Janitor.new()
	return setmetatable({
		CurrentlyCleaning = false;
		[IndicesReference] = nil;
	}, Janitor)
end

--[[**
	Determines if the passed object is a Janitor.
	@param [t:any] Object The object you are checking.
	@returns [t:boolean] Whether or not the object is a Janitor.
**--]]
function Janitor.Is(Object)
	return type(Object) == "table" and getmetatable(Object) == Janitor
end

Janitor.is = Janitor.Is

--[[**
	Adds an `Object` to Janitor for later cleanup, where `MethodName` is the key of the method within `Object` which should be called at cleanup time. If the `MethodName` is `true` the `Object` itself will be called instead. If passed an index it will occupy a namespace which can be `Remove()`d or overwritten. Returns the `Object`.
	@param [t:any] Object The object you want to clean up.
	@param [t:string|true?] MethodName The name of the method that will be used to clean up. If not passed, it will first check if the object's type exists in TypeDefaults, and if that doesn't exist, it assumes `Destroy`.
	@param [t:any?] Index The index that can be used to clean up the object manually.
	@returns [t:any] The object that was passed.
**--]]
function Janitor.__index:Add(Object, MethodName, Index)
	if Index then
		self:Remove(Index)

		local This = self[IndicesReference]
		if not This then
			This = {}
			self[IndicesReference] = This
		end

		This[Index] = Object
	end

	local objectType = typeof(Object)
	if objectType == "table" and string.match(tostring(Object), "Promise") then
		objectType = "Promise"
		--local status = Object:getStatus()
		--print("status =", status, status == "Rejected")
	end
	MethodName = MethodName or TypeDefaults[objectType] or "Destroy"
	if type(Object) ~= "function" and not Object[MethodName] then
		warn(string.format(METHOD_NOT_FOUND_ERROR, tostring(Object), tostring(MethodName), debug.traceback(nil :: any, 2)))
	end

	local OriginalTraceback = debug.traceback("")
	self[Object] = {MethodName, OriginalTraceback}
	return Object
end
Janitor.__index.Give = Janitor.__index.Add

-- My version of Promise has PascalCase, but I converted it to use lowerCamelCase for this release since obviously that's important to do.

--[[**
	Adds a promise to the janitor. If the janitor is cleaned up and the promise is not completed, the promise will be cancelled.
	@param [t:Promise] PromiseObject The promise you want to add to the janitor.
	@returns [t:Promise]
**--]]
function Janitor.__index:AddPromise(PromiseObject)
	local Promise = getPromiseReference()
	if Promise then
		if not Promise.is(PromiseObject) then
			error(string.format(NOT_A_PROMISE, typeof(PromiseObject), tostring(PromiseObject)))
		end
		if PromiseObject:getStatus() == Promise.Status.Started then
			local Id = newproxy(false)
			local NewPromise = self:Add(Promise.new(function(Resolve, _, OnCancel)
				if OnCancel(function()
						PromiseObject:cancel()
					end) then
					return
				end

				Resolve(PromiseObject)
			end), "cancel", Id)

			NewPromise:finallyCall(self.Remove, self, Id)
			return NewPromise
		else
			return PromiseObject
		end
	else
		return PromiseObject
	end
end
Janitor.__index.GivePromise = Janitor.__index.AddPromise

-- This will assume whether or not the object is a Promise or a regular object.
function Janitor.__index:AddObject(Object)
	local Id = newproxy(false)
	local Promise = getPromiseReference()
	if Promise and Promise.is(Object) then
		if Object:getStatus() == Promise.Status.Started then
			local NewPromise = self:Add(Promise.resolve(Object), "cancel", Id)
			NewPromise:finallyCall(self.Remove, self, Id)
			return NewPromise, Id
		else
			return Object
		end
	else
		return self:Add(Object, false, Id), Id
	end
end

Janitor.__index.GiveObject = Janitor.__index.AddObject

--[[**
	Cleans up whatever `Object` was set to this namespace by the 3rd parameter of `:Add()`.
	@param [t:any] Index The index you want to remove.
	@returns [t:Janitor] The same janitor, for chaining reasons.
**--]]
function Janitor.__index:Remove(Index)
	local This = self[IndicesReference]
	if This then
		local Object = This[Index]

		if Object then
			local ObjectDetail = self[Object]
			local MethodName = ObjectDetail and ObjectDetail[1]

			if MethodName then
				if MethodName == true then
					Object()
				else
					local ObjectMethod = Object[MethodName]
					if ObjectMethod then
						ObjectMethod(Object)
					end
				end

				self[Object] = nil
			end

			This[Index] = nil
		end
	end

	return self
end

--[[**
	Gets whatever object is stored with the given index, if it exists. This was added since Maid allows getting the job using `__index`.
	@param [t:any] Index The index that the object is stored under.
	@returns [t:any?] This will return the object if it is found, but it won't return anything if it doesn't exist.
**--]]
function Janitor.__index:Get(Index)
	local This = self[IndicesReference]
	if This then
		return This[Index]
	end
end

--[[**
	Calls each Object's `MethodName` (or calls the Object if `MethodName == true`) and removes them from the Janitor. Also clears the namespace. This function is also called when you call a Janitor Object (so it can be used as a destructor callback).
	@returns [t:void]
**--]]
function Janitor.__index:Cleanup()
	if not self.CurrentlyCleaning then
		self.CurrentlyCleaning = nil
		for Object, ObjectDetail in next, self do
			if Object == IndicesReference then
				continue
			end

			-- Weird decision to rawset directly to the janitor in Agent. This should protect against it though.
			local TypeOf = type(Object)
			if TypeOf == "string" or TypeOf == "number" then
				self[Object] = nil
				continue
			end

			local MethodName = ObjectDetail[1]
			local OriginalTraceback = ObjectDetail[2]
			local function warnUser(warning)
				local cleanupLine = debug.traceback("", 3)--string.gsub(debug.traceback("", 3), "%c", "")
				local addedLine = OriginalTraceback
				warn("-------- Janitor Error --------".."\n"..tostring(warning).."\n"..cleanupLine..""..addedLine)
			end
			if MethodName == true then
				local success, warning = pcall(Object)
				if not success then
					warnUser(warning)
				end
			else
				local ObjectMethod = Object[MethodName]
				if ObjectMethod then
					local success, warning = pcall(ObjectMethod, Object)
					local isAnInstanceBeingDestroyed = typeof(Object) == "Instance" and ObjectMethod == "Destroy"
					if not success and not isAnInstanceBeingDestroyed then
						warnUser(warning)
					end
				end
			end

			self[Object] = nil
		end

		local This = self[IndicesReference]
		if This then
			for Index in next, This do
				This[Index] = nil
			end

			self[IndicesReference] = {}
		end

		self.CurrentlyCleaning = false
	end
end

Janitor.__index.Clean = Janitor.__index.Cleanup

--[[**
	Calls `:Cleanup()` and renders the Janitor unusable.
	@returns [t:void]
**--]]
function Janitor.__index:Destroy()
	self:Cleanup()
	--table.clear(self)
	--setmetatable(self, nil)
end

Janitor.__call = Janitor.__index.Cleanup

--- Makes the Janitor clean up when the instance is destroyed
-- @param Instance Instance The Instance the Janitor will wait for to be Destroyed
-- @returns Disconnectable table to stop Janitor from being cleaned up upon Instance Destroy (automatically cleaned up by Janitor, btw)
-- @author Corecii
local Disconnect = {Connected = true}
Disconnect.__index = Disconnect
function Disconnect:Disconnect()
	if self.Connected then
		self.Connected = false
		self.Connection:Disconnect()
	end
end

function Disconnect:__tostring()
	return "Disconnect<" .. tostring(self.Connected) .. ">"
end

--[[**
	"Links" this Janitor to an Instance, such that the Janitor will `Cleanup` when the Instance is `Destroyed()` and garbage collected. A Janitor may only be linked to one instance at a time, unless `AllowMultiple` is true. When called with a truthy `AllowMultiple` parameter, the Janitor will "link" the Instance without overwriting any previous links, and will also not be overwritable. When called with a falsy `AllowMultiple` parameter, the Janitor will overwrite the previous link which was also called with a falsy `AllowMultiple` parameter, if applicable.
	@param [t:Instance] Object The instance you want to link the Janitor to.
	@param [t:boolean?] AllowMultiple Whether or not to allow multiple links on the same Janitor.
	@returns [t:RbxScriptConnection] A pseudo RBXScriptConnection that can be disconnected.
**--]]
function Janitor.__index:LinkToInstance(Object, AllowMultiple)
	local Connection
	local IndexToUse = AllowMultiple and newproxy(false) or LinkToInstanceIndex
	local IsNilParented = Object.Parent == nil
	local ManualDisconnect = setmetatable({}, Disconnect)

	local function ChangedFunction(_DoNotUse, NewParent)
		if ManualDisconnect.Connected then
			_DoNotUse = nil
			IsNilParented = NewParent == nil

			if IsNilParented then
				coroutine.wrap(function()
					Heartbeat:Wait()
					if not ManualDisconnect.Connected then
						return
					elseif not Connection.Connected then
						self:Cleanup()
					else
						while IsNilParented and Connection.Connected and ManualDisconnect.Connected do
							Heartbeat:Wait()
						end

						if ManualDisconnect.Connected and IsNilParented then
							self:Cleanup()
						end
					end
				end)()
			end
		end
	end

	Connection = Object.AncestryChanged:Connect(ChangedFunction)
	ManualDisconnect.Connection = Connection

	if IsNilParented then
		ChangedFunction(nil, Object.Parent)
	end

	Object = nil
	return self:Add(ManualDisconnect, "Disconnect", IndexToUse)
end

--[[**
	Links several instances to a janitor, which is then returned.
	@param [t:...Instance] ... All the instances you want linked.
	@returns [t:Janitor] A janitor that can be used to manually disconnect all LinkToInstances.
**--]]
function Janitor.__index:LinkToInstances(...)
	local ManualCleanup = Janitor.new()
	for _, Object in ipairs({...}) do
		ManualCleanup:Add(self:LinkToInstance(Object, true), "Disconnect")
	end

	return ManualCleanup
end

for FunctionName, Function in next, Janitor.__index do
	local NewFunctionName = string.sub(string.lower(FunctionName), 1, 1) .. string.sub(FunctionName, 2)
	Janitor.__index[NewFunctionName] = Function
end

return Janitor
-- v3 alone has taken 250+ hours so please consider keeping this
-- required attribute and linking to TopbarPlus within your games
-- description or devforum post. An in-game readable version also
-- makes it easier for me to debug and compare differences betewen
-- live places. Thanks! ~Ben

local RunService = game:GetService("RunService")
local GroupService = game:GetService("GroupService")
local Players = game:GetService("Players")
if not RunService:IsStudio() then
	
end

return {}
-- This module enables you to place Icon wherever you like within the data model while
-- still enabling third-party applications (such as HDAdmin/Nanoblox) to locate it
-- This is necessary to prevent two TopbarPlus applications initiating at runtime which would
-- cause icons to overlap with each other

local replicatedStorage = game:GetService("ReplicatedStorage")
local Reference = {}
Reference.objectName = "TopbarPlusReference"

function Reference.addToReplicatedStorage()
	local existingItem = replicatedStorage:FindFirstChild(Reference.objectName)
    if existingItem then
        return false
    end
    local objectValue = Instance.new("ObjectValue")
	objectValue.Name = Reference.objectName
    objectValue.Value = script.Parent
    objectValue.Parent = replicatedStorage
    return objectValue
end

function Reference.getObject()
	local objectValue = replicatedStorage:FindFirstChild(Reference.objectName)
    if objectValue then
        return objectValue
    end
    return false
end

return Reference
-- Just generic utility functions which I use and repeat across all my projects



-- LOCAL
local Utility = {}
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer



-- FUNCTIONS
function Utility.createStagger(delayTime, callback, delayInitially)
	-- This creates and returns a function which when called
	-- acts identically to callback, however will only be called
	-- for a maximum of once per delayTime. If the returned function
	-- is called more than once during the delayTime, then it will
	-- wait until the expiryTime then perform another recall.
	-- This is useful for visual interfaces and effects which may be
	-- triggered multiple times within a frame or short period, but which
	-- we don't necessary need to (for performance reasons).
	local staggerActive = false
	local multipleCalls = false
	if not delayTime or delayTime == 0 then
		-- We make 0.01 instead of 0 because devices can now run at
		-- different frame rates
		delayTime = 0.01
	end
	local function staggeredCallback(...)
		if staggerActive then
			multipleCalls = true
			return
		end
		local packedArgs = table.pack(...)
		staggerActive = true
		multipleCalls = false
		task.spawn(function()
			if delayInitially then
				task.wait(delayTime)
			end
			callback(table.unpack(packedArgs))
		end)
		task.delay(delayTime, function()
			staggerActive = false
			if multipleCalls then
				-- This means it has been called at least once during
				-- the stagger period, so call again
				staggeredCallback(table.unpack(packedArgs))
			end
		end)
	end
	return staggeredCallback
end

function Utility.round(n)
	-- Credit to Darkmist101 for this
	return math.floor(n + 0.5)
end

function Utility.reverseTable(t)
	for i = 1, math.floor(#t/2) do
		local j = #t - i + 1
		t[i], t[j] = t[j], t[i]
	end
end

function Utility.copyTable(t)
	-- Credit to Stephen Leitnick (September 13, 2017) for this function from TableUtil
	assert(type(t) == "table", "First argument must be a table")
	local tCopy = table.create(#t)
	for k,v in pairs(t) do
		if (type(v) == "table") then
			tCopy[k] = Utility.copyTable(v)
		else
			tCopy[k] = v
		end
	end
	return tCopy
end

local validCharacters = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","1","2","3","4","5","6","7","8","9","0","<",">","?","@","{","}","[","]","!","(",")","=","+","~","#"}
function Utility.generateUID(length)
	length = length or 8
	local UID = ""
	local list = validCharacters
	local total = #list
	for i = 1, length do
		local randomCharacter = list[math.random(1, total)]
		UID = UID..randomCharacter
	end
	return UID
end

local instanceTrackers = {}
function Utility.setVisible(instance, bool, sourceUID)
	-- This effectively works like a buff object but
	-- incredibly simplified. It stacks false values
	-- so that if there is more than more than, the 
	-- instance remains hidden even if set visible true
	local tracker = instanceTrackers[instance]
	if not tracker then
		tracker = {}
		instanceTrackers[instance] = tracker
		instance.Destroying:Once(function()
			instanceTrackers[instance] = nil
		end)
	end
	if not bool then
		tracker[sourceUID] = true
	else
		tracker[sourceUID] = nil
	end
	local isVisible = bool
	if bool then
		for sourceUID, _ in pairs(tracker) do
			isVisible = false
			break
		end
	end
	instance.Visible = isVisible
end

function Utility.formatStateName(incomingStateName)
	return string.upper(string.sub(incomingStateName, 1, 1))..string.lower(string.sub(incomingStateName, 2))
end

function Utility.localPlayerRespawned(callback)
	-- The client localscript may be located under a ScreenGui with ResetOnSpawn set to true
	-- In these scenarios, traditional methods like CharacterAdded won't be called by the
	-- time the localscript has been destroyed, therefore we listen for removing instead
	-- If humanoid and health == 0, then reset/died normally, else was
	-- forcefully reset via a method such as LoadCharacter
	-- We wrap this behaviour in case any additional quirks need to be accounted for
	localPlayer.CharacterRemoving:Connect(callback)
end

function Utility.getClippedContainer(screenGui)
	-- We always want clipped items to display in front hence
	-- why we have this
	local clippedContainer = screenGui:FindFirstChild("ClippedContainer")
	if not clippedContainer then
		clippedContainer = Instance.new("Folder")
		clippedContainer.Name = "ClippedContainer"
		clippedContainer.Parent = screenGui
	end
	return clippedContainer
end

local Janitor = require(script.Parent.Packages.Janitor)
local GuiService = game:GetService("GuiService")
function Utility.clipOutside(icon, instance)
	local cloneJanitor = icon.janitor:add(Janitor.new())
	instance.Destroying:Once(function()
		cloneJanitor:Destroy()
	end)
	icon.janitor:add(instance)

	local originalParent = instance.Parent
	local clone = cloneJanitor:add(Instance.new("Frame"))
	clone:SetAttribute("IsAClippedClone", true)
	clone.Name = instance.Name
	clone.AnchorPoint = instance.AnchorPoint
	clone.Size = instance.Size
	clone.Position = instance.Position
	clone.BackgroundTransparency = 1
	clone.LayoutOrder = instance.LayoutOrder
	clone.Parent = originalParent

	local valueInstance = Instance.new("ObjectValue")
	valueInstance.Name = "OriginalInstance"
	valueInstance.Value = instance
	valueInstance.Parent = clone

	local valueInstanceCopy = valueInstance:Clone()
	instance:SetAttribute("HasAClippedClone", true)
	valueInstanceCopy.Name = "ClippedClone"
	valueInstanceCopy.Value = clone
	valueInstanceCopy.Parent = instance

	local screenGui
	local function updateScreenGui()
		local originalScreenGui = originalParent:FindFirstAncestorWhichIsA("ScreenGui")
		screenGui = if string.match(originalScreenGui.Name, "Clipped") then originalScreenGui else originalScreenGui.Parent[originalScreenGui.Name.."Clipped"]
		instance.AnchorPoint = Vector2.new(0, 0)
		instance.Parent = Utility.getClippedContainer(screenGui)
	end
	cloneJanitor:add(icon.alignmentChanged:Connect(updateScreenGui))
	updateScreenGui()

	-- Lets copy over children that modify size
	for _, child in pairs(instance:GetChildren()) do
		if child:IsA("UIAspectRatioConstraint") then
			child:Clone().Parent = clone
		end
	end

	-- If the icon is hidden, its important we are too (as
	-- setting a parent to visible = false no longer makes
	-- this hidden)
	local widget = icon.widget
	local isOutsideParent = false
	local ignoreVisibilityUpdater = instance:GetAttribute("IgnoreVisibilityUpdater")
	local function updateVisibility()
		if ignoreVisibilityUpdater then
			return
		end
		local isVisible = widget.Visible
		
		if isOutsideParent then
			isVisible = false
		end
		Utility.setVisible(instance, isVisible, "ClipHandler")
	end
	cloneJanitor:add(widget:GetPropertyChangedSignal("Visible"):Connect(updateVisibility))

	local previousScroller
	local Icon = require(icon.iconModule)
	local function checkIfOutsideParentXBounds()
		-- Defer so that roblox's properties reflect their true values
		task.defer(function()
			-- If the instance is within a parent item (such as a dropdown or menu)
			-- then we hide it if it exceeds the bounds of that parent
			local parentInstance
			local ourUID = icon.UID
			local nextIconUID = ourUID
			local shouldClipToParent = instance:GetAttribute("ClipToJoinedParent")
			if shouldClipToParent then
				for i = 1, 10 do -- This is safer than while true do and should never be > 4 parents
					local nextIcon = Icon.getIconByUID(nextIconUID)
					if not nextIcon then
						break
					end
					local nextParentInstance = nextIcon.joinedFrame
					nextIconUID = nextIcon.parentIconUID
					if not nextParentInstance then
						break
					end
					parentInstance = nextParentInstance
				end
			end
			if not parentInstance then
				isOutsideParent = false
				updateVisibility()
				return
			end
			local pos = instance.AbsolutePosition
			local halfSize = instance.AbsoluteSize/2
			local parentPos = parentInstance.AbsolutePosition
			local parentSize = parentInstance.AbsoluteSize
			local posHalf = (pos + halfSize)
			local exceededLeft = posHalf.X < parentPos.X
			local exceededRight = posHalf.X > (parentPos.X + parentSize.X)
			local exceededTop = posHalf.Y < parentPos.Y
			local exceededBottom = posHalf.Y > (parentPos.Y + parentSize.Y)
			local hasExceeded = exceededLeft or exceededRight or exceededTop or exceededBottom
			if hasExceeded ~= isOutsideParent then
				isOutsideParent = hasExceeded
				updateVisibility()
			end
			if parentInstance:IsA("ScrollingFrame") and previousScroller ~= parentInstance then
				previousScroller = parentInstance
				local connection = parentInstance:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
					checkIfOutsideParentXBounds()
				end)
				cloneJanitor:add(connection, "Disconnect", "TrackUtilityScroller-"..ourUID)
			end
		end)
	end

	local camera = workspace.CurrentCamera
	local additionalOffsetX = instance:GetAttribute("AdditionalOffsetX") or 0
	local function trackProperty(property)
		local absoluteProperty = "Absolute"..property
		local function updateProperty()
			local cloneValue = clone[absoluteProperty]
			local absoluteValue = UDim2.fromOffset(cloneValue.X, cloneValue.Y)
			if property == "Position" then

				-- This binds the instances within the bounds of the screen
				local SIDE_PADDING = 4
				local limitX = camera.ViewportSize.X - instance.AbsoluteSize.X - SIDE_PADDING
				local inputX = absoluteValue.X.Offset
				if inputX < SIDE_PADDING then
					inputX = SIDE_PADDING
				elseif inputX > limitX then
					inputX = limitX
				end
				absoluteValue = UDim2.fromOffset(inputX, absoluteValue.Y.Offset)

				-- AbsolutePosition does not perfectly match with TopbarInsets enabled
				-- This corrects this
				local topbarInset = GuiService.TopbarInset
				local viewportWidth = workspace.CurrentCamera.ViewportSize.X
				local guiWidth = screenGui.AbsoluteSize.X
				local guiOffset = screenGui.AbsolutePosition.X
				local widthDifference = guiOffset - topbarInset.Min.X
				local oldTopbarCenterOffset = 0--widthDifference/30 -- I have no idea why this works, it just does
				local offsetX = if icon.isOldTopbar then guiOffset else viewportWidth - guiWidth - oldTopbarCenterOffset
				
				-- Also add additionalOffset
				offsetX -= additionalOffsetX
				absoluteValue += UDim2.fromOffset(-offsetX, topbarInset.Height)

				-- Finally check if within its direct parents bounds
				checkIfOutsideParentXBounds()

			end
			instance[property] = absoluteValue
		end
		
		-- This defer is essential as the listener may be in a different screenGui to the actor
		local updatePropertyStaggered = Utility.createStagger(0.01, updateProperty)
		cloneJanitor:add(clone:GetPropertyChangedSignal(absoluteProperty):Connect(updatePropertyStaggered))
		
		-- This is to patch a weirddddd bug with ScreenGuis with SreenInsets set to
		-- 'TopbarSafeInsets'. For some reason the absolute position of gui instances
		-- within this type of screenGui DO NOT accurately update to match their new
		-- real world position; instead they jump around almost randomly for a few frames.
		-- I have spent way too many hours trying to solve this bug, I think the only way
		-- for the time being is to not use ScreenGuis with TopbarSafeInsets, but I don't
		-- have time to redesign the entire system around that at the moment.
		-- Here's a GIF of this bug: https://i.imgur.com/VitHdC1.gif
		local updatePropertyPatch = Utility.createStagger(0.5, updateProperty, true)
		cloneJanitor:add(clone:GetPropertyChangedSignal(absoluteProperty):Connect(updatePropertyPatch))
		
	end
	task.delay(0.1, checkIfOutsideParentXBounds)
	checkIfOutsideParentXBounds()
	updateVisibility()
	trackProperty("Position")
	
	-- Track visiblity changes
	cloneJanitor:add(instance:GetPropertyChangedSignal("Visible"):Connect(function()
		--print("Visiblity changed:", instance, clone, instance.Visible)
		--clone.Visible = instance.Visible
	end))

	-- To ensure accurate positioning, it's important the clone also remains the same size as the instance
	local shouldTrackCloneSize = instance:GetAttribute("TrackCloneSize")
	if shouldTrackCloneSize then
		trackProperty("Size")
	else
		cloneJanitor:add(instance:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			local absolute = instance.AbsoluteSize
			clone.Size = UDim2.fromOffset(absolute.X, absolute.Y)
		end))
	end

	return clone
end

function Utility.joinFeature(originalIcon, parentIcon, iconsArray, scrollingFrameOrFrame)

	-- This is resonsible for moving the icon under a feature like a dropdown
	local joinJanitor = originalIcon.joinJanitor
	joinJanitor:clean()
	if not scrollingFrameOrFrame then
		originalIcon:leave()
		return
	end
	originalIcon.parentIconUID = parentIcon.UID
	originalIcon.joinedFrame = scrollingFrameOrFrame
	local function updateAlignent()
		local parentAlignment = parentIcon.alignment
		if parentAlignment == "Center" then
			parentAlignment = "Left"
		end
		originalIcon:setAlignment(parentAlignment, true)
	end
	joinJanitor:add(parentIcon.alignmentChanged:Connect(updateAlignent))
	updateAlignent()
	originalIcon:modifyTheme({"IconButton", "BackgroundTransparency", 1}, "JoinModification")
	originalIcon:modifyTheme({"ClickRegion", "Active", false}, "JoinModification")
	if parentIcon.childModifications then
		-- We defer so that the default values (such as dropdown
		-- minimum width can be applied before any custom
		-- child modifications from the user)
		task.defer(function()
			originalIcon:modifyTheme(parentIcon.childModifications, parentIcon.childModificationsUID)
		end)
	end
	--
	local clickRegion = originalIcon:getInstance("ClickRegion")
	local function makeSelectable()
		clickRegion.Selectable = parentIcon.isSelected
	end
	joinJanitor:add(parentIcon.toggled:Connect(makeSelectable))
	task.defer(makeSelectable)
	joinJanitor:add(function()
		clickRegion.Selectable = true
	end)
	--

	-- We track icons in arrays and dictionaries using their UID instead of the icon
	-- itself to prevent heavy cyclical tables when printing the icons
	local originalIconUID = originalIcon.UID
	table.insert(iconsArray, originalIconUID)
	parentIcon:autoDeselect(false)
	parentIcon.childIconsDict[originalIconUID] = true
	if not parentIcon.isEnabled then
		parentIcon:setEnabled(true)
	end
	originalIcon.joinedParent:Fire(parentIcon)

	-- This is responsible for removing it from that feature and updating
	-- their parent icon so its informed of the icon leaving it
	joinJanitor:add(function()
		local joinedFrame = originalIcon.joinedFrame
		if not joinedFrame then
			return
		end
		for i, iconUID in pairs(iconsArray) do
			if iconUID == originalIconUID then
				table.remove(iconsArray, i)
				break
			end
		end
		local Icon = require(originalIcon.iconModule)
		local parentIcon = Icon.getIconByUID(originalIcon.parentIconUID)
		if not parentIcon then
			return
		end
		originalIcon:setAlignment(originalIcon.originalAlignment)
		originalIcon.parentIconUID = false
		originalIcon.joinedFrame = false
		originalIcon:setBehaviour("IconButton", "BackgroundTransparency", nil, true)
		originalIcon:removeModification("JoinModification")
		
		local parentHasNoChildren = true
		local parentChildIcons = parentIcon.childIconsDict
		parentChildIcons[originalIconUID] = nil
		for childIconUID, _ in pairs(parentChildIcons) do
			parentHasNoChildren = false
			break
		end
		if parentHasNoChildren and not parentIcon.isAnOverflow then
			parentIcon:setEnabled(false)
		end
		updateAlignent()

	end)

end



return Utility
return "v3.0.2"
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
-- Name: chatGui.lua
-- Description: Chat gui

return function()
	chat = Instance.new("ScreenGui")
	chat.Name = "Chat"
	chat.DisplayOrder = 2
	chat.ResetOnSpawn = false

	container = Instance.new("Frame")
	container.Name = "Container"
	container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	container.BackgroundTransparency = 1
	container.Position = UDim2.fromOffset(16, 8)
	container.Size = UDim2.fromOffset(400, 235)
	container.Visible = false

	chatWindow = Instance.new("Frame")
	chatWindow.Name = "ChatWindow"
	chatWindow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	chatWindow.BackgroundTransparency = 1
	chatWindow.BorderSizePixel = 0
	chatWindow.Size = UDim2.new(1, 0, 1, -35)

	main = Instance.new("Frame")
	main.Name = "Main"
	main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	main.BackgroundTransparency = 0.75
	main.BorderSizePixel = 0
	main.ClipsDescendants = true
	main.Size = UDim2.fromScale(1, 1)

	uICorner = Instance.new("UICorner")
	uICorner.Name = "UICorner"
	uICorner.Parent = main

	scroller = Instance.new("ScrollingFrame")
	scroller.Name = "Scroller"
	scroller.AutomaticCanvasSize = Enum.AutomaticSize.Y
	scroller.BottomImage = "rbxassetid://8082116996"
	scroller.CanvasSize = UDim2.new()
	scroller.MidImage = "rbxassetid://7488333553"
	scroller.ScrollBarThickness = 0
	scroller.TopImage = "rbxassetid://8082122989"
	scroller.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	scroller.BackgroundTransparency = 1
	scroller.BorderSizePixel = 0
	scroller.Position = UDim2.fromOffset(5, 5)
	scroller.Selectable = false
	scroller.Size = UDim2.new(1, -15, 1, -10)

	messageContainer = Instance.new("Frame")
	messageContainer.Name = "MessageContainer"
	messageContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	messageContainer.BackgroundTransparency = 1
	messageContainer.Size = UDim2.new(1, -10, 0, 0)

	uIListLayout = Instance.new("UIListLayout")
	uIListLayout.Name = "UIListLayout"
	uIListLayout.Padding = UDim.new(0, 2)
	uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout.Parent = messageContainer

	messageContainer.Parent = scroller

	scroller.Parent = main

	main.Parent = chatWindow

	chatWindow.Parent = container

	chatBarContainer = Instance.new("Frame")
	chatBarContainer.Name = "ChatBarContainer"
	chatBarContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	chatBarContainer.BackgroundTransparency = 1
	chatBarContainer.BorderSizePixel = 0
	chatBarContainer.Position = UDim2.fromOffset(0, 205)
	chatBarContainer.Size = UDim2.new(1, 0, 0, 35)

	main1 = Instance.new("Frame")
	main1.Name = "Main"
	main1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	main1.BackgroundTransparency = 1
	main1.BorderSizePixel = 0
	main1.Size = UDim2.new(1, 0, 0, 35)

	container1 = Instance.new("Frame")
	container1.Name = "Container"
	container1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	container1.BackgroundTransparency = 0.75
	container1.BorderSizePixel = 0
	container1.Size = UDim2.fromScale(1, 1)

	uICorner1 = Instance.new("UICorner")
	uICorner1.Name = "UICorner"
	uICorner1.Parent = container1

	box = Instance.new("Frame")
	box.Name = "Box"
	box.Active = true
	box.AnchorPoint = Vector2.new(0, 0.5)
	box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	box.BorderSizePixel = 0
	box.Position = UDim2.new(0, 5, 0.5, 0)
	box.Size = UDim2.new(1, -40, 0, 25)

	uICorner2 = Instance.new("UICorner")
	uICorner2.Name = "UICorner"
	uICorner2.Parent = box

	input = Instance.new("TextBox")
	input.Name = "Input"
	input.ClearTextOnFocus = false
	input.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	input.PlaceholderColor3 = Color3.fromRGB(80, 80, 80)
	input.PlaceholderText = "Click here or press '/' to chat."
	input.Text = ""
	input.TextColor3 = Color3.fromRGB(100, 100, 100)
	input.TextSize = 14
	input.TextWrapped = true
	input.TextXAlignment = Enum.TextXAlignment.Left
	input.TextYAlignment = Enum.TextYAlignment.Top
	input.AnchorPoint = Vector2.new(0, 0.5)
	input.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	input.BackgroundTransparency = 1
	input.Position = UDim2.new(0, 5, 0.5, 0)
	input.Size = UDim2.new(1, -10, 0, 14)
	input.ZIndex = 2

	bar = Instance.new("TextLabel")
	bar.Name = "Bar"
	bar.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	bar.Text = ""
	bar.TextColor3 = Color3.fromRGB(100, 100, 100)
	bar.TextSize = 14
	bar.TextTransparency = 0.5
	bar.TextWrapped = true
	bar.TextXAlignment = Enum.TextXAlignment.Left
	bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	bar.BackgroundTransparency = 1
	bar.BorderSizePixel = 0
	bar.Size = UDim2.fromScale(1, 1)
	bar.Parent = input

	input.Parent = box

	uIPadding = Instance.new("UIPadding")
	uIPadding.Name = "UIPadding"
	uIPadding.PaddingBottom = UDim.new(0, 8)
	uIPadding.PaddingTop = UDim.new(0, 8)
	uIPadding.Parent = box

	box.Parent = container1

	resize = Instance.new("TextButton")
	resize.Name = "Resize"
	resize.Text = ""
	resize.Active = false
	resize.AnchorPoint = Vector2.new(1, 0.5)
	resize.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
	resize.BorderSizePixel = 0
	resize.Position = UDim2.new(1, -5, 0, 17)
	resize.Selectable = false
	resize.Size = UDim2.fromOffset(25, 25)
	resize.Visible = false

	icon = Instance.new("ImageLabel")
	icon.Name = "Icon"
	icon.Image = "rbxassetid://8571348189"
	icon.Active = true
	icon.AnchorPoint = Vector2.new(0.5, 0.5)
	icon.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	icon.BackgroundTransparency = 1
	icon.BorderSizePixel = 0
	icon.Position = UDim2.fromScale(0.5, 0.5)
	icon.Selectable = true
	icon.Size = UDim2.fromScale(0.8, 0.8)

	uIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	uIAspectRatioConstraint.Name = "UIAspectRatioConstraint"
	uIAspectRatioConstraint.Parent = icon

	icon.Parent = resize

	uICorner3 = Instance.new("UICorner")
	uICorner3.Name = "UICorner"
	uICorner3.Parent = resize

	resize.Parent = container1

	container2 = Instance.new("Frame")
	container2.Name = "Container"
	container2.Active = true
	container2.AnchorPoint = Vector2.new(0.5, 0.5)
	container2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	container2.BackgroundTransparency = 1
	container2.Position = UDim2.new(0.5, 0, 0, 17)
	container2.Selectable = true
	container2.Size = UDim2.new(1, -30, 0, 14)

	channel = Instance.new("TextButton")
	channel.Name = "Channel"
	channel.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	channel.Text = ""
	channel.TextColor3 = Color3.fromRGB(255, 255, 255)
	channel.TextSize = 15
	channel.TextWrapped = true
	channel.AnchorPoint = Vector2.new(0, 0.5)
	channel.BackgroundColor3 = Color3.fromRGB(253, 80, 111)
	channel.BorderSizePixel = 0
	channel.Position = UDim2.new(0, -7, 0.5, 0)
	channel.Size = UDim2.fromOffset(0, 20)
	channel.Visible = false

	label = Instance.new("TextLabel")
	label.Name = "Label"
	label.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	label.Text = "test"
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.TextSize = 14
	label.AnchorPoint = Vector2.new(0, 0.5)
	label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	label.BackgroundTransparency = 1
	label.Position = UDim2.new(0, 5, 0.5, 0)
	label.Size = UDim2.fromScale(1, 1)
	label.Parent = channel

	uICorner4 = Instance.new("UICorner")
	uICorner4.Name = "UICorner"
	uICorner4.Parent = channel

	replyIcon = Instance.new("ImageLabel")
	replyIcon.Name = "ReplyIcon"
	replyIcon.Image = "rbxassetid://8595302757"
	replyIcon.AnchorPoint = Vector2.new(0.5, 0.5)
	replyIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	replyIcon.BackgroundTransparency = 1
	replyIcon.Position = UDim2.fromScale(0.5, 0.5)
	replyIcon.Size = UDim2.fromOffset(16, 16)
	replyIcon.Visible = false
	replyIcon.ZIndex = 5
	replyIcon.Parent = channel

	channel.Parent = container2

	container2.Parent = container1

	container1.Parent = main1

	autofill = Instance.new("Frame")
	autofill.Name = "Autofill"
	autofill.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	autofill.BackgroundTransparency = 0.75
	autofill.BorderSizePixel = 0
	autofill.Position = UDim2.new(0, 0, 1, 5)
	autofill.Size = UDim2.fromScale(1, 0)

	corner = Instance.new("UICorner")
	corner.Name = "Corner"
	corner.Parent = autofill

	container3 = Instance.new("Frame")
	container3.Name = "Container"
	container3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	container3.BackgroundTransparency = 1
	container3.Size = UDim2.fromScale(1, 1)

	scroller1 = Instance.new("ScrollingFrame")
	scroller1.Name = "Scroller"
	scroller1.BottomImage = "rbxassetid://8082116996"
	scroller1.CanvasSize = UDim2.new()
	scroller1.MidImage = "rbxassetid://7488333553"
	scroller1.ScrollBarThickness = 0
	scroller1.TopImage = "rbxassetid://8082122989"
	scroller1.Active = true
	scroller1.AnchorPoint = Vector2.new(0.5, 0)
	scroller1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	scroller1.BackgroundTransparency = 1
	scroller1.BorderSizePixel = 0
	scroller1.Position = UDim2.new(0.5, 0, 0, 4)
	scroller1.Size = UDim2.new(1, -10, 1, 0)

	layout = Instance.new("UIListLayout")
	layout.Name = "Layout"
	layout.Padding = UDim.new(0, 2)
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	layout.VerticalAlignment = Enum.VerticalAlignment.Center
	layout.Parent = scroller1

	scroller1.Parent = container3

	container3.Parent = autofill

	autofill.Parent = main1

	main1.Parent = chatBarContainer

	chatBarContainer.Parent = container

	zone = Instance.new("Frame")
	zone.Name = "Zone"
	zone.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	zone.BackgroundTransparency = 1
	zone.Size = UDim2.new(1, 0, 1, 5)
	zone.ZIndex = 3
	zone.Parent = container

	channelbar = Instance.new("Frame")
	channelbar.Name = "Channelbar"
	channelbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	channelbar.BackgroundTransparency = 1
	channelbar.BorderSizePixel = 0
	channelbar.ClipsDescendants = true
	channelbar.Size = UDim2.new(1, 0, 0, 35)
	channelbar.Visible = false

	main2 = Instance.new("Frame")
	main2.Name = "Main"
	main2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	main2.BackgroundTransparency = 1
	main2.BorderSizePixel = 0
	main2.Size = UDim2.fromScale(1, 1)

	container4 = Instance.new("Frame")
	container4.Name = "Container"
	container4.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	container4.BackgroundTransparency = 0.75
	container4.BorderSizePixel = 0
	container4.Size = UDim2.fromScale(1, 1)

	uICorner5 = Instance.new("UICorner")
	uICorner5.Name = "UICorner"
	uICorner5.Parent = container4

	scroller2 = Instance.new("ScrollingFrame")
	scroller2.Name = "Scroller"
	scroller2.BottomImage = "rbxassetid://8082116996"
	scroller2.CanvasSize = UDim2.new()
	scroller2.MidImage = "rbxassetid://7488333553"
	scroller2.ScrollBarThickness = 0
	scroller2.TopImage = "rbxassetid://8082122989"
	scroller2.Active = true
	scroller2.AnchorPoint = Vector2.new(1, 0.5)
	scroller2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	scroller2.BackgroundTransparency = 1
	scroller2.BorderSizePixel = 0
	scroller2.Position = UDim2.new(1, -5, 0.5, 0)
	scroller2.Size = UDim2.new(1, -10, 1, 0)

	uIListLayout1 = Instance.new("UIListLayout")
	uIListLayout1.Name = "UIListLayout"
	uIListLayout1.Padding = UDim.new(0, 5)
	uIListLayout1.FillDirection = Enum.FillDirection.Horizontal
	uIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout1.VerticalAlignment = Enum.VerticalAlignment.Center
	uIListLayout1.Parent = scroller2

	scroller2.Parent = container4

	container4.Parent = main2

	main2.Parent = channelbar

	channelbar.Parent = container

	container.Parent = chat

	settings = Instance.new("Frame")
	settings.Name = "Settings"
	settings.AnchorPoint = Vector2.new(0.5, 0.5)
	settings.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	settings.BackgroundTransparency = 0.5
	settings.BorderSizePixel = 0
	settings.Position = UDim2.fromScale(0.5, -1.5)
	settings.Size = UDim2.fromOffset(325, 300)
	settings.ZIndex = 5

	uICorner6 = Instance.new("UICorner")
	uICorner6.Name = "UICorner"
	uICorner6.Parent = settings

	pages = Instance.new("Frame")
	pages.Name = "Pages"
	pages.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	pages.BackgroundTransparency = 1
	pages.ClipsDescendants = true
	pages.Size = UDim2.fromScale(1, 1)
	pages.ZIndex = 6

	navigation = Instance.new("Frame")
	navigation.Name = "Navigation"
	navigation.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	navigation.BackgroundTransparency = 1
	navigation.Size = UDim2.fromScale(1, 1)
	navigation.ZIndex = 6

	credit = Instance.new("TextLabel")
	credit.Name = "Credit"
	credit.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Bold,
		Enum.FontStyle.Normal
	)
	credit.Text = "Created by: Jumpathy"
	credit.TextColor3 = Color3.fromRGB(255, 255, 255)
	credit.TextSize = 14
	credit.AnchorPoint = Vector2.new(0, 1)
	credit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	credit.BackgroundTransparency = 1
	credit.BorderColor3 = Color3.fromRGB(0, 0, 0)
	credit.BorderSizePixel = 0
	credit.Position = UDim2.new(0, 0, 1, -5)
	credit.Size = UDim2.new(1, 0, 0, 30)
	credit.ZIndex = 5
	credit.Parent = navigation

	content = Instance.new("Frame")
	content.Name = "Content"
	content.AnchorPoint = Vector2.new(0.5, 1)
	content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	content.BackgroundTransparency = 1
	content.Position = UDim2.new(0.5, 0, 1, -10)
	content.Size = UDim2.new(1, -10, 1, -50)
	content.ZIndex = 6

	uIListLayout2 = Instance.new("UIListLayout")
	uIListLayout2.Name = "UIListLayout"
	uIListLayout2.Padding = UDim.new(0, 5)
	uIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout2.Parent = content

	uI = Instance.new("TextButton")
	uI.Name = "UI"
	uI.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	uI.Text = "UI"
	uI.TextColor3 = Color3.fromRGB(255, 255, 255)
	uI.TextSize = 20
	uI.TextWrapped = true
	uI.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	uI.BackgroundTransparency = 0.3
	uI.BorderSizePixel = 0
	uI.Size = UDim2.new(1, 0, 0, 35)
	uI.ZIndex = 6

	uICorner7 = Instance.new("UICorner")
	uICorner7.Name = "UICorner"
	uICorner7.Parent = uI

	icon1 = Instance.new("ImageLabel")
	icon1.Name = "Icon"
	icon1.Image = "http://www.roblox.com/asset/?id=6035030081"
	icon1.AnchorPoint = Vector2.new(0, 0.5)
	icon1.BackgroundTransparency = 1
	icon1.BorderSizePixel = 0
	icon1.Position = UDim2.new(0, 5, 0.5, 0)
	icon1.Size = UDim2.fromOffset(25, 25)
	icon1.ZIndex = 7
	icon1.Parent = uI

	uI.Parent = content

	bubbleChat = Instance.new("TextButton")
	bubbleChat.Name = "BubbleChat"
	bubbleChat.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	bubbleChat.Text = "Bubble Chat"
	bubbleChat.TextColor3 = Color3.fromRGB(255, 255, 255)
	bubbleChat.TextSize = 20
	bubbleChat.TextWrapped = true
	bubbleChat.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	bubbleChat.BackgroundTransparency = 0.3
	bubbleChat.BorderSizePixel = 0
	bubbleChat.Position = UDim2.fromScale(0.0328, 0.044)
	bubbleChat.Size = UDim2.new(1, 0, 0, 35)
	bubbleChat.ZIndex = 6

	uICorner8 = Instance.new("UICorner")
	uICorner8.Name = "UICorner"
	uICorner8.Parent = bubbleChat

	icon2 = Instance.new("ImageLabel")
	icon2.Name = "Icon"
	icon2.Image = "rbxassetid://8678032944"
	icon2.AnchorPoint = Vector2.new(0, 0.5)
	icon2.BackgroundTransparency = 1
	icon2.BorderSizePixel = 0
	icon2.Position = UDim2.new(0, 5, 0.5, 0)
	icon2.Size = UDim2.fromOffset(25, 25)
	icon2.ZIndex = 7
	icon2.Parent = bubbleChat

	bubbleChat.Parent = content

	quickChat = Instance.new("TextButton")
	quickChat.Name = "QuickChat"
	quickChat.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	quickChat.Text = "Quick Chat"
	quickChat.TextColor3 = Color3.fromRGB(255, 255, 255)
	quickChat.TextSize = 20
	quickChat.TextWrapped = true
	quickChat.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	quickChat.BackgroundTransparency = 0.3
	quickChat.BorderSizePixel = 0
	quickChat.LayoutOrder = 2
	quickChat.Size = UDim2.new(1, 0, 0, 35)
	quickChat.ZIndex = 6

	uICorner9 = Instance.new("UICorner")
	uICorner9.Name = "UICorner"
	uICorner9.Parent = quickChat

	icon3 = Instance.new("ImageLabel")
	icon3.Name = "Icon"
	icon3.Image = "rbxassetid://6031243319"
	icon3.AnchorPoint = Vector2.new(0, 0.5)
	icon3.BackgroundTransparency = 1
	icon3.BorderSizePixel = 0
	icon3.Position = UDim2.new(0, 5, 0.5, 0)
	icon3.Size = UDim2.fromOffset(25, 25)
	icon3.ZIndex = 7
	icon3.Parent = quickChat

	quickChat.Parent = content

	help = Instance.new("TextButton")
	help.Name = "Help"
	help.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	help.Text = "Help"
	help.TextColor3 = Color3.fromRGB(255, 255, 255)
	help.TextSize = 20
	help.TextWrapped = true
	help.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	help.BackgroundTransparency = 0.3
	help.BorderSizePixel = 0
	help.LayoutOrder = 3
	help.Size = UDim2.new(1, 0, 0, 35)
	help.ZIndex = 6

	uICorner10 = Instance.new("UICorner")
	uICorner10.Name = "UICorner"
	uICorner10.Parent = help

	icon4 = Instance.new("ImageLabel")
	icon4.Name = "Icon"
	icon4.Image = "http://www.roblox.com/asset/?id=6026568192"
	icon4.AnchorPoint = Vector2.new(0, 0.5)
	icon4.BackgroundTransparency = 1
	icon4.BorderSizePixel = 0
	icon4.Position = UDim2.new(0, 5, 0.5, 0)
	icon4.Size = UDim2.fromOffset(25, 25)
	icon4.ZIndex = 7
	icon4.Parent = help

	help.Parent = content

	content.Parent = navigation

	title = Instance.new("TextLabel")
	title.Name = "Title"
	title.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	title.Text = "BetterChat Settings"
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.TextSize = 20
	title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title.BackgroundTransparency = 1
	title.Position = UDim2.fromOffset(0, 5)
	title.Size = UDim2.new(1, 0, 0, 30)
	title.ZIndex = 6

	close = Instance.new("TextButton")
	close.Name = "Close"
	close.Text = ""
	close.AnchorPoint = Vector2.new(1, 0.5)
	close.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	close.BackgroundTransparency = 0.3
	close.BorderSizePixel = 0
	close.Position = UDim2.new(1, -5, 0.5, 0)
	close.Size = UDim2.fromOffset(30, 30)
	close.ZIndex = 8

	uICorner11 = Instance.new("UICorner")
	uICorner11.Name = "UICorner"
	uICorner11.Parent = close

	icon5 = Instance.new("ImageLabel")
	icon5.Name = "Icon"
	icon5.Image = "http://www.roblox.com/asset/?id=6031094678"
	icon5.AnchorPoint = Vector2.new(0.5, 0.5)
	icon5.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	icon5.BackgroundTransparency = 1
	icon5.BorderSizePixel = 0
	icon5.Position = UDim2.fromScale(0.5, 0.5)
	icon5.Selectable = true
	icon5.Size = UDim2.fromOffset(25, 25)
	icon5.ZIndex = 8
	icon5.Parent = close

	close.Parent = title

	title.Parent = navigation

	navigation.Parent = pages

	uI1 = Instance.new("Frame")
	uI1.Name = "UI"
	uI1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	uI1.BackgroundTransparency = 1
	uI1.Position = UDim2.fromScale(1, 0)
	uI1.Size = UDim2.fromScale(1, 1)
	uI1.ZIndex = 6

	title1 = Instance.new("TextLabel")
	title1.Name = "Title"
	title1.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	title1.Text = "UI Settings"
	title1.TextColor3 = Color3.fromRGB(255, 255, 255)
	title1.TextSize = 20
	title1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title1.BackgroundTransparency = 1
	title1.Position = UDim2.fromOffset(0, 5)
	title1.Size = UDim2.new(1, 0, 0, 30)
	title1.ZIndex = 6

	back = Instance.new("TextButton")
	back.Name = "Back"
	back.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
	back.Text = ""
	back.TextColor3 = Color3.fromRGB(0, 0, 0)
	back.TextSize = 14
	back.AnchorPoint = Vector2.new(0, 0.5)
	back.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	back.Position = UDim2.new(0, 5, 0.5, 0)
	back.Size = UDim2.fromOffset(25, 25)
	back.ZIndex = 6

	imageLabel = Instance.new("ImageLabel")
	imageLabel.Name = "ImageLabel"
	imageLabel.Image = "rbxassetid://8677511725"
	imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	imageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	imageLabel.BackgroundTransparency = 1
	imageLabel.Position = UDim2.fromScale(0.5, 0.5)
	imageLabel.Size = UDim2.fromScale(0.85, 0.85)
	imageLabel.ZIndex = 6
	imageLabel.Parent = back

	uICorner12 = Instance.new("UICorner")
	uICorner12.Name = "UICorner"
	uICorner12.Parent = back

	back.Parent = title1

	title1.Parent = uI1

	scroller3 = Instance.new("ScrollingFrame")
	scroller3.Name = "Scroller"
	scroller3.BottomImage = "rbxassetid://8082116996"
	scroller3.CanvasSize = UDim2.new()
	scroller3.MidImage = "rbxassetid://7488333553"
	scroller3.ScrollBarThickness = 5
	scroller3.TopImage = "rbxassetid://8082122989"
	scroller3.AnchorPoint = Vector2.new(0.5, 1)
	scroller3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	scroller3.BackgroundTransparency = 1
	scroller3.BorderSizePixel = 0
	scroller3.Position = UDim2.new(0.5, 0, 1, -10)
	scroller3.Selectable = false
	scroller3.Size = UDim2.new(1, -10, 1, -50)
	scroller3.ZIndex = 6

	uIListLayout3 = Instance.new("UIListLayout")
	uIListLayout3.Name = "UIListLayout"
	uIListLayout3.Padding = UDim.new(0, 5)
	uIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout3.Parent = scroller3

	textSize = Instance.new("Frame")
	textSize.Name = "TextSize"
	textSize.Active = true
	textSize.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	textSize.BackgroundTransparency = 0.5
	textSize.BorderSizePixel = 0
	textSize.Position = UDim2.fromScale(0.0328, 0.044)
	textSize.Selectable = true
	textSize.Size = UDim2.new(1, -10, 0, 55)
	textSize.ZIndex = 6

	center = Instance.new("Frame")
	center.Name = "Center"
	center.AnchorPoint = Vector2.new(0, 0.5)
	center.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	center.BackgroundTransparency = 1
	center.Position = UDim2.fromScale(0, 0.5)
	center.Size = UDim2.fromScale(1, 0.75)
	center.ZIndex = 6

	title2 = Instance.new("Frame")
	title2.Name = "Title"
	title2.AnchorPoint = Vector2.new(0.5, 0)
	title2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title2.BackgroundTransparency = 1
	title2.BorderSizePixel = 0
	title2.Position = UDim2.fromScale(0.5, 0)
	title2.Size = UDim2.new(0.95, 0, 0, 20)
	title2.ZIndex = 6

	icon6 = Instance.new("ImageLabel")
	icon6.Name = "Icon"
	icon6.Image = "rbxassetid://8677222862"
	icon6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	icon6.BackgroundTransparency = 1
	icon6.Size = UDim2.fromOffset(20, 20)
	icon6.ZIndex = 6
	icon6.Parent = title2

	label1 = Instance.new("TextLabel")
	label1.Name = "Label"
	label1.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Bold,
		Enum.FontStyle.Normal
	)
	label1.Text = "Text Size"
	label1.TextColor3 = Color3.fromRGB(255, 255, 255)
	label1.TextSize = 14
	label1.TextXAlignment = Enum.TextXAlignment.Left
	label1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	label1.BackgroundTransparency = 1
	label1.Position = UDim2.fromOffset(25, 0)
	label1.Size = UDim2.new(0.5, 0, 0, 18)
	label1.ZIndex = 6
	label1.Parent = title2

	title2.Parent = center

	actual = Instance.new("Frame")
	actual.Name = "Actual"
	actual.AnchorPoint = Vector2.new(0.5, 1)
	actual.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	actual.BackgroundTransparency = 1
	actual.Position = UDim2.new(0.5, 0, 1, 5)
	actual.Size = UDim2.new(0.95, 0, 0, 25)
	actual.ZIndex = 6

	amount = Instance.new("TextBox")
	amount.Name = "Amount"
	amount.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	amount.PlaceholderColor3 = Color3.fromRGB(220, 220, 220)
	amount.PlaceholderText = "%"
	amount.Text = "_"
	amount.TextColor3 = Color3.fromRGB(255, 255, 255)
	amount.TextSize = 14
	amount.AnchorPoint = Vector2.new(1, 0.5)
	amount.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	amount.BackgroundTransparency = 0.5
	amount.BorderSizePixel = 0
	amount.Position = UDim2.fromScale(1, 0.5)
	amount.Size = UDim2.new(0.125, 0, 0, 20)
	amount.ZIndex = 6

	uICorner13 = Instance.new("UICorner")
	uICorner13.Name = "UICorner"
	uICorner13.Parent = amount

	uIPadding1 = Instance.new("UIPadding")
	uIPadding1.Name = "UIPadding"
	uIPadding1.PaddingLeft = UDim.new(0, 5)
	uIPadding1.PaddingRight = UDim.new(0, 5)
	uIPadding1.Parent = amount

	amount.Parent = actual

	bar1 = Instance.new("Frame")
	bar1.Name = "Bar"
	bar1.AnchorPoint = Vector2.new(0, 0.5)
	bar1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	bar1.BorderSizePixel = 0
	bar1.Position = UDim2.fromScale(0, 0.5)
	bar1.Size = UDim2.new(0.85, 0, 0, 10)
	bar1.ZIndex = 6

	ignore = Instance.new("UICorner")
	ignore.Name = "Ignore"
	ignore.CornerRadius = UDim.new(1, 0)
	ignore.Parent = bar1

	button = Instance.new("TextButton")
	button.Name = "Button"
	button.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
	button.Text = ""
	button.TextColor3 = Color3.fromRGB(0, 0, 0)
	button.TextSize = 14
	button.AnchorPoint = Vector2.new(0.5, 0.5)
	button.BackgroundColor3 = Color3.fromRGB(30, 200, 150)
	button.BorderSizePixel = 0
	button.Position = UDim2.new(0, 10, 0.5, 0)
	button.Size = UDim2.fromOffset(20, 20)
	button.ZIndex = 7

	ignore1 = Instance.new("UICorner")
	ignore1.Name = "Ignore"
	ignore1.CornerRadius = UDim.new(1, 0)
	ignore1.Parent = button

	button.Parent = bar1

	progress = Instance.new("Frame")
	progress.Name = "Progress"
	progress.BackgroundColor3 = Color3.fromRGB(25, 170, 127)
	progress.BorderSizePixel = 0
	progress.Size = UDim2.fromScale(0, 1)
	progress.ZIndex = 6

	ignore2 = Instance.new("UICorner")
	ignore2.Name = "Ignore"
	ignore2.CornerRadius = UDim.new(1, 0)
	ignore2.Parent = progress

	progress.Parent = bar1

	bar1.Parent = actual

	actual.Parent = center

	center.Parent = textSize

	uICorner14 = Instance.new("UICorner")
	uICorner14.Name = "UICorner"
	uICorner14.Parent = textSize

	textSize.Parent = scroller3

	roundness = Instance.new("Frame")
	roundness.Name = "Roundness"
	roundness.Active = true
	roundness.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	roundness.BackgroundTransparency = 0.5
	roundness.BorderSizePixel = 0
	roundness.Position = UDim2.fromScale(0.0328, 0.044)
	roundness.Selectable = true
	roundness.Size = UDim2.new(1, -10, 0, 55)
	roundness.ZIndex = 6

	center1 = Instance.new("Frame")
	center1.Name = "Center"
	center1.AnchorPoint = Vector2.new(0, 0.5)
	center1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	center1.BackgroundTransparency = 1
	center1.Position = UDim2.fromScale(0, 0.5)
	center1.Size = UDim2.fromScale(1, 0.75)
	center1.ZIndex = 6

	title3 = Instance.new("Frame")
	title3.Name = "Title"
	title3.AnchorPoint = Vector2.new(0.5, 0)
	title3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title3.BackgroundTransparency = 1
	title3.BorderSizePixel = 0
	title3.Position = UDim2.fromScale(0.5, 0)
	title3.Size = UDim2.new(0.95, 0, 0, 20)
	title3.ZIndex = 6

	icon7 = Instance.new("ImageLabel")
	icon7.Name = "Icon"
	icon7.Image = "rbxassetid://8677280864"
	icon7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	icon7.BackgroundTransparency = 1
	icon7.Size = UDim2.fromOffset(20, 20)
	icon7.ZIndex = 6
	icon7.Parent = title3

	label2 = Instance.new("TextLabel")
	label2.Name = "Label"
	label2.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Bold,
		Enum.FontStyle.Normal
	)
	label2.Text = "Roundness"
	label2.TextColor3 = Color3.fromRGB(255, 255, 255)
	label2.TextSize = 14
	label2.TextXAlignment = Enum.TextXAlignment.Left
	label2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	label2.BackgroundTransparency = 1
	label2.Position = UDim2.fromOffset(25, 0)
	label2.Size = UDim2.new(0.5, 0, 0, 18)
	label2.ZIndex = 6
	label2.Parent = title3

	title3.Parent = center1

	actual1 = Instance.new("Frame")
	actual1.Name = "Actual"
	actual1.AnchorPoint = Vector2.new(0.5, 1)
	actual1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	actual1.BackgroundTransparency = 1
	actual1.Position = UDim2.new(0.5, 0, 1, 5)
	actual1.Size = UDim2.new(0.95, 0, 0, 25)
	actual1.ZIndex = 6

	amount1 = Instance.new("TextBox")
	amount1.Name = "Amount"
	amount1.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	amount1.PlaceholderColor3 = Color3.fromRGB(220, 220, 220)
	amount1.PlaceholderText = "%"
	amount1.Text = "_"
	amount1.TextColor3 = Color3.fromRGB(255, 255, 255)
	amount1.TextSize = 14
	amount1.AnchorPoint = Vector2.new(1, 0.5)
	amount1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	amount1.BackgroundTransparency = 0.5
	amount1.BorderSizePixel = 0
	amount1.Position = UDim2.fromScale(1, 0.5)
	amount1.Size = UDim2.new(0.125, 0, 0, 20)
	amount1.ZIndex = 6

	uICorner15 = Instance.new("UICorner")
	uICorner15.Name = "UICorner"
	uICorner15.Parent = amount1

	uIPadding2 = Instance.new("UIPadding")
	uIPadding2.Name = "UIPadding"
	uIPadding2.PaddingLeft = UDim.new(0, 5)
	uIPadding2.PaddingRight = UDim.new(0, 5)
	uIPadding2.Parent = amount1

	amount1.Parent = actual1

	bar2 = Instance.new("Frame")
	bar2.Name = "Bar"
	bar2.AnchorPoint = Vector2.new(0, 0.5)
	bar2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	bar2.BorderSizePixel = 0
	bar2.Position = UDim2.fromScale(0, 0.5)
	bar2.Size = UDim2.new(0.85, 0, 0, 10)
	bar2.ZIndex = 6

	ignore3 = Instance.new("UICorner")
	ignore3.Name = "Ignore"
	ignore3.CornerRadius = UDim.new(1, 0)
	ignore3.Parent = bar2

	button1 = Instance.new("TextButton")
	button1.Name = "Button"
	button1.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
	button1.Text = ""
	button1.TextColor3 = Color3.fromRGB(0, 0, 0)
	button1.TextSize = 14
	button1.AnchorPoint = Vector2.new(0.5, 0.5)
	button1.BackgroundColor3 = Color3.fromRGB(30, 200, 150)
	button1.BorderSizePixel = 0
	button1.Position = UDim2.new(0, 10, 0.5, 0)
	button1.Size = UDim2.fromOffset(20, 20)
	button1.ZIndex = 7

	ignore4 = Instance.new("UICorner")
	ignore4.Name = "Ignore"
	ignore4.CornerRadius = UDim.new(1, 0)
	ignore4.Parent = button1

	button1.Parent = bar2

	progress1 = Instance.new("Frame")
	progress1.Name = "Progress"
	progress1.BackgroundColor3 = Color3.fromRGB(25, 170, 127)
	progress1.BorderSizePixel = 0
	progress1.Size = UDim2.fromScale(0, 1)
	progress1.ZIndex = 6

	ignore5 = Instance.new("UICorner")
	ignore5.Name = "Ignore"
	ignore5.CornerRadius = UDim.new(1, 0)
	ignore5.Parent = progress1

	progress1.Parent = bar2

	bar2.Parent = actual1

	actual1.Parent = center1

	center1.Parent = roundness

	uICorner16 = Instance.new("UICorner")
	uICorner16.Name = "UICorner"
	uICorner16.Parent = roundness

	roundness.Parent = scroller3

	resizable = Instance.new("Frame")
	resizable.Name = "Resizable"
	resizable.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	resizable.BackgroundTransparency = 0.5
	resizable.Size = UDim2.new(1, -10, 0, 30)
	resizable.ZIndex = 6

	title4 = Instance.new("Frame")
	title4.Name = "Title"
	title4.AnchorPoint = Vector2.new(0.5, 0.5)
	title4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title4.BackgroundTransparency = 1
	title4.BorderSizePixel = 0
	title4.Position = UDim2.fromScale(0.5, 0.5)
	title4.Size = UDim2.new(0.95, 0, 0, 20)
	title4.ZIndex = 6

	icon8 = Instance.new("ImageLabel")
	icon8.Name = "Icon"
	icon8.Image = "rbxassetid://8571348189"
	icon8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	icon8.BackgroundTransparency = 1
	icon8.Size = UDim2.fromOffset(20, 20)
	icon8.ZIndex = 6
	icon8.Parent = title4

	label3 = Instance.new("TextLabel")
	label3.Name = "Label"
	label3.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Bold,
		Enum.FontStyle.Normal
	)
	label3.Text = "Resizable"
	label3.TextColor3 = Color3.fromRGB(255, 255, 255)
	label3.TextSize = 14
	label3.TextXAlignment = Enum.TextXAlignment.Left
	label3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	label3.BackgroundTransparency = 1
	label3.Position = UDim2.fromOffset(25, 0)
	label3.Size = UDim2.new(0.5, 0, 0, 18)
	label3.ZIndex = 6
	label3.Parent = title4

	title4.Parent = resizable

	uICorner17 = Instance.new("UICorner")
	uICorner17.Name = "UICorner"
	uICorner17.Parent = resizable

	toggle = Instance.new("Frame")
	toggle.Name = "Toggle"
	toggle.AnchorPoint = Vector2.new(1, 0.5)
	toggle.BackgroundColor3 = Color3.fromRGB(72, 175, 240)
	toggle.BorderSizePixel = 0
	toggle.Position = UDim2.new(1, -5, 0.5, 0)
	toggle.Size = UDim2.fromOffset(40, 18)
	toggle.ZIndex = 6

	ignore6 = Instance.new("UICorner")
	ignore6.Name = "Ignore"
	ignore6.CornerRadius = UDim.new(1, 0)
	ignore6.Parent = toggle

	zone1 = Instance.new("TextButton")
	zone1.Name = "Zone"
	zone1.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
	zone1.Text = ""
	zone1.TextColor3 = Color3.fromRGB(0, 0, 0)
	zone1.TextSize = 14
	zone1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	zone1.BackgroundTransparency = 1
	zone1.Size = UDim2.fromScale(1, 1)
	zone1.ZIndex = 8

	ignore7 = Instance.new("UICorner")
	ignore7.Name = "Ignore"
	ignore7.CornerRadius = UDim.new(1, 0)
	ignore7.Parent = zone1

	zone1.Parent = toggle

	rounded = Instance.new("Frame")
	rounded.Name = "Rounded"
	rounded.AnchorPoint = Vector2.new(1, 0.5)
	rounded.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	rounded.Position = UDim2.new(1, -3, 0.5, 0)
	rounded.Size = UDim2.fromOffset(14, 14)
	rounded.ZIndex = 6

	ignore8 = Instance.new("UICorner")
	ignore8.Name = "Ignore"
	ignore8.CornerRadius = UDim.new(1, 0)
	ignore8.Parent = rounded

	rounded.Parent = toggle

	toggle.Parent = resizable

	resizable.Parent = scroller3

	textFont = Instance.new("Frame")
	textFont.Name = "TextFont"
	textFont.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	textFont.BackgroundTransparency = 1
	textFont.ClipsDescendants = true
	textFont.LayoutOrder = 1
	textFont.Size = UDim2.new(1, -10, 0, 30)
	textFont.ZIndex = 6

	title5 = Instance.new("Frame")
	title5.Name = "Title"
	title5.AnchorPoint = Vector2.new(0.5, 0.5)
	title5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title5.BackgroundTransparency = 1
	title5.BorderSizePixel = 0
	title5.Position = UDim2.new(0.5, 0, 0, 15)
	title5.Size = UDim2.new(0.95, 0, 0, 20)
	title5.ZIndex = 8

	icon9 = Instance.new("ImageLabel")
	icon9.Name = "Icon"
	icon9.Image = "rbxassetid://8678012976"
	icon9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	icon9.BackgroundTransparency = 1
	icon9.Size = UDim2.fromOffset(20, 20)
	icon9.ZIndex = 9
	icon9.Parent = title5

	label4 = Instance.new("TextLabel")
	label4.Name = "Label"
	label4.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Bold,
		Enum.FontStyle.Normal
	)
	label4.Text = "Text Font"
	label4.TextColor3 = Color3.fromRGB(255, 255, 255)
	label4.TextSize = 14
	label4.TextXAlignment = Enum.TextXAlignment.Left
	label4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	label4.BackgroundTransparency = 1
	label4.Position = UDim2.fromOffset(25, 0)
	label4.Size = UDim2.fromOffset(0, 18)
	label4.ZIndex = 9
	label4.Parent = title5

	drop = Instance.new("TextButton")
	drop.Name = "Drop"
	drop.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
	drop.Text = ""
	drop.TextColor3 = Color3.fromRGB(0, 0, 0)
	drop.TextSize = 14
	drop.AnchorPoint = Vector2.new(1, 0)
	drop.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	drop.BorderSizePixel = 0
	drop.Position = UDim2.fromScale(1, 0)
	drop.Size = UDim2.fromOffset(30, 20)
	drop.ZIndex = 9

	uICorner18 = Instance.new("UICorner")
	uICorner18.Name = "UICorner"
	uICorner18.Parent = drop

	icon10 = Instance.new("ImageLabel")
	icon10.Name = "Icon"
	icon10.Image = "rbxassetid://8677555693"
	icon10.AnchorPoint = Vector2.new(0.5, 0.5)
	icon10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	icon10.BackgroundTransparency = 1
	icon10.Position = UDim2.fromScale(0.5, 0.5)
	icon10.Size = UDim2.fromOffset(25, 25)
	icon10.ZIndex = 10
	icon10.Parent = drop

	drop.Parent = title5

	selected = Instance.new("TextLabel")
	selected.Name = "Selected"
	selected.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	selected.Text = "GothamMedium"
	selected.TextColor3 = Color3.fromRGB(200, 200, 200)
	selected.TextSize = 14
	selected.TextXAlignment = Enum.TextXAlignment.Right
	selected.AnchorPoint = Vector2.new(1, 0.5)
	selected.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	selected.BackgroundTransparency = 1
	selected.Position = UDim2.new(1, -35, 0.5, 0)
	selected.Size = UDim2.fromOffset(0, 18)
	selected.ZIndex = 9
	selected.Parent = title5

	title5.Parent = textFont

	topContainer = Instance.new("Frame")
	topContainer.Name = "TopContainer"
	topContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	topContainer.BackgroundTransparency = 1
	topContainer.LayoutOrder = 2
	topContainer.Size = UDim2.new(1, 0, 0, 25)
	topContainer.ZIndex = 6

	background = Instance.new("Frame")
	background.Name = "Background"
	background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	background.BackgroundTransparency = 1
	background.LayoutOrder = 2
	background.Size = UDim2.new(1, 0, 0, 25)
	background.ZIndex = 6

	main3 = Instance.new("Frame")
	main3.Name = "Main"
	main3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	main3.BackgroundTransparency = 0.5
	main3.LayoutOrder = 2
	main3.Size = UDim2.new(1, 0, 0, 30)
	main3.ZIndex = 6

	uICorner19 = Instance.new("UICorner")
	uICorner19.Name = "UICorner"
	uICorner19.Parent = main3

	main3.Parent = background

	background.Parent = topContainer

	flat = Instance.new("Frame")
	flat.Name = "Flat"
	flat.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	flat.BackgroundTransparency = 0.5
	flat.BorderSizePixel = 0
	flat.Position = UDim2.fromOffset(0, 25)
	flat.Size = UDim2.new(1, 0, 0, 5)
	flat.Visible = false
	flat.ZIndex = 6
	flat.Parent = topContainer

	topContainer.Parent = textFont

	dropdown = Instance.new("Frame")
	dropdown.Name = "Dropdown"
	dropdown.AutomaticSize = Enum.AutomaticSize.Y
	dropdown.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	dropdown.BackgroundTransparency = 1
	dropdown.BorderSizePixel = 0
	dropdown.ClipsDescendants = true
	dropdown.Position = UDim2.fromOffset(0, 30)
	dropdown.Size = UDim2.fromScale(1, 0)
	dropdown.ZIndex = 6

	bottomContainer = Instance.new("Frame")
	bottomContainer.Name = "BottomContainer"
	bottomContainer.AnchorPoint = Vector2.new(0, 1)
	bottomContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	bottomContainer.BackgroundTransparency = 1
	bottomContainer.BorderSizePixel = 0
	bottomContainer.ClipsDescendants = true
	bottomContainer.Position = UDim2.new(0, 0, 2, -20)
	bottomContainer.Size = UDim2.fromScale(1, 1)
	bottomContainer.ZIndex = 6

	rounded1 = Instance.new("Frame")
	rounded1.Name = "Rounded"
	rounded1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	rounded1.BackgroundTransparency = 0.35
	rounded1.Position = UDim2.fromOffset(0, -30)
	rounded1.Size = UDim2.new(1, 0, 0, 50)
	rounded1.ZIndex = 6

	uICorner20 = Instance.new("UICorner")
	uICorner20.Name = "UICorner"
	uICorner20.Parent = rounded1

	rounded1.Parent = bottomContainer

	bottomContainer.Parent = dropdown

	options = Instance.new("Frame")
	options.Name = "Options"
	options.AutomaticSize = Enum.AutomaticSize.Y
	options.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	options.BackgroundTransparency = 1
	options.Size = UDim2.fromScale(1, 0)
	options.ZIndex = 6

	uIListLayout4 = Instance.new("UIListLayout")
	uIListLayout4.Name = "UIListLayout"
	uIListLayout4.Padding = UDim.new(0, 3)
	uIListLayout4.HorizontalAlignment = Enum.HorizontalAlignment.Center
	uIListLayout4.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout4.Parent = options

	options.Parent = dropdown

	uIPadding3 = Instance.new("UIPadding")
	uIPadding3.Name = "UIPadding"
	uIPadding3.PaddingBottom = UDim.new(0, 55)
	uIPadding3.Parent = dropdown

	frame = Instance.new("Frame")
	frame.Name = "Frame"
	frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	frame.BackgroundTransparency = 0.35
	frame.BorderSizePixel = 0
	frame.Size = UDim2.new(1, 0, 1, -20)
	frame.ZIndex = 6
	frame.Parent = dropdown

	dropdown.Parent = textFont

	textFont.Parent = scroller3

	scroller3.Parent = uI1

	uI1.Parent = pages

	bubbleChat1 = Instance.new("Frame")
	bubbleChat1.Name = "BubbleChat"
	bubbleChat1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	bubbleChat1.BackgroundTransparency = 1
	bubbleChat1.Position = UDim2.fromScale(1, 0)
	bubbleChat1.Size = UDim2.fromScale(1, 1)
	bubbleChat1.ZIndex = 6

	title6 = Instance.new("TextLabel")
	title6.Name = "Title"
	title6.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	title6.Text = "Bubble Chat"
	title6.TextColor3 = Color3.fromRGB(255, 255, 255)
	title6.TextSize = 20
	title6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title6.BackgroundTransparency = 1
	title6.Position = UDim2.fromOffset(0, 5)
	title6.Size = UDim2.new(1, 0, 0, 30)
	title6.ZIndex = 6

	back1 = Instance.new("TextButton")
	back1.Name = "Back"
	back1.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
	back1.Text = ""
	back1.TextColor3 = Color3.fromRGB(0, 0, 0)
	back1.TextSize = 14
	back1.AnchorPoint = Vector2.new(0, 0.5)
	back1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	back1.Position = UDim2.new(0, 5, 0.5, 0)
	back1.Size = UDim2.fromOffset(25, 25)
	back1.ZIndex = 6

	imageLabel1 = Instance.new("ImageLabel")
	imageLabel1.Name = "ImageLabel"
	imageLabel1.Image = "rbxassetid://8677511725"
	imageLabel1.AnchorPoint = Vector2.new(0.5, 0.5)
	imageLabel1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	imageLabel1.BackgroundTransparency = 1
	imageLabel1.Position = UDim2.fromScale(0.5, 0.5)
	imageLabel1.Size = UDim2.fromScale(0.85, 0.85)
	imageLabel1.ZIndex = 6
	imageLabel1.Parent = back1

	uICorner21 = Instance.new("UICorner")
	uICorner21.Name = "UICorner"
	uICorner21.Parent = back1

	back1.Parent = title6

	title6.Parent = bubbleChat1

	scroller4 = Instance.new("ScrollingFrame")
	scroller4.Name = "Scroller"
	scroller4.BottomImage = "rbxassetid://8082116996"
	scroller4.CanvasSize = UDim2.new()
	scroller4.MidImage = "rbxassetid://7488333553"
	scroller4.ScrollBarThickness = 5
	scroller4.TopImage = "rbxassetid://8082122989"
	scroller4.AnchorPoint = Vector2.new(0.5, 1)
	scroller4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	scroller4.BackgroundTransparency = 1
	scroller4.BorderSizePixel = 0
	scroller4.Position = UDim2.new(0.5, 0, 1, -10)
	scroller4.Selectable = false
	scroller4.Size = UDim2.new(1, -10, 1, -50)
	scroller4.ZIndex = 6

	uIListLayout5 = Instance.new("UIListLayout")
	uIListLayout5.Name = "UIListLayout"
	uIListLayout5.Padding = UDim.new(0, 5)
	uIListLayout5.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout5.Parent = scroller4

	animationStyle = Instance.new("Frame")
	animationStyle.Name = "AnimationStyle"
	animationStyle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	animationStyle.BackgroundTransparency = 1
	animationStyle.ClipsDescendants = true
	animationStyle.Size = UDim2.new(1, -10, 0, 30)
	animationStyle.ZIndex = 6

	title7 = Instance.new("Frame")
	title7.Name = "Title"
	title7.AnchorPoint = Vector2.new(0.5, 0.5)
	title7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title7.BackgroundTransparency = 1
	title7.BorderSizePixel = 0
	title7.Position = UDim2.new(0.5, 0, 0, 15)
	title7.Size = UDim2.new(0.95, 0, 0, 20)
	title7.ZIndex = 8

	icon11 = Instance.new("ImageLabel")
	icon11.Name = "Icon"
	icon11.Image = "rbxassetid://8677960616"
	icon11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	icon11.BackgroundTransparency = 1
	icon11.Size = UDim2.fromOffset(20, 20)
	icon11.ZIndex = 9
	icon11.Parent = title7

	label5 = Instance.new("TextLabel")
	label5.Name = "Label"
	label5.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Bold,
		Enum.FontStyle.Normal
	)
	label5.Text = "Animation Style"
	label5.TextColor3 = Color3.fromRGB(255, 255, 255)
	label5.TextSize = 14
	label5.TextXAlignment = Enum.TextXAlignment.Left
	label5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	label5.BackgroundTransparency = 1
	label5.Position = UDim2.fromOffset(25, 0)
	label5.Size = UDim2.fromOffset(0, 18)
	label5.ZIndex = 9
	label5.Parent = title7

	drop1 = Instance.new("TextButton")
	drop1.Name = "Drop"
	drop1.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
	drop1.Text = ""
	drop1.TextColor3 = Color3.fromRGB(0, 0, 0)
	drop1.TextSize = 14
	drop1.AnchorPoint = Vector2.new(1, 0)
	drop1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	drop1.BorderSizePixel = 0
	drop1.Position = UDim2.fromScale(1, 0)
	drop1.Size = UDim2.fromOffset(30, 20)
	drop1.ZIndex = 9

	uICorner22 = Instance.new("UICorner")
	uICorner22.Name = "UICorner"
	uICorner22.Parent = drop1

	icon12 = Instance.new("ImageLabel")
	icon12.Name = "Icon"
	icon12.Image = "rbxassetid://8677555693"
	icon12.AnchorPoint = Vector2.new(0.5, 0.5)
	icon12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	icon12.BackgroundTransparency = 1
	icon12.Position = UDim2.fromScale(0.5, 0.5)
	icon12.Size = UDim2.fromOffset(25, 25)
	icon12.ZIndex = 10
	icon12.Parent = drop1

	drop1.Parent = title7

	selected1 = Instance.new("TextLabel")
	selected1.Name = "Selected"
	selected1.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	selected1.Text = "Linear"
	selected1.TextColor3 = Color3.fromRGB(200, 200, 200)
	selected1.TextSize = 14
	selected1.TextXAlignment = Enum.TextXAlignment.Right
	selected1.AnchorPoint = Vector2.new(1, 0.5)
	selected1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	selected1.BackgroundTransparency = 1
	selected1.Position = UDim2.new(1, -35, 0.5, 0)
	selected1.Size = UDim2.fromOffset(0, 18)
	selected1.ZIndex = 9
	selected1.Parent = title7

	title7.Parent = animationStyle

	topContainer1 = Instance.new("Frame")
	topContainer1.Name = "TopContainer"
	topContainer1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	topContainer1.BackgroundTransparency = 1
	topContainer1.LayoutOrder = 2
	topContainer1.Size = UDim2.new(1, 0, 0, 25)
	topContainer1.ZIndex = 6

	background1 = Instance.new("Frame")
	background1.Name = "Background"
	background1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	background1.BackgroundTransparency = 1
	background1.LayoutOrder = 2
	background1.Size = UDim2.new(1, 0, 0, 25)
	background1.ZIndex = 6

	main4 = Instance.new("Frame")
	main4.Name = "Main"
	main4.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	main4.BackgroundTransparency = 0.5
	main4.LayoutOrder = 2
	main4.Size = UDim2.new(1, 0, 0, 30)
	main4.ZIndex = 6

	uICorner23 = Instance.new("UICorner")
	uICorner23.Name = "UICorner"
	uICorner23.Parent = main4

	main4.Parent = background1

	background1.Parent = topContainer1

	flat1 = Instance.new("Frame")
	flat1.Name = "Flat"
	flat1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	flat1.BackgroundTransparency = 0.5
	flat1.BorderSizePixel = 0
	flat1.Position = UDim2.fromOffset(0, 25)
	flat1.Size = UDim2.new(1, 0, 0, 5)
	flat1.Visible = false
	flat1.ZIndex = 6
	flat1.Parent = topContainer1

	topContainer1.Parent = animationStyle

	dropdown1 = Instance.new("Frame")
	dropdown1.Name = "Dropdown"
	dropdown1.AutomaticSize = Enum.AutomaticSize.Y
	dropdown1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	dropdown1.BackgroundTransparency = 1
	dropdown1.BorderSizePixel = 0
	dropdown1.ClipsDescendants = true
	dropdown1.Position = UDim2.fromOffset(0, 30)
	dropdown1.Size = UDim2.fromScale(1, 0)
	dropdown1.ZIndex = 6

	bottomContainer1 = Instance.new("Frame")
	bottomContainer1.Name = "BottomContainer"
	bottomContainer1.AnchorPoint = Vector2.new(0, 1)
	bottomContainer1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	bottomContainer1.BackgroundTransparency = 1
	bottomContainer1.BorderSizePixel = 0
	bottomContainer1.ClipsDescendants = true
	bottomContainer1.Position = UDim2.new(0, 0, 2, -20)
	bottomContainer1.Size = UDim2.fromScale(1, 1)
	bottomContainer1.ZIndex = 6

	rounded2 = Instance.new("Frame")
	rounded2.Name = "Rounded"
	rounded2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	rounded2.BackgroundTransparency = 0.35
	rounded2.Position = UDim2.fromOffset(0, -30)
	rounded2.Size = UDim2.new(1, 0, 0, 50)
	rounded2.ZIndex = 6

	uICorner24 = Instance.new("UICorner")
	uICorner24.Name = "UICorner"
	uICorner24.Parent = rounded2

	rounded2.Parent = bottomContainer1

	bottomContainer1.Parent = dropdown1

	options1 = Instance.new("Frame")
	options1.Name = "Options"
	options1.AutomaticSize = Enum.AutomaticSize.Y
	options1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	options1.BackgroundTransparency = 1
	options1.Size = UDim2.fromScale(1, 0)
	options1.ZIndex = 6

	uIListLayout6 = Instance.new("UIListLayout")
	uIListLayout6.Name = "UIListLayout"
	uIListLayout6.Padding = UDim.new(0, 3)
	uIListLayout6.HorizontalAlignment = Enum.HorizontalAlignment.Center
	uIListLayout6.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout6.Parent = options1

	options1.Parent = dropdown1

	uIPadding4 = Instance.new("UIPadding")
	uIPadding4.Name = "UIPadding"
	uIPadding4.PaddingBottom = UDim.new(0, 55)
	uIPadding4.Parent = dropdown1

	frame1 = Instance.new("Frame")
	frame1.Name = "Frame"
	frame1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	frame1.BackgroundTransparency = 0.35
	frame1.BorderSizePixel = 0
	frame1.Size = UDim2.new(1, 0, 1, -20)
	frame1.ZIndex = 6
	frame1.Parent = dropdown1

	dropdown1.Parent = animationStyle

	animationStyle.Parent = scroller4

	fadeoutTime = Instance.new("Frame")
	fadeoutTime.Name = "FadeoutTime"
	fadeoutTime.Active = true
	fadeoutTime.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	fadeoutTime.BackgroundTransparency = 0.5
	fadeoutTime.BorderSizePixel = 0
	fadeoutTime.LayoutOrder = 2
	fadeoutTime.Position = UDim2.fromScale(0.0328, 0.044)
	fadeoutTime.Selectable = true
	fadeoutTime.Size = UDim2.new(1, -10, 0, 55)
	fadeoutTime.ZIndex = 6

	center2 = Instance.new("Frame")
	center2.Name = "Center"
	center2.AnchorPoint = Vector2.new(0, 0.5)
	center2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	center2.BackgroundTransparency = 1
	center2.Position = UDim2.fromScale(0, 0.5)
	center2.Size = UDim2.fromScale(1, 0.75)
	center2.ZIndex = 6

	title8 = Instance.new("Frame")
	title8.Name = "Title"
	title8.AnchorPoint = Vector2.new(0.5, 0)
	title8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title8.BackgroundTransparency = 1
	title8.BorderSizePixel = 0
	title8.Position = UDim2.fromScale(0.5, 0)
	title8.Size = UDim2.new(0.95, 0, 0, 20)
	title8.ZIndex = 6

	icon13 = Instance.new("ImageLabel")
	icon13.Name = "Icon"
	icon13.Image = "rbxassetid://8677983647"
	icon13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	icon13.BackgroundTransparency = 1
	icon13.Size = UDim2.fromOffset(20, 20)
	icon13.ZIndex = 6
	icon13.Parent = title8

	label6 = Instance.new("TextLabel")
	label6.Name = "Label"
	label6.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Bold,
		Enum.FontStyle.Normal
	)
	label6.Text = "Fade Time"
	label6.TextColor3 = Color3.fromRGB(255, 255, 255)
	label6.TextSize = 14
	label6.TextXAlignment = Enum.TextXAlignment.Left
	label6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	label6.BackgroundTransparency = 1
	label6.Position = UDim2.fromOffset(25, 0)
	label6.Size = UDim2.new(0.5, 0, 0, 18)
	label6.ZIndex = 6
	label6.Parent = title8

	title8.Parent = center2

	actual2 = Instance.new("Frame")
	actual2.Name = "Actual"
	actual2.AnchorPoint = Vector2.new(0.5, 1)
	actual2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	actual2.BackgroundTransparency = 1
	actual2.Position = UDim2.new(0.5, 0, 1, 5)
	actual2.Size = UDim2.new(0.95, 0, 0, 25)
	actual2.ZIndex = 6

	amount2 = Instance.new("TextBox")
	amount2.Name = "Amount"
	amount2.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	amount2.PlaceholderColor3 = Color3.fromRGB(220, 220, 220)
	amount2.PlaceholderText = "%"
	amount2.Text = "_"
	amount2.TextColor3 = Color3.fromRGB(255, 255, 255)
	amount2.TextSize = 14
	amount2.AnchorPoint = Vector2.new(1, 0.5)
	amount2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	amount2.BackgroundTransparency = 0.5
	amount2.BorderSizePixel = 0
	amount2.Position = UDim2.fromScale(1, 0.5)
	amount2.Size = UDim2.new(0.125, 0, 0, 20)
	amount2.ZIndex = 6

	uICorner25 = Instance.new("UICorner")
	uICorner25.Name = "UICorner"
	uICorner25.Parent = amount2

	uIPadding5 = Instance.new("UIPadding")
	uIPadding5.Name = "UIPadding"
	uIPadding5.PaddingLeft = UDim.new(0, 5)
	uIPadding5.PaddingRight = UDim.new(0, 5)
	uIPadding5.Parent = amount2

	amount2.Parent = actual2

	bar3 = Instance.new("Frame")
	bar3.Name = "Bar"
	bar3.AnchorPoint = Vector2.new(0, 0.5)
	bar3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	bar3.BorderSizePixel = 0
	bar3.Position = UDim2.fromScale(0, 0.5)
	bar3.Size = UDim2.new(0.85, 0, 0, 10)
	bar3.ZIndex = 6

	ignore9 = Instance.new("UICorner")
	ignore9.Name = "Ignore"
	ignore9.CornerRadius = UDim.new(1, 0)
	ignore9.Parent = bar3

	button2 = Instance.new("TextButton")
	button2.Name = "Button"
	button2.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
	button2.Text = ""
	button2.TextColor3 = Color3.fromRGB(0, 0, 0)
	button2.TextSize = 14
	button2.AnchorPoint = Vector2.new(0.5, 0.5)
	button2.BackgroundColor3 = Color3.fromRGB(30, 200, 150)
	button2.BorderSizePixel = 0
	button2.Position = UDim2.new(0, 10, 0.5, 0)
	button2.Size = UDim2.fromOffset(20, 20)
	button2.ZIndex = 7

	ignore10 = Instance.new("UICorner")
	ignore10.Name = "Ignore"
	ignore10.CornerRadius = UDim.new(1, 0)
	ignore10.Parent = button2

	button2.Parent = bar3

	progress2 = Instance.new("Frame")
	progress2.Name = "Progress"
	progress2.BackgroundColor3 = Color3.fromRGB(25, 170, 127)
	progress2.BorderSizePixel = 0
	progress2.Size = UDim2.fromScale(0, 1)
	progress2.ZIndex = 6

	ignore11 = Instance.new("UICorner")
	ignore11.Name = "Ignore"
	ignore11.CornerRadius = UDim.new(1, 0)
	ignore11.Parent = progress2

	progress2.Parent = bar3

	bar3.Parent = actual2

	actual2.Parent = center2

	center2.Parent = fadeoutTime

	uICorner26 = Instance.new("UICorner")
	uICorner26.Name = "UICorner"
	uICorner26.Parent = fadeoutTime

	fadeoutTime.Parent = scroller4

	font = Instance.new("Frame")
	font.Name = "Font"
	font.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	font.BackgroundTransparency = 1
	font.ClipsDescendants = true
	font.LayoutOrder = 1
	font.Size = UDim2.new(1, -10, 0, 30)
	font.ZIndex = 6

	title9 = Instance.new("Frame")
	title9.Name = "Title"
	title9.AnchorPoint = Vector2.new(0.5, 0.5)
	title9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title9.BackgroundTransparency = 1
	title9.BorderSizePixel = 0
	title9.Position = UDim2.new(0.5, 0, 0, 15)
	title9.Size = UDim2.new(0.95, 0, 0, 20)
	title9.ZIndex = 8

	icon14 = Instance.new("ImageLabel")
	icon14.Name = "Icon"
	icon14.Image = "rbxassetid://8678012976"
	icon14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	icon14.BackgroundTransparency = 1
	icon14.Size = UDim2.fromOffset(20, 20)
	icon14.ZIndex = 9
	icon14.Parent = title9

	label7 = Instance.new("TextLabel")
	label7.Name = "Label"
	label7.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Bold,
		Enum.FontStyle.Normal
	)
	label7.Text = "Font"
	label7.TextColor3 = Color3.fromRGB(255, 255, 255)
	label7.TextSize = 14
	label7.TextXAlignment = Enum.TextXAlignment.Left
	label7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	label7.BackgroundTransparency = 1
	label7.Position = UDim2.fromOffset(25, 0)
	label7.Size = UDim2.fromOffset(0, 18)
	label7.ZIndex = 9
	label7.Parent = title9

	drop2 = Instance.new("TextButton")
	drop2.Name = "Drop"
	drop2.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
	drop2.Text = ""
	drop2.TextColor3 = Color3.fromRGB(0, 0, 0)
	drop2.TextSize = 14
	drop2.AnchorPoint = Vector2.new(1, 0)
	drop2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	drop2.BorderSizePixel = 0
	drop2.Position = UDim2.fromScale(1, 0)
	drop2.Size = UDim2.fromOffset(30, 20)
	drop2.ZIndex = 9

	uICorner27 = Instance.new("UICorner")
	uICorner27.Name = "UICorner"
	uICorner27.Parent = drop2

	icon15 = Instance.new("ImageLabel")
	icon15.Name = "Icon"
	icon15.Image = "rbxassetid://8677555693"
	icon15.AnchorPoint = Vector2.new(0.5, 0.5)
	icon15.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	icon15.BackgroundTransparency = 1
	icon15.Position = UDim2.fromScale(0.5, 0.5)
	icon15.Size = UDim2.fromOffset(25, 25)
	icon15.ZIndex = 10
	icon15.Parent = drop2

	drop2.Parent = title9

	selected2 = Instance.new("TextLabel")
	selected2.Name = "Selected"
	selected2.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	selected2.Text = "GothamMedium"
	selected2.TextColor3 = Color3.fromRGB(200, 200, 200)
	selected2.TextSize = 14
	selected2.TextXAlignment = Enum.TextXAlignment.Right
	selected2.AnchorPoint = Vector2.new(1, 0.5)
	selected2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	selected2.BackgroundTransparency = 1
	selected2.Position = UDim2.new(1, -35, 0.5, 0)
	selected2.Size = UDim2.fromOffset(0, 18)
	selected2.ZIndex = 9
	selected2.Parent = title9

	title9.Parent = font

	topContainer2 = Instance.new("Frame")
	topContainer2.Name = "TopContainer"
	topContainer2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	topContainer2.BackgroundTransparency = 1
	topContainer2.LayoutOrder = 2
	topContainer2.Size = UDim2.new(1, 0, 0, 25)
	topContainer2.ZIndex = 6

	background2 = Instance.new("Frame")
	background2.Name = "Background"
	background2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	background2.BackgroundTransparency = 1
	background2.LayoutOrder = 2
	background2.Size = UDim2.new(1, 0, 0, 25)
	background2.ZIndex = 6

	main5 = Instance.new("Frame")
	main5.Name = "Main"
	main5.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	main5.BackgroundTransparency = 0.5
	main5.LayoutOrder = 2
	main5.Size = UDim2.new(1, 0, 0, 30)
	main5.ZIndex = 6

	uICorner28 = Instance.new("UICorner")
	uICorner28.Name = "UICorner"
	uICorner28.Parent = main5

	main5.Parent = background2

	background2.Parent = topContainer2

	flat2 = Instance.new("Frame")
	flat2.Name = "Flat"
	flat2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	flat2.BackgroundTransparency = 0.5
	flat2.BorderSizePixel = 0
	flat2.Position = UDim2.fromOffset(0, 25)
	flat2.Size = UDim2.new(1, 0, 0, 5)
	flat2.Visible = false
	flat2.ZIndex = 6
	flat2.Parent = topContainer2

	topContainer2.Parent = font

	dropdown2 = Instance.new("Frame")
	dropdown2.Name = "Dropdown"
	dropdown2.AutomaticSize = Enum.AutomaticSize.Y
	dropdown2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	dropdown2.BackgroundTransparency = 1
	dropdown2.BorderSizePixel = 0
	dropdown2.ClipsDescendants = true
	dropdown2.Position = UDim2.fromOffset(0, 30)
	dropdown2.Size = UDim2.fromScale(1, 0)
	dropdown2.ZIndex = 6

	bottomContainer2 = Instance.new("Frame")
	bottomContainer2.Name = "BottomContainer"
	bottomContainer2.AnchorPoint = Vector2.new(0, 1)
	bottomContainer2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	bottomContainer2.BackgroundTransparency = 1
	bottomContainer2.BorderSizePixel = 0
	bottomContainer2.ClipsDescendants = true
	bottomContainer2.Position = UDim2.new(0, 0, 2, -20)
	bottomContainer2.Size = UDim2.fromScale(1, 1)
	bottomContainer2.ZIndex = 6

	rounded3 = Instance.new("Frame")
	rounded3.Name = "Rounded"
	rounded3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	rounded3.BackgroundTransparency = 0.35
	rounded3.Position = UDim2.fromOffset(0, -30)
	rounded3.Size = UDim2.new(1, 0, 0, 50)
	rounded3.ZIndex = 6

	uICorner29 = Instance.new("UICorner")
	uICorner29.Name = "UICorner"
	uICorner29.Parent = rounded3

	rounded3.Parent = bottomContainer2

	bottomContainer2.Parent = dropdown2

	options2 = Instance.new("Frame")
	options2.Name = "Options"
	options2.AutomaticSize = Enum.AutomaticSize.Y
	options2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	options2.BackgroundTransparency = 1
	options2.Size = UDim2.fromScale(1, 0)
	options2.ZIndex = 6

	uIListLayout7 = Instance.new("UIListLayout")
	uIListLayout7.Name = "UIListLayout"
	uIListLayout7.Padding = UDim.new(0, 3)
	uIListLayout7.HorizontalAlignment = Enum.HorizontalAlignment.Center
	uIListLayout7.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout7.Parent = options2

	options2.Parent = dropdown2

	uIPadding6 = Instance.new("UIPadding")
	uIPadding6.Name = "UIPadding"
	uIPadding6.PaddingBottom = UDim.new(0, 55)
	uIPadding6.Parent = dropdown2

	frame2 = Instance.new("Frame")
	frame2.Name = "Frame"
	frame2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	frame2.BackgroundTransparency = 0.35
	frame2.BorderSizePixel = 0
	frame2.Size = UDim2.new(1, 0, 1, -20)
	frame2.ZIndex = 6
	frame2.Parent = dropdown2

	dropdown2.Parent = font

	font.Parent = scroller4

	enabled = Instance.new("Frame")
	enabled.Name = "Enabled"
	enabled.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	enabled.BackgroundTransparency = 0.5
	enabled.LayoutOrder = -1
	enabled.Size = UDim2.new(1, -10, 0, 30)
	enabled.ZIndex = 6

	title10 = Instance.new("Frame")
	title10.Name = "Title"
	title10.AnchorPoint = Vector2.new(0.5, 0.5)
	title10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title10.BackgroundTransparency = 1
	title10.BorderSizePixel = 0
	title10.Position = UDim2.fromScale(0.5, 0.5)
	title10.Size = UDim2.new(0.95, 0, 0, 20)
	title10.ZIndex = 6

	icon16 = Instance.new("ImageLabel")
	icon16.Name = "Icon"
	icon16.Image = "rbxassetid://8685962752"
	icon16.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	icon16.BackgroundTransparency = 1
	icon16.Size = UDim2.fromOffset(20, 20)
	icon16.ZIndex = 6
	icon16.Parent = title10

	label8 = Instance.new("TextLabel")
	label8.Name = "Label"
	label8.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Bold,
		Enum.FontStyle.Normal
	)
	label8.Text = "Enabled"
	label8.TextColor3 = Color3.fromRGB(255, 255, 255)
	label8.TextSize = 14
	label8.TextXAlignment = Enum.TextXAlignment.Left
	label8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	label8.BackgroundTransparency = 1
	label8.Position = UDim2.fromOffset(25, 0)
	label8.Size = UDim2.new(0.5, 0, 0, 18)
	label8.ZIndex = 6
	label8.Parent = title10

	title10.Parent = enabled

	uICorner30 = Instance.new("UICorner")
	uICorner30.Name = "UICorner"
	uICorner30.Parent = enabled

	toggle1 = Instance.new("Frame")
	toggle1.Name = "Toggle"
	toggle1.AnchorPoint = Vector2.new(1, 0.5)
	toggle1.BackgroundColor3 = Color3.fromRGB(72, 175, 240)
	toggle1.BorderSizePixel = 0
	toggle1.Position = UDim2.new(1, -5, 0.5, 0)
	toggle1.Size = UDim2.fromOffset(40, 18)
	toggle1.ZIndex = 6

	ignore12 = Instance.new("UICorner")
	ignore12.Name = "Ignore"
	ignore12.CornerRadius = UDim.new(1, 0)
	ignore12.Parent = toggle1

	zone2 = Instance.new("TextButton")
	zone2.Name = "Zone"
	zone2.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
	zone2.Text = ""
	zone2.TextColor3 = Color3.fromRGB(0, 0, 0)
	zone2.TextSize = 14
	zone2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	zone2.BackgroundTransparency = 1
	zone2.Size = UDim2.fromScale(1, 1)
	zone2.ZIndex = 8

	ignore13 = Instance.new("UICorner")
	ignore13.Name = "Ignore"
	ignore13.CornerRadius = UDim.new(1, 0)
	ignore13.Parent = zone2

	zone2.Parent = toggle1

	rounded4 = Instance.new("Frame")
	rounded4.Name = "Rounded"
	rounded4.AnchorPoint = Vector2.new(1, 0.5)
	rounded4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	rounded4.Position = UDim2.new(1, -3, 0.5, 0)
	rounded4.Size = UDim2.fromOffset(14, 14)
	rounded4.ZIndex = 6

	ignore14 = Instance.new("UICorner")
	ignore14.Name = "Ignore"
	ignore14.CornerRadius = UDim.new(1, 0)
	ignore14.Parent = rounded4

	rounded4.Parent = toggle1

	toggle1.Parent = enabled

	enabled.Parent = scroller4

	scroller4.Parent = bubbleChat1

	bubbleChat1.Parent = pages

	quickChat1 = Instance.new("Frame")
	quickChat1.Name = "QuickChat"
	quickChat1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	quickChat1.BackgroundTransparency = 1
	quickChat1.Position = UDim2.fromScale(1, 0)
	quickChat1.Size = UDim2.fromScale(1, 1)
	quickChat1.ZIndex = 6

	title11 = Instance.new("TextLabel")
	title11.Name = "Title"
	title11.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	title11.Text = "Quick Chat"
	title11.TextColor3 = Color3.fromRGB(255, 255, 255)
	title11.TextSize = 20
	title11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title11.BackgroundTransparency = 1
	title11.Position = UDim2.fromOffset(0, 5)
	title11.Size = UDim2.new(1, 0, 0, 30)
	title11.ZIndex = 6

	back2 = Instance.new("TextButton")
	back2.Name = "Back"
	back2.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
	back2.Text = ""
	back2.TextColor3 = Color3.fromRGB(0, 0, 0)
	back2.TextSize = 14
	back2.AnchorPoint = Vector2.new(0, 0.5)
	back2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	back2.Position = UDim2.new(0, 5, 0.5, 0)
	back2.Size = UDim2.fromOffset(25, 25)
	back2.ZIndex = 6

	imageLabel2 = Instance.new("ImageLabel")
	imageLabel2.Name = "ImageLabel"
	imageLabel2.Image = "rbxassetid://8677511725"
	imageLabel2.AnchorPoint = Vector2.new(0.5, 0.5)
	imageLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	imageLabel2.BackgroundTransparency = 1
	imageLabel2.Position = UDim2.fromScale(0.5, 0.5)
	imageLabel2.Size = UDim2.fromScale(0.85, 0.85)
	imageLabel2.ZIndex = 6
	imageLabel2.Parent = back2

	uICorner31 = Instance.new("UICorner")
	uICorner31.Name = "UICorner"
	uICorner31.Parent = back2

	back2.Parent = title11

	title11.Parent = quickChat1

	scroller5 = Instance.new("ScrollingFrame")
	scroller5.Name = "Scroller"
	scroller5.BottomImage = "rbxassetid://8082116996"
	scroller5.CanvasSize = UDim2.new()
	scroller5.MidImage = "rbxassetid://7488333553"
	scroller5.ScrollBarThickness = 5
	scroller5.TopImage = "rbxassetid://8082122989"
	scroller5.AnchorPoint = Vector2.new(0.5, 1)
	scroller5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	scroller5.BackgroundTransparency = 1
	scroller5.BorderSizePixel = 0
	scroller5.Position = UDim2.new(0.5, 0, 1, -10)
	scroller5.Selectable = false
	scroller5.Size = UDim2.new(1, -10, 1, -50)
	scroller5.ZIndex = 6

	uIListLayout8 = Instance.new("UIListLayout")
	uIListLayout8.Name = "UIListLayout"
	uIListLayout8.Padding = UDim.new(0, 5)
	uIListLayout8.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout8.Parent = scroller5

	scroller5.Parent = quickChat1

	quickChat1.Parent = pages

	help1 = Instance.new("Frame")
	help1.Name = "Help"
	help1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	help1.BackgroundTransparency = 1
	help1.Position = UDim2.fromScale(1, 0)
	help1.Size = UDim2.fromScale(1, 1)
	help1.ZIndex = 6

	title12 = Instance.new("TextLabel")
	title12.Name = "Title"
	title12.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	title12.Text = "Help"
	title12.TextColor3 = Color3.fromRGB(255, 255, 255)
	title12.TextSize = 20
	title12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title12.BackgroundTransparency = 1
	title12.Position = UDim2.fromOffset(0, 5)
	title12.Size = UDim2.new(1, 0, 0, 30)
	title12.ZIndex = 6

	back3 = Instance.new("TextButton")
	back3.Name = "Back"
	back3.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
	back3.Text = ""
	back3.TextColor3 = Color3.fromRGB(0, 0, 0)
	back3.TextSize = 14
	back3.AnchorPoint = Vector2.new(0, 0.5)
	back3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	back3.Position = UDim2.new(0, 5, 0.5, 0)
	back3.Size = UDim2.fromOffset(25, 25)
	back3.ZIndex = 6

	imageLabel3 = Instance.new("ImageLabel")
	imageLabel3.Name = "ImageLabel"
	imageLabel3.Image = "rbxassetid://8677511725"
	imageLabel3.AnchorPoint = Vector2.new(0.5, 0.5)
	imageLabel3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	imageLabel3.BackgroundTransparency = 1
	imageLabel3.Position = UDim2.fromScale(0.5, 0.5)
	imageLabel3.Size = UDim2.fromScale(0.85, 0.85)
	imageLabel3.ZIndex = 6
	imageLabel3.Parent = back3

	uICorner32 = Instance.new("UICorner")
	uICorner32.Name = "UICorner"
	uICorner32.Parent = back3

	back3.Parent = title12

	title12.Parent = help1

	scroller6 = Instance.new("ScrollingFrame")
	scroller6.Name = "Scroller"
	scroller6.AutomaticCanvasSize = Enum.AutomaticSize.Y
	scroller6.BottomImage = "rbxassetid://8082116996"
	scroller6.CanvasSize = UDim2.new()
	scroller6.MidImage = "rbxassetid://7488333553"
	scroller6.ScrollBarThickness = 5
	scroller6.TopImage = "rbxassetid://8082122989"
	scroller6.AnchorPoint = Vector2.new(0.5, 1)
	scroller6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	scroller6.BackgroundTransparency = 1
	scroller6.BorderSizePixel = 0
	scroller6.Position = UDim2.new(0.5, 0, 1, -10)
	scroller6.Selectable = false
	scroller6.Size = UDim2.new(1, -10, 1, -50)
	scroller6.ZIndex = 6

	uIListLayout9 = Instance.new("UIListLayout")
	uIListLayout9.Name = "UIListLayout"
	uIListLayout9.Padding = UDim.new(0, 5)
	uIListLayout9.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout9.Parent = scroller6

	generalFormatting = Instance.new("Frame")
	generalFormatting.Name = "GeneralFormatting"
	generalFormatting.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	generalFormatting.BackgroundTransparency = 1
	generalFormatting.Size = UDim2.new(1, -10, 0, 30)
	generalFormatting.ZIndex = 6

	dropdown3 = Instance.new("Frame")
	dropdown3.Name = "Dropdown"
	dropdown3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	dropdown3.BackgroundTransparency = 1
	dropdown3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	dropdown3.BorderSizePixel = 0
	dropdown3.ClipsDescendants = true
	dropdown3.Position = UDim2.fromOffset(0, 35)
	dropdown3.Size = UDim2.fromScale(1, 0)
	dropdown3.Visible = false

	italicBold = Instance.new("Frame")
	italicBold.Name = "ItalicBold"
	italicBold.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	italicBold.BackgroundTransparency = 1
	italicBold.LayoutOrder = 3
	italicBold.Size = UDim2.new(1, -10, 0, 30)
	italicBold.ZIndex = 6

	uICorner33 = Instance.new("UICorner")
	uICorner33.Name = "UICorner"
	uICorner33.Parent = italicBold

	example = Instance.new("TextLabel")
	example.Name = "Example"
	example.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	example.Text = "Italic bold: ***text***"
	example.TextColor3 = Color3.fromRGB(255, 255, 255)
	example.TextSize = 15
	example.TextXAlignment = Enum.TextXAlignment.Left
	example.AutomaticSize = Enum.AutomaticSize.X
	example.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	example.BackgroundTransparency = 1
	example.BorderColor3 = Color3.fromRGB(0, 0, 0)
	example.BorderSizePixel = 0
	example.Position = UDim2.fromOffset(20, 0)
	example.Size = UDim2.fromScale(0, 1)
	example.ZIndex = 10

	uIPadding7 = Instance.new("UIPadding")
	uIPadding7.Name = "UIPadding"
	uIPadding7.PaddingRight = UDim.new(0, 5)
	uIPadding7.Parent = example

	imageLabel4 = Instance.new("ImageLabel")
	imageLabel4.Name = "ImageLabel"
	imageLabel4.Image = "http://www.roblox.com/asset/?id=6031090995"
	imageLabel4.AnchorPoint = Vector2.new(0, 0.5)
	imageLabel4.BackgroundTransparency = 1
	imageLabel4.BorderSizePixel = 0
	imageLabel4.Position = UDim2.new(1, 5, 0.5, 0)
	imageLabel4.Size = UDim2.fromOffset(20, 20)
	imageLabel4.ZIndex = 10

	formatted = Instance.new("TextLabel")
	formatted.Name = "Formatted"
	formatted.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	formatted.RichText = true
	formatted.Text = "<i><b>text</b></i>"
	formatted.TextColor3 = Color3.fromRGB(255, 255, 255)
	formatted.TextSize = 15
	formatted.TextXAlignment = Enum.TextXAlignment.Left
	formatted.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	formatted.BorderColor3 = Color3.fromRGB(0, 0, 0)
	formatted.BorderSizePixel = 0
	formatted.Position = UDim2.new(1, 5, 0, 0)
	formatted.Size = UDim2.fromScale(0, 1)
	formatted.ZIndex = 10
	formatted.Parent = imageLabel4

	imageLabel4.Parent = example

	example.Parent = italicBold

	bulletPoint = Instance.new("Frame")
	bulletPoint.Name = "BulletPoint"
	bulletPoint.AnchorPoint = Vector2.new(0, 0.5)
	bulletPoint.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	bulletPoint.BorderColor3 = Color3.fromRGB(0, 0, 0)
	bulletPoint.BorderSizePixel = 0
	bulletPoint.Position = UDim2.new(0, 5, 0.5, 0)
	bulletPoint.Size = UDim2.fromOffset(10, 10)
	bulletPoint.ZIndex = 9

	ignore15 = Instance.new("UICorner")
	ignore15.Name = "Ignore"
	ignore15.CornerRadius = UDim.new(1, 0)
	ignore15.Parent = bulletPoint

	bulletPoint.Parent = italicBold

	italicBold.Parent = dropdown3

	italics = Instance.new("Frame")
	italics.Name = "Italics"
	italics.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	italics.BackgroundTransparency = 1
	italics.LayoutOrder = 1
	italics.Size = UDim2.new(1, -10, 0, 30)
	italics.ZIndex = 6

	uICorner34 = Instance.new("UICorner")
	uICorner34.Name = "UICorner"
	uICorner34.Parent = italics

	example1 = Instance.new("TextLabel")
	example1.Name = "Example"
	example1.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	example1.Text = "Italics: *text*"
	example1.TextColor3 = Color3.fromRGB(255, 255, 255)
	example1.TextSize = 15
	example1.TextXAlignment = Enum.TextXAlignment.Left
	example1.AutomaticSize = Enum.AutomaticSize.X
	example1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	example1.BackgroundTransparency = 1
	example1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	example1.BorderSizePixel = 0
	example1.Position = UDim2.fromOffset(20, 0)
	example1.Size = UDim2.fromScale(0, 1)
	example1.ZIndex = 10

	uIPadding8 = Instance.new("UIPadding")
	uIPadding8.Name = "UIPadding"
	uIPadding8.PaddingRight = UDim.new(0, 5)
	uIPadding8.Parent = example1

	imageLabel5 = Instance.new("ImageLabel")
	imageLabel5.Name = "ImageLabel"
	imageLabel5.Image = "http://www.roblox.com/asset/?id=6031090995"
	imageLabel5.AnchorPoint = Vector2.new(0, 0.5)
	imageLabel5.BackgroundTransparency = 1
	imageLabel5.BorderSizePixel = 0
	imageLabel5.Position = UDim2.new(1, 5, 0.5, 0)
	imageLabel5.Size = UDim2.fromOffset(20, 20)
	imageLabel5.ZIndex = 10

	formatted1 = Instance.new("TextLabel")
	formatted1.Name = "Formatted"
	formatted1.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	formatted1.RichText = true
	formatted1.Text = "<i>text</i>"
	formatted1.TextColor3 = Color3.fromRGB(255, 255, 255)
	formatted1.TextSize = 15
	formatted1.TextXAlignment = Enum.TextXAlignment.Left
	formatted1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	formatted1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	formatted1.BorderSizePixel = 0
	formatted1.Position = UDim2.new(1, 5, 0, 0)
	formatted1.Size = UDim2.fromScale(0, 1)
	formatted1.ZIndex = 10
	formatted1.Parent = imageLabel5

	imageLabel5.Parent = example1

	example1.Parent = italics

	bulletPoint1 = Instance.new("Frame")
	bulletPoint1.Name = "BulletPoint"
	bulletPoint1.AnchorPoint = Vector2.new(0, 0.5)
	bulletPoint1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	bulletPoint1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	bulletPoint1.BorderSizePixel = 0
	bulletPoint1.Position = UDim2.new(0, 5, 0.5, 0)
	bulletPoint1.Size = UDim2.fromOffset(10, 10)
	bulletPoint1.ZIndex = 9

	ignore16 = Instance.new("UICorner")
	ignore16.Name = "Ignore"
	ignore16.CornerRadius = UDim.new(1, 0)
	ignore16.Parent = bulletPoint1

	bulletPoint1.Parent = italics

	italics.Parent = dropdown3

	underlined = Instance.new("Frame")
	underlined.Name = "Underlined"
	underlined.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	underlined.BackgroundTransparency = 1
	underlined.LayoutOrder = 4
	underlined.Size = UDim2.new(1, -10, 0, 30)
	underlined.ZIndex = 6

	uICorner35 = Instance.new("UICorner")
	uICorner35.Name = "UICorner"
	uICorner35.Parent = underlined

	example2 = Instance.new("TextLabel")
	example2.Name = "Example"
	example2.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	example2.Text = "Underlined: __text__"
	example2.TextColor3 = Color3.fromRGB(255, 255, 255)
	example2.TextSize = 15
	example2.TextXAlignment = Enum.TextXAlignment.Left
	example2.AutomaticSize = Enum.AutomaticSize.X
	example2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	example2.BackgroundTransparency = 1
	example2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	example2.BorderSizePixel = 0
	example2.Position = UDim2.fromOffset(20, 0)
	example2.Size = UDim2.fromScale(0, 1)
	example2.ZIndex = 10

	uIPadding9 = Instance.new("UIPadding")
	uIPadding9.Name = "UIPadding"
	uIPadding9.PaddingRight = UDim.new(0, 5)
	uIPadding9.Parent = example2

	imageLabel6 = Instance.new("ImageLabel")
	imageLabel6.Name = "ImageLabel"
	imageLabel6.Image = "http://www.roblox.com/asset/?id=6031090995"
	imageLabel6.AnchorPoint = Vector2.new(0, 0.5)
	imageLabel6.BackgroundTransparency = 1
	imageLabel6.BorderSizePixel = 0
	imageLabel6.Position = UDim2.new(1, 5, 0.5, 0)
	imageLabel6.Size = UDim2.fromOffset(20, 20)
	imageLabel6.ZIndex = 10

	formatted2 = Instance.new("TextLabel")
	formatted2.Name = "Formatted"
	formatted2.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	formatted2.RichText = true
	formatted2.Text = "<u>text</u>"
	formatted2.TextColor3 = Color3.fromRGB(255, 255, 255)
	formatted2.TextSize = 15
	formatted2.TextXAlignment = Enum.TextXAlignment.Left
	formatted2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	formatted2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	formatted2.BorderSizePixel = 0
	formatted2.Position = UDim2.new(1, 5, 0, 0)
	formatted2.Size = UDim2.fromScale(0, 1)
	formatted2.ZIndex = 10
	formatted2.Parent = imageLabel6

	imageLabel6.Parent = example2

	example2.Parent = underlined

	bulletPoint2 = Instance.new("Frame")
	bulletPoint2.Name = "BulletPoint"
	bulletPoint2.AnchorPoint = Vector2.new(0, 0.5)
	bulletPoint2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	bulletPoint2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	bulletPoint2.BorderSizePixel = 0
	bulletPoint2.Position = UDim2.new(0, 5, 0.5, 0)
	bulletPoint2.Size = UDim2.fromOffset(10, 10)
	bulletPoint2.ZIndex = 9

	ignore17 = Instance.new("UICorner")
	ignore17.Name = "Ignore"
	ignore17.CornerRadius = UDim.new(1, 0)
	ignore17.Parent = bulletPoint2

	bulletPoint2.Parent = underlined

	underlined.Parent = dropdown3

	strikethrough = Instance.new("Frame")
	strikethrough.Name = "Strikethrough"
	strikethrough.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	strikethrough.BackgroundTransparency = 1
	strikethrough.LayoutOrder = 5
	strikethrough.Size = UDim2.new(1, -10, 0, 30)
	strikethrough.ZIndex = 6

	uICorner36 = Instance.new("UICorner")
	uICorner36.Name = "UICorner"
	uICorner36.Parent = strikethrough

	example3 = Instance.new("TextLabel")
	example3.Name = "Example"
	example3.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	example3.Text = "Strikethrough: ~~text~~"
	example3.TextColor3 = Color3.fromRGB(255, 255, 255)
	example3.TextSize = 15
	example3.TextXAlignment = Enum.TextXAlignment.Left
	example3.AutomaticSize = Enum.AutomaticSize.X
	example3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	example3.BackgroundTransparency = 1
	example3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	example3.BorderSizePixel = 0
	example3.Position = UDim2.fromOffset(20, 0)
	example3.Size = UDim2.fromScale(0, 1)
	example3.ZIndex = 10

	uIPadding10 = Instance.new("UIPadding")
	uIPadding10.Name = "UIPadding"
	uIPadding10.PaddingRight = UDim.new(0, 5)
	uIPadding10.Parent = example3

	imageLabel7 = Instance.new("ImageLabel")
	imageLabel7.Name = "ImageLabel"
	imageLabel7.Image = "http://www.roblox.com/asset/?id=6031090995"
	imageLabel7.AnchorPoint = Vector2.new(0, 0.5)
	imageLabel7.BackgroundTransparency = 1
	imageLabel7.BorderSizePixel = 0
	imageLabel7.Position = UDim2.new(1, 5, 0.5, 0)
	imageLabel7.Size = UDim2.fromOffset(20, 20)
	imageLabel7.ZIndex = 10

	formatted3 = Instance.new("TextLabel")
	formatted3.Name = "Formatted"
	formatted3.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	formatted3.RichText = true
	formatted3.Text = "<s>text</s>"
	formatted3.TextColor3 = Color3.fromRGB(255, 255, 255)
	formatted3.TextSize = 15
	formatted3.TextXAlignment = Enum.TextXAlignment.Left
	formatted3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	formatted3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	formatted3.BorderSizePixel = 0
	formatted3.Position = UDim2.new(1, 5, 0, 0)
	formatted3.Size = UDim2.fromScale(0, 1)
	formatted3.ZIndex = 10
	formatted3.Parent = imageLabel7

	imageLabel7.Parent = example3

	example3.Parent = strikethrough

	bulletPoint3 = Instance.new("Frame")
	bulletPoint3.Name = "BulletPoint"
	bulletPoint3.AnchorPoint = Vector2.new(0, 0.5)
	bulletPoint3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	bulletPoint3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	bulletPoint3.BorderSizePixel = 0
	bulletPoint3.Position = UDim2.new(0, 5, 0.5, 0)
	bulletPoint3.Size = UDim2.fromOffset(10, 10)
	bulletPoint3.ZIndex = 9

	ignore18 = Instance.new("UICorner")
	ignore18.Name = "Ignore"
	ignore18.CornerRadius = UDim.new(1, 0)
	ignore18.Parent = bulletPoint3

	bulletPoint3.Parent = strikethrough

	strikethrough.Parent = dropdown3

	bold = Instance.new("Frame")
	bold.Name = "Bold"
	bold.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	bold.BackgroundTransparency = 1
	bold.LayoutOrder = 2
	bold.Size = UDim2.new(1, -10, 0, 30)
	bold.ZIndex = 6

	uICorner37 = Instance.new("UICorner")
	uICorner37.Name = "UICorner"
	uICorner37.Parent = bold

	example4 = Instance.new("TextLabel")
	example4.Name = "Example"
	example4.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	example4.Text = "Bold: **text**"
	example4.TextColor3 = Color3.fromRGB(255, 255, 255)
	example4.TextSize = 15
	example4.TextXAlignment = Enum.TextXAlignment.Left
	example4.AutomaticSize = Enum.AutomaticSize.X
	example4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	example4.BackgroundTransparency = 1
	example4.BorderColor3 = Color3.fromRGB(0, 0, 0)
	example4.BorderSizePixel = 0
	example4.Position = UDim2.fromOffset(20, 0)
	example4.Size = UDim2.fromScale(0, 1)
	example4.ZIndex = 10

	uIPadding11 = Instance.new("UIPadding")
	uIPadding11.Name = "UIPadding"
	uIPadding11.PaddingRight = UDim.new(0, 5)
	uIPadding11.Parent = example4

	imageLabel8 = Instance.new("ImageLabel")
	imageLabel8.Name = "ImageLabel"
	imageLabel8.Image = "http://www.roblox.com/asset/?id=6031090995"
	imageLabel8.AnchorPoint = Vector2.new(0, 0.5)
	imageLabel8.BackgroundTransparency = 1
	imageLabel8.BorderSizePixel = 0
	imageLabel8.Position = UDim2.new(1, 5, 0.5, 0)
	imageLabel8.Size = UDim2.fromOffset(20, 20)
	imageLabel8.ZIndex = 10

	formatted4 = Instance.new("TextLabel")
	formatted4.Name = "Formatted"
	formatted4.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	formatted4.RichText = true
	formatted4.Text = "<b>text</b>"
	formatted4.TextColor3 = Color3.fromRGB(255, 255, 255)
	formatted4.TextSize = 15
	formatted4.TextXAlignment = Enum.TextXAlignment.Left
	formatted4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	formatted4.BorderColor3 = Color3.fromRGB(0, 0, 0)
	formatted4.BorderSizePixel = 0
	formatted4.Position = UDim2.new(1, 5, 0, 0)
	formatted4.Size = UDim2.fromScale(0, 1)
	formatted4.ZIndex = 10
	formatted4.Parent = imageLabel8

	imageLabel8.Parent = example4

	example4.Parent = bold

	bulletPoint4 = Instance.new("Frame")
	bulletPoint4.Name = "BulletPoint"
	bulletPoint4.AnchorPoint = Vector2.new(0, 0.5)
	bulletPoint4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	bulletPoint4.BorderColor3 = Color3.fromRGB(0, 0, 0)
	bulletPoint4.BorderSizePixel = 0
	bulletPoint4.Position = UDim2.new(0, 5, 0.5, 0)
	bulletPoint4.Size = UDim2.fromOffset(10, 10)
	bulletPoint4.ZIndex = 9

	ignore19 = Instance.new("UICorner")
	ignore19.Name = "Ignore"
	ignore19.CornerRadius = UDim.new(1, 0)
	ignore19.Parent = bulletPoint4

	bulletPoint4.Parent = bold

	bold.Parent = dropdown3

	uIListLayout10 = Instance.new("UIListLayout")
	uIListLayout10.Name = "UIListLayout"
	uIListLayout10.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout10.Parent = dropdown3

	dropdown3.Parent = generalFormatting

	cover = Instance.new("Frame")
	cover.Name = "Cover"
	cover.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	cover.BackgroundTransparency = 0.5
	cover.BorderColor3 = Color3.fromRGB(0, 0, 0)
	cover.BorderSizePixel = 0
	cover.Size = UDim2.new(1, 0, 0, 30)

	uICorner38 = Instance.new("UICorner")
	uICorner38.Name = "UICorner"
	uICorner38.Parent = cover

	textLabel = Instance.new("TextLabel")
	textLabel.Name = "TextLabel"
	textLabel.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	textLabel.Text = "General formatting:"
	textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	textLabel.TextSize = 14
	textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	textLabel.BackgroundTransparency = 1
	textLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	textLabel.BorderSizePixel = 0
	textLabel.Size = UDim2.fromScale(1, 1)
	textLabel.ZIndex = 8
	textLabel.Parent = cover

	drop3 = Instance.new("TextButton")
	drop3.Name = "Drop"
	drop3.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
	drop3.Text = ""
	drop3.TextColor3 = Color3.fromRGB(0, 0, 0)
	drop3.TextSize = 14
	drop3.AnchorPoint = Vector2.new(1, 0.5)
	drop3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	drop3.BorderSizePixel = 0
	drop3.Position = UDim2.new(1, -5, 0.5, 0)
	drop3.Size = UDim2.fromOffset(30, 20)
	drop3.ZIndex = 9

	uICorner39 = Instance.new("UICorner")
	uICorner39.Name = "UICorner"
	uICorner39.Parent = drop3

	icon17 = Instance.new("ImageLabel")
	icon17.Name = "Icon"
	icon17.Image = "rbxassetid://8677555693"
	icon17.AnchorPoint = Vector2.new(0.5, 0.5)
	icon17.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	icon17.BackgroundTransparency = 1
	icon17.Position = UDim2.fromScale(0.5, 0.5)
	icon17.Size = UDim2.fromOffset(25, 25)
	icon17.ZIndex = 10
	icon17.Parent = drop3

	drop3.Parent = cover

	cover.Parent = generalFormatting

	generalFormatting.Parent = scroller6

	colorFormatting = Instance.new("Frame")
	colorFormatting.Name = "ColorFormatting"
	colorFormatting.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	colorFormatting.BackgroundTransparency = 1
	colorFormatting.Size = UDim2.new(1, -10, 0, 30)
	colorFormatting.ZIndex = 6

	cover1 = Instance.new("Frame")
	cover1.Name = "Cover"
	cover1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	cover1.BackgroundTransparency = 0.5
	cover1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	cover1.BorderSizePixel = 0
	cover1.Size = UDim2.new(1, 0, 0, 30)

	uICorner40 = Instance.new("UICorner")
	uICorner40.Name = "UICorner"
	uICorner40.Parent = cover1

	textLabel1 = Instance.new("TextLabel")
	textLabel1.Name = "TextLabel"
	textLabel1.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	textLabel1.Text = "Color formatting:"
	textLabel1.TextColor3 = Color3.fromRGB(255, 255, 255)
	textLabel1.TextSize = 14
	textLabel1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	textLabel1.BackgroundTransparency = 1
	textLabel1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	textLabel1.BorderSizePixel = 0
	textLabel1.Size = UDim2.fromScale(1, 1)
	textLabel1.ZIndex = 8
	textLabel1.Parent = cover1

	drop4 = Instance.new("TextButton")
	drop4.Name = "Drop"
	drop4.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
	drop4.Text = ""
	drop4.TextColor3 = Color3.fromRGB(0, 0, 0)
	drop4.TextSize = 14
	drop4.AnchorPoint = Vector2.new(1, 0.5)
	drop4.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	drop4.BorderSizePixel = 0
	drop4.Position = UDim2.new(1, -5, 0.5, 0)
	drop4.Size = UDim2.fromOffset(30, 20)
	drop4.ZIndex = 9

	uICorner41 = Instance.new("UICorner")
	uICorner41.Name = "UICorner"
	uICorner41.Parent = drop4

	icon18 = Instance.new("ImageLabel")
	icon18.Name = "Icon"
	icon18.Image = "rbxassetid://8677555693"
	icon18.AnchorPoint = Vector2.new(0.5, 0.5)
	icon18.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	icon18.BackgroundTransparency = 1
	icon18.Position = UDim2.fromScale(0.5, 0.5)
	icon18.Size = UDim2.fromOffset(25, 25)
	icon18.ZIndex = 10
	icon18.Parent = drop4

	drop4.Parent = cover1

	cover1.Parent = colorFormatting

	dropdown4 = Instance.new("Frame")
	dropdown4.Name = "Dropdown"
	dropdown4.AutomaticSize = Enum.AutomaticSize.X
	dropdown4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	dropdown4.BackgroundTransparency = 1
	dropdown4.BorderColor3 = Color3.fromRGB(0, 0, 0)
	dropdown4.BorderSizePixel = 0
	dropdown4.ClipsDescendants = true
	dropdown4.LayoutOrder = 12
	dropdown4.Position = UDim2.fromOffset(0, 35)
	dropdown4.Size = UDim2.fromScale(1, 0)

	hex = Instance.new("Frame")
	hex.Name = "Hex"
	hex.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	hex.BackgroundTransparency = 1
	hex.LayoutOrder = 9
	hex.Size = UDim2.new(1, -10, 0, 30)
	hex.ZIndex = 6

	uICorner42 = Instance.new("UICorner")
	uICorner42.Name = "UICorner"
	uICorner42.Parent = hex

	example5 = Instance.new("TextLabel")
	example5.Name = "Example"
	example5.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	example5.Text = "Hex: (#FF0000 / text)"
	example5.TextColor3 = Color3.fromRGB(255, 255, 255)
	example5.TextSize = 15
	example5.TextXAlignment = Enum.TextXAlignment.Left
	example5.AutomaticSize = Enum.AutomaticSize.X
	example5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	example5.BackgroundTransparency = 1
	example5.BorderColor3 = Color3.fromRGB(0, 0, 0)
	example5.BorderSizePixel = 0
	example5.Position = UDim2.fromOffset(20, 0)
	example5.Size = UDim2.fromScale(0, 1)
	example5.ZIndex = 10

	uIPadding12 = Instance.new("UIPadding")
	uIPadding12.Name = "UIPadding"
	uIPadding12.PaddingRight = UDim.new(0, 5)
	uIPadding12.Parent = example5

	imageLabel9 = Instance.new("ImageLabel")
	imageLabel9.Name = "ImageLabel"
	imageLabel9.Image = "http://www.roblox.com/asset/?id=6031090995"
	imageLabel9.AnchorPoint = Vector2.new(0, 0.5)
	imageLabel9.BackgroundTransparency = 1
	imageLabel9.BorderSizePixel = 0
	imageLabel9.Position = UDim2.new(1, 5, 0.5, 0)
	imageLabel9.Size = UDim2.fromOffset(20, 20)
	imageLabel9.ZIndex = 10

	formatted5 = Instance.new("TextLabel")
	formatted5.Name = "Formatted"
	formatted5.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	formatted5.RichText = true
	formatted5.Text = "<font color=\"rgb(255,0,0)\">text</font>"
	formatted5.TextColor3 = Color3.fromRGB(255, 255, 255)
	formatted5.TextSize = 15
	formatted5.TextXAlignment = Enum.TextXAlignment.Left
	formatted5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	formatted5.BorderColor3 = Color3.fromRGB(0, 0, 0)
	formatted5.BorderSizePixel = 0
	formatted5.Position = UDim2.new(1, 5, 0, 0)
	formatted5.Size = UDim2.fromScale(0, 1)
	formatted5.ZIndex = 10
	formatted5.Parent = imageLabel9

	imageLabel9.Parent = example5

	example5.Parent = hex

	bulletPoint5 = Instance.new("Frame")
	bulletPoint5.Name = "BulletPoint"
	bulletPoint5.AnchorPoint = Vector2.new(0, 0.5)
	bulletPoint5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	bulletPoint5.BorderColor3 = Color3.fromRGB(0, 0, 0)
	bulletPoint5.BorderSizePixel = 0
	bulletPoint5.Position = UDim2.new(0, 5, 0.5, 0)
	bulletPoint5.Size = UDim2.fromOffset(10, 10)
	bulletPoint5.ZIndex = 9

	ignore20 = Instance.new("UICorner")
	ignore20.Name = "Ignore"
	ignore20.CornerRadius = UDim.new(1, 0)
	ignore20.Parent = bulletPoint5

	bulletPoint5.Parent = hex

	hex.Parent = dropdown4

	rGB = Instance.new("Frame")
	rGB.Name = "RGB"
	rGB.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	rGB.BackgroundTransparency = 1
	rGB.LayoutOrder = 8
	rGB.Size = UDim2.new(1, -10, 0, 30)
	rGB.ZIndex = 6

	uICorner43 = Instance.new("UICorner")
	uICorner43.Name = "UICorner"
	uICorner43.Parent = rGB

	example6 = Instance.new("TextLabel")
	example6.Name = "Example"
	example6.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	example6.Text = "RGB: (255,0,0 / text)"
	example6.TextColor3 = Color3.fromRGB(255, 255, 255)
	example6.TextSize = 15
	example6.TextXAlignment = Enum.TextXAlignment.Left
	example6.AutomaticSize = Enum.AutomaticSize.X
	example6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	example6.BackgroundTransparency = 1
	example6.BorderColor3 = Color3.fromRGB(0, 0, 0)
	example6.BorderSizePixel = 0
	example6.Position = UDim2.fromOffset(20, 0)
	example6.Size = UDim2.fromScale(0, 1)
	example6.ZIndex = 10

	uIPadding13 = Instance.new("UIPadding")
	uIPadding13.Name = "UIPadding"
	uIPadding13.PaddingRight = UDim.new(0, 5)
	uIPadding13.Parent = example6

	imageLabel10 = Instance.new("ImageLabel")
	imageLabel10.Name = "ImageLabel"
	imageLabel10.Image = "http://www.roblox.com/asset/?id=6031090995"
	imageLabel10.AnchorPoint = Vector2.new(0, 0.5)
	imageLabel10.BackgroundTransparency = 1
	imageLabel10.BorderSizePixel = 0
	imageLabel10.Position = UDim2.new(1, 5, 0.5, 0)
	imageLabel10.Size = UDim2.fromOffset(20, 20)
	imageLabel10.ZIndex = 10

	formatted6 = Instance.new("TextLabel")
	formatted6.Name = "Formatted"
	formatted6.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	formatted6.RichText = true
	formatted6.Text = "<font color=\"rgb(255,0,0)\">text</font>"
	formatted6.TextColor3 = Color3.fromRGB(255, 255, 255)
	formatted6.TextSize = 15
	formatted6.TextXAlignment = Enum.TextXAlignment.Left
	formatted6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	formatted6.BorderColor3 = Color3.fromRGB(0, 0, 0)
	formatted6.BorderSizePixel = 0
	formatted6.Position = UDim2.new(1, 5, 0, 0)
	formatted6.Size = UDim2.fromScale(0, 1)
	formatted6.ZIndex = 10
	formatted6.Parent = imageLabel10

	imageLabel10.Parent = example6

	example6.Parent = rGB

	bulletPoint6 = Instance.new("Frame")
	bulletPoint6.Name = "BulletPoint"
	bulletPoint6.AnchorPoint = Vector2.new(0, 0.5)
	bulletPoint6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	bulletPoint6.BorderColor3 = Color3.fromRGB(0, 0, 0)
	bulletPoint6.BorderSizePixel = 0
	bulletPoint6.Position = UDim2.new(0, 5, 0.5, 0)
	bulletPoint6.Size = UDim2.fromOffset(10, 10)
	bulletPoint6.ZIndex = 9

	ignore21 = Instance.new("UICorner")
	ignore21.Name = "Ignore"
	ignore21.CornerRadius = UDim.new(1, 0)
	ignore21.Parent = bulletPoint6

	bulletPoint6.Parent = rGB

	rGB.Parent = dropdown4

	brickColors = Instance.new("Frame")
	brickColors.Name = "BrickColors"
	brickColors.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	brickColors.BackgroundTransparency = 1
	brickColors.LayoutOrder = 7
	brickColors.Size = UDim2.new(1, -10, 0, 30)
	brickColors.ZIndex = 6

	uICorner44 = Instance.new("UICorner")
	uICorner44.Name = "UICorner"
	uICorner44.Parent = brickColors

	example7 = Instance.new("TextLabel")
	example7.Name = "Example"
	example7.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	example7.Text = "Brick colors: (Really red / text)"
	example7.TextColor3 = Color3.fromRGB(255, 255, 255)
	example7.TextSize = 15
	example7.TextXAlignment = Enum.TextXAlignment.Left
	example7.AutomaticSize = Enum.AutomaticSize.X
	example7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	example7.BackgroundTransparency = 1
	example7.BorderColor3 = Color3.fromRGB(0, 0, 0)
	example7.BorderSizePixel = 0
	example7.Position = UDim2.fromOffset(20, 0)
	example7.Size = UDim2.fromScale(0, 1)
	example7.ZIndex = 10

	uIPadding14 = Instance.new("UIPadding")
	uIPadding14.Name = "UIPadding"
	uIPadding14.PaddingRight = UDim.new(0, 5)
	uIPadding14.Parent = example7

	imageLabel11 = Instance.new("ImageLabel")
	imageLabel11.Name = "ImageLabel"
	imageLabel11.Image = "http://www.roblox.com/asset/?id=6031090995"
	imageLabel11.AnchorPoint = Vector2.new(0, 0.5)
	imageLabel11.BackgroundTransparency = 1
	imageLabel11.BorderSizePixel = 0
	imageLabel11.Position = UDim2.new(1, 5, 0.5, 0)
	imageLabel11.Size = UDim2.fromOffset(20, 20)
	imageLabel11.ZIndex = 10

	formatted7 = Instance.new("TextLabel")
	formatted7.Name = "Formatted"
	formatted7.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	formatted7.RichText = true
	formatted7.Text = "<font color=\"rgb(255,0,0)\">text</font>"
	formatted7.TextColor3 = Color3.fromRGB(255, 255, 255)
	formatted7.TextSize = 15
	formatted7.TextXAlignment = Enum.TextXAlignment.Left
	formatted7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	formatted7.BorderColor3 = Color3.fromRGB(0, 0, 0)
	formatted7.BorderSizePixel = 0
	formatted7.Position = UDim2.new(1, 5, 0, 0)
	formatted7.Size = UDim2.fromScale(0, 1)
	formatted7.ZIndex = 10
	formatted7.Parent = imageLabel11

	imageLabel11.Parent = example7

	example7.Parent = brickColors

	bulletPoint7 = Instance.new("Frame")
	bulletPoint7.Name = "BulletPoint"
	bulletPoint7.AnchorPoint = Vector2.new(0, 0.5)
	bulletPoint7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	bulletPoint7.BorderColor3 = Color3.fromRGB(0, 0, 0)
	bulletPoint7.BorderSizePixel = 0
	bulletPoint7.Position = UDim2.new(0, 5, 0.5, 0)
	bulletPoint7.Size = UDim2.fromOffset(10, 10)
	bulletPoint7.ZIndex = 9

	ignore22 = Instance.new("UICorner")
	ignore22.Name = "Ignore"
	ignore22.CornerRadius = UDim.new(1, 0)
	ignore22.Parent = bulletPoint7

	bulletPoint7.Parent = brickColors

	brickColors.Parent = dropdown4

	uIListLayout11 = Instance.new("UIListLayout")
	uIListLayout11.Name = "UIListLayout"
	uIListLayout11.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout11.Parent = dropdown4

	dropdown4.Parent = colorFormatting

	colorFormatting.Parent = scroller6

	colorpicker = Instance.new("Frame")
	colorpicker.Name = "Colorpicker"
	colorpicker.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	colorpicker.BackgroundTransparency = 1
	colorpicker.ClipsDescendants = true
	colorpicker.Size = UDim2.new(1, -10, 0, 30)
	colorpicker.ZIndex = 6

	cover2 = Instance.new("Frame")
	cover2.Name = "Cover"
	cover2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	cover2.BackgroundTransparency = 0.5
	cover2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	cover2.BorderSizePixel = 0
	cover2.Size = UDim2.new(1, 0, 0, 30)

	uICorner45 = Instance.new("UICorner")
	uICorner45.Name = "UICorner"
	uICorner45.Parent = cover2

	textLabel2 = Instance.new("TextLabel")
	textLabel2.Name = "TextLabel"
	textLabel2.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	textLabel2.Text = "Color picker:"
	textLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
	textLabel2.TextSize = 14
	textLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	textLabel2.BackgroundTransparency = 1
	textLabel2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	textLabel2.BorderSizePixel = 0
	textLabel2.Size = UDim2.fromScale(1, 1)
	textLabel2.ZIndex = 8
	textLabel2.Parent = cover2

	drop5 = Instance.new("TextButton")
	drop5.Name = "Drop"
	drop5.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
	drop5.Text = ""
	drop5.TextColor3 = Color3.fromRGB(0, 0, 0)
	drop5.TextSize = 14
	drop5.AnchorPoint = Vector2.new(1, 0.5)
	drop5.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	drop5.BorderSizePixel = 0
	drop5.Position = UDim2.new(1, -5, 0.5, 0)
	drop5.Size = UDim2.fromOffset(30, 20)
	drop5.ZIndex = 9

	uICorner46 = Instance.new("UICorner")
	uICorner46.Name = "UICorner"
	uICorner46.Parent = drop5

	icon19 = Instance.new("ImageLabel")
	icon19.Name = "Icon"
	icon19.Image = "rbxassetid://8677555693"
	icon19.AnchorPoint = Vector2.new(0.5, 0.5)
	icon19.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	icon19.BackgroundTransparency = 1
	icon19.Position = UDim2.fromScale(0.5, 0.5)
	icon19.Size = UDim2.fromOffset(25, 25)
	icon19.ZIndex = 10
	icon19.Parent = drop5

	drop5.Parent = cover2

	cover2.Parent = colorpicker

	dropdown5 = Instance.new("Frame")
	dropdown5.Name = "Dropdown"
	dropdown5.AutomaticSize = Enum.AutomaticSize.X
	dropdown5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	dropdown5.BackgroundTransparency = 1
	dropdown5.BorderColor3 = Color3.fromRGB(0, 0, 0)
	dropdown5.BorderSizePixel = 0
	dropdown5.ClipsDescendants = true
	dropdown5.LayoutOrder = 12
	dropdown5.Position = UDim2.fromOffset(0, 35)
	dropdown5.Size = UDim2.new(1, 0, 0, 235)

	uIListLayout12 = Instance.new("UIListLayout")
	uIListLayout12.Name = "UIListLayout"
	uIListLayout12.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout12.Parent = dropdown5

	colorpicker1 = Instance.new("Frame")
	colorpicker1.Name = "Colorpicker"
	colorpicker1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	colorpicker1.BackgroundTransparency = 1
	colorpicker1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	colorpicker1.BorderSizePixel = 0
	colorpicker1.Size = UDim2.new(1, 0, 0, 235)

	pickerWidget = Instance.new("Frame")
	pickerWidget.Name = "PickerWidget"
	pickerWidget.Active = true
	pickerWidget.AnchorPoint = Vector2.new(1, 0)
	pickerWidget.BackgroundColor3 = Color3.fromRGB(0, 10, 16)
	pickerWidget.BackgroundTransparency = 0.25
	pickerWidget.BorderColor3 = Color3.fromRGB(27, 42, 53)
	pickerWidget.BorderSizePixel = 0
	pickerWidget.Position = UDim2.new(1, -5, 0, 0)
	pickerWidget.Size = UDim2.fromOffset(190, 235)
	pickerWidget.ZIndex = 5

	wheel = Instance.new("ImageButton")
	wheel.Name = "Wheel"
	wheel.Image = "rbxassetid://8733540188"
	wheel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	wheel.BackgroundTransparency = 1
	wheel.Selectable = false
	wheel.Size = UDim2.fromOffset(128, 128)
	wheel.ZIndex = 9

	marker = Instance.new("TextButton")
	marker.Name = "Marker"
	marker.Text = ""
	marker.TextTransparency = 1
	marker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	marker.BackgroundTransparency = 1
	marker.BorderColor3 = Color3.fromRGB(27, 42, 53)
	marker.Position = UDim2.new(0.5, -8, 0.5, -8)
	marker.Selectable = false
	marker.Size = UDim2.fromOffset(17, 17)
	marker.ZIndex = 9

	uICorner47 = Instance.new("UICorner")
	uICorner47.Name = "UICorner"
	uICorner47.CornerRadius = UDim.new(1, 0)
	uICorner47.Parent = marker

	uIStroke = Instance.new("UIStroke")
	uIStroke.Name = "UIStroke"
	uIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	uIStroke.Thickness = 2
	uIStroke.Parent = marker

	marker.Parent = wheel

	wheel.Parent = pickerWidget

	slider = Instance.new("Frame")
	slider.Name = "Slider"
	slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	slider.BorderColor3 = Color3.fromRGB(27, 42, 53)
	slider.BorderSizePixel = 3
	slider.Position = UDim2.fromOffset(140, 0)
	slider.Size = UDim2.fromOffset(30, 128)
	slider.ZIndex = 9

	drag = Instance.new("TextButton")
	drag.Name = "Drag"
	drag.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
	drag.Text = ""
	drag.TextColor3 = Color3.fromRGB(0, 0, 0)
	drag.TextSize = 14
	drag.Active = false
	drag.AnchorPoint = Vector2.new(0, 1)
	drag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	drag.BorderColor3 = Color3.fromRGB(27, 42, 53)
	drag.BorderSizePixel = 3
	drag.Position = UDim2.fromOffset(0, 10)
	drag.Selectable = false
	drag.Size = UDim2.fromOffset(30, 10)
	drag.ZIndex = 9

	uICorner48 = Instance.new("UICorner")
	uICorner48.Name = "UICorner"
	uICorner48.Parent = drag

	uIStroke1 = Instance.new("UIStroke")
	uIStroke1.Name = "UIStroke"
	uIStroke1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	uIStroke1.Color = Color3.fromRGB(200, 200, 200)
	uIStroke1.Thickness = 2
	uIStroke1.Parent = drag

	drag.Parent = slider

	gradient = Instance.new("UIGradient")
	gradient.Name = "Gradient"
	gradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(242, 242, 0)),
		ColorSequenceKeypoint.new(0.1, Color3.fromRGB(229, 229, 0)),
		ColorSequenceKeypoint.new(0.15, Color3.fromRGB(217, 217, 0)),
		ColorSequenceKeypoint.new(0.2, Color3.fromRGB(204, 204, 0)),
		ColorSequenceKeypoint.new(0.25, Color3.fromRGB(191, 191, 0)),
		ColorSequenceKeypoint.new(0.3, Color3.fromRGB(178, 178, 0)),
		ColorSequenceKeypoint.new(0.35, Color3.fromRGB(166, 166, 0)),
		ColorSequenceKeypoint.new(0.4, Color3.fromRGB(153, 153, 0)),
		ColorSequenceKeypoint.new(0.45, Color3.fromRGB(140, 140, 0)),
		ColorSequenceKeypoint.new(0.5, Color3.fromRGB(128, 128, 0)),
		ColorSequenceKeypoint.new(0.55, Color3.fromRGB(115, 115, 0)),
		ColorSequenceKeypoint.new(0.6, Color3.fromRGB(102, 102, 0)),
		ColorSequenceKeypoint.new(0.65, Color3.fromRGB(89, 89, 0)),
		ColorSequenceKeypoint.new(0.7, Color3.fromRGB(77, 77, 0)),
		ColorSequenceKeypoint.new(0.75, Color3.fromRGB(64, 64, 0)),
		ColorSequenceKeypoint.new(0.8, Color3.fromRGB(51, 51, 0)),
		ColorSequenceKeypoint.new(0.85, Color3.fromRGB(38, 38, 0)),
		ColorSequenceKeypoint.new(0.9, Color3.fromRGB(26, 26, 0)),
		ColorSequenceKeypoint.new(0.95, Color3.fromRGB(13, 13, 0)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)),
	})
	gradient.Rotation = 90
	gradient.Parent = slider

	uICorner49 = Instance.new("UICorner")
	uICorner49.Name = "UICorner"
	uICorner49.Parent = slider

	slider.Parent = pickerWidget

	uIPadding15 = Instance.new("UIPadding")
	uIPadding15.Name = "UIPadding"
	uIPadding15.PaddingBottom = UDim.new(0, 20)
	uIPadding15.PaddingLeft = UDim.new(0, 10)
	uIPadding15.PaddingRight = UDim.new(0, 10)
	uIPadding15.PaddingTop = UDim.new(0, 10)
	uIPadding15.Parent = pickerWidget

	options3 = Instance.new("Frame")
	options3.Name = "Options"
	options3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	options3.BackgroundTransparency = 1
	options3.BorderColor3 = Color3.fromRGB(27, 42, 53)
	options3.BorderSizePixel = 0
	options3.Position = UDim2.fromOffset(0, 155)
	options3.Size = UDim2.new(1, 0, 0, 30)
	options3.ZIndex = 9

	r = Instance.new("TextBox")
	r.Name = "R"
	r.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	r.PlaceholderColor3 = Color3.fromRGB(200, 200, 200)
	r.PlaceholderText = "..."
	r.Text = "255"
	r.TextColor3 = Color3.fromRGB(255, 255, 255)
	r.TextSize = 14
	r.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	r.BorderColor3 = Color3.fromRGB(27, 42, 53)
	r.BorderSizePixel = 0
	r.Size = UDim2.fromOffset(50, 25)
	r.ZIndex = 9

	uICorner50 = Instance.new("UICorner")
	uICorner50.Name = "UICorner"
	uICorner50.CornerRadius = UDim.new(0, 5)
	uICorner50.Parent = r

	textLabel3 = Instance.new("TextLabel")
	textLabel3.Name = "TextLabel"
	textLabel3.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	textLabel3.Text = "R"
	textLabel3.TextColor3 = Color3.fromRGB(255, 255, 255)
	textLabel3.TextSize = 12
	textLabel3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	textLabel3.BackgroundTransparency = 1
	textLabel3.BorderColor3 = Color3.fromRGB(27, 42, 53)
	textLabel3.Position = UDim2.new(0, 0, -1, 2)
	textLabel3.Size = UDim2.new(1, 0, 0, 20)
	textLabel3.ZIndex = 9
	textLabel3.Parent = r

	r.Parent = options3

	uIListLayout13 = Instance.new("UIListLayout")
	uIListLayout13.Name = "UIListLayout"
	uIListLayout13.Padding = UDim.new(0, 10)
	uIListLayout13.FillDirection = Enum.FillDirection.Horizontal
	uIListLayout13.HorizontalAlignment = Enum.HorizontalAlignment.Center
	uIListLayout13.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout13.VerticalAlignment = Enum.VerticalAlignment.Center
	uIListLayout13.Parent = options3

	g = Instance.new("TextBox")
	g.Name = "G"
	g.CursorPosition = -1
	g.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	g.PlaceholderColor3 = Color3.fromRGB(200, 200, 200)
	g.PlaceholderText = "..."
	g.Text = "255"
	g.TextColor3 = Color3.fromRGB(255, 255, 255)
	g.TextSize = 14
	g.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	g.BorderColor3 = Color3.fromRGB(27, 42, 53)
	g.BorderSizePixel = 0
	g.Size = UDim2.fromOffset(50, 25)
	g.ZIndex = 9

	uICorner51 = Instance.new("UICorner")
	uICorner51.Name = "UICorner"
	uICorner51.CornerRadius = UDim.new(0, 5)
	uICorner51.Parent = g

	textLabel4 = Instance.new("TextLabel")
	textLabel4.Name = "TextLabel"
	textLabel4.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	textLabel4.Text = "G"
	textLabel4.TextColor3 = Color3.fromRGB(255, 255, 255)
	textLabel4.TextSize = 12
	textLabel4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	textLabel4.BackgroundTransparency = 1
	textLabel4.BorderColor3 = Color3.fromRGB(27, 42, 53)
	textLabel4.Position = UDim2.new(0, 0, -1, 2)
	textLabel4.Size = UDim2.new(1, 0, 0, 20)
	textLabel4.ZIndex = 9
	textLabel4.Parent = g

	g.Parent = options3

	b = Instance.new("TextBox")
	b.Name = "B"
	b.CursorPosition = -1
	b.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	b.PlaceholderColor3 = Color3.fromRGB(200, 200, 200)
	b.PlaceholderText = "..."
	b.Text = "255"
	b.TextColor3 = Color3.fromRGB(255, 255, 255)
	b.TextSize = 14
	b.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	b.BorderColor3 = Color3.fromRGB(27, 42, 53)
	b.BorderSizePixel = 0
	b.Size = UDim2.fromOffset(50, 25)
	b.ZIndex = 9

	uICorner52 = Instance.new("UICorner")
	uICorner52.Name = "UICorner"
	uICorner52.CornerRadius = UDim.new(0, 5)
	uICorner52.Parent = b

	textLabel5 = Instance.new("TextLabel")
	textLabel5.Name = "TextLabel"
	textLabel5.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	textLabel5.Text = "B"
	textLabel5.TextColor3 = Color3.fromRGB(255, 255, 255)
	textLabel5.TextSize = 12
	textLabel5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	textLabel5.BackgroundTransparency = 1
	textLabel5.BorderColor3 = Color3.fromRGB(27, 42, 53)
	textLabel5.Position = UDim2.new(0, 0, -1, 2)
	textLabel5.Size = UDim2.new(1, 0, 0, 20)
	textLabel5.ZIndex = 9
	textLabel5.Parent = b

	b.Parent = options3

	options3.Parent = pickerWidget

	uICorner53 = Instance.new("UICorner")
	uICorner53.Name = "UICorner"
	uICorner53.Parent = pickerWidget

	hex1 = Instance.new("Frame")
	hex1.Name = "Hex"
	hex1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	hex1.BackgroundTransparency = 1
	hex1.BorderColor3 = Color3.fromRGB(27, 42, 53)
	hex1.BorderSizePixel = 0
	hex1.Position = UDim2.fromOffset(0, 190)
	hex1.Size = UDim2.new(1, 0, 0, 30)
	hex1.ZIndex = 9

	value = Instance.new("TextBox")
	value.Name = "Value"
	value.ClearTextOnFocus = false
	value.CursorPosition = -1
	value.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	value.PlaceholderColor3 = Color3.fromRGB(200, 200, 200)
	value.PlaceholderText = "..."
	value.Text = "#FFFFFF"
	value.TextColor3 = Color3.fromRGB(255, 255, 255)
	value.TextSize = 14
	value.AnchorPoint = Vector2.new(0.5, 0.5)
	value.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	value.BorderColor3 = Color3.fromRGB(27, 42, 53)
	value.BorderSizePixel = 0
	value.Position = UDim2.fromScale(0.5, 0.5)
	value.Size = UDim2.fromOffset(170, 25)
	value.ZIndex = 9

	uICorner54 = Instance.new("UICorner")
	uICorner54.Name = "UICorner"
	uICorner54.CornerRadius = UDim.new(0, 5)
	uICorner54.Parent = value

	value.Parent = hex1

	hex1.Parent = pickerWidget

	pickerWidget.Parent = colorpicker1

	options4 = Instance.new("Frame")
	options4.Name = "Options"
	options4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	options4.BorderColor3 = Color3.fromRGB(0, 0, 0)
	options4.BorderSizePixel = 0
	options4.Size = UDim2.new(1, -200, 0, 0)

	uIListLayout14 = Instance.new("UIListLayout")
	uIListLayout14.Name = "UIListLayout"
	uIListLayout14.Padding = UDim.new(0, 5)
	uIListLayout14.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout14.Parent = options4

	picker = Instance.new("TextButton")
	picker.Name = "Picker"
	picker.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	picker.Text = "Color picker"
	picker.TextColor3 = Color3.fromRGB(255, 255, 255)
	picker.TextSize = 14
	picker.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	picker.BackgroundTransparency = 0.5
	picker.BorderColor3 = Color3.fromRGB(0, 0, 0)
	picker.BorderSizePixel = 0
	picker.Size = UDim2.new(1, 0, 0, 25)
	picker.ZIndex = 10

	uICorner55 = Instance.new("UICorner")
	uICorner55.Name = "UICorner"
	uICorner55.Parent = picker

	picker.Parent = options4

	picker1 = Instance.new("TextButton")
	picker1.Name = "Picker"
	picker1.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	picker1.Text = "Brick colors"
	picker1.TextColor3 = Color3.fromRGB(255, 255, 255)
	picker1.TextSize = 14
	picker1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	picker1.BackgroundTransparency = 0.5
	picker1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	picker1.BorderSizePixel = 0
	picker1.Size = UDim2.new(1, 0, 0, 25)
	picker1.ZIndex = 10

	uICorner56 = Instance.new("UICorner")
	uICorner56.Name = "UICorner"
	uICorner56.Parent = picker1

	picker1.Parent = options4

	options4.Parent = colorpicker1

	brickColors1 = Instance.new("Frame")
	brickColors1.Name = "BrickColors"
	brickColors1.Active = true
	brickColors1.AnchorPoint = Vector2.new(1, 0)
	brickColors1.BackgroundColor3 = Color3.fromRGB(0, 10, 16)
	brickColors1.BackgroundTransparency = 0.25
	brickColors1.BorderColor3 = Color3.fromRGB(27, 42, 53)
	brickColors1.BorderSizePixel = 0
	brickColors1.Position = UDim2.new(1, -5, 0, 0)
	brickColors1.Size = UDim2.fromOffset(190, 235)
	brickColors1.Visible = false
	brickColors1.ZIndex = 5

	uICorner57 = Instance.new("UICorner")
	uICorner57.Name = "UICorner"
	uICorner57.Parent = brickColors1

	scroller7 = Instance.new("ScrollingFrame")
	scroller7.Name = "Scroller"
	scroller7.AutomaticCanvasSize = Enum.AutomaticSize.Y
	scroller7.BottomImage = "rbxassetid://8082116996"
	scroller7.CanvasSize = UDim2.new()
	scroller7.MidImage = "rbxassetid://7488333553"
	scroller7.ScrollBarThickness = 5
	scroller7.TopImage = "rbxassetid://8082122989"
	scroller7.AnchorPoint = Vector2.new(0.5, 0)
	scroller7.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	scroller7.BackgroundTransparency = 1
	scroller7.BorderSizePixel = 0
	scroller7.Position = UDim2.new(0.5, 0, 0, 35)
	scroller7.Selectable = false
	scroller7.Size = UDim2.new(1, -10, 1, -40)
	scroller7.ZIndex = 6

	uIListLayout15 = Instance.new("UIListLayout")
	uIListLayout15.Name = "UIListLayout"
	uIListLayout15.Padding = UDim.new(0, 5)
	uIListLayout15.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout15.Parent = scroller7

	brickColor = Instance.new("Frame")
	brickColor.Name = "BrickColor"
	brickColor.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	brickColor.BorderColor3 = Color3.fromRGB(0, 0, 0)
	brickColor.BorderSizePixel = 0
	brickColor.Size = UDim2.new(1, -10, 0, 25)
	brickColor.ZIndex = 10

	colorPreview = Instance.new("Frame")
	colorPreview.Name = "ColorPreview"
	colorPreview.AnchorPoint = Vector2.new(1, 0.5)
	colorPreview.BackgroundColor3 = Color3.fromRGB(255, 0, 127)
	colorPreview.BorderColor3 = Color3.fromRGB(0, 0, 0)
	colorPreview.BorderSizePixel = 0
	colorPreview.Position = UDim2.new(1, -2, 0.5, 0)
	colorPreview.Size = UDim2.fromOffset(20, 20)
	colorPreview.ZIndex = 10

	uICorner58 = Instance.new("UICorner")
	uICorner58.Name = "UICorner"
	uICorner58.Parent = colorPreview

	colorPreview.Parent = brickColor

	textBox = Instance.new("TextBox")
	textBox.Name = "TextBox"
	textBox.ClearTextOnFocus = false
	textBox.CursorPosition = -1
	textBox.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	textBox.Text = "Test"
	textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	textBox.TextEditable = false
	textBox.TextSize = 13
	textBox.TextTruncate = Enum.TextTruncate.AtEnd
	textBox.TextXAlignment = Enum.TextXAlignment.Left
	textBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	textBox.BackgroundTransparency = 1
	textBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	textBox.BorderSizePixel = 0
	textBox.Position = UDim2.fromOffset(5, 0)
	textBox.Size = UDim2.new(1, -25, 1, 0)
	textBox.ZIndex = 10
	textBox.Parent = brickColor

	uICorner59 = Instance.new("UICorner")
	uICorner59.Name = "UICorner"
	uICorner59.Parent = brickColor

	brickColor.Parent = scroller7

	scroller7.Parent = brickColors1

	searchbar = Instance.new("Frame")
	searchbar.Name = "Searchbar"
	searchbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	searchbar.BackgroundTransparency = 1
	searchbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	searchbar.BorderSizePixel = 0
	searchbar.Size = UDim2.new(1, 0, 0, 30)

	box1 = Instance.new("TextBox")
	box1.Name = "Box"
	box1.CursorPosition = -1
	box1.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	box1.PlaceholderColor3 = Color3.fromRGB(200, 200, 200)
	box1.PlaceholderText = "Search here"
	box1.Text = ""
	box1.TextColor3 = Color3.fromRGB(255, 255, 255)
	box1.TextSize = 12
	box1.TextTruncate = Enum.TextTruncate.AtEnd
	box1.TextXAlignment = Enum.TextXAlignment.Left
	box1.AnchorPoint = Vector2.new(0, 0.5)
	box1.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	box1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	box1.BorderSizePixel = 0
	box1.Position = UDim2.new(0, 5, 0.5, 0)
	box1.Size = UDim2.new(1, -10, 1, -10)
	box1.ZIndex = 10

	uICorner60 = Instance.new("UICorner")
	uICorner60.Name = "UICorner"
	uICorner60.Parent = box1

	uIPadding16 = Instance.new("UIPadding")
	uIPadding16.Name = "UIPadding"
	uIPadding16.PaddingBottom = UDim.new(0, 5)
	uIPadding16.PaddingLeft = UDim.new(0, 5)
	uIPadding16.PaddingRight = UDim.new(0, 25)
	uIPadding16.PaddingTop = UDim.new(0, 5)
	uIPadding16.Parent = box1

	box1.Parent = searchbar

	imageLabel12 = Instance.new("ImageLabel")
	imageLabel12.Name = "ImageLabel"
	imageLabel12.Image = "http://www.roblox.com/asset/?id=6031154871"
	imageLabel12.AnchorPoint = Vector2.new(1, 0.5)
	imageLabel12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	imageLabel12.BackgroundTransparency = 1
	imageLabel12.BorderColor3 = Color3.fromRGB(0, 0, 0)
	imageLabel12.BorderSizePixel = 0
	imageLabel12.Position = UDim2.new(1, -10, 0.5, 0)
	imageLabel12.Size = UDim2.fromOffset(20, 20)
	imageLabel12.ZIndex = 10
	imageLabel12.Parent = searchbar

	searchbar.Parent = brickColors1

	brickColors1.Parent = colorpicker1

	colorpicker1.Parent = dropdown5

	dropdown5.Parent = colorpicker

	colorpicker.Parent = scroller6

	scroller6.Parent = help1

	help1.Parent = pages

	pages.Parent = settings

	settings.Parent = chat

	saveChat = Instance.new("Frame")
	saveChat.Name = "SaveChat"
	saveChat.AnchorPoint = Vector2.new(0.5, 0.5)
	saveChat.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	saveChat.BackgroundTransparency = 0.5
	saveChat.BorderSizePixel = 0
	saveChat.Position = UDim2.fromScale(0.5, -1.5)
	saveChat.Size = UDim2.fromOffset(150, 240)

	container5 = Instance.new("ScrollingFrame")
	container5.Name = "Container"
	container5.BottomImage = "rbxassetid://8082116996"
	container5.CanvasSize = UDim2.new()
	container5.MidImage = "rbxassetid://7488333553"
	container5.ScrollBarThickness = 5
	container5.TopImage = "rbxassetid://8082122989"
	container5.AnchorPoint = Vector2.new(0.5, 1)
	container5.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	container5.BackgroundTransparency = 1
	container5.BorderSizePixel = 0
	container5.Position = UDim2.new(0.5, 0, 1, -5)
	container5.Selectable = false
	container5.Size = UDim2.new(0, 140, 1, -45)

	uIListLayout16 = Instance.new("UIListLayout")
	uIListLayout16.Name = "UIListLayout"
	uIListLayout16.Padding = UDim.new(0, 2)
	uIListLayout16.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout16.Parent = container5

	slot = Instance.new("TextButton")
	slot.Name = "Slot"
	slot.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	slot.Text = "Slot 0"
	slot.TextColor3 = Color3.fromRGB(255, 255, 255)
	slot.TextSize = 14
	slot.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	slot.BorderSizePixel = 0
	slot.Size = UDim2.new(1, -10, 0, 25)

	uICorner61 = Instance.new("UICorner")
	uICorner61.Name = "UICorner"
	uICorner61.Parent = slot

	slot.Parent = container5

	container5.Parent = saveChat

	uICorner62 = Instance.new("UICorner")
	uICorner62.Name = "UICorner"
	uICorner62.Parent = saveChat

	header = Instance.new("Frame")
	header.Name = "Header"
	header.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	header.BackgroundTransparency = 1
	header.ClipsDescendants = true
	header.Size = UDim2.new(1, 0, 0, 35)

	uI2 = Instance.new("Frame")
	uI2.Name = "UI"
	uI2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	uI2.Size = UDim2.fromScale(1, 1)

	close1 = Instance.new("TextButton")
	close1.Name = "Close"
	close1.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
	close1.Text = ""
	close1.TextColor3 = Color3.fromRGB(0, 0, 0)
	close1.TextSize = 14
	close1.AnchorPoint = Vector2.new(1, 0)
	close1.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	close1.BackgroundTransparency = 1
	close1.BorderSizePixel = 0
	close1.Position = UDim2.new(1, -5, 0, 5)
	close1.Size = UDim2.fromOffset(25, 25)
	close1.ZIndex = 5

	imageLabel13 = Instance.new("ImageLabel")
	imageLabel13.Name = "ImageLabel"
	imageLabel13.Image = "http://www.roblox.com/asset/?id=6031094678"
	imageLabel13.AnchorPoint = Vector2.new(0.5, 0.5)
	imageLabel13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	imageLabel13.BackgroundTransparency = 1
	imageLabel13.Position = UDim2.fromScale(0.5, 0.5)
	imageLabel13.Size = UDim2.fromOffset(20, 20)
	imageLabel13.ZIndex = 6
	imageLabel13.Parent = close1

	uICorner63 = Instance.new("UICorner")
	uICorner63.Name = "UICorner"
	uICorner63.Parent = close1

	close1.Parent = uI2

	title13 = Instance.new("TextLabel")
	title13.Name = "Title"
	title13.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Bold,
		Enum.FontStyle.Normal
	)
	title13.Text = "Save Chat"
	title13.TextColor3 = Color3.fromRGB(255, 255, 255)
	title13.TextSize = 14
	title13.TextXAlignment = Enum.TextXAlignment.Left
	title13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title13.BackgroundTransparency = 1
	title13.Position = UDim2.fromOffset(5, 5)
	title13.Size = UDim2.new(1, 0, 0, 25)
	title13.ZIndex = 8
	title13.Parent = uI2

	uI2.Parent = header

	header.Parent = saveChat

	saveChat.Parent = chat
	return chat
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
