﻿local BFChat = LibStub('AceAddon-3.0'):GetAddon('BigFootChat')
local L = LibStub("AceLocale-3.0"):GetLocale("BigFootChat")
local MODNAME = "ICONFRAME"
local BFChatIconFrame = BFChat:NewModule(MODNAME)
local BFC_NUM_TAB = 60
local BFC_ICON_SIZE_X = 25
local BFC_ICON_SIZE_Y = 25
local BFC_ICON_NUMBER_X = 10
local BFC_ICON_NUMBER_Y = 6
local chaticonbuttonlist = {}
BFC_IconTable = {
    {"{rt1}", "Interface\\TargetingFrame\\UI-RaidTargetingIcon_1"},
    {"{rt2}", "Interface\\TargetingFrame\\UI-RaidTargetingIcon_2"},
    {"{rt3}", "Interface\\TargetingFrame\\UI-RaidTargetingIcon_3"},
    {"{rt4}", "Interface\\TargetingFrame\\UI-RaidTargetingIcon_4"},
    {"{rt5}", "Interface\\TargetingFrame\\UI-RaidTargetingIcon_5"},
    {"{rt6}", "Interface\\TargetingFrame\\UI-RaidTargetingIcon_6"},
    {"{rt7}", "Interface\\TargetingFrame\\UI-RaidTargetingIcon_7"},
    {"{rt8}", "Interface\\TargetingFrame\\UI-RaidTargetingIcon_8"},
    {"{" .. L.Angel .. "}", "Interface\\AddOns\\BigFootChat\\icon\\angel.tga"},
    {"{" .. L.Angry .. "}", "Interface\\AddOns\\BigFootChat\\icon\\angry.tga"},
    {
        "{" .. L.Biglaugh .. "}",
        "Interface\\AddOns\\BigFootChat\\icon\\biglaugh.tga"
    }, {"{" .. L.Clap .. "}", "Interface\\AddOns\\BigFootChat\\icon\\clap.tga"},
    {"{" .. L.Cool .. "}", "Interface\\AddOns\\BigFootChat\\icon\\cool.tga"},
    {"{" .. L.Cry .. "}", "Interface\\AddOns\\BigFootChat\\icon\\cry.tga"},
    {"{" .. L.Cute .. "}", "Interface\\AddOns\\BigFootChat\\icon\\cutie.tga"},
    {
        "{" .. L.Despise .. "}",
        "Interface\\AddOns\\BigFootChat\\icon\\despise.tga"
    }, {
        "{" .. L.Dreamsmile .. "}",
        "Interface\\AddOns\\BigFootChat\\icon\\dreamsmile.tga"
    }, {
        "{" .. L.Embarras .. "}",
        "Interface\\AddOns\\BigFootChat\\icon\\embarrass.tga"
    }, {"{" .. L.Evil .. "}", "Interface\\AddOns\\BigFootChat\\icon\\evil.tga"},
    {
        "{" .. L.Excited .. "}",
        "Interface\\AddOns\\BigFootChat\\icon\\excited.tga"
    },
    {"{" .. L.Faint .. "}", "Interface\\AddOns\\BigFootChat\\icon\\faint.tga"},
    {"{" .. L.Fight .. "}", "Interface\\AddOns\\BigFootChat\\icon\\fight.tga"},
    {"{" .. L.Flu .. "}", "Interface\\AddOns\\BigFootChat\\icon\\flu.tga"},
    {"{" .. L.Freeze .. "}", "Interface\\AddOns\\BigFootChat\\icon\\freeze.tga"},
    {"{" .. L.Frown .. "}", "Interface\\AddOns\\BigFootChat\\icon\\frown.tga"},
    {"{" .. L.Greet .. "}", "Interface\\AddOns\\BigFootChat\\icon\\greet.tga"},
    {
        "{" .. L.Grimace .. "}",
        "Interface\\AddOns\\BigFootChat\\icon\\grimace.tga"
    },
    {"{" .. L.Growl .. "}", "Interface\\AddOns\\BigFootChat\\icon\\growl.tga"},
    {"{" .. L.Happy .. "}", "Interface\\AddOns\\BigFootChat\\icon\\happy.tga"},
    {"{" .. L.Heart .. "}", "Interface\\AddOns\\BigFootChat\\icon\\heart.tga"},
    {"{" .. L.Horror .. "}", "Interface\\AddOns\\BigFootChat\\icon\\horror.tga"},
    {"{" .. L.Ill .. "}", "Interface\\AddOns\\BigFootChat\\icon\\ill.tga"}, {
        "{" .. L.Innocent .. "}",
        "Interface\\AddOns\\BigFootChat\\icon\\innocent.tga"
    },
    {"{" .. L.Kongfu .. "}", "Interface\\AddOns\\BigFootChat\\icon\\kongfu.tga"},
    {"{" .. L.Love .. "}", "Interface\\AddOns\\BigFootChat\\icon\\love.tga"},
    {"{" .. L.Mail .. "}", "Interface\\AddOns\\BigFootChat\\icon\\mail.tga"},
    {"{" .. L.Makeup .. "}", "Interface\\AddOns\\BigFootChat\\icon\\makeup.tga"},
    {"{" .. L.Mario .. "}", "Interface\\AddOns\\BigFootChat\\icon\\mario.tga"},
    {
        "{" .. L.Meditate .. "}",
        "Interface\\AddOns\\BigFootChat\\icon\\meditate.tga"
    }, {
        "{" .. L.Miserable .. "}",
        "Interface\\AddOns\\BigFootChat\\icon\\miserable.tga"
    }, {"{" .. L.Okay .. "}", "Interface\\AddOns\\BigFootChat\\icon\\okay.tga"},
    {"{" .. L.Pretty .. "}", "Interface\\AddOns\\BigFootChat\\icon\\pretty.tga"},
    {"{" .. L.Puke .. "}", "Interface\\AddOns\\BigFootChat\\icon\\puke.tga"},
    {"{" .. L.Shake .. "}", "Interface\\AddOns\\BigFootChat\\icon\\shake.tga"},
    {"{" .. L.Shout .. "}", "Interface\\AddOns\\BigFootChat\\icon\\shout.tga"},
    {"{" .. L.Silent .. "}", "Interface\\AddOns\\BigFootChat\\icon\\shuuuu.tga"},
    {"{" .. L.Shy .. "}", "Interface\\AddOns\\BigFootChat\\icon\\shy.tga"},
    {"{" .. L.Sleep .. "}", "Interface\\AddOns\\BigFootChat\\icon\\sleep.tga"},
    {"{" .. L.Smile .. "}", "Interface\\AddOns\\BigFootChat\\icon\\smile.tga"},
    {
        "{" .. L.Suprise .. "}",
        "Interface\\AddOns\\BigFootChat\\icon\\suprise.tga"
    }, {
        "{" .. L.Surrender .. "}",
        "Interface\\AddOns\\BigFootChat\\icon\\surrender.tga"
    },
    {"{" .. L.Sweat .. "}", "Interface\\AddOns\\BigFootChat\\icon\\sweat.tga"},
    {"{" .. L.Tear .. "}", "Interface\\AddOns\\BigFootChat\\icon\\tear.tga"},
    {"{" .. L.Tears .. "}", "Interface\\AddOns\\BigFootChat\\icon\\tears.tga"},
    {"{" .. L.Think .. "}", "Interface\\AddOns\\BigFootChat\\icon\\think.tga"},
    {"{" .. L.Titter .. "}", "Interface\\AddOns\\BigFootChat\\icon\\titter.tga"},
    {"{" .. L.Ugly .. "}", "Interface\\AddOns\\BigFootChat\\icon\\ugly.tga"},
    {
        "{" .. L.Victory .. "}",
        "Interface\\AddOns\\BigFootChat\\icon\\victory.tga"
    }, {
        "{" .. L.Volunteer .. "}",
        "Interface\\AddOns\\BigFootChat\\icon\\volunteer.tga"
    },
    {
        "{" .. L.Wronged .. "}",
        "Interface\\AddOns\\BigFootChat\\icon\\wronged.tga"
    }
}
local db
local defaults = {profile = {enablechaticon = false}}
local optGetter, optSetter
do
    local mod = BFChatIconFrame
    function optGetter(info)
        local key = info[#info]
        return BFChat.db.profile[key]
    end
    function optSetter(info, value)
        local key = info[#info]
        BFChat.db.profile[key] = value
        mod:Refresh()
    end
end
local options
local getOptions = function()
    if not options then
        options = {
            type = "group",
            name = L["IconFrame"],
            arg = MODNAME,
            get = optGetter,
            set = optSetter,
            args = {
                intro = {
                    order = 1,
                    type = "description",
                    name = L["this function allows you to use emtion icons in your chat, and others who has this addon enabled can see your emtion icons"]
                },
                enablechaticon = {
                    order = 2,
                    type = "toggle",
                    name = L["Enable emotion icons"],
                    get = function()
                        return BFChat:GetModuleEnabled(MODNAME)
                    end,
                    set = function(info, value)
                        BFChat:SetModuleEnabled(MODNAME, value)
                    end
                }
            }
        }
    end
    return options
end
local function createIconButton(text, texture, i)
    local chatTab = _G["BFCChatIconButton" .. i] or
                        CreateFrame("Button", "BFCChatIconButton" .. i,
                                    BFCIconFrame, "BFCIconButtonTemplate")
    chatTab.id = i
    chatTab.text = text
    chatTab.texture = texture
    chatTab:SetNormalTexture(texture)
    return chatTab
end
local function setIconPosition(frame, icon, ix, iy)
    icon:SetPoint("TOPLEFT", frame, "TOPLEFT", (ix - 1) * BFC_ICON_SIZE_X + 5,
                  -1 * (iy - 1) * BFC_ICON_SIZE_Y - 5)
end
local function arrangeIcons(frame, icons)
    local px = 1
    local py = 1
    for i = 1, BFC_NUM_TAB, 1 do
        setIconPosition(frame, icons[i], px, py)
        px = px + 1
        if px == BFC_ICON_NUMBER_X + 1 then
            px = 1
            py = py + 1
        end
    end
end
local function createRollFrame()
    local rollButton = _G.BFCIconFrameRollButton
    if BFChatFrame_CheckNumber then
        rollButton:SetPoint("LEFT",
                            _G["BFCChatTab" .. (BFChatFrame_CheckNumber)],
                            "RIGHT", 1, 0)
    else
        rollButton:SetPoint("TOPLEFT", BFCChatFrame, "TOPLEFT", 268, -3)
    end
    if BFChat.db.profile.enableRollButton then rollButton:Show() end
    rollButton:SetScript("OnEnter", function(self)
        BigFoot_ShowNewbieTooltip(L["RollDice"])
    end)
    rollButton:SetScript("OnLeave",
                         function(self) BigFoot_HideNewbieTooltip() end)
end
local function createIconFrame()
    local callOutButton = _G.BFCIconFrameCalloutButton
    local iconFrame = _G.BFCIconFrame
    callOutButton:SetScript("OnClick", function()
        if not iconFrame then return end
        if iconFrame:IsShown() then
            iconFrame:Hide()
        else
            iconFrame:Show()
        end
    end)
    callOutButton:SetScript("OnEnter", function() end)
    callOutButton:SetScript("OnLeave", function() end)
    callOutButton:SetAlpha(0.8)
    callOutButton:SetPoint("TOPLEFT", BFCChatFrame, "TOPLEFT", 2, -3)
    callOutButton:Show()
    local i = 0
    for BFChat_63a9ce6f1eeac72ef41293b7d0303335,
        BFChat_8d0644c92128c1ff68223fd74ba63b56 in pairs(BFC_IconTable) do
        i = i + 1
        chaticonbuttonlist[i] = createIconButton(
                                    BFChat_8d0644c92128c1ff68223fd74ba63b56[1],
                                    BFChat_8d0644c92128c1ff68223fd74ba63b56[2],
                                    BFChat_63a9ce6f1eeac72ef41293b7d0303335)
    end
    BFC_NUM_TAB = i
    arrangeIcons(iconFrame, chaticonbuttonlist)
    iconFrame.iconButtonList = chaticonbuttonlist
    iconFrame:SetScript("OnShow", function(self)
        local i = 1
        while (self.iconButtonList[i]) do
            self.iconButtonList[i]:Show()
            i = i + 1
        end
    end)
    iconFrame:SetScript("OnHide", function(self)
        local i = 1
        while (self.iconButtonList[i]) do
            self.iconButtonList[i]:Hide()
            i = i + 1
        end
    end)
end
function BFChatIconFrame:OnInitialize()
    self.db = BFChat.db:RegisterNamespace(MODNAME, defaults)
    db = self.db.profile
    self:SetEnabledState(BFChat:GetModuleEnabled(MODNAME))
    BFChat:RegisterModuleOptions(MODNAME, getOptions, L["IconFrame"])
    local worldFrame_MouseUp = WorldFrame:GetScript("OnMouseUp")
    if worldFrame_MouseUp then
        WorldFrame:HookScript("OnMouseUp", function()
            if BFCIconFrame then BFCIconFrame:Hide() end
        end)
    else
        WorldFrame:SetScript("OnMouseUp", function()
            if BFCIconFrame then BFCIconFrame:Hide() end
        end)
    end
end
function BFChatIconFrame:Refresh() end
local function BFChat_c07a6f7e7a6437b52d37b86a592291d1(self)
    local text, tag = BFChat:ParseLocalText(self:GetText())
    if tag then self:SetText(text) end
end
local function BFChat_18a8e7c500e52ac19067d62bf63e8ee7() end
function BFChatIconFrame:OnEnable()
    for i = 1, 10 do
        local editBox = _G["ChatFrame" .. i .. "EditBox"]
        if editBox then
            editBox:SetScript("OnTextChanged",
                              BFChat_c07a6f7e7a6437b52d37b86a592291d1)
        end
    end
    createIconFrame()
    createRollFrame()
    createReportFrame()
    raidersFrame_Init();
    self:Refresh()
end
function BFChatIconFrame:OnDisable()
    for i = 1, 10 do
        local editBox = _G["ChatFrame" .. i .. "EditBox"]
        if editBox then
            editBox:SetScript("OnTextChanged",
                              BFChat_18a8e7c500e52ac19067d62bf63e8ee7)
        end
    end
    _G.BFCIconFrameCalloutButton:Hide()
    _G.BFCIconFrame:Hide()
end
function BFC_StartCount(frame)
    if frame:GetParent() ~= UIParent then
        BFC_StartCount(frame:GetParent())
        return
    end
    frame.showTimer = 1;
    frame.isCounting = 1;
end
function BFC_StopCount(frame)
    if frame:GetParent() ~= UIParent then
        BFC_StopCount(frame:GetParent())
        return
    end
    frame.isCounting = nil;
end
function BFC_OnUpdate(self, elapsed)
    if (not self.showTimer or not self.isCounting) then
        return;
    elseif (self.showTimer < 0) then
        self:Hide();
        self.showTimer = nil;
        self.isCounting = nil;
    else
        self.showTimer = self.showTimer - elapsed;
    end
end
function changeBGTexture(self, switch)
    local texture = _G[self:GetName() .. "BG"];
    if switch then
        texture:SetTexture(
            "Interface\\AddOns\\BigFootChat\\icon\\text_push_frame");
    else
        texture:SetTexture(
            "Interface\\AddOns\\BigFootChat\\icon\\text_nor_frame");
    end
end
