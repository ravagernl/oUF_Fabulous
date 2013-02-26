local addonName, ns = ...
local oUF = oUF

oUF:RegisterStyle(addonName, ns.layout)
oUF:Factory(function(self)
     self:SetActiveStyle(addonName)
     self:Spawn("player"):SetPoint("CENTER")
end)