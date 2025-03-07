-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------
local ADDON_NAME, ns = ...
local L = ns.locale

-------------------------------------------------------------------------------
--------------------------------- DEVELOPMENT ---------------------------------
-------------------------------------------------------------------------------

--[[

To enable all development settings and functionality:

    1. Tweak any setting in the addon and exit the game.
    2. Open the settings file for this addon.
        WTF/Account/<account>/SavedVariables/HandyNotes_<this_addon>.lua
    3. Add a new line under profiles => Default.
        ["development"] = true,
    4. Save and star the game. You should now see development settings
       at the bottom of the addon settings window.

--]]

-- Register all addons objects for the CTRL+ALT handler
local plugins = 'HandyNotes_ZarPlugins'
if _G[plugins] == nil then _G[plugins] = {} end
_G[plugins][#_G[plugins] + 1] = ns

local function BootstrapDevelopmentEnvironment()
    _G['HandyNotes_ZarPluginsDevelopment'] = true

    -- Add development settings to the UI
    ns.options.args.GeneralTab.args.DevelopmentHeader = {
        type = 'header',
        name = L['options_dev_settings'],
        order = 100
    }
    ns.options.args.GeneralTab.args.show_debug_map = {
        type = 'toggle',
        arg = 'show_debug_map',
        name = L['options_toggle_show_debug_map'],
        desc = L['options_toggle_show_debug_map_desc'],
        order = 101
    }
    ns.options.args.GeneralTab.args.show_debug_quest = {
        type = 'toggle',
        arg = 'show_debug_quest',
        name = L['options_toggle_show_debug_quest'],
        desc = L['options_toggle_show_debug_quest_desc'],
        order = 102
    }
    ns.options.args.GeneralTab.args.force_nodes = {
        type = 'toggle',
        arg = 'force_nodes',
        name = L['options_toggle_force_nodes'],
        desc = L['options_toggle_force_nodes_desc'],
        order = 103
    }
    ns.options.args.GeneralTab.args.show_debug_currency = {
        type = 'toggle',
        arg = 'show_debug_currency',
        name = L['options_toggle_show_debug_currency'],
        desc = L['options_toggle_show_debug_currency_desc'],
        order = 104
    }

    -- Print debug messages for each quest ID that is flipped
    local QTFrame = CreateFrame('Frame', ADDON_NAME .. 'QT')
    local history = ns.GetDatabaseTable('quest_id_history')
    local lastCheck = GetTime()
    local quests = {}
    local changed = {}
    local max_quest_id = 100000

    local CurrencyFrame = CreateFrame('Frame', ADDON_NAME .. 'C')
    local c_lastCheck = GetTime()
    local c_history = ns.GetDatabaseTable('currency_id_history')
    local currency = {}
    local c_changed = {}

    if ns:GetOpt('show_debug_quest') then
        C_Timer.After(2, function()
            -- Give some time for quest info to load in before we start
            for id = 65000, max_quest_id do
                quests[id] = C_QuestLog.IsQuestFlaggedCompleted(id)
            end
            QTFrame:SetScript('OnUpdate', function()
                if GetTime() - lastCheck > 5 and ns:GetOpt('show_debug_quest') then
                    for id = 65000, max_quest_id do
                        local s = C_QuestLog.IsQuestFlaggedCompleted(id)
                        if s ~= quests[id] then
                            changed[#changed + 1] = {time(), id, quests[id], s}
                            quests[id] = s
                        end
                    end
                    if #changed <= 10 then
                        -- changing zones will sometimes cause thousands of quest
                        -- ids to flip state, we do not want to report on those
                        for i, args in ipairs(changed) do
                            table.insert(history, 1, args)
                            print('Quest', args[2], 'changed:', args[3], '=>',
                                args[4])
                        end
                    end
                    if #history > 100 then
                        for i = #history, 101, -1 do
                            history[i] = nil
                        end
                    end
                    lastCheck = GetTime()
                    wipe(changed)
                end
            end)
            print('Quest IDs are now being tracked')
        end)
    end

    if ns:GetOpt('show_debug_currency') then
        C_Timer.After(2, function()
            -- Give some time for currency info to load in before we start
            for id = 1, 3000 do
                local c = C_CurrencyInfo.GetCurrencyInfo(id) or false
                if c then currency[id] = c.quantity end
            end
            CurrencyFrame:SetScript('OnUpdate', function()
                if GetTime() - c_lastCheck > 5 and
                    ns:GetOpt('show_debug_currency') then
                    for id = 1, 3000 do
                        local c = C_CurrencyInfo.GetCurrencyInfo(id) or false
                        if c then
                            local s = c.quantity
                            if s ~= currency[id] then
                                c_changed[#c_changed + 1] = {
                                    time(), id, currency[id], s
                                }
                                currency[id] = s
                            end
                        end
                    end

                    for i, args in ipairs(c_changed) do
                        table.insert(c_history, 1, args)
                        print('Currency', args[2], 'changed:', args[3], '=>',
                            args[4])
                    end

                    if #c_history > 100 then
                        for i = #c_history, 101, -1 do
                            c_history[i] = nil
                        end
                    end
                    c_lastCheck = GetTime()
                    wipe(c_changed)
                end
            end)
            print('Currency changes are now being tracked')
        end)
    end

    -- Listen for LCTRL + LALT when the map is open to force display nodes
    local IQFrame = CreateFrame('Frame', ADDON_NAME .. 'IQ', WorldMapFrame)
    local groupPins = WorldMapFrame.pinPools.GroupMembersPinTemplate
    IQFrame:SetPropagateKeyboardInput(true)
    IQFrame:SetScript('OnKeyDown', function(_, key)
        if (key == 'LCTRL' or key == 'LALT') and IsLeftControlKeyDown() and
            IsLeftAltKeyDown() then
            if InCombatLockdown() then
                print('Can\'t force display nodes in combat')
                return
            end
            IQFrame:SetPropagateKeyboardInput(false)
            for i, _ns in ipairs(_G[plugins]) do
                if not _ns.dev_force then
                    _ns.dev_force = true
                    _ns.addon:RefreshImmediate()
                end
            end
            -- Hide player pins on the map
            groupPins:GetNextActive():Hide()
        end
    end)
    IQFrame:SetScript('OnKeyUp', function(_, key)
        if key == 'LCTRL' or key == 'LALT' then
            if InCombatLockdown() then return end
            IQFrame:SetPropagateKeyboardInput(true)
            for i, _ns in ipairs(_G[plugins]) do
                if _ns.dev_force then
                    _ns.dev_force = false
                    _ns.addon:RefreshImmediate()
                end
            end
            -- Show player pins on the map
            groupPins:GetNextActive():Show()
        end
    end)

    -- Slash commands
    SLASH_PETID1 = '/petid'
    SlashCmdList['PETID'] = function(name)
        if #name == 0 then return print('Usage: /petid NAME') end
        local petid = C_PetJournal.FindPetIDByName(name)
        if petid then
            print(name .. ': ' .. petid)
        else
            print('NO MATCH FOR: /petid ' .. name)
        end
    end

    SLASH_MOUNTID1 = '/mountid'
    SlashCmdList['MOUNTID'] = function(name)
        if #name == 0 then return print('Usage: /mountid NAME') end
        for i, m in ipairs(C_MountJournal.GetMountIDs()) do
            if (C_MountJournal.GetMountInfoByID(m) == name) then
                return print(name .. ': ' .. m)
            end
        end
        print('NO MATCH FOR: /mountid ' .. name)
    end

end

-------------------------------------------------------------------------------

-- Debug function that prints entries from the quest id history

_G[ADDON_NAME .. 'QuestHistory'] = function(count)
    local history = ns.GetDatabaseTable('quest_id_history')
    if #history == 0 then return print('Quest ID history is empty') end
    for i = 1, (count or 10) do
        if i > #history then break end
        local time, id, old, new, _
        if history[i][1] == 'Quest' then
            _, id, _, old, _, new = unpack(history[i])
            time = 'MISSING'
        else
            time, id, old, new = unpack(history[i])
            time = date('%H:%M:%S', time)
        end
        print(time, '::', id, '::', old, '=>', new)
    end
end

_G[ADDON_NAME .. 'CurrencyHistory'] = function(count)
    local c_history = ns.GetDatabaseTable('currency_id_history')
    if #c_history == 0 then return print('Currency history is empty') end
    for i = 1, (count or 10) do
        if i > #c_history then break end
        local time, id, old, new, _
        if c_history[i][1] == 'Currency' then
            _, id, _, old, _, new = unpack(c_history[i])
            time = 'MISSING'
        else
            time, id, old, new = unpack(c_history[i])
            time = date('%H:%M:%S', time)
        end
        print(time, '::', id, '::', old, '=>', new)
    end
end

-------------------------------------------------------------------------------

-- Debug function that iterates over each pin template and removes it from the
-- map. This is helpful for determining which template a pin is coming from.

local hidden = {}
_G[ADDON_NAME .. 'RemovePins'] = function()
    for k, v in pairs(WorldMapFrame.pinPools) do
        if not hidden[k] then
            hidden[k] = true
            print('Removing pin template:', k)
            WorldMapFrame:RemoveAllPinsByTemplate(k)
            return
        end
    end
end

-------------------------------------------------------------------------------

function ns.Debug(...)
    if not ns.addon.db then return end
    if ns:GetOpt('development') then print(ns.color.Blue('DEBUG:'), ...) end
end

function ns.Warn(...)
    if not ns.addon.db then return end
    if ns:GetOpt('development') then print(ns.color.Orange('WARN:'), ...) end
end

function ns.Error(...)
    if not ns.addon.db then return end
    if ns:GetOpt('development') then print(ns.color.Red('ERROR:'), ...) end
end

-------------------------------------------------------------------------------

_G[ADDON_NAME .. 'ScanQuestObjectives'] =
    function(start, end_)
        local function attemptObjectiveInfo(quest, index)
            local text, objectiveType, finished, fulfilled =
                GetQuestObjectiveInfo(quest, index, true)
            if text or objectiveType or finished or fulfilled then
                print(quest, index, text, objectiveType, finished, fulfilled)
            end
        end

        for i = start, end_, 1 do
            for j = 0, 10, 1 do attemptObjectiveInfo(i, j) end
        end
    end

-------------------------------------------------------------------------------

ns.BootstrapDevelopmentEnvironment = BootstrapDevelopmentEnvironment
