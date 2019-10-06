local L = LibStub("AceLocale-3.0"):NewLocale("ClassicCodex", "zhTW")
if not L then return end


L = L or {}

-- browser.lua
L["Quest Start"] = "任務開始"
L["Quest End"] = "任務結束"
L["Quest Level"] = "任務等級"
L["Required Level"] = "需要等級"
L["Hostile"] = "敵對"
L["Friendly"] = "友方"
L["Reaction"] = "反應"
L["Alliance"] = "聯盟"
L["Horde"] = "部落"
L["Location"] = "地點"
L["Looted from"] = "拾取自"
L["Sold by"] = "售賣者"
L["and %d others"] = "以及%d個其他結果"
L["Too many entries. Results shown: %d"] = "條目太多，僅顯示前%d條"
L["Units"] = "單位"
L["Objects"] = "對象"
L["Items"] = "物品"
L["Quests"] = "任務"
L["Left-Click"] = "左鍵"
L["Open Browser"] = "打開瀏覽器"
L["Shift-Click"] = "Shift-左鍵"
L["Move Button"] = "移動按鈕"
L["ClassicCodex"] = "ClassicCodex 全能數據庫"
L["Clean Map"] = "清除"
L["Search"] = "搜索"

-- command.lua
L["|cff33ffcc/codex|cffffffff show |cffcccccc - Show database interface"] = "|cff33ffcc/codex|cffffffff show |cffcccccc - 顯示數據庫瀏覽器"
L["|cff33ffcc/codex|cffffffff unit <unit> |cffcccccc - Search units"] = "|cff33ffcc/codex|cffffffff unit <unit> |cffcccccc - 搜索單位"
L["|cff33ffcc/codex|cffffffff object <gameObject> |cffcccccc - Search objects"] = "|cff33ffcc/codex|cffffffff object <gameObject> |cffcccccc - 搜索物體、目標"
L["|cff33ffcc/codex|cffffffff item <item> |cffcccccc - Search items"] = "|cff33ffcc/codex|cffffffff item <item> |cffcccccc - 搜索物品"
L["|cff33ffcc/codex|cffffffff vendor <item> |cffcccccc - Search vendors for item"] = "|cff33ffcc/codex|cffffffff vendor <item> |cffcccccc - 搜索物品售賣者"
L["|cff33ffcc/codex|cffffffff quest <questName> |cffcccccc - Show specific quest giver"] = "|cff33ffcc/codex|cffffffff quest <questName> |cffcccccc - 搜索任務給予者"
L["|cff33ffcc/codex|cffffffff quests |cffcccccc - Show all quests on the map"] = "|cff33ffcc/codex|cffffffff quests |cffcccccc - 在地圖上顯示所有任務"
L["|cff33ffcc/codex|cffffffff meta <relation> [min, [max]] |cffcccccc - Show related objects on the map"] = "|cff33ffcc/codex|cffffffff meta <relation> [min, [max]] |cffcccccc - 在地圖上顯示相關目標、對象"
L["|cff33ffcc/codex|cffffffff clean |cffcccccc - Clean map"] = "|cff33ffcc/codex|cffffffff clean |cffcccccc - 清理地圖"
L["|cff33ffcc/codex|cffffffff reset |cffcccccc - Reset map"] = "|cff33ffcc/codex|cffffffff reset |cffcccccc - 重置地圖"
L["|cff33ffcc ->|cffffffff Available relations:  |cff33ffccchests|r, |cff33ffccherbs|r, |cff33ffccmines|r"] = "|cff33ffcc ->|cffffffff 可用關系:  |cff33ffccchests|r - 寶箱, |cff33ffccherbs|r - 草藥, |cff33ffccmines|r - 礦物"

