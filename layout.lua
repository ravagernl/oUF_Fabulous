local addonName, ns = ...
local oUF = oUF
local Debug = ns.Debug
local config = ns.config
local units = ns.units
local type2size = config.type2size

ns.layout = function(self, unit, isSingle)
	if self:GetParent():GetAttribute("useOwnerUnit") then
		local suffix = self:GetParent():GetAttribute("unitsuffix")
		self:SetAttribute("useOwnerUnit", true)
		self:SetAttribute("unitsuffix", suffix)
		unit = unit .. suffix
	end
	if units[unit] then
		self.layoutType = unit
	elseif units[unit:gsub('%d+','')] then
		-- remove numerics (ie boss1)
		self.layoutType = unit:gsub('%d+','')
	end

	if not isSingle then
		-- TODO: party/raid frames!
	end

	local settings = config[self.layoutType
		and type2size[self.layoutType]
		or 'normal']
	self.settings = settings

	local height, width = settings.width, settings.height
	self:SetSize(height, width)

	-- Some shared stuff.
	local hp = ns.CreateStatusBar(self)
	hp:SetPoint'TOPLEFT'
	hp:SetPoint'RIGHT'
	hp:SetHeight(settings.health * height)

	self.Health = hp

	local pp = ns.CreateStatusBar(self)
	pp:SetPoint'LEFT'
	pp:SetPoint'RIGHT'
	pp:SetPoint('TOP', hp, 'BOTTOM', 0, 1)
	pp:SetHeight( (settings.power - 1) * height)

	self.Power = pp

	if self.layoutType and units[self.layoutType] then
		return units[self.layoutType](self, unit)
	end
	return self
end
ns.units = {}