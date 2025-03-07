﻿local L = LibStub("AceLocale-3.0"):NewLocale("GladiatorlosSA", "enUS",true)
if not L then return end

local Colors = {
    DeathKnight = "|cffC41F3B",
    DemonHunter = "|cffA330C9",
    Druid = "|cffFF7D0A",
    Evoker = "|cff33937F",
    Hunter = "|cffABD473",
    Mage = "|cff69CCF0",
    Monk = "|cFF00FF96",
    Paladin = "|cffF58CBA",
    Priest = "|cffFFFFFF",
    Rogue = "|cffFFF569",
    Shaman = "|cff0070da",
    ShamanTotems = "|cff0070da",
    Warlock = "|cff9482C9",
    Warrior = "|cffC79C6E",
}

local Classes = {
    DeathKnight = Colors.DeathKnight .. "Death Knight|r",
    DemonHunter = Colors.DemonHunter .. "Demon Hunter|r",
    Druid = Colors.Druid .. "Druid|r",
    Evoker = Colors.Evoker .. "Evoker|r",
    Hunter = Colors.Hunter .. "Hunter|r",
    Mage = Colors.Mage .. "Mage|r",
    Monk = Colors.Monk .. "Monk|r",
    Paladin = Colors.Paladin .. "Paladin|r",
    Priest = Colors.Priest .. "Priest|r",
    Rogue = Colors.Rogue .. "Rogue|r",
    Shaman = Colors.Shaman .. "Shaman|r",
    Warlock = Colors.Warlock .. "Warlock|r",
    Warrior = Colors.Warrior .. "Warrior|r",
}

L["Spell_CastSuccess"] = "On Successful Cast"
L["Spell_CastStart"] = "On Beginning of Spell Cast"
L["Spell_AuraApplied"] = "On Buff/Debuff Application"
L["Spell_AuraRemoved"] = "On Buff/Debuff Removal"
L["Spell_Interrupt"] = "On Cast Interrupt"
L["Spell_Summon"] = "On Spell Summon"
L["Spell_EmpowerStart"] = "On Empower Begin"
L["Unit_Died"] = "Unit Died"
L["Any"] = true
L["Player"] = true
L["Target"] = true
L["Focus"] = true
L["Mouseover"] = true
L["Party"] = true
L["Raid"] = true
L["Arena"] = true
L["Boss"] = true
L["Custom"] = true
L["Friendly"] = true
L["Hostile player"] = true
L["Hostile unit"] = true
L["Neutral"] = true
L["Myself"] = true
L["Mine"] = true
L["My pet"] = true
L["Custom Spell"] = true
L["New Sound Alert"] = true
L["name"] = "File Name"
L["same name already exists"] = "Spell name already exists"
L["spellid"] = "Spell ID"
L["Remove"] = "Delete Sound"
L["Are you sure?"] = true
L["Test"] = "Test File Path"
L["Use existing sound"] = true
L["choose a sound"] = "Choose existing sound"
L["file path"] = "Custom File Path"
L["event type"] = "Event Type"
L["Source unit"] = "Source Unit"
L["Source type"] = "Source Type"
L["Custom unit name"] = "Custom Unit Name"
L["Dest unit"] = "Destination Unit"
L["Dest type"] = "Destination Type"

