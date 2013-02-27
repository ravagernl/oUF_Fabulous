local addonName, ns = ...
local oUF = oUF
local pairs = pairs
local strupper = string.upper
local strlower = string.lower

local ui = UIParent

oUF:Factory(function(self)
    local player = self:Spawn('player', addonName..'_player')
    player:SetPoint('RIGHT', ui, 'BOTTOM', -300, 200)

    local target = self:Spawn('target', addonName..'_target')
    target:SetPoint('LEFT', ui, 'BOTTOM', 300, 200)
end)