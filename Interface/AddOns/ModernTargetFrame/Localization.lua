﻿--[[	Modern TargetFrame Localization
	by SDPhantom
	https://www.wowinterface.com/forums/member.php?u=34145
	https://www.curseforge.com/members/sdphantomgamer/projects	]]
--------------------------------------------------------------------------

----------------------------------
--[[	Localization Table	]]
----------------------------------
local Localization={
	enUS={--	Native locale by SDPhantom
--		Options Panel
		Options_ByAuthor_Format="by %s";

--		Options Panel (Feature List)
		Options_FeatureName_StatusBarText="Show Health & Mana Text";
		Options_FeatureName_ClassificationTexture="Enable Rare-Elite Texture";
		Options_FeatureName_ThreatIndicatorGlow="Enable Threat Glow";
		Options_FeatureName_ThreatIndicatorNumber="Enable Threat Numeric Display";
	};
	frFR={--	Translated by Arektor
--		Options Panel
		Options_ByAuthor_Format="par %s";

--		Options Panel (Feature List)
		Options_FeatureName_StatusBarText="Afficher les points de vie et de mana";
		Options_FeatureName_ClassificationTexture="Activer la bordure des élites rares";
		Options_FeatureName_ThreatIndicatorGlow="Activer l'alerte visuelle d'aggro";
		Options_FeatureName_ThreatIndicatorNumber="Afficher les quantités de menace";
	};
	zhCN={--	Native locale by SDPhantom
--		Options Panel
		Options_ByAuthor_Format="作者 %s";

--		Options Panel (Feature List)
		Options_FeatureName_StatusBarText="显示生命值、法力值";
		Options_FeatureName_ClassificationTexture="显示稀有精英边框";
		Options_FeatureName_ThreatIndicatorGlow="显示仇恨红色高亮边框";
		Options_FeatureName_ThreatIndicatorNumber="显示仇恨数值框体";
	};
}

----------------------------------
--[[	Localization Loader	]]--	Nothing to localize below this line
----------------------------------
local AddOn=select(2,...);
AddOn.Localization=Localization[GetLocale()] or Localization.enUS;
if AddOn.Localization~=Localization.enUS then setmetatable(AddOn.Localization,{__index=Localization.enUS}); end