L["GladiatorlosSACredits"] = "Customizable PvP Announcer addon for vocalizing many important spells cast by your enemies.|n|n|cffFFF569Created by|r |cff9482C9Abatorlos|r |cffFFF569of Spinebreaker (past)|r|r|n|n|cffFFF569Special Thanks|r|n|cffA330C9superk521|r (Past Project Manager)|n|cffA330C9DuskAshes|r (Chinese Support)|n|cffA330C9N30Ex|r (Mists of Pandaria Support; Shadowlands voice recordings)|n|cffA330C9zuhligan|r (Warlords of Draenor & French Support)|n|cffA330C9jungwan2|r (Korean Support)|n|cffA330C9Mini_Dragon|r (Chinese support for WoD & Legion)|n|cffA330C9LordKuper|r (Russian support for Legion)|n|cffA330C9Tzanee - Wyrmrest Accord|r (Placeholder Voice Lines)|n|cffA330C9Gnulkion - Illidan|r (Alert only from opponent in duels feature)|n|nAll feedback, questions, suggestions, and bug reports are welcome at the addon's page on Curse:|nhttps://wow.curseforge.com/projects/gladiatorlossa2|nOR GitHub:|nhttps://github.com/Rhykes/GladiatorlosSA2"
L["PVP Voice Alert"] = true
L["Load Configuration"] = "<-- Load GSA2 Menus"
L["Load Configuration Options"] = true
L["General"] = true
L["General options"] = "General Options"
L["Enable area"] = "Enabled Locations"
L["Anywhere"] = true
L["Alert works anywhere"] = "Alerts occur anywhere and everywhere."
L["Arena"] = "Arenas"
L["Alert only works in arena"] = "Alerts occur in arenas and PvP Scenarios (such as Island Expeditions)."
L["Battleground"] = "Battlegrounds"
L["Alert only works in BG"] = "Alerts occur in battlegrounds."
L["World"] = true
L["Alert works anywhere else then anena, BG, dungeon instance"] = "Alerts occur in the world such as on Kalimdor or the Broken Isles"
L["Voice config"] = "Voice Options"
L["Voice language"] = true
L["Select language of the alert"] = true
L["Chinese(female)"] = true
L["English(female)"] = "English (Female)"
L["adjusting the voice volume(the same as adjusting the system master sound volume)"] = "Adjusts the voice's volume.|n|nNOTE: The voice uses the client's Master channel. You may need to adjust your other sound options accordingly."
L["Advance options"] = "Advanced Options"
L["Smart disable"] = "Spam Throttle"
L["Disable addon for a moment while too many alerts comes"] = "Briefly disables sound notifications during periods of frequent ability usage."
L["Throttle"] = true
L["The minimum interval of each alert"] = true
L["Abilities"] = true
L["Abilities options"] = true
L["Disable options"] = "Disable Category / Feature"
L["Disable abilities by type"] = true
L["Disable Buff Applied"] = "Buff Applied"
L["Check this will disable alert for buff applied to hostile targets"] = "Disable all alerts in Buff Applied"
L["Disable Buff Down"] = "Buff Down"
L["Check this will disable alert for buff removed from hostile targets"] = "Disable all alerts in Buff Down"
L["Disable Spell Casting"] = "Spell Casting"
L["Chech this will disable alert for spell being casted to friendly targets"] = "Disable all alerts in Spell Casting"
L["Disable special abilities"] = "Cast Success/Instants"
L["Check this will disable alert for instant-cast important abilities"] = "Disable all alerts in Cast Success/Instants"
L["Disable friendly interrupt"] = "Friendly Interrupts"
L["Check this will disable alert for successfully-landed friendly interrupting abilities"] = "Disable the alert for successful interrupts done by you or your allies which lock the enemy out of casting.|n|n('Countered!')"
L["Buff Applied"] = true
L["Target and Focus Only"] = true
L["Alert works only when your current target or focus gains the buff effect or use the ability"] = "If enabled, alerts will only happen if the ability is cast by your current target or focused target.|n|nThis option is separate for each category."
L["Alert Drinking"] = true
L["In arena, alert when enemy is drinking"] = "In arena, alert when enemy is drinking."
L["PvP Trinketed Class"] = true
L["Also announce class name with trinket alert when hostile targets use PvP trinket in arena"] = "In arenas, announces the class that used their Gladiator Medallion. (2 Minute Trinket)|r"
L["General Abilities"] = true
L["Druid"] = Classes.Druid
L["Paladin"] = Classes.Paladin
L["Rogue"] = Classes.Rogue
L["Warrior"] = Classes.Warrior
L["Priest"] = Classes.Priest
L["Shaman"] = Classes.Shaman
L["ShamanTotems"] = Colors.ShamanTotems .. "Shaman (Totems)" .. "|r"
L["Mage"] = Classes.Mage
L["DeathKnight"] = Classes.DeathKnight
L["Hunter"] = Classes.Hunter
L["Monk"] = Classes.Monk
L["DemonHunter"] = Classes.DemonHunter
L["Warlock"] = Classes.Warlock
L["Evoker"] = Classes.Evoker
L["Buff Down"] = true
L["Spell Casting"] = true
L["BigHeal"] = "Big Heals"
L["BigHeal_Desc"] = "Nourish (" .. Classes.Druid .. ")|nHeal (" .. Classes.Priest .. ")|nPower Word: Radiance (" .. Classes.Priest .. ")|nHoly Light (" .. Classes.Paladin .. ")|nHealing Wave (" .. Classes.Shaman .. ")|nSurging Mist |cFF00FF96(" .. Classes.Monk ..")|r"
L["Resurrection"] = true
L["Resurrection_Desc"] = "All out-of-combat resurrection abilities."
L["Special Abilities"] = "Cast Success/Instants"
L["Friendly Interrupt"] = true
L["Profiles"] = true

