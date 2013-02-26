local addonName, ns = ...
local oUF = oUF
local strformat = string.format

local nofunc = function() end

--[[
	Debug function
]]
do
	local debugf = tekDebug and tekDebug:GetFrame(addonName)
	if debugf then
		ns.Debug = function(msg, ...) debugf:AddMessage(strformat(msg, ...)) end
	else
		ns.Debug = nofunc
	end
end