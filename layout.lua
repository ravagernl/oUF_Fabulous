local addonName, ns = ...
local oUF = oUF

ns.layout = function(self, unit)
	-- Shared layout code.

	if ns.layoutUnits[unit] then
		return ns.layoutUnits[unit](self, unit)
	end
end