L["PvPWorldQuests"] = "NYI"
L["DisablePvPWorldQuests"] = "NYI"
L["DisablePvPWorldQuestsDesc"] = "Disable all alerts in PvP World Quests"
L["OperationMurlocFreedom"] = true

L["EnemyInterrupts"] = "Interrupts"
L["EnemyInterruptsDesc"] = "Enables or disables alerts for ALL enemy Interrupt and Silence abilities."

L["Default / Female voice"] = "Default Voice"
L["Select the default voice pack of the alert"] = " "
L["Optional / Male voice"] = true
L["Select the male voice"] = true
L["Optional / Neutral voice"] = true
L["Select the neutral voice"] = true
L["Gender detection"] = true
L["Activate the gender detection"] = true
L["Voice menu config"] = true
L["Choose a test voice pack"] = true
L["Select the menu voice pack alert"] = true

L["English(male)"] = true
L["No sound selected for the Custom alert : |cffC41F4B"] = true
L["Master Volume"] = true -- changed from L["Volume"] = true
L["Change Output"] = true
L["Unlock the output options"] = true
L["Output"] = true
L["Select the default output"] = true
L["Master"] = "-Master-"
L["SFX"] = true
L["Ambience"] = true
L["Music"] = true
L["Dialog"] = true

L["DPSDispel"] = "Non-Magic Dispels"
L["DPSDispel_Desc"] = "Generic alert for hybrid class dispels that do not remove Magic effects.|n|nRemove Corruption (" .. Classes.Druid .. ")|nRemove Curse (" .. Classes.Mage ..")|nDetox (" .. Classes.Monk .. ")|nCleanse Toxins (" .. Classes.Paladin .. ")|nPurify Disease (" .. Classes.Priest ..")|nCleanse Spirit (" .. Classes.Shaman .. ")"
L["HealerDispel"] = "Magic Dispels"
L["HealerDispel_Desc"] = "Generic alert for healing class (and warlocks) dispels that remove Magic effects.|n|nNature's Cure (" .. Classes.Druid .. ")|nDetox (" .. Classes.Monk .. ")|nCleanse (" .. Classes.Paladin .. ")|nPurify (" .. Classes.Priest .. ")|nPurify Spirit (" .. Classes.Shaman .. ")|nSinge Magic (" .. Classes.Warlock .. ")"
L["CastingSuccess"] = "CC Cast Success"
L["CastingSuccess_Desc"] = "Enables generic 'success' alert when a major enemy cast-time Crowd Control ability is applied to an ally.|n|n|cffC41F3BWARNING: ALL of the abilities below will announce their success if this is enabled, even if you have some of them disabled in Spell Casting.|r|n|nCyclone (" .. Classes.Druid .. ")|nEntangling Roots (" .. Classes.Druid .. ")|nHibernate (" .. Classes.Druid .. ")|nMass Polymorph (" .. Classes.Mage .. ")|nSleepwalk (" .. Classes.Evoker .. ")|nScare Beast (" .. Classes.Hunter .. ")|nPolymorph (" .. Classes.Mage .. ")|nRing of Frost (" .. Classes.Mage .. ")|nRepentance (" .. Classes.Paladin .. ")|nSearing Glare (" ..Classes.Paladin .. ")|nMind Control (" .. Classes.Priest .. ")|nHex (" .. Classes.Shaman .. ")|nFear (" .. Classes.Warlock .. ")"
L["DispelKickback"] = "Dispel Penalties"

L["Purge"] = "Purges"
L["PurgeDesc"] = "Generic alert for purges that remove magic effects from your team, excluding Arcane Torrent.|n|nConsume Magic (" .. Classes.DemonHunter .. ")|nTranquilizing Shot (" .. Classes.Hunter ..")|nDispel Magic (" .. Classes.Priest ..")|nGreater Purge (" .. Classes.Shaman .. ")|nPurge (" .. Classes.Shaman .. ")|nDevour Magic (" .. Classes.Warlock .. ")"

L["FriendlyInterrupted"] = "Ally Lockout Alert"
L["FriendlyInterruptedDesc"] = "Disable the alert that occurs when an enemy successfully interrupts you or an ally which locks them out of casting.|n|n(Plays the Blizzard 'Quest Failed' sound effect.)"

L["epicbattleground"] = "Epic Battlegrounds"
L["epicbattlegroundDesc"] = "Alerts occur in Epic Battlegrounds.|n|nYou're welcome."

