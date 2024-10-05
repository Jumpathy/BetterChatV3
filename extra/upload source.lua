local studioService = game:GetService("StudioService")
local file = studioService:PromptImportFile({"rbxmx"})
local httpService = game:GetService("HttpService")

local HttpService = game:GetService("HttpService")

local SEQ = {
	[0] = "A", "B", "C", "D", "E", "F", "G", "H",
	"I", "J", "K", "L", "M", "N", "O", "P",
	"Q", "R", "S", "T", "U", "V", "W", "X",
	"Y", "Z", "a", "b", "c", "d", "e", "f",
	"g", "h", "i", "j", "k", "l", "m", "n",
	"o", "p", "q", "r", "s", "t", "u", "v",
	"w", "x", "y", "z", "0", "1", "2", "3",
	"4", "5", "6", "7", "8", "9", "+", "/",
}

local STRING_FAST = {}
local INDEX = {[61] = 0, [65] = 0}

for key, val in ipairs(SEQ) do
	-- memoization
	INDEX[string.byte(val)] = key
end

-- string.char has a MASSIVE overhead, its faster to precompute
-- the values for performance
for i = 0, 255 do
	local c = string.char(i)
	STRING_FAST[i] = c
end

local b64 = {}

function b64.encode(str)
	local len = string.len(str)
	local output = table.create(math.ceil(len/4)*4)
	local index = 1

	for i = 1, len, 3 do
		local b0, b1, b2 = string.byte(str, i, i + 2)
		local b = bit32.lshift(b0, 16) + bit32.lshift(b1 or 0, 8) + (b2 or 0)

		output[index] = SEQ[bit32.extract(b, 18, 6)]
		output[index + 1] = SEQ[bit32.extract(b, 12, 6)]
		output[index + 2] = b1 and SEQ[bit32.extract(b, 6, 6)] or "="
		output[index + 3] = b2 and SEQ[bit32.band(b, 63)] or "="

		index += 4
	end

	return table.concat(output)
end

function b64.decode(hash)
	-- given a 24 bit word (4 6-bit letters), decode 3 bytes from it
	local len = string.len(hash)
	local output = table.create(len * 0.75)

	local index = 1
	for i = 1, len, 4 do
		local c0, c1, c2, c3 = string.byte(hash, i, i + 3)

		local b = 
			bit32.lshift(INDEX[c0], 18)
			+ bit32.lshift(INDEX[c1], 12)
			+ bit32.lshift(INDEX[c2], 6)
			+ (INDEX[c3])


		output[index] = STRING_FAST[bit32.extract(b, 16, 8)]
		output[index + 1] = c2 ~= "=" and STRING_FAST[bit32.extract(b, 8, 8)] or "="
		output[index + 2] = c3 ~= "=" and STRING_FAST[bit32.band(b, 0xFF)] or "="
		index += 3
	end

	return table.concat(output)
end

local function getFileSHA(owner, repo, path, token)
	local url = string.format("https://api.github.com/repos/%s/%s/contents/%s", owner, repo, path)

	local headers = {
		["Authorization"] = "token " .. token,
		["Accept"] = "application/vnd.github.v3+json"
	}

	local success, response = pcall(function()
		return HttpService:RequestAsync({
			Url = url,
			Method = "GET",
			Headers = headers
		})
	end)

	if success and response.StatusCode == 200 then
		local data = HttpService:JSONDecode(response.Body)
		return data.sha
	else
		warn("Failed to get file SHA:", response)
		return nil
	end
end

local function updateGithubFile(owner, repo, path, content, token)
	local sha = getFileSHA(owner, repo, path, token)
	if not sha then
		return false
	end

	local url = string.format("https://api.github.com/repos/%s/%s/contents/%s", owner, repo, path)

	local headers = {
		["Authorization"] = "token " .. token,
		["Accept"] = "application/vnd.github.v3+json"
	}

	local data = {
		message = "Update file via Roblox",
		content = b64.encode(content),
		sha = sha
	}

	local success, response = pcall(function()
		return HttpService:RequestAsync({
			Url = url,
			Method = "PUT",
			Headers = headers,
			Body = HttpService:JSONEncode(data)
		})
	end)

	if success and response.StatusCode == 200 then
		print("File updated successfully")
		return true
	else
		warn("Failed to update file:", response)
		return false
	end
end

-- Usage example:
local upload = function(text)
	local owner = "Jumpathy"
	local repo = "BetterChatV3"
	local path = "extra/source_encoded"
	local token = "" -- nuh-uh
	updateGithubFile(owner, repo, path, text, token)
end

if file then
	local content = file:GetBinaryContents()
	local compressed = require(6598757206).compress(content)
	
	upload(compressed)
end
