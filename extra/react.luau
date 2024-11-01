local React = require(workspace.Roact.React)

local messageElement = React.createElement("Frame", {
	AutomaticSize = Enum.AutomaticSize.Y,
	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	BackgroundTransparency = 1,
	Size = UDim2.new(1, 0, 0, 16),
}, {
	raw = React.createElement("TextLabel", {
		AnchorPoint = Vector2.new(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		FontFace = Font.new(
			"rbxasset://fonts/families/GothamSSm.json",
			Enum.FontWeight.Medium,
			Enum.FontStyle.Normal
		),
		Position = UDim2.fromScale(1, 0),
		RichText = true,
		Size = UDim2.new(1, 0, 0, 16),
		Text = "Hello, world!",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 15,
		TextStrokeTransparency = 0.9,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left,
		ZIndex = 2,
	}, {
		user = React.createElement("TextButton", {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			FontFace = Font.new(
				"rbxasset://fonts/families/GothamSSm.json",
				Enum.FontWeight.Medium,
				Enum.FontStyle.Normal
			),
			RichText = true,
			Size = UDim2.fromOffset(0, 16),
			TextColor3 = Color3.fromRGB(0, 0, 0),
			TextSize = 15,
			TextTransparency = 1,
			TextWrapped = true,
		}),

		uIPadding = React.createElement("UIPadding"),
	}),

	icon = React.createElement("ImageLabel", {
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromOffset(15, 15),
		Visible = false,
		ZIndex = 2,
	}),

	mentioned = React.createElement("Frame", {
		BackgroundColor3 = Color3.fromRGB(255, 170, 0),
		BackgroundTransparency = 0.75,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1),
		Visible = false,
	}, {
		ignore = React.createElement("UICorner", {
			CornerRadius = UDim.new(0, 4),
		}),

		bar = React.createElement("Frame", {
			BackgroundColor3 = Color3.fromRGB(255, 170, 0),
			BorderSizePixel = 0,
			Size = UDim2.fromOffset(5, 16),
		}, {
			uICorner = React.createElement("UICorner", {
				CornerRadius = UDim.new(0, 4),
			}),
		}),
	}),

	edit = React.createElement("TextBox", {
		Active = false,
		AnchorPoint = Vector2.new(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		ClearTextOnFocus = false,
		FontFace = Font.new(
			"rbxasset://fonts/families/GothamSSm.json",
			Enum.FontWeight.Medium,
			Enum.FontStyle.Normal
		),
		Position = UDim2.fromScale(1, 0),
		Selectable = false,
		Size = UDim2.new(1, 0, 0, 16),
		Text = "",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 15,
		TextStrokeTransparency = 0.9,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left,
		Visible = false,
	}),
})
