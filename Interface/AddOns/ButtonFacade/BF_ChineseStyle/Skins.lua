-- HelloKitty

local LBF = LibStub("LibButtonFacade", true)
if not LBF then
	return
end

LBF:AddSkin("ChineseStyle", {
	Shape = "Square",
    Masque_Version = 40200,
	-- Skin data start.
	Backdrop = {
		Width = 40,
		Height = 40,
		Texture = [[Interface\AddOns\ButtonFacade\BF_ChineseStyle\Textures\HKittyBase]],
	},
	Icon = {
		Width = 36,
		Height = 36,
	},
	Flash = {
		Width = 30,
		Height = 30,
		Texture = [[Interface\AddOns\ButtonFacade\BF_ChineseStyle\Textures\overlayred]],
	},
	Cooldown = {
		Width = 36,
		Height = 36,
	},
	AutoCast = {
		Width = 30,
		Height = 30,
		AboveNormal = true,
	},
	Normal = {
		Width = 40,
		Height = 40,
		Static = true,
		OffsetX = 2,
		OffsetY = -2,
		Texture = [[Interface\AddOns\ButtonFacade\BF_ChineseStyle\Textures\HKittyBase]],
	},
	Pushed = {
		Width = 37,
		Height = 37,
		BlendMode = "ADD",
		OffsetX = -0.5,
		Texture = [[Interface\Buttons\UI-Quickslot-Depress]],

	},
	Border = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		OffsetX = 2,
		OffsetY = -2,
		Texture = [[Interface\AddOns\ButtonFacade\BF_ChineseStyle\Textures\HKittyBase]],
	},
	Disabled = {
		Hide = true,
	},
	Checked = {
		Width = 34,
		Height = 34,
		BlendMode = "ADD",
		Texture = [[Interface\Buttons\CheckButtonHilight]],
	},
	AutoCastable = {
		Width = 57,
		Height = 62,
		OffsetX = 0.5,
		OffsetY = -0.5,
	},
	Highlight = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		OffsetX = 2,
		OffsetY = -2,
		Texture = [[Interface\AddOns\ButtonFacade\BF_ChineseStyle\Textures\HKittyBase]],
	},
	Gloss = {
		Width = 40,
		Height = 40,
	},
	HotKey = {
		Width = 36,
		Height = 7,
		OffsetX = -6,
		OffsetY = -3,
	},
	Count = {
		Width = 44,
		Height = 10,
		--OffsetX = 4,
		OffsetY = 2,
	},
	Name = {
		Width = 20,
		Height = 7,
		OffsetY = 2,
	},
	-- Skin data end.
	Regions = {
		-- OffsetY = -5,
		-- Texture = [[Interface\AddOns\ButtonFacade\BF_ChineseStyle\Textures\MainMenuBarBG]],
	},
	LeftCap = {
		Texture = [[Interface\AddOns\ButtonFacade\BF_ChineseStyle\Textures\dragoncap]],
		OffsetX = -447,
		OffsetY = -30,
		Width = 256,
		Height = 128,
		
	},
	RightCap = {
		Texture = [[Interface\AddOns\ButtonFacade\BF_ChineseStyle\Textures\dragoncap]],
		OffsetX = 447,
		OffsetY = -30,
		Width = 256,
		Height = 128,
	},
}, true)

