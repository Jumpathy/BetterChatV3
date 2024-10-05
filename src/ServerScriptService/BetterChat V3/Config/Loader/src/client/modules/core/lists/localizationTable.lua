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