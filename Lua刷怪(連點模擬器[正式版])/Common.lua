Common.UseWeaponInven(true) -- 使用武器背包功能
Common.SetSaveCurrentWeapons(true) -- 設定將目前裝備中的武器儲存
Common.SetSaveWeaponInven(true) -- 設定儲存武器背包內容(需先設定UseWeaponInven)
Common.SetAutoLoad(true) -- 自動執行讀取儲存資訊。
Common.DisableWeaponParts(false) -- 關閉武器部件功能
Common.DisableWeaponEnhance(false) -- 關閉武器強化功能
Common.DontGiveDefaultItems(true) -- 遊戲開始時不會給予基本武器
Common.DontCheckTeamKill(true) -- 團隊擊殺也會算為正常擊殺
Common.UseScenarioBuymenu(false) -- 商店使用災厄之章商店視窗
Common.SetNeedMoney(true) -- 購買槍枝時需要金錢
Common.UseAdvancedMuzzle(true) -- 發射時槍口效果以新型態呈現(不套用Scale)
Common.SetMuzzleScale(1.0) -- 修正發射時槍口效果大小
Common.SetBloodScale(2) -- 修正被攻擊時血的效果大小
Common.SetGunsparkScale(10) -- 修正子彈射到牆壁等等的效果大小
Common.SetHitboxScale(2.5) -- 修正准心大小
Common.SetMouseoverOutline(true, {r = 255,g = 0,b = 0}) -- 當游標移到怪物等的實體上時標示外框
Common.SetUnitedPrimaryAmmoPrice(0) -- 所有主武器每個彈匣價格相同
Common.SetUnitedSecondaryAmmoPrice(0) -- 所有輔助武器每個彈匣價格相同

-- 比較實數值使用
EPSILON = 0.00001
	
-- 遊戲中顯示的所有武器清單
WeaponList = {
	-- 輔助武器清單
	1,
	10,
	11,
	16,
	17,
	26,
	56,
	67,
	70,
	75,
	78,
	235,
	318,
	329,
	373,
	395,
	431,
	-- 狙擊槍清單
	3,
	13,
	18,
	24,
	66,
	103,
	-- 步槍清單
	8,
	14,
	15,
	22,
	27,
	28,
	31,
	60,
	65,
	83,
	102,
	107,
	108,
	160,
	161,
	163,
	165,
	168,
	169,
	183,
	201,
	204,
	207,
	221,
	222,
	279,
	306,
	307,
	338,
	385,
	398,
	-- 衝鋒槍清單
	7,
	12,
	19,
	23,
	30,
	74,
	95,
	105,
	110,
	135,
	145,
	200,
	302,
	-- 散彈槍清單
	5,
	21,
	39,
	58,
	63,
	88,
	90,
	111,
	126,
	192,
	203,
	217,
	239,
	257,
	281,
	284,
	337,
	381,
	-- 機關槍清單
	20,
	41,
	45,
	59,
	73,
	115,
	147,
	172,
	197,
	241,
	295,
	339,
	377,
	397,
	417,
	449,
	-- 裝備武器清單
	118,
	144,
	170,
	193,
	209,
	233,
	249,
	258,
	259,
	275,
	277,
	319,
	400,
	432
}

-- 武器屬性詳細武器id、價格、R、G、B
function SetOption(weaponid,price,cycletime,reloadtime,damage,red,green,blue)
	option = Common.GetWeaponOption(weaponid)  --[[設置武器]]
	option.price = price --[[武器價格]]

	if red ~= nil then
		option:SetBulletColor({r = red,g = green,b = blue})
	end
end