L["OnlyIfPvPFlagged"] = "Only in PvP"
L["OnlyIfPvPFlaggedDesc"] = "If enabled, alerts will no longer play unless you are PvP flagged; such as in War Mode or in a PvP instance. Those areas still need to be enabled for GSA to function there, even if this option is enabled.|n|n|cffC41F3BWARNING: This also disables alerts while in a Duel, so remember to toggle it off!|r"

L["TankTauntsOFF"] = "Intimidation"
L["TankTauntsOFF_Desc"] = "Alerts the fading of Intimidation: a damage amplification effect originating from tank specializations."
L["TankTauntsON"] = "Intimidation"
L["TankTauntsON_Desc"] = "Alerts the application of Intimidation: a damage amplifcation effect originating from tank specializations."

L["Connected"] = "Connected Alerts"
L["Connected_Desc"] = "Plays a simple 'Connected' alert when certain very powerful cast-time abilities successfully complete their cast.|n|nThe Hunt (" .. Classes.DemonHunter ..")|nSniper Shot (" .. Classes.Hunter .. ")|nGreater Pyroblast (" .. Classes.Mage .. ")|nLight's Wrath (" .. Classes.Priest .. ")|nMind Games (" .. Classes.Priest ..")|nChaos Bolt (" ..Classes.Warlock ..")"

L["CovenantAbilities"] = "Covenant Abilities"

L["FrostDK"] = "Frost"
L["BloodDK"] = "Blood"
L["UnholyDK"] = "Unholy"

L["HavocDH"] = "Havoc"
L["VengeanceDH"] = "Vengeance"

L["FeralDR"] = "Feral"
L["BalanceDR"] = "Balance"
L["RestorationDR"] = "Restoration"
L["GuardianDR"] = "Guardian"

L["DevastationEV"] = "Devastation" 
L["PreservationEV"] = "Preservation" 
L["AugmentationEV"] = "Augmentation"

L["MarksmanshipHN"] = "Marksmanship"
L["SurvivalHN"] = "Survival"
L["BeastMasteryHN"] = "Beast Mastery"

L["FrostMG"] = "Frost"
L["FireMG"] = "Fire"
L["ArcaneMG"] = "Arcane"

L["MistweaverMN"] = "Mistweaver"
L["WindwalkerMN"] = "Windwalker"
L["BrewmasterMN"] = "Brewmaster"

L["HolyPD"] = "Holy"
L["RetributionPD"] = "Retribution"
L["ProtectionPD"] = "Protection"

L["HolyPR"] = "Holy"
L["DisciplinePR"] = "Discipline"
L["ShadowPR"] = "Shadow"

L["OutlawRG"] = "Outlaw"
L["AssassinationRG"] = "Assassination"
L["SubtletyRG"] = "Subtlety"

L["RestorationSH"] = "Restoration"
L["EnhancementSH"] = "Enhancement"
L["ElementalSH"] = "Elemental"

L["DestructionWL"] = "Destruction"
L["DemonologyWL"] = "Demonology"
L["AfflictionWL"] = "Affliction"

L["ArmsWR"] = "Arms"
L["FuryWR"] = "Fury"
L["ProtectionWR"] = "Protection"

L["EXPAC_UnknownExpac"] = "Unknown Expansion"
L["EXPAC_Classic"] = "Classic"
L["EXPAC_TBC"] = "The Burning Crusade"
L["EXPAC_WotLK"] = "Wrath of the Lich King"
L["EXPAC_Cata"] = "Cataclysm"
L["EXPAC_MoP"] = "Mists of Pandaria"
L["EXPAC_WoD"] = "Warlords of Draenor"
L["EXPAC_Legion"] = "Legion"
L["EXPAC_BfA"] = "Battle for Azeroth"
L["EXPAC_SL"] = "Shadowlands"
L["EXPAC_DF"] = "Dragonflight"
L["EXPAC_TWW"] = "The War Within"


L["GladiatorlosSA2"] = true

L["GSA_EXPERIMENTAL_BUILD"] = Colors.DeathKnight .. "This is an experimental build of GladiatorlosSA2 and has NOT been tested on TBC. Although I am confident that everything still works correctly, please reach out if you run into problems and downgrade to GSA2_TBC1.1 if necessary. This message will not be displayed again." .. "|r"

L["RacialAbilities"] = "Racial Abilities"

-- 自行加入
L["GladiatorlosSA"] = true
L["GladiatorlosSA2"] = true
L["|cFF33FF22GladiatorlosSA|r: "] = true