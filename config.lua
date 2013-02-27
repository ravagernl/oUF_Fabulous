local addonName, ns = ...
local oUF = oUF

local config = {
	statusbar = [[Interface\TargetingFrame\UI-StatusBar]],
	font = GameFontNormal:GetFont(),

	big = { width = 200, height = 50, health = 20 / 50, power = 10 / 50},
	normal = { width = 200, height = 40, health = 30 / 40, power = 10 / 40},
	small = { width = 80, height = 25, health = 20 / 25, power = 5 / 25},
	tiny = { width = 30, height = 30, health = 28 / 30, power = 2 / 30},

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