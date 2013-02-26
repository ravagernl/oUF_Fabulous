local addonName, ns = ...
local oUF = oUF

local config = {
	statusbar = [[Interface\TargetingFrame\UI-StatusBar]],
	font = GameFontNormal:GetFont(),

	big = { w = 200, h = 40},
	normal = { w = 150, h = 40},
	small = { w = 80, h = 40},
	tiny = { w = 40, h = 40},

	type2size = {
		player = 'big',
		target = 'big',
		focus = 'big',
		party = 'big',

		partypet = 'small',
		partytarget = 'small',
		raid15 = 'small',

		raid25 = 'tiny',
		raid40 = 'tiny',

		-- the rest of the frames will get normal size (such as pet)
	}
}

ns.config = config