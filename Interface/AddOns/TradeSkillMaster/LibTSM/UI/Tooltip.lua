-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                          https://tradeskillmaster.com                          --
--    All Rights Reserved - Detailed license information included with addon.     --
-- ------------------------------------------------------------------------------ --

--- UI tooltip functions.
-- @module Tooltip

local _, TSM = ...
local Tooltip = TSM.Init("UI.Tooltip")
local ItemString = TSM.Include("Util.ItemString")
local Vararg = TSM.Include("Util.Vararg")
local Event = TSM.Include("Util.Event")
local ItemInfo = TSM.Include("Service.ItemInfo")
local private = {
	currentParent = nil,
	registeredEvent = false,
}



-- ============================================================================
-- Module Functions
-- ============================================================================

--- Shows a tooltip which is anchored to the frame.
-- @tparam Frame parent The parent and anchor frame for the tooltip
-- @tparam ?number|string|function data The tooltip information which can be either an itemId,
-- itemString, raw text string, or function which returns one of the other options
-- @tparam ?boolean noWrapping Disables wrapping of text lines
-- @tparam[opt=0] number xOffset An extra x offset to apply to the anchor of the tooltip
function Tooltip.Show(parent, data, noWrapping, xOffset)
	if not data then
		return
	elseif type(data) == "function" then
		local funcNoWrapping, funcXOffset = false, 0
		data, funcNoWrapping, funcXOffset = data()
		noWrapping = noWrapping or funcNoWrapping
		xOffset = xOffset or funcXOffset
	end
	local showCompare = false
	GameTooltip:SetOwner(parent, "ANCHOR_PRESERVE")
	GameTooltip:ClearAllPoints()
	GameTooltip:SetPoint("LEFT", parent, "RIGHT", xOffset or 0, 0)
	if type(data) == "number" then
		GameTooltip:SetHyperlink("item:"..data)
		showCompare = true
	elseif type(data) == "string" and strfind(data, "^craft:") then
		data = strmatch(data, "craft:(%d+)")
		GameTooltip:SetCraftSpell(tonumber(data))
	elseif type(data) == "string" and strfind(data, "^enchant:") then
		GameTooltip:SetHyperlink(data)
	elseif type(data) == "string" and strfind(data, "^currency:") then
		GameTooltip:SetCurrencyByID(strmatch(data, "currency:(%d+)"))
	elseif type(data) == "string" and (strfind(data, "^\124c.+\124Hitem:") or ItemString.IsItem(data)) then
		GameTooltip:SetHyperlink(ItemInfo.GetLink(data))
		showCompare = true
	elseif type(data) == "string" and (strfind(data, "^\124c.+\124Hbattlepet:") or ItemString.IsPet(data)) then
		if strmatch(data, "p:") then
			data = ItemInfo.GetLink(data)
		end
		local _, speciesID, level, breedQuality, maxHealth, power, speed = strsplit(":", data)
		BattlePetToolTip_Show(tonumber(speciesID), tonumber(level) or 0, tonumber(breedQuality) or 0, tonumber(maxHealth) or 0, tonumber(power) or 0, tonumber(speed) or 0, gsub(gsub(data, "^(.*)%[", ""), "%](.*)$", ""))
	else
		for _, line in Vararg.Iterator(strsplit("\n", data)) do
			local textLeft, textRight = strsplit(TSM.CONST.TOOLTIP_SEP, line)
			if textRight then
				GameTooltip:AddDoubleLine(textLeft, textRight, 1, 1, 1, 1, 1, 1)
			else
				GameTooltip:AddLine(textLeft, 1, 1, 1, not noWrapping)
			end
		end
	end
	GameTooltip:Show()
	private.currentParent = parent
	if showCompare then
		assert(not private.registeredEvent)
		private.registeredEvent = true
		Event.Register("MODIFIER_STATE_CHANGED", private.UpdateCompareState)
		private.UpdateCompareState()
	end
end

--- Hides the current tooltip.
function Tooltip.Hide()
	if private.registeredEvent then
		Event.Unregister("MODIFIER_STATE_CHANGED", private.UpdateCompareState)
		private.registeredEvent = false
	end
	private.currentParent = nil
	GameTooltip:SetOwner(UIParent, "ANCHOR_PRESERVE")
	GameTooltip:ClearAllPoints()
	GameTooltip:SetPoint("CENTER")
	GameTooltip:Hide()
	if not TSM.IsWowClassic() then
		BattlePetTooltip:ClearAllPoints()
		BattlePetTooltip:SetPoint("CENTER")
		BattlePetTooltip:Hide()
	end
end

--- Checks if the tooltip is visible.
-- @tparam[opt=nil] table frame An optional parent frame to check against
-- @treturn boolean Whether or not the tooltip is visible
function Tooltip.IsVisible(frame)
	if frame then
		return private.currentParent == frame
	else
		return private.currentParent and true or false
	end
end



-- ============================================================================
-- Private Helper Functions
-- ============================================================================

function private.UpdateCompareState()
	if private.currentParent and GameTooltip:IsVisible() and IsShiftKeyDown() and not GameTooltip:IsEquippedItem() then
		GameTooltip_ShowCompareItem(GameTooltip)
	else
		GameTooltip_HideShoppingTooltips(GameTooltip)
	end
end
