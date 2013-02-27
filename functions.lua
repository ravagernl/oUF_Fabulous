local addonName, ns = ...
local oUF = oUF
local strformat = string.format
local strlower = string.lower
local strupper = string.upper
local strjoin = string.join

local nofunc = function() end

--[[----------------------------------------------------------------------------
	Debug function
------------------------------------------------------------------------------]]
do
	local debugf = tekDebug and tekDebug:GetFrame(addonName)
	if debugf then
		ns.Debug = function(...) debugf:AddMessage(strjoin(..., ', ')) end
	else
		ns.Debug = nofunc
	end
end

--[[----------------------------------------------------------------------------
	StatusBars + FontStrings shortcuts (from oUF_Phanx)
------------------------------------------------------------------------------]]
function ns.SetStatusBarValue(self, cur)
	local min, max = self:GetMinMaxValues()
	self:GetStatusBarTexture():SetTexCoord(0, (cur - min) / (max - min), 0, 1)
	self.orig_SetValue(self, cur)
end

function ns.CreateStatusBar(parent, statusbar, size, justify, nohook)
	local sb = CreateFrame("StatusBar", nil, parent)
	sb:SetStatusBarTexture(statusbar or ns.config.statusbar
		or [[Interface\TargetingFrame\UI-StatusBar]])
	sb:GetStatusBarTexture():SetDrawLayer("BORDER")
	sb:GetStatusBarTexture():SetHorizTile(false)
	sb:GetStatusBarTexture():SetVertTile(false)

	sb.bg = sb:CreateTexture(nil, "BACKGROUND")
	sb.bg:SetTexture(ns.config.statusbar)
	sb.bg:SetAllPoints(true)

	if size then
		sb.value = ns.CreateFontString(sb, size, justify)
	end

	if not nohook then
		sb.orig_SetValue = sb.SetValue
		sb.SetValue = ns.SetStatusBarValue
	end

	return sb
end

function ns.CreateFontString(parent, size, justify)
	local fs = parent:CreateFontString(nil, "OVERLAY")
	fs:SetFont(ns.config.font, size or 12, ns.config.fontOutline)
	fs:SetJustifyH(justify or "LEFT")
	fs:SetShadowOffset(1, -1)

	return fs
end
