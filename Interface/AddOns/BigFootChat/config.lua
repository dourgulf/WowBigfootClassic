local BFC = LibStub("AceAddon-3.0"):GetAddon("BigFootChat")
local L = LibStub("AceLocale-3.0"):GetLocale("BigFootChat")
local optGetter, optSetter
do
    function optGetter(info)
        local key = info[#info]
        return BFC.db.profile[key]
    end
    function optSetter(info, value)
        local key = info[#info]
        BFC.db.profile[key] = value
        BFC:Refresh()
    end
end
local options, moduleOptions = nil, {}
local function getOptions()
    if not options then
        options = {
            type = "group",
            name = L.BFChatTitle,
            args = {
                general = {
                    order = 1,
                    type = "group",
                    name = L.BFChat,
                    get = optGetter,
                    set = optSetter,
                    args = {
                        intro = {
                            order = 1,
                            type = "description",
                            name = L["BFChat provides you convient tools like copy text, name highlight and timestamps"]
                        },
                        enablecopy = {
                            order = 2,
                            type = "toggle",
                            name = L["Enable copy text"],
                            width = "full"
                        },
                        enableOldChatFrameStyle = {
                            order = 3,
                            type = "toggle",
                            name = L["Enable Old style Style"],
                            width = "full"
                        },
                        timestampheader = {
                            order = 4,
                            type = "header",
                            name = L["Timestamp setting"]
                        },
                        enabletimestamp = {
                            order = 5,
                            type = "toggle",
                            name = L["Enable timestamp"],
                            width = "full",
                            get = function()
                                if GetCVar("showTimestamps") == "none" then
                                    return false
                                else
                                    return true
                                end
                            end,
                            set = function(...)
                                local _, flag = ...
                                if flag then
                                    SetCVar("showTimestamps", "%I:%M %p")
                                    CHAT_TIMESTAMP_FORMAT = "%I:%M %p"
                                else
                                    SetCVar("showTimestamps", "none")
                                    CHAT_TIMESTAMP_FORMAT = nil
                                end
                            end
                        },
                        classheader = {
                            order = 12,
                            type = "header",
                            name = L["Class setting"]
                        },
                        enableclasscolor = {
                            order = 13,
                            type = "toggle",
                            name = L["Enable Class Color"],
                            width = "full",
                            set = function(...)
                                local _, flag = ...
                                if flag then
                                    BFC:MaskSystemColoring(true)
                                else
                                    BFC:MaskSystemColoring(false)
                                end
                                BFC.db.profile.enableclasscolor = flag
                            end,
                            get = function()
                                return BFC.db.profile.enableclasscolor
                            end
                        },
                        channelheader = {
                            order = 14,
                            type = "header",
                            name = L["Channel setting"]
                        },
                        useshortname = {
                            order = 18,
                            name = L["Use short channel names"],
                            type = "toggle",
                            width = "full"
                        },
                        enablechatchannelmove = {
                            order = 20,
                            type = "toggle",
                            name = L["Enable channel buttons move"]
                        }
                    }
                }
            }
        }
        for k, v in pairs(moduleOptions) do
            options.args[k] = (type(v) == "function") and v() or v
        end
    end
    return options
end
function BFC:ShowOptions() LibStub("AceConfigDialog-3.0"):Open("BigFootChat"); end
function BFC:SetupOptions()
    InterfaceOptionsFrame:SetFrameStrata("DIALOG")
    self.optionsFrames = {}
    LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable("BigFootChat",
                                                          getOptions)
    self:RegisterModuleOptions("Profiles",
                               LibStub("AceDBOptions-3.0"):GetOptionsTable(
                                   self.db), "Profiles")
    self:Refresh()
end
function BFC:RegisterModuleOptions(name, optionTbl, displayName)
    moduleOptions[name] = optionTbl
end