-- 輔助武器屬性
SetOption(1,100,255,255,50)
SetOption(10,100,255,255,50)
SetOption(11,100,255,255,50)
SetOption(16,100,255,255,50)
SetOption(17,100,255,255,50)
SetOption(26,100,255,255,50)
SetOption(56,100,255,255,50)
SetOption(67,100,255,255,50)
SetOption(70,100,255,255,50)
SetOption(75,100)
SetOption(78,100,255,255,50)
SetOption(235,100)
SetOption(318,100,255,255,50)
SetOption(329,100000,255,255,50)
SetOption(373,500000,255,255,50)
SetOption(395,1000000,255,255,50)
SetOption(431,5000000)
-- 狙擊槍屬性
SetOption(3,1000,255,255,255)
SetOption(13,1000,255,255,255)
SetOption(18,1000,255,255,255)
SetOption(24,1000,255,255,255)
SetOption(66,1000,255,255,255)
SetOption(103,1000,255,255,255)
-- 步槍屬性
SetOption(8,1000,255,128,0)
SetOption(14,1000,255,128,0)
SetOption(15,1000,255,128,0)
SetOption(22,1000,255,128,0)
SetOption(27,1000,255,128,0)
SetOption(28,1000,255,128,0)
SetOption(31,1000,255,128,0)
SetOption(60,1000,255,128,0)
SetOption(65,1000,255,128,0)
SetOption(83,1000)
SetOption(102,1000,255,128,0)
SetOption(107,1000,255,128,0)
SetOption(108,1000,255,128,0)
SetOption(160,1000,255,128,0)
SetOption(161,1000,255,128,0)
SetOption(163,1000,255,128,0)
SetOption(165,1000,255,128,0)
SetOption(168,1000,255,128,0)
SetOption(169,1000)
SetOption(183,1000,255,128,0)
SetOption(201,1000,255,128,0)
SetOption(204,1000,255,128,0)
SetOption(207,1000)
SetOption(221,1000)
SetOption(279,1000)
SetOption(306,500000,255,128,0)
SetOption(307,500000,255,128,0)
SetOption(338,500000,255,128,0)
SetOption(385,1000,255,128,0)
SetOption(398,1000,255,128,0)
-- 衝鋒槍屬性
SetOption(7,1000,128,255,255)
SetOption(12,1000,128,255,255)
SetOption(19,1000,128,255,255)
SetOption(23,1000,128,255,255)
SetOption(30,1000,128,255,255)
SetOption(74,1000,128,255,255)
SetOption(95,1000,128,255,255)
SetOption(105,1000,128,255,255)
SetOption(110,1000,128,255,255)
SetOption(135,1000,128,255,255)
SetOption(145,1000,128,255,255)
SetOption(200,1000)
SetOption(302,1000,128,255,255)
SetOption(440,1000000)
-- 散彈槍屬性
SetOption(5,1000,50,255,50)
SetOption(21,1000,50,255,50)
SetOption(39,1000,50,255,50)
SetOption(58,1000,50,255,50)
SetOption(63,1000,50,255,50)
SetOption(88,1000,50,255,50)
SetOption(90,1000,50,255,50)
SetOption(111,1000,50,255,50)
SetOption(126,1000,50,255,50)
SetOption(192,1000,50,255,50)
SetOption(203,1000,50,255,50)
SetOption(217,1000,50,255,50)
SetOption(239,1000,50,255,50)
SetOption(257,1000,50,255,50)
SetOption(281,1000,50,255,50)
SetOption(284,1000,50,255,50)
SetOption(337,1000,50,255,50)
SetOption(381,1000)
-- 機關槍屬性
SetOption(20,1000,255,50,255)
SetOption(41,1000,255,50,255)
SetOption(45,1000,255,50,255)
SetOption(59,1000,255,50,255)
SetOption(73,1000,255,50,255)
SetOption(115,1000,255,50,255)
SetOption(147,1000,255,50,255)
SetOption(172,1000,255,50,255)
SetOption(197,1000,255,50,255)
SetOption(241,1000,255,50,255)
SetOption(295,1000,255,50,255)
SetOption(303,1000)
SetOption(339,1000,255,50,255)
SetOption(377,1000,255,50,255)
SetOption(397,1000,255,50,255)
SetOption(417,1000,255,50,255)
SetOption(449,1000)
-- 裝備武器屬性
SetOption(118,80000)
SetOption(144,800000)
SetOption(170,100000)
SetOption(193,650000)
SetOption(209,30000)
SetOption(233,1000000)
SetOption(249,500000)
SetOption(258,50000)
SetOption(259,80000)
SetOption(275,10000000)
SetOption(277,350000)
SetOption(319,300000,50,50,255)
SetOption(400,250000)
SetOption(432,750000)