-- config.lua
L["CONFIG_TEXT_FONT"] = "Fonts/bKAI00M.ttf"
L["Auto-Accept Quests"] = "自動接任務"
L["Toggle auto-accepting quests"] = "開啟/關閉自動接任務"
L["Auto-Turnin Quests"] = "自動交任務"
L["Toggle auto-turning in quests"] = "開啟/關閉自動交任務"
L["Nameplate Quest Icon"] = "姓名板任務圖標"
L["Toggle quest icon on top of enemy nameplates"] = "在任務怪姓名板上方顯示任務感嘆號"
L["All Questgivers"] = "顯示所有可接任務"
L["If selected, this will display all questgivers on the map"] = "選中後，在地圖和小地圖上顯示可接任務的圖標"
L["Current Questgivers"] = "顯示當前任務NPC"
L["If selected, current quest-ender npcs/objects will be displayed on the map for active quests"] = "選中後，可交付當前任務的NPC或物體會顯示在地圖上"
L["Show Low-level Quests"] = "顯示低等級任務"
L["If selected, low-level quests will be hidden on the map"] = "選中後，地圖上的低等級任務(比玩家等級低10級)不再被隱藏"
L["Show High-level Quests"] = "顯示高等級任務"
L["If selected, quests with a level requirement of your level + 3 will be shown on the map"] = "選中後，可接等級比玩家等級高3級的任務也會顯示在地圖上"
L["Show Festival/PVP/Misc Quests"] = "顯示節日/PVP/雜項任務"
L["If selected, quests related to WoW festive seasons or PVP or not available at the current stage will be displayed on the map"] = "選中後，與遊戲內節日、PVP相關的任務和某些當前階段不可用的任務會被顯示在地圖上"
L["Color By Spawn"] = "按任務怪類型標記顏色"
L["If selected, markers' colors will be set per spawn type or per quest if not selected"] = "選中後，不同任務怪的地圖標記顏色不同。如果未選中，則壹個任務的所有任務怪都是同壹個顏色。"
L["Quest Marker Size"] = "任務標記大小"
L["Spawn Marker Size"] = "怪物標記大小"
L["Hide items with a drop probability less than (%)"] = "隱藏掉落概率低於(%)的物品"
L["Show All Quests You Manually Hide Again"] = "重新顯示所有手動隱藏的任務"
L["Show all the quests you have hidden by shift + click."] = "顯示所有通過Shift+點擊隱藏的任務"
L["Hide a quest by holding the shift key and clicking on the quest icon on the minimap or world map."] = "按住Shift並點擊小地圖或世界地圖上的任務圖標可以隱藏任務"
L["ClassicCodex: You have no manually hidden quests. You can hold the shift key and click on the quest icon on the minimap or world map to hide it."] = "ClassicCodex: 您沒有手動隱藏過任何任務，按住Shift並點擊小地圖或世界地圖上的任務圖標可以隱藏任務"
L["ClassicCodex: %d hidden quests will be able to show again."] = "ClassicCodex: %d個隱藏任務已重新顯示"
L["List Manually Hidden Quests"] = "列出手動隱藏的任務"
L["List Completed Quests"] = "列出完成的任務"
L["Always Show ID In Browser"] = "在查詢結果中顯示ID"
L["If selected, the item/object/unit/quest ID will be displayed when you searching something in ClassicCodex Browser."] = "選中後，“ClassicCodex全能數據庫”查詢窗口將顯示物品/對象/單位/任務的ID。"

-- map.lua
L["Buy"] = "購買"
L["Required"] = "需要"
L["Loot"] = "拾取"
L["Vendor"] = "商販"
L["Level"] = "等級"

-- quest.lua
L["QUEST_STATE_SPLIT_REGEXP"] = "(.*)：%s*([%d]+)%s*/%s*([%d]+)"
L["Show"] = "顯示"
L["Hide"] = "隱藏"
L["Reset"] = "重置"
L["All Quests"] = "顯示所有任務"
L["Tracked Quests"] = "顯示追蹤的任務"
L["Manual Selection"] = "顯示手動選擇的任務"
L["Hide Quests"] = "不顯示任務"

-- ui.lua
L["DEFAULT_FONT"] = "Fonts\\bLEI00D.TTF"