local addonName, ns = ...
local oUF = oUF
local Debug = ns.Debug
local config = ns.config
local units = ns.units
local type2size = config.type2size

ns.layout = function(self, unit, isSingle)
	self.layoutType = nil
	if isSingle then
		if units[unit] then
			self.layoutType = unit
		elseif units[unit:gsub('%d+','')] then --boss1 -> boss
			self.layoutType = unit:gsub('%d+','')
		end
	end

	local layoutSize = config[self.layoutType
		and type2size[self.layoutType]
		or 'normal']

	self:SetSize(layoutSize.w, layoutSize.h)

	-- Some shared stuff.
	local health = ns.CreateStatusBar(self, 12)
	health:SetPoint'TOPLEFT'
	health:SetPoint'BOTTOMRIGHT'

	self.Health = health

	if self.layoutType and units[self.layoutType] then
		return units[self.layoutType](self, unit)
	end
	return self
end

oUF:RegisterStyle(addonName, ns.layout)