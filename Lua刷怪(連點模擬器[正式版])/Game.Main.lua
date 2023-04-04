-- G縮短表
G = {
    R = Game.Rule,
    SV = Game.SyncValue,
    EB = Game.EntityBlock,
    MT = Game.MONSTERTYPE,
    M = Game.Monster,
    WT = Game.WEAPONTYPE,
    HB = Game.HITBOX,
    WC = Game.WEAPONCOLOR
}

G.R.friendlyfire = false -- 同隊陣營傷害
G.R.enemyfire = false -- 敵隊陣營傷害
G.R.respawnTime = 0 -- 重生時間
G.R.respawnable = true -- 是否可以重生

All_lucky = 1
All_lucky_time = 0
All_tap = 1
All_tap_time = 0
All_gems = 1
All_gems_time = 0
All_coin = 1
All_coin_time = 0
Monster_KCtime = 0
Players = {} -- 儲存每個玩家的實體
AHtime = {}
DDP = 0
MOSHP = 0
MODA = nil
timehp1 = 0
timeap1 = 0
timepp1 = 0
timehp2 = 0
timeap2 = 0
timepp2 = 0
lint = 0 -- 初始值設定
-- 升級價格表
UpHpPrice = {}
UpApPrice = {}
UpSpPrice = {}
UpTpPrice = {}
UpLuckyPrice = {}
RBTpPrice = {}

-- 四捨五入函式
function G_Round(number) 
    if (number - (number % 0.1)) - (number - (number % 1)) < 0.5 then 
        number = number - (number % 1) 
    else 
        number = (number - (number % 1)) + 1 
    end 
    return number 
end

-- 數字進位函式
function G_NumberCarry(num)
    local carry = ''
    local temp = 0
    if num >= 10^3 and num < 10^6 then
       temp = string.format('%1.2f',num / 10^3)
       carry = ' K'
    elseif num >= 10^6 and num < 10^9 then
       temp = string.format('%1.2f',num / 10^6)
       carry = ' M'
    elseif num >= 10^9 and num < 10^12 then
       temp = string.format('%1.2f',num / 10^9)
       carry = ' B'
    elseif num >= 10^12 and num < 10^15 then
       temp = string.format('%1.2f',num / 10^12)
       carry = ' T'
    elseif num >= 10^15 and num < 10^18 then
       temp = string.format('%1.2f',num / 10^15)
       carry = ' Qd'
    elseif num >= 10^18 and num < 10^21 then
       temp = string.format('%1.2f',num / 10^18)
       carry = ' Qn'
    elseif num >= 10^21 and num < 10^24 then
       temp = string.format('%1.2f',num / 10^21)
       carry = ' Sx'
    elseif num >= 10^24 and num < 10^27 then
       temp = string.format('%1.2f',num / 10^24)
       carry = ' Sp'
    elseif num >= 10^27 and num < 10^30 then
       temp = string.format('%1.2f',num / 10^27)
       carry = ' Oc'
    elseif num >= 10^30 and num < 10^33 then
       temp = string.format('%1.2f',num / 10^30)
       carry = ' No'
    elseif num >= 10^33 and num < 10^36 then
       temp = string.format('%1.2f',num / 10^33)
       carry = ' Dc'
    elseif num >= 10^36 and num < 10^39 then
       temp = string.format('%1.2f',num / 10^36)
       carry = ' Udc'
    elseif num >= 10^39 and num < 10^42 then
       temp = string.format('%1.2f',num / 10^39)
       carry = ' Ddc'
    elseif num >= 10^42 and num < 10^45 then
       temp = string.format('%1.2f',num / 10^42)
       carry = ' Tdc'
    elseif num >= 10^45 and num < 10^48 then
       temp = string.format('%1.2f',num / 10^45)
       carry = ' Qddc'
    elseif num >= 10^48 and num < 10^51 then
       temp = string.format('%1.2f',num / 10^48)
       carry = ' Qndc'
    elseif num >= 10^51 and num < 10^54 then
       temp = string.format('%1.2f',num / 10^51)
       carry = ' Sxdc'
    elseif num >= 10^54 and num < 10^57 then
       temp = string.format('%1.2f',num / 10^54)
       carry = ' Spdc'
    elseif num >= 10^57 and num < 10^60 then
       temp = string.format('%1.2f',num / 10^57)
       carry = ' Odc'
    elseif num >= 10^60 then
       temp = string.format('%1.2f',num / 10^60)
       carry = ' Ndc'
    else
       temp = string.format('%1.0f', num)
    end
 
    return temp..carry
end

-- 武器販售函式
function G_WeaponsSales(weapon)
    return weapon.user.dtap
end

-- 建立同步變數函式
function G_SV_C(str)
    return G.SV.Create(str)
end

-- 隨機整數函式
function G_RI(max,min)
    return Game.RandomInt(max,min)
end

-- 隨機浮點數函式
function G_RF(max,min)
    return Game.RandomFloat(max,min)
end

-- 建立觸發方塊函式
local function G_EB_C(a,b,c)
    return G.EB:Create({x = a,y = b,z = c})
end

-- 在控制台顯示玩家數據函式
function G_ShowPlayerData (player)
    local pu = player.user
    -- 偵測各個玩家數據是否為空值
    if pu.detection == nil then
        pu.detection = 0
    end
    if pu.tap == nil then
        pu.tap = 0
    end
    if pu.gems == nil then
        pu.gems = 0
    end
    if pu.atm == nil then
        pu.atm = 0
    end
    if pu.act == nil then
        pu.act = 0
    end
    if pu.lc == nil then
        pu.lc = 0
    end
    if pu.hatch == nil then
        pu.hatch = 0
    end
    if pu.rebirth == nil then
        pu.rebirth = 0
    end
    if pu.lucky == nil or pu.lucky == 0 then
        pu.lucky = 1
    end
    if pu.hp == nil or pu.hp == 0 then
        pu.hp = 1
    end
    if pu.ap == nil or pu.ap == 0 then
        pu.ap = 1
    end
    if pu.sp == nil or pu.sp == 0 then
        pu.sp = 1
    end
    if pu.tp == nil or pu.tp == 0 then
        pu.tp = 1
    end
    if pu.rp == nil or pu.rp == 0 then
        pu.rp = 1
    end
    if pu.luckyp == nil or pu.luckyp == 0 then
        pu.luckyp = 1
    end
    if pu.tapbuff == nil or pu.tapbuff == 0 then
        pu.tapbuff = 1
    end
    if pu.gemsbuff == nil or pu.gemsbuff == 0 then
        pu.gemsbuff = 1
    end
    if pu.rebirthbuff == nil or pu.rebirthbuff == 0 then
        pu.rebirthbuff = 1
    end
    if pu.buyAT == nil then
        pu.buyAT = 0
    end
    if pu.autotap == nil then
        pu.autotap = 0
    end
    if pu.buyFAT == nil then
        pu.buyFAT = 0
    end
    if pu.fastauto == nil then
        pu.fastauto = 0
    end
    if pu.buyAR == nil then
        pu.buyAR = 0
    end
    if pu.autorebirth == nil then
        pu.autorebirth = 0
    end
    if pu.buyTH == nil then
        pu.buyTH = 0
    end
    if pu.triplehatch == nil then
        pu.triplehatch = 0
    end
    if pu.buyAH == nil then
        pu.buyAH = 0
    end
    if pu.autohatch == nil then
        pu.autohatch = 0
    end
    if pu.buySR == nil then
        pu.buySR = 0
    end
    if pu.superrun == nil then
        pu.superrun = 0
    end
    if pu.autosellweapon == nil then
        pu.autosellweapon = 0
    end
    if pu.autosellweapon2 == nil then
        pu.autosellweapon2 = 0
    end
    if pu.autosellweapon3 == nil then
        pu.autosellweapon3 = 0
    end
    if pu.blacklist == nil then
        pu.blacklist = 0
    end
    if pu.SPTV == nil then
        pu.SPTV = 0
    end
    if pu.TIME == nil then
        pu.TIME = 0
    end
    if pu.UPEN == nil then
        pu.UPEN = 0
    end
    if pu.MAP == nil then
        pu.MAP = 0
    end
    if pu.SI == nil then
        pu.SI = 0
    end
    if pu.ENBOSS1 == nil then
        pu.ENBOSS1 = 0
    end
    if pu.AHtime == nil then
        pu.AHtime = 0
    end
    if pu.AHmap == nil then
        pu.AHmap = 0
    end
    print('----- 玩家數據清單 -----\n')
    print('['..player.index..']'..player.name..', '..pu.detection)
    print('重生：'..G_NumberCarry(pu.rebirth)..'次')
    print('點擊數：'..G_NumberCarry(pu.tap))
    print('金幣：'..G_NumberCarry(player.coin))
    print('存款：'..G_NumberCarry(pu.atm)..'E')
    print('寶石：'..G_NumberCarry(pu.gems))
    print('抽蛋數；'..G_NumberCarry(pu.hatch))
    print('加成券：'..G_NumberCarry(pu.act)..'張')
    print('領主券：'..G_NumberCarry(pu.lc)..'張')
    print('幸運加成：'..string.format('%1.2f',pu.lucky..'\n'))
    print('------------------------')
end

-- 觸發方塊
E = {
    UP = {
        Omap1 = G_EB_C(163,-170,0),
        Cmap1 = G_EB_C(164,-170,0),
        Omap2 = G_EB_C(164,50,0),
        Cmap2 = G_EB_C(165,50,0),
    },
    RE = {
        Omap = G_EB_C(175,50,0),
        Cmap = G_EB_C(174,50,0),
    },
    MAP = {
        GEMS = G_EB_C(179,-160,17),
        unlock1 = G_EB_C(169,-156,0),
        unlock2 = G_EB_C(169,-120,0),
        unlock3 = G_EB_C(169,-80,0),
        unlock4 = G_EB_C(169,-40,0),
        unlock5 = G_EB_C(169,0,0),
        unlock6 = G_EB_C(169,40,0),
        unlock7 = G_EB_C(169,61,0),
        unlock8 = G_EB_C(169,101,0),
        unlock9 = G_EB_C(169,141,0),
        unlock10_1 = G_EB_C(169,181,0),
        unlock10_2 = G_EB_C(138,-180,0),
        unlock11 = G_EB_C(138,-141,0),
        unlock12 = G_EB_C(138,-101,0),
        unlock13 = G_EB_C(138,-80,0),
        unlock14 = G_EB_C(138,-40,0),
        unlock15 = G_EB_C(138,0,0),
        unlock16 = G_EB_C(138,40,0),
        unlock17 = G_EB_C(138,80,0),
    },
    BOSS = {
        BO1 = G_EB_C(148,-96,0),
        BC1 = G_EB_C(138,-180,31),
    },
    EGG = {
        Map1 = G_EB_C(176,-170,0),
        Map2 = G_EB_C(176,-140,0),
        Map3 = G_EB_C(176,-102,0),
        Map4 = G_EB_C(176,-60,0),
        Map5 = G_EB_C(176,-21,0),
        Map6 = G_EB_C(176,20,0),
        Map7 = G_EB_C(176,82,0),
        Map8 = G_EB_C(176,121,0),
        Map9 = G_EB_C(176,161,0),
        Map10 = G_EB_C(144,-161,0),
        Map11 = G_EB_C(144,-122,0),
        Map12 = G_EB_C(144,-60,0),
        Map13 = G_EB_C(144,-20,0),
        Map14 = G_EB_C(144,20,0),
        Map15 = G_EB_C(144,60,0),
        Map16 = G_EB_C(144,100,0),
        Map1001 = G_EB_C(144,-90,0),
    },
    ITEM = {
        CHP1 = G_EB_C(177,-164,1),
        HP1 = G_EB_C(177,-164,0),
        CAP1 = G_EB_C(177,-161,1),
        AP1 = G_EB_C(177,-161,0),
        CPP1 = G_EB_C(162,-158,1),
        PP1 = G_EB_C(162,-158,0),
        CHP2 = G_EB_C(162,45,1),
        HP2 = G_EB_C(162,45,0),
        CAP2 = G_EB_C(177,45,1),
        AP2 = G_EB_C(177,45,0),
        CPP2 = G_EB_C(162,55,1),
        PP2 = G_EB_C(162,55,0),
    },
    ATM = {
        Dposit = G_EB_C(179,-177,1),
        Withdraw = G_EB_C(179,-175,1),
    },
    ORB = G_EB_C(131,-90,0),
    CRB = G_EB_C(132,-90,0),
    WPER = G_EB_C(160,-174,0),
    Monster_Clear = G_EB_C(147,-84,1),
}

local Cheating = {
    [1] = '請你吃棉花糖',
    [2] = '破壞遊戲體驗玩家',
    [3] = '妹子思念我了',
    [4] = '缃嬡小神',
    [5] = '煞氣A阿祐',
    [6] = '三百壯士扛習近平',
    [7] = '龘龘虋麤齾',
    [8] = '天生自帶笑果',
    [9] = 'DottoAz',
    [10] = '藍藍烤番薯',
    [11] = '連假特產',
    [12] = '老牛吳家峻死啃老',
    [13] = 'DRaconNian演員',
    [14] = '嘻哈肉肉機614',
    [15] = '小冰冰小號',
    [16] = '小啾什麼',
    [17] = 'swgdvedq',
    [18] = 'l柚月亞衣l',
    [19] = '春的笑容由我守護',
    [20] = '劉1柏1園',
    [21] = '嵐司洛123',
    [22] = '吳生生',
    [23] = '劉l柏l園',
    [24] = '劉I柏I園',
    [25] = '劉l柏I園',
    [26] = '劉I柏l園',
    [27] = '劉1柏l園',
    [28] = '劉l柏1園',
    [29] = '劉I柏1園',
    [30] = '劉1柏I園',
    [31] = '我來破壞遊戲體驗',
    [32] = '龘龘虋𪋠齾',
    [33] = 'CxtrayAganzQ',
    [34] = '戰神南部掃全場'
}

OMapUP1 = G_SV_C('OMapUP1')
CMapUP1 = G_SV_C('CMapUP1')
OMapUP2 = G_SV_C('OMapUP2')
CMapUP2 = G_SV_C('CMapUP2')

OMapRE = G_SV_C('OMapRE')
CMapRE = G_SV_C('CMapRE')

OMapRB = G_SV_C('OMapRB')
CMapRB = G_SV_C('CMapRB')

RMKC = G_SV_C('RMKC')

RBLT = G_SV_C('RBLT')
RBLT.value = 0
RBGT = G_SV_C('RBGT')
RBGT.value = 0
RBCT = G_SV_C('RBCT')
RBCT.value = 0
RBTT = G_SV_C('RBTT')
RBTT.value = 0

CPGW = G_SV_C('CPGW')
PGW = G_SV_C('PGW')
CSGW = G_SV_C('CSGW')
SGW = G_SV_C('SGW')

CUpHp = G_SV_C('CUpHp')
UpHp = G_SV_C('UpHp')
CUpAp = G_SV_C('CUpAp')
UpAp = G_SV_C('UpAp')
CUpSp = G_SV_C('CUpSp')
UpSp = G_SV_C('UpSp')
CUpTp = G_SV_C('CUpTp')
UpTp = G_SV_C('UpTp')
CUpLucky = G_SV_C('CUpLucky')
UpLucky = G_SV_C('UpLucky')

CReTp = G_SV_C('CReTp')
ReTp = G_SV_C('ReTp')

CATSV = G_SV_C('CATSV')
ATSV = G_SV_C('ATSV')
CFATSV = G_SV_C('CFATSV')
FATSV = G_SV_C('FATSV')
CTHSV = G_SV_C('CTHSV')
THSV = G_SV_C('THSV')
CAHSV = G_SV_C('CAHSV')
AHSV = G_SV_C('AHSV')
CSRSV = G_SV_C('CSRSV')
SRSV = G_SV_C('SRSV')
CASWSV = G_SV_C('CASWSV')
ASWSV = G_SV_C('ASWSV')
CASW2SV = G_SV_C('CASW2SV')
ASW2SV = G_SV_C('ASW2SV')
CASW3SV = G_SV_C('CASW3SV')
ASW3SV = G_SV_C('ASW3SV')

ATOC = G_SV_C('ATOC')

CCSD = G_SV_C('CCSD')
SD = G_SV_C('SD')

CGEMS = G_SV_C('CGEMS')
GEMS = G_SV_C('GEMS')
CATM = G_SV_C('CATM')
ATM = G_SV_C('ATM')
CTAP = G_SV_C('CTAP')
TAP = G_SV_C('TAP')
CHATCH = G_SV_C('CHATCH')
HATCH = G_SV_C('HATCH')
CLUCKY = G_SV_C('CLUCKY')
LUCKY = G_SV_C('LUCKY')
CREBIRTH = G_SV_C('CREBIRTH')
REBIRTH = G_SV_C('REBIRTH')
CACT = G_SV_C('CACT')
ACT = G_SV_C('ACT')
CLC = G_SV_C('CLC')
LC = G_SV_C('LC')

CHP = G_SV_C('CHP')
MHP = G_SV_C('MHP')
HP = G_SV_C('HP')
CAP = G_SV_C('CAP')
MAP = G_SV_C('MAP')
AP = G_SV_C('AP')

CMOHP = G_SV_C('CMOHP')
MOMHP = G_SV_C('MOMHP')
MOHP = G_SV_C('MOHP')
DMOHP = G_SV_C('DMOHP')

AdviceHp = G_SV_C('AdviceHp')
AdviceAp = G_SV_C('AdviceAp')
AdviceSp = G_SV_C('AdviceSp')
AdviceTp = G_SV_C('AdviceTp')
AdviceRp = G_SV_C('AdviceRp')
AdviceDeBUG = G_SV_C('AdviceDeBUG')
AdviceAHStart = G_SV_C('AdviceAHStart')
AdviceAHStop = G_SV_C('AdviceAHStop')
AdviceLucky = G_SV_C('AdviceLucky')
Adviceilnt = G_SV_C('Adviceilnt')
Advicelimit = G_SV_C('Advicelimit')
AdviceATOw = G_SV_C('AdviceATOw')
AdviceUATOw = G_SV_C('AdviceUATOw')
AdviceFATOw = G_SV_C('AdviceFATOw')
AdviceUFATOw = G_SV_C('AdviceUFATOw')
AdviceTHOw = G_SV_C('AdviceTHOw')
AdviceUTHOw = G_SV_C('AdviceUTHOw')
AdviceAHOw = G_SV_C('AdviceAHOw')
AdviceUAHOw = G_SV_C('AdviceUAHOw')
AdviceSROw = G_SV_C('AdviceSROw')
AdviceUSROw = G_SV_C('AdviceUSROw')
AdviceUUBOw = G_SV_C('AdviceUUBOw')
AdviceATSW = G_SV_C('AdviceATSW')
AdviceATSW2 = G_SV_C('AdviceATSW2')
AdviceATSW3 = G_SV_C('AdviceATSW3')
AdviceSave = G_SV_C('AdviceSave')
AdviceNOw = G_SV_C('AdviceNOw')
AdviceNTAP = G_SV_C('AdviceNTAP')
AdviceNATM = G_SV_C('AdviceNATM')
AdviceNWP = G_SV_C('AdviceNWP')
AdviceNACT = G_SV_C('AdviceNACT')
AdviceNLC = G_SV_C('AdviceNLC')
AdviceNMKC = G_SV_C('AdviceNMKC')
AdviceCoin = G_SV_C('AdviceCoin')
AdviceATM = G_SV_C('AdviceATM')
AdviceGems = G_SV_C('AdviceGems')
AdviceGetGems = G_SV_C('AdviceGetGems')
AdviceGetAct = G_SV_C('AdviceGetAct')
AdviceGetLC = G_SV_C('AdviceGetLC')
AdviceWPUB = G_SV_C('AdviceWPUB')
AdviceLege = G_SV_C('AdviceLege')
AdviceMyth = G_SV_C('AdviceMyth')
AdviceSecr = G_SV_C('AdviceSecr')
AdviceBL =  G_SV_C('AdviceBL')
AdviceRebirth = G_SV_C('AdviceRebirth')

-- 販賣手持武器
function E.WPER:OnTouch(player)
    G_CheckWeapons(player)
    if player:GetPrimaryWeapon() == nil and player:GetSecondaryWeapon() == nil then
        AdviceNWP.value = player.index
    elseif player:GetSecondaryWeapon() == nil then
        if player:GetPrimaryWeapon().user.dtap == nil then return end
        player.coin = player.coin + G_WeaponsSales(player:GetPrimaryWeapon())
        player:RemoveWeapon()
    elseif player:GetPrimaryWeapon() == nil then
        if player:GetSecondaryWeapon().user.dtap == nil then return end
        player.coin = player.coin + G_WeaponsSales(player:GetSecondaryWeapon())
        player:RemoveWeapon()
    else
        if player:GetPrimaryWeapon().user.dtap == nil then return end
        if player:GetSecondaryWeapon().user.dtap == nil then return end
        player.coin = player.coin + (G_WeaponsSales(player:GetPrimaryWeapon()) + G_WeaponsSales(player:GetSecondaryWeapon()))
        player:RemoveWeapon()
    end
end

-- 雲端銀行
function E.ATM.Dposit:OnUse(player)
    pu = player.user
    if player.coin >= 10^8 then
        if pu.atm == nil then
            pu.atm = 1
        else
            pu.atm = pu.atm + 1
        end
        player.coin = player.coin - 100000000
    else
        AdviceCoin.value = player.index
    end
    CATM.value = player.index
    ATM.value = pu.atm
end
function E.ATM.Withdraw:OnUse(player)
    pu = player.user
    if pu.atm > 0 then
        if (player.coin + 10^8) <= 10^9 then
            pu.atm = pu.atm - 1
            player.coin = player.coin + 100000000
            if pu.atm - 1 <= 0 then pu.atm = 0 end
        else
            Advicelimit.value = player.index
        end
    else
        AdviceATM.value = player.index
    end
    CATM.value = player.index
    ATM.value = pu.atm
end

-- 升級介面UI開啟關閉
function E.UP.Omap1:OnTouch(player)
    if player.user.UPEN == 0 then
        OMapUP1.value = player.index
        player.user.UPEN = 1
    end
end
function E.UP.Cmap1:OnTouch(player)
    if player.user.UPEN == 1 then
        CMapUP1.value = player.index
        player.user.UPEN = 0
    end
end
function E.UP.Omap2:OnTouch(player)
    if player.user.UPEN == 0 then
        OMapUP2.value = player.index
        player.user.UPEN = 1
    end
end
function E.UP.Cmap2:OnTouch(player)
    if player.user.UPEN == 1 then
        CMapUP2.value = player.index
        player.user.UPEN = 0
    end
end

function E.RE.Omap:OnTouch(player)
    if player.user.UPEN == 0 then
        OMapRE.value = player.index
        player.user.UPEN = 1
    end
end
function E.RE.Cmap:OnTouch(player)
    if player.user.UPEN == 1 then
        CMapRE.value = player.index
        player.user.UPEN = 0
    end
end

function E.ORB:OnTouch(player)
    if player.user.UPEN == 0 then
        OMapRB.value = player.index
        player.user.UPEN = 1
    end
end
function E.CRB:OnTouch(player)
    if player.user.UPEN == 1 then
        CMapRB.value = player.index
        player.user.UPEN = 0
    end
end

function E.Monster_Clear:OnUse(player)
    if RMKC.value == 0 then
        Game.KillAllMonsters()
        for i = 1, 15 do
            MLC[i] = 0
            LVNU.Mapi = 0
            LVC[i] = 0
        end
        MLC[1001] = 0
        LVNU.Map1001 = 0
        LVC[1001] = 0
        Monster_KCtime = Game.GetTime() + 60
        RMKC.value = Monster_KCtime
        G_ST('Mstrkl',true)
        G_ST('Mstrkl',false)
    else
        AdviceNMKC.value = player.index
    end
end

-- 地圖1的道具販賣機
function E.ITEM.HP1:OnUse(player)
    timehp1 = Game.GetTime() + 1
end
function E.ITEM.AP1:OnUse(player)
    timeap1 = Game.GetTime() + 1
end
function E.ITEM.PP1:OnUse(player)
    timepp1 = Game.GetTime() + 1
end
-- 地圖6的道具販賣機
function E.ITEM.HP2:OnUse(player)
    timehp2 = Game.GetTime() + 1
end
function E.ITEM.AP2:OnUse(player)
    timeap2 = Game.GetTime() + 1
end
function E.ITEM.PP2:OnUse(player)
    timepp2 = Game.GetTime() + 1
end

-- 地圖1的跑酷獎勵
function E.MAP.GEMS:OnTouch(player)
    player.position = {x = 170, y = -175, z  = 3}
    player.user.gems = player.user.gems + ((5 * (player.user.rebirth + 1) * player.user.gemsbuff) * All_gems)
    CGEMS.value = player.index
    GEMS.value = player.user.gems
    AdviceGetGems.value = player.index
end

-- 地圖2解鎖條件
function E.MAP.unlock1:OnTouch(player)
    if player.user.tap < 10000 then
        player.velocity = {y = -50}
        AdviceNTAP.value = player.index
    else
        if player.position.y < self.position.y then
            player.user.MAP = 1
            player:Signal(1)
        else
            player.user.MAP = 2
            player:Signal(2)
            LVNU.Map1 = 1
            MNC(1)
        end
    end
end

-- 地圖3解鎖條件
function E.MAP.unlock2:OnTouch(player)
    if player.user.tap < 250000 then
        player.velocity = {y = -50}
        AdviceNTAP.value = player.index
    else
        if player.position.y < self.position.y then
            player.user.MAP = 2
            player:Signal(2)
            LVNU.Map1 = 1
            MNC(1)
        else
            player.user.MAP = 3
            player:Signal(3)
            LVNU.Map2 = 1
            MNC(2)
        end
    end
end

-- 地圖4解鎖條件
function E.MAP.unlock3:OnTouch(player)
    if player.user.tap < 2500000 then
        player.velocity = {y = -50}
        AdviceNTAP.value = player.index
    else
        if player.position.y < self.position.y then
            player.user.MAP = 3
            player:Signal(3)
            LVNU.Map2 = 1
            MNC(2)
        else
            player.user.MAP = 4
            player:Signal(4)
            LVNU.Map3 = 1
            MNC(3)
        end
    end
end

-- 地圖5解鎖條件
function E.MAP.unlock4:OnTouch(player)
    if player.user.tap < 25000000 then
        player.velocity = {y = -50}
        AdviceNTAP.value = player.index
    else
        if player.position.y < self.position.y then
            player.user.MAP = 4
            player:Signal(4)
            LVNU.Map3 = 1
            MNC(3)
        else
            player.user.MAP = 5
            player:Signal(5)
            LVNU.Map4 = 1
            MNC(4)
        end
    end
end

-- 地圖6解鎖條件
function E.MAP.unlock5:OnTouch(player)
    if player.user.tap < 250000000 then
        player.velocity = {y = -50}
        AdviceNTAP.value = player.index
    else
        if player.position.y < self.position.y then
            player.user.MAP = 5
            player:Signal(5)
            LVNU.Map4 = 1
            MNC(4)
        else
            player.user.MAP = 6
            player:Signal(6)
            LVNU.Map5 = 1
            MNC(5)
        end
    end
end

-- 地圖7解鎖條件
function E.MAP.unlock6:OnTouch(player)
    if player.user.tap < 2500000000 then
        player.velocity = {y = -50}
        AdviceNTAP.value = player.index
    else
        if player.position.y < self.position.y then
            player.user.MAP = 6
            player:Signal(6)
            LVNU.Map5 = 1
            MNC(5)
        else
            player.user.MAP = 7
            player:Signal(7)
        end
    end
end

-- 地圖8解鎖條件
function E.MAP.unlock7:OnTouch(player)
    if player.user.tap < 10^10 then
        player.velocity = {y = -50}
        AdviceNTAP.value = player.index
    else
        if player.position.y < self.position.y then
            player.user.MAP = 7
            player:Signal(7)
        else
            player.user.MAP = 8
            player:Signal(8)
            LVNU.Map6 = 1
            MNC(6)
        end
    end
end

-- 地圖9解鎖條件
function E.MAP.unlock8:OnTouch(player)
    if player.user.tap < 10^11 then
        player.velocity = {y = -50}
        AdviceNTAP.value = player.index
    else
        if player.position.y < self.position.y then
            player.user.MAP = 8
            player:Signal(8)
            LVNU.Map6 = 1
            MNC(6)
        else
            player.user.MAP = 9
            player:Signal(9)
            LVNU.Map7 = 1
            MNC(7)
        end
    end
end

-- 地圖10解鎖條件
function E.MAP.unlock9:OnTouch(player)
    if player.user.tap < 10^12 then
        player.velocity = {y = -50}
        AdviceNTAP.value = player.index
    else
        if player.position.y < self.position.y then
            player.user.MAP = 9
            player:Signal(9)
            LVNU.Map7 = 1
            MNC(7)
        else
            player.user.MAP = 10
            player:Signal(10)
            LVNU.Map8 = 1
            MNC(8)
        end
    end
end

-- 地圖11解鎖條件
function E.MAP.unlock10_1:OnTouch(player)
    if player.user.tap < 10^13 then
        player.velocity = {y = -50}
        AdviceNTAP.value = player.index
    else
        player.position = {x = 140, y = -175, z  = 3}
        player.user.MAP = 11
        player:Signal(11)
        LVNU.Map9 = 1
        MNC(9)
    end
end
function E.MAP.unlock10_2:OnTouch(player)
    player.position = {x = 170, y = 175, z  = 3}

    player.user.MAP = 10
    player:Signal(10)
    LVNU.Map8 = 1
    MNC(8)
end

-- 地圖12解鎖條件
function E.MAP.unlock11:OnTouch(player)
    if player.user.tap <= 10^14 then
        player.velocity = {y = -50}
        AdviceNTAP.value = player.index
    else
        if player.position.y < self.position.y then
            player.user.MAP = 11
            player:Signal(11)
            LVNU.Map9 = 1
            MNC(9)
        else
            player.user.MAP = 12
            player:Signal(12)
            LVNU.Map10 = 1
            MNC(10)
        end
    end
end

-- 地圖13解鎖條件
function E.MAP.unlock12:OnTouch(player)
    if player.user.tap < 10^15 then
        player.velocity = {y = -50}
        AdviceNTAP.value = player.index
    else
        if player.position.y < self.position.y then
            player.user.MAP = 12
            player:Signal(12)
            LVNU.Map10 = 1
            MNC(10)
        else
            player.user.MAP = 13
            player:Signal(13)
        end
    end
end

-- 地圖14解鎖條件
function E.MAP.unlock13:OnTouch(player)
    if player.user.tap < 10^16 then
        player.velocity = {y = -50}
        AdviceNTAP.value = player.index
    else
        if player.position.y < self.position.y then
            player.user.MAP = 13
            player:Signal(13)
        else
            player.user.MAP = 14
            player:Signal(14)
            LVNU.Map11 = 1
            MNC(11)
        end
    end
end

-- 地圖15解鎖條件
function E.MAP.unlock14:OnTouch(player)
    if player.user.tap < 10^18 then
        player.velocity = {y = -50}
        AdviceNTAP.value = player.index
    else
        if player.position.y < self.position.y then
            player.user.MAP = 14
            player:Signal(14)
            LVNU.Map11 = 1
            MNC(11)
        else
            player.user.MAP = 15
            player:Signal(15)
            LVNU.Map12 = 1
            MNC(12)
        end
    end
end

-- 地圖16解鎖條件
function E.MAP.unlock15:OnTouch(player)
    if player.user.tap < 10^19 then
        player.velocity = {y = -50}
        AdviceNTAP.value = player.index
    else
        if player.position.y < self.position.y then
            player.user.MAP = 15
            player:Signal(15)
            LVNU.Map12 = 1
            MNC(12)
        else
            player.user.MAP = 16
            player:Signal(16)
            LVNU.Map13 = 1
            MNC(13)
        end
    end
end

-- 地圖17解鎖條件
function E.MAP.unlock16:OnTouch(player)
    if player.user.tap < 10^20 then
        player.velocity = {y = -50}
        AdviceNTAP.value = player.index
    else
        if player.position.y < self.position.y then
            player.user.MAP = 16
            player:Signal(16)
            LVNU.Map13 = 1
            MNC(13)
        else
            player.user.MAP = 17
            player:Signal(17)
            LVNU.Map14 = 1
            MNC(14)
        end
    end
end

-- 地圖18解鎖條件
function E.MAP.unlock17:OnTouch(player)
    if player.user.tap < 10^21 then
        player.velocity = {y = -50}
        AdviceNTAP.value = player.index
    else
        if player.position.y < self.position.y then
            player.user.MAP = 17
            player:Signal(17)
            LVNU.Map14 = 1
            MNC(14)
        else
            player.user.MAP = 18
            player:Signal(18)
            LVNU.Map15 = 1
            MNC(15)
        end
    end
end

-- 進入爆破領主
function E.BOSS.BO1:OnTouch(player)
    player.position = {x = 140, y = -175, z  = 33}
    player.user.ENBOSS1 = 1
    player:Signal(101)
    LVNU.Map1001 = 1
    MNC(1001)
end

-- 離開爆破領主
function E.BOSS.BC1:OnTouch(player)
    player.position = {x = 140, y = -95, z  = 3}
    player.user.ENBOSS1 = 0
    player:Signal(13)
end

-- 怪物傷害系統
function G.R:OnTakeDamage(victim,attacker,damage,weapontype,hitbox)
    if attacker == nil then
        if victim:IsMonster() then
            victim = victim:ToMonster()
            vu = victim.user

            if vu.SI > Game.GetTime() then
                return 0
            end

            return damage

        elseif victim:IsPlayer() then
            victim = victim:ToPlayer()
            vu = victim.user

            return damage
        end

	elseif attacker:IsPlayer() then
        attacker = attacker:ToPlayer()
        au = attacker.user

        if victim:IsMonster() then
            victim = victim:ToMonster()
            vu = victim.user

            if vu.SI ~= nil then
                if vu.SI > Game.GetTime() then
                    return 0
                end
            end

            if vu.MK == 1001 then
                au.ENBOSS1 = 2
            end

            if au.tap <= vu.limit then
                AdviceNTAP.value = attacker.index
                return 0
            end

            damage = ADD_damage(attacker,victim,weapontype,damage,hitbox)
            
            MODA = victim
            MOSHP = Game.GetTime() + 1
            SD.value = au.tap

            return damage

        elseif victim:IsPlayer() then
            victim = victim:ToPlayer()
            vu = victim.user

            return damage
        end

    elseif attacker:IsMonster() then
        attacker = attacker:ToMonster()
        au = attacker.user

        if victim:IsPlayer() then
            victim = victim:ToPlayer()
            vu = victim.user

            if au.MK == 1001 then
                return math.ceil(victim.maxhealth * 0.25)
            end
            
        elseif victim:IsMonster() then
            victim = victim:ToMonster()
            vu = victim.user

            return 0
        end
	end
end

-- 玩家傷害系統
function G.R:OnPlayerAttack(victim,attacker,damage,weapontype,hitbox)
    if attacker == nil then
        victim = victim:ToPlayer()
        vu = victim.user

        if vu.SI > Game.GetTime() then
            return 0
        end

        return damage

    elseif attacker:IsPlayer() then
        attacker = attacker:ToPlayer()
        victim = victim:ToPlayer()
        au = attacker.user
        vu = victim.user

        if attacker.index == victim.index then
            victim.velocity = {z = 0}
        end

        return damage
    end
end

-- 計算傷害
function ADD_damage(attacker,victim,weapontype,damage,hitbox)
    vu = victim.user
    au = attacker.user
    
    CCSD.value = attacker.index

    if vu.health <= 0 then
        vu.health = 0
    end

    damage = au.tap

    local MonsterHP = victim.health + vu.health
    
    if MonsterHP >= 2147483648 or MonsterHP < 0 then
        local MonsterHP = victim.health + vu.health

        if damage >= MonsterHP then
            vu.health = 0
            SD.value = damage
            victim:ShowOverheadDamage(MonsterHP,0)
            victim.health = victim.health - 500000
            victim.health = victim.health - 500000
            return victim.health
        else
            SD.value = damage    
            victim:ShowOverheadDamage(damage,0)
        end

        MODA = victim
        DDP = attacker.index

        if vu.health > 0 then
            if math.ceil(damage) >= MonsterHP then
                victim.health = victim.health - math.ceil(damage)
                MOSHP = Game.GetTime() + 1
                return MonsterHP
    
            elseif math.ceil(damage) >= vu.health then
                damage = math.ceil(damage) - vu.health
                vu.health = 0
                MOSHP = Game.GetTime() + 1
                return math.ceil(damage)
            end
    
            vu.health = vu.health - math.ceil(damage)
            MOSHP = Game.GetTime() + 1
    
            return 0
        else
            if math.ceil(damage) >= MonsterHP then
                victim.health = victim.health - math.ceil(damage)
                MOSHP = Game.GetTime() + 1
                return MonsterHP
    
            else
                victim.health = victim.health - math.ceil(damage)
                MOSHP = Game.GetTime() + 1
                return 0
    
            end
        end

    else
        local MonsterHP = victim.health + vu.health

        if damage >= MonsterHP then
            damage = MonsterHP
            SD.value = damage
            victim:ShowOverheadDamage(MonsterHP,0)
        else
            SD.value = damage    
            victim:ShowOverheadDamage(damage,0)
        end

        MODA = victim
        DDP = attacker.index

        if vu.health > 0 then
            if math.ceil(damage) >= MonsterHP then
                victim.health = victim.health - math.ceil(damage)
                MOSHP = Game.GetTime() + 1
                return MonsterHP
    
            elseif math.ceil(damage) >= vu.health then
                damage = math.ceil(damage) - vu.health
                vu.health = 0
                MOSHP = Game.GetTime() + 1
                return math.ceil(damage)
            end
    
            vu.health = vu.health - math.ceil(damage)
            MOSHP = Game.GetTime() + 1
    
            return 0
        else
            if math.ceil(damage) >= MonsterHP then
                victim.health = victim.health - math.ceil(damage)
                MOSHP = Game.GetTime() + 1
                return MonsterHP
    
            else
                victim.health = victim.health - math.ceil(damage)
                MOSHP = Game.GetTime() + 1
                return 0
    
            end
        end
    end
end

-- 怪物擊殺系統
function G.R:OnKilled(victim,killer)
    if killer == nil then

        if victim:IsMonster() then
            victim = victim:ToMonster()
            vu = victim.user

            if RMKC.value - 59 <= Game.GetTime() then
                Total_area(vu.MK,vu.B)
            end
            MOHP.value = 0
            MODA = nil

        elseif victim:IsPlayer() then
            victim = victim:ToPlayer()
            vu = victim.user

            CHP.value = victim.index -- 偵測各個玩家的索引值
            MHP.value = victim.maxhealth -- 偵測各個玩家的最大血量
            HP.value = victim.health -- 偵測各個玩家的目前血量
            CAP.value = victim.index -- 偵測各個玩家的索引值
            MAP.value = victim.maxarmor -- 偵測各個玩家的最大護甲
            AP.value = victim.armor -- 偵測各個玩家的目前護甲

        end

    elseif killer:IsPlayer() then
        killer = killer:ToPlayer()
        ku = killer.user

        if victim:IsMonster() then
            victim = victim:ToMonster()
            vu = victim.user
            if vu.MK == 1001 then
                if ku.ENBOSS1 == 2 then
                    ku.lc = ku.lc + G_RI(1,3)
                    AdviceGetLC.value = killer.index
                    CLC.value = killer.index
                    LC.value = ku.lc
                end
            end

            Total_area(vu.MK,vu.B)
            local RN_ACT = G_RF(1,100)
            if vu.gems ~= 0 and vu.gems ~= nil then
                ku.gems = ku.gems + ((vu.gems * (ku.rebirth + 1) * ku.gemsbuff) * All_gems)
                AdviceGetGems.value = killer.index
                CGEMS.value = killer.index
                GEMS.value = ku.gems
            end
            if RN_ACT > 97.50 and RN_ACT < 100.01 then
                ku.act = ku.act + 1
                AdviceGetAct.value = killer.index
                CACT.value = killer.index
                ACT.value = ku.act
            end

            killer.coin = killer.coin + ((victim.coin * ku.rebirth) * All_coin)

            CMOHP.value = killer.index
            MOMHP.value = victim.maxhealth + vu.maxhealth
            MOHP.value = 0
            MODA = nil

        elseif victim:IsPlayer() then
            victim = victim:ToPlayer()
            vu = victim.user

            CHP.value = victim.index -- 偵測各個玩家的索引值
            MHP.value = victim.maxhealth -- 偵測各個玩家的最大血量
            HP.value = victim.health -- 偵測各個玩家的目前血量
            CAP.value = victim.index -- 偵測各個玩家的索引值
            MAP.value = victim.maxarmor -- 偵測各個玩家的最大護甲
            AP.value = victim.armor -- 偵測各個玩家的目前護甲

        end

    elseif killer:IsMonster() then
        killer = killer:ToMonster()
        ku = killer.user

        if victim:IsMonster() then
            victim = victim:ToMonster()
            vu = victim.user

            Total_area(vu.MK,vu.B)
            MOHP.value = 0
            MODA = nil

        elseif victim:IsPlayer() then
            victim = victim:ToPlayer()
            vu = victim.user

            if ku.MK == 1001 then
                vu.ENBOSS1 = 0
            end

            CHP.value = victim.index -- 偵測各個玩家的索引值
            MHP.value = victim.maxhealth -- 偵測各個玩家的最大血量
            HP.value = victim.health -- 偵測各個玩家的目前血量
            CAP.value = victim.index -- 偵測各個玩家的索引值
            MAP.value = victim.maxarmor -- 偵測各個玩家的最大護甲
            AP.value = victim.armor -- 偵測各個玩家的目前護甲

        end
    end
end

-- 玩家重生時呼叫函數
function G.R:OnPlayerSpawn(player)
    pu = player.user
    
    player.team = Game.TEAM.CT
    player.armor = player.maxarmor
    player.health = player.maxhealth
    player.armor = player.maxarmor
end

-- 玩家選擇角色後初次重生時叫出的函數
function G.R:OnPlayerJoiningSpawn(player)

    if lint == 0 then
        local dn1 = 1.0
        for i = 1,100 do
            table.insert(UpHpPrice,i,G_Round(125^dn1))
            table.insert(UpApPrice,i,G_Round(150^dn1))
            table.insert(UpTpPrice,i,G_Round(11^dn1))
            dn1 = dn1 + 0.1
        end
        local dn2 = 1.0
        for i = 1,41 do
            table.insert(UpLuckyPrice,i,G_Round(100^dn2))
            dn2 = dn2 + 0.1
        end
        local dn3 = 1.0
        for i = 1,11 do
            table.insert(UpSpPrice,i,G_Round(100^dn3))
            dn3 = dn3 + 0.1
        end
        local dn4 = 1.0
        for i = 1,100 do
            table.insert(RBTpPrice,i,G_Round(100000000^dn4))
            dn4 = dn4 + 0.05
        end

        lint = 1
    end
    
    if player == nil then return end

    local pu = player.user

    -- 儲存玩家排列
    Players[player.index] = player

    -- 團隊設定
    if player.team == Game.TEAM.TR then
        player.team = Game.TEAM.CT
    end

    -- 基本能力
    player.maxhealth = 100 -- 最大血量
    player.maxarmor = 100 -- 最大護甲
    player.coin = 0 -- 金幣
    player.maxspeed = 1 -- 跑速
    pu.detection = 0 -- 偵錯
    pu.tap = 0 -- 點擊數
    pu.atm = 0 -- 存款
    pu.gems = 0 -- 鑽石
    pu.act = 0 -- 活動券
    pu.lc = 0 -- 領主券
    pu.rebirth = 0 -- 重生
    pu.hatch = 0 -- 抽蛋數
    pu.lucky = 1 -- 幸運
    pu.hp = 1 -- 偵測玩家升級血量的價格逐增
    pu.ap = 1 -- 偵測玩家升級護甲的價格逐增
    pu.sp = 1 -- 偵測玩家升級跑速的價格逐增
    pu.tp = 1 -- 偵測玩家升級額外點擊的價格逐增
    pu.rp = 1 -- 偵測玩家重生次數的需要的點擊數逐增
    pu.luckyp = 1 -- 偵測玩家升級幸運的價格逐增
    pu.tapbuff = 1 -- 點擊增益
    pu.gemsbuff = 1 -- 鑽石增益
    pu.rebirthbuff = 1 -- 重生增益
    pu.buyAT = 0 -- 是否有購買自動連點
    pu.autotap = 0 -- 自動連點開關
    pu.buyFAT = 0 -- 是否有購買快速自動連點
    pu.fastauto = 0 -- 快速自動連點開關
    pu.buyAR = 0 -- 是否有購買自動重生
    pu.autorebirth = 0 -- 自動重生開關
    pu.buyTH = 0 -- 是否有買三連抽
    pu.triplehatch = 0 -- 三連抽開關
    pu.buyAH = 0 -- 是否有買自動抽獎
    pu.autohatch = 0 -- 自動抽獎開關
    pu.buySR = 0 -- 是否有買超級跑速
    pu.superrun = 0 -- 超級跑速開關
    pu.buyUB = 0 -- 是否有買無限備彈
    pu.autosellweapon = 0 -- 自動販售史詩級以下的武器開關
    pu.autosellweapon2 = 0 -- 自動販售傳說級的武器開關
    pu.autosellweapon3 = 0 -- 自動販售神話級的武器開關
    pu.blacklist = 0

    pu.SPTV = 0
    pu.TIME = 0
    pu.UPEN = 0
    pu.MAP = 0
    pu.SI = 0
    pu.gwp = 0
    pu.swp = 0
    pu.ENBOSS1 = 0
    pu.AHtime = 0
    pu.AHmap = 0

    if player.name == '黃泉驅' then
        player.maxhealth = 100
        player.maxarmor = 100
        player.coin = 500000000
        pu.detection = 0
        pu.tap = 10^22
        pu.atm = 100
        pu.gems = 1000000000000
        pu.act = 50
        pu.lc = 50
        pu.rebirth = 1
        pu.hatch = 0
        pu.lucky = 1
        pu.hp = 100
        pu.ap = 100
        pu.sp = 10
        pu.tp = 1
        pu.rp = 1
        pu.luckyp = 41
        pu.tapbuff = 1
        pu.gemsbuff = 1
        pu.rebirthbuff = 1
        pu.si = 0
        pu.buyAT = 1
        pu.autotap = 1
        pu.buyFAT = 1
        pu.fastauto = 1
        pu.buyAR = 1
        pu.autorebirth = 0
        pu.buyTH = 1
        pu.triplehatch = 1
        pu.buyAH = 1
        pu.autohatch = 1
        pu.buySR = 1
        pu.superrun = 1
        pu.buyUB = 1
        pu.autosellweapon = 0
        pu.autosellweapon2 = 0
        pu.autosellweapon3 = 0
        pu.blacklist = 0

        pu.SPTV = 0
        pu.TIME = 0
        pu.UPEN = 0
        pu.MAP = 0
        pu.SI = 0
        pu.gwp = 0
        pu.swp = 0
        pu.ENBOSS1 = 0
        pu.AHtime = 0
        pu.AHmap = 0
    end
end

-- 玩家離線
function G.R:OnPlayerDisconnect(player)

    if player ~= nil then
        pu = player.user

        -- 偵測各個玩家數據是否為空值
        if pu.detection == nil then
            pu.detection = 0
        end
        if pu.tap == nil then
            pu.tap = 0
        end
        if pu.gems == nil then
            pu.gems = 0
        end
        if pu.atm == nil then
            pu.atm = 0
        end
        if pu.act == nil then
            pu.act = 0
        end
        if pu.lc == nil then
            pu.lc = 0
        end
        if pu.hatch == nil then
            pu.hatch = 0
        end
        if pu.rebirth == nil then
            pu.rebirth = 0
        end
        if pu.lucky == nil or pu.lucky == 0 then
            pu.lucky = 1
        end
        if pu.hp == nil or pu.hp == 0 then
            pu.hp = 1
        end
        if pu.ap == nil or pu.ap == 0 then
            pu.ap = 1
        end
        if pu.sp == nil or pu.sp == 0 then
            pu.sp = 1
        end
        if pu.tp == nil or pu.tp == 0 then
            pu.tp = 1
        end
        if pu.rp == nil or pu.rp == 0 then
            pu.rp = 1
        end
        if pu.luckyp == nil or pu.luckyp == 0 then
            pu.luckyp = 1
        end
        if pu.tapbuff == nil or pu.tapbuff == 0 then
            pu.tapbuff = 1
        end
        if pu.gemsbuff == nil or pu.gemsbuff == 0 then
            pu.gemsbuff = 1
        end
        if pu.rebirthbuff == nil or pu.rebirthbuff == 0 then
            pu.rebirthbuff = 1
        end
        if pu.buyAT == nil then
            pu.buyAT = 0
        end
        if pu.autotap == nil then
            pu.autotap = 0
        end
        if pu.buyFAT == nil then
            pu.buyFAT = 0
        end
        if pu.fastauto == nil then
            pu.fastauto = 0
        end
        if pu.buyAR == nil then
            pu.buyAR = 0
        end
        if pu.autorebirth == nil then
            pu.autorebirth = 0
        end
        if pu.buyTH == nil then
            pu.buyTH = 0
        end
        if pu.triplehatch == nil then
            pu.triplehatch = 0
        end
        if pu.buyAH == nil then
            pu.buyAH = 0
        end
        if pu.autohatch == nil then
            pu.autohatch = 0
        end
        if pu.buySR == nil then
            pu.buySR = 0
        end
        if pu.superrun == nil then
            pu.superrun = 0
        end
        if pu.buyUB == nil then
            pu.buyUB = 0
        end
        if pu.autosellweapon == nil then
            pu.autosellweapon = 0
        end
        if pu.autosellweapon2 == nil then
            pu.autosellweapon2 = 0
        end
        if pu.autosellweapon3 == nil then
            pu.autosellweapon3 = 0
        end
        if pu.blacklist == nil then
            pu.blacklist = 0
        end
    
        for i = 1, #Players do
            if Players[i] ~= nil then
                if Players[i].name ~= player.name then
                    G_ShowPlayerData (Players[i])
                else
                    Players[player.index] = nil
                end
            end
        end
    
        player:SetGameSave('detection',pu.detection)
        player:SetGameSave('rebirth',pu.rebirth)
        player:SetGameSave('tap',pu.tap)
        player:SetGameSave('atm',pu.atm)
        player:SetGameSave('gems',pu.gems)
        player:SetGameSave('hatch',pu.hatch)
        player:SetGameSave('act',pu.act)
        player:SetGameSave('lc',pu.lc)
        player:SetGameSave('lucky',pu.lucky)
        player:SetGameSave('hp',pu.hp)
        player:SetGameSave('ap',pu.ap)
        player:SetGameSave('sp',pu.sp)
        player:SetGameSave('tp',pu.tp)
        player:SetGameSave('rp',pu.rp)
        player:SetGameSave('luckyp',pu.luckyp)
        player:SetGameSave('tapbuff',pu.tapbuff)
        player:SetGameSave('gemsbuff',pu.gemsbuff)
        player:SetGameSave('rebirthbuff',pu.rebirthbuff)
        player:SetGameSave('buyAT',pu.buyAT)
        player:SetGameSave('autotap',pu.autotap)
        player:SetGameSave('buyFAT',pu.buyFAT)
        player:SetGameSave('fastauto',pu.fastauto)
        player:SetGameSave('buyTH',pu.buyTH)
        player:SetGameSave('triplehatch',pu.triplehatch)
        player:SetGameSave('buyAH',pu.buyAH)
        player:SetGameSave('autohatch',pu.autohatch)
        player:SetGameSave('buySR',pu.buySR)
        player:SetGameSave('superrun',pu.superrun)
        player:SetGameSave('buyUB',pu.buyUB)
        player:SetGameSave('autosellweapon',pu.autosellweapon)
        player:SetGameSave('autosellweapon2',pu.autosellweapon2)
        player:SetGameSave('autosellweapon3',pu.autosellweapon3)
        player:SetGameSave('blacklist',pu.blacklist)
    end
end

-- 紀錄計算
function DoubleToInt(number)
    if number ~= nil then
        return math.floor(math.abs(number + EPSILON))
    end
end

-- 各玩家儲存資訊
function G.R:OnGameSave(player)

    if player ~= nil then 
        pu = player.user

        -- 偵測各個玩家數據是否為空值
        if pu.detection == nil then
            pu.detection = 0
        end
        if pu.tap == nil then
            pu.tap = 0
        end
        if pu.gems == nil then
            pu.gems = 0
        end
        if pu.atm == nil then
            pu.atm = 0
        end
        if pu.act == nil then
            pu.act = 0
        end
        if pu.lc == nil then
            pu.lc = 0
        end
        if pu.hatch == nil then
            pu.hatch = 0
        end
        if pu.rebirth == nil then
            pu.rebirth = 0
        end
        if pu.lucky == nil or pu.lucky == 0 then
            pu.lucky = 1
        end
        if pu.hp == nil or pu.hp == 0 then
            pu.hp = 1
        end
        if pu.ap == nil or pu.ap == 0 then
            pu.ap = 1
        end
        if pu.sp == nil or pu.sp == 0 then
            pu.sp = 1
        end
        if pu.tp == nil or pu.tp == 0 then
            pu.tp = 1
        end
        if pu.rp == nil or pu.rp == 0 then
            pu.rp = 1
        end
        if pu.luckyp == nil or pu.luckyp == 0 then
            pu.luckyp = 1
        end
        if pu.tapbuff == nil or pu.tapbuff == 0 then
            pu.tapbuff = 1
        end
        if pu.gemsbuff == nil or pu.gemsbuff == 0 then
            pu.gemsbuff = 1
        end
        if pu.rebirthbuff == nil or pu.rebirthbuff == 0 then
            pu.rebirthbuff = 1
        end
        if pu.buyAT == nil then
            pu.buyAT = 0
        end
        if pu.autotap == nil then
            pu.autotap = 0
        end
        if pu.buyFAT == nil then
            pu.buyFAT = 0
        end
        if pu.fastauto == nil then
            pu.fastauto = 0
        end
        if pu.buyAR == nil then
            pu.buyAR = 0
        end
        if pu.autorebirth == nil then
            pu.autorebirth = 0
        end
        if pu.buyTH == nil then
            pu.buyTH = 0
        end
        if pu.triplehatch == nil then
            pu.triplehatch = 0
        end
        if pu.buyAH == nil then
            pu.buyAH = 0
        end
        if pu.autohatch == nil then
            pu.autohatch = 0
        end
        if pu.buySR == nil then
            pu.buySR = 0
        end
        if pu.superrun == nil then
            pu.superrun = 0
        end
        if pu.buyUB == nil then
            pu.buyUB = 0
        end
        if pu.autosellweapon == nil then
            pu.autosellweapon = 0
        end
        if pu.autosellweapon2 == nil then
            pu.autosellweapon2 = 0
        end
        if pu.autosellweapon3 == nil then
            pu.autosellweapon3 = 0
        end
        if pu.blacklist == nil then
            pu.blacklist = 0
        end
        
        player:SetGameSave('detection',pu.detection)
        player:SetGameSave('rebirth',pu.rebirth)
        player:SetGameSave('tap',pu.tap)
        player:SetGameSave('atm',pu.atm)
        player:SetGameSave('gems',pu.gems)
        player:SetGameSave('hatch',pu.hatch)
        player:SetGameSave('act',pu.act)
        player:SetGameSave('lc',pu.lc)
        player:SetGameSave('lucky',pu.lucky)
        player:SetGameSave('hp',pu.hp)
        player:SetGameSave('ap',pu.ap)
        player:SetGameSave('sp',pu.sp)
        player:SetGameSave('tp',pu.tp)
        player:SetGameSave('rp',pu.rp)
        player:SetGameSave('luckyp',pu.luckyp)
        player:SetGameSave('tapbuff',pu.tapbuff)
        player:SetGameSave('gemsbuff',pu.gemsbuff)
        player:SetGameSave('rebirthbuff',pu.rebirthbuff)
        player:SetGameSave('buyAT',pu.buyAT)
        player:SetGameSave('autotap',pu.autotap)
        player:SetGameSave('buyFAT',pu.buyFAT)
        player:SetGameSave('fastauto',pu.fastauto)
        player:SetGameSave('buyTH',pu.buyTH)
        player:SetGameSave('triplehatch',pu.triplehatch)
        player:SetGameSave('buyAH',pu.buyAH)
        player:SetGameSave('autohatch',pu.autohatch)
        player:SetGameSave('buySR',pu.buySR)
        player:SetGameSave('superrun',pu.superrun)
        player:SetGameSave('buyUB',pu.buyUB)
        player:SetGameSave('autosellweapon',pu.autosellweapon)
        player:SetGameSave('autosellweapon2',pu.autosellweapon2)
        player:SetGameSave('autosellweapon3',pu.autosellweapon3)
        player:SetGameSave('blacklist',pu.blacklist)
    end
end

-- 各玩家 save 資訊Load
function G.R:OnLoadGameSave(player)

    if player ~= nil then 
        pu = player.user

        -- 讀取各個玩家的數據
        if pu.detection == nil then
            pu.detection = 0
        else
            pu.detection = DoubleToInt(player:GetGameSave('detection'))
        end
        if pu.rebirth == nil then
            pu.rebirth = 0
        else
            pu.rebirth = DoubleToInt(player:GetGameSave('rebirth'))
        end
        if pu.tap == nil then
            pu.tap = 0
        else
            pu.tap = DoubleToInt(player:GetGameSave('tap'))
        end
        if pu.atm == nil then
            pu.atm = 0
        else
            pu.atm = DoubleToInt(player:GetGameSave('atm'))
        end
        if pu.gems == nil then
            pu.gems = 0
        else
            pu.gems = DoubleToInt(player:GetGameSave('gems'))
        end
        if pu.hatch == nil then
            pu.hatch = 0
        else
            pu.hatch = DoubleToInt(player:GetGameSave('hatch'))
        end
        if pu.act == nil then
            pu.act = 0
        else
            pu.act = DoubleToInt(player:GetGameSave('act'))
        end
        if pu.lc == nil then
            pu.lc = 0
        else
            pu.lc = DoubleToInt(player:GetGameSave('lc'))
        end
        if pu.lucky == nil or pu.lucky == 0 then
            pu.lucky = 1
        else
            pu.lucky = DoubleToInt(player:GetGameSave('lucky'))
        end
        if pu.hp == nil or pu.hp == 0 then
            pu.hp = 1
        else
            pu.hp = DoubleToInt(player:GetGameSave('hp'))
        end
        if pu.ap == nil or pu.ap == 0 then
            pu.ap = 1
        else
            pu.ap = DoubleToInt(player:GetGameSave('ap'))
        end
        if pu.sp == nil or pu.sp == 0 then
            pu.sp = 1
        else
            pu.sp = DoubleToInt(player:GetGameSave('sp'))
        end
        if pu.tp == nil or pu.tp == 0 then
            pu.tp = 1
        else
            pu.tp = DoubleToInt(player:GetGameSave('tp'))
        end
        if pu.rp == nil or pu.rp == 0 then
            pu.rp = 1
        else
            pu.rp = DoubleToInt(player:GetGameSave('rp'))
        end
        if pu.luckyp == nil or pu.luckyp == 0 then
            pu.luckyp = 1
        else
            pu.luckyp = DoubleToInt(player:GetGameSave('luckyp'))
        end
        if pu.tapbuff == nil or pu.tapbuff == 0 then
            pu.tapbuff = 1
        else
            pu.tapbuff = DoubleToInt(player:GetGameSave('tapbuff'))
        end
        if pu.gemsbuff == nil or pu.gemsbuff == 0 then
            pu.gemsbuff = 1
        else
            pu.gemsbuff = DoubleToInt(player:GetGameSave('gemsbuff'))
        end
        if pu.rebirthbuff == nil or pu.rebirthbuff == 0 then
            pu.rebirthbuff = 1
        else
            pu.rebirthbuff = DoubleToInt(player:GetGameSave('rebirthbuff'))
        end
        if pu.buyAT == nil then
            pu.buyAT = 0
        else
            pu.buyAT = DoubleToInt(player:GetGameSave('buyAT'))
        end
        if pu.autotap == nil then
            pu.autotap = 0
        else
            pu.autotap = DoubleToInt(player:GetGameSave('autotap'))
        end
        if pu.buyFAT == nil then
            pu.buyFAT = 0
        else
            pu.buyFAT = DoubleToInt(player:GetGameSave('buyFAT'))
        end
        if pu.fastauto == nil then
            pu.fastauto = 0
        else
            pu.fastauto = DoubleToInt(player:GetGameSave('fastauto'))
        end
        if pu.buyTH == nil then
            pu.buyTH = 0
        else
            pu.buyTH = DoubleToInt(player:GetGameSave('buyTH'))
        end
        if pu.triplehatch == nil then
            pu.triplehatch = 0
        else
            pu.triplehatch = DoubleToInt(player:GetGameSave('triplehatch'))
        end
        if pu.buyAH == nil then
            pu.buyAH = 0
        else
            pu.buyAH = DoubleToInt(player:GetGameSave('buyAH'))
        end
        if pu.autohatch == nil then
            pu.autohatch = 0
        else
            pu.autohatch = DoubleToInt(player:GetGameSave('autohatch'))
        end
        if pu.buySR == nil then
            pu.buySR = 0
        else
            pu.buySR = DoubleToInt(player:GetGameSave('buySR'))
        end
        if pu.superrun == nil then
            pu.superrun = 0
        else
            pu.superrun = DoubleToInt(player:GetGameSave('superrun'))
        end
        if pu.buyUB == nil then
            pu.buyUB = 0
        else
            pu.buyUB = DoubleToInt(player:GetGameSave('buyUB'))
        end
        if pu.autosellweapon == nil then
            pu.autosellweapon = 0
        else
            pu.autosellweapon = DoubleToInt(player:GetGameSave('autosellweapon'))
        end
        if pu.autosellweapon2 == nil then
            pu.autosellweapon2 = 0
        else
            pu.autosellweapon2 = DoubleToInt(player:GetGameSave('autosellweapon2'))
        end
        if pu.autosellweapon3 == nil then
            pu.autosellweapon3 = 0
        else
            pu.autosellweapon3 = DoubleToInt(player:GetGameSave('autosellweapon3'))
        end
        if pu.blacklist == nil then
            pu.blacklist = 0
        else
            pu.blacklist = DoubleToInt(player:GetGameSave('blacklist'))
        end

        for i = 1, #Cheating do
            if player.name == Cheating[i] then
                pu.blacklist = 1
            end
        end

        if player.name == '黃泉驅' then
            pu.tap = 100000000000000000000000
        end

        CGEMS.value = player.index
        GEMS.value = pu.gems -- 偵測各個玩家的寶石
        CATM.value = player.index
        ATM.value = pu.atm -- 偵測各個玩家的存款
        CTAP.value = player.index
        TAP.value = pu.tap -- 偵測各個玩家的點擊數
        CHATCH.value = player.index
        HATCH.value = pu.hatch -- 偵測各個玩家的抽蛋數
        CREBIRTH.value = player.index
        REBIRTH.value = pu.rebirth -- 偵測各個玩家的重生次數
        CACT.value = player.index
        ACT.value = pu.act -- 偵測各個玩家的加成券
        CLC.value = player.index
        LC.value = pu.lc -- 偵測各個玩家的領主券
        CUpHp.value = player.index
        if pu.hp >= 100 then
            UpHp.value = pu.hp
        else
            UpHp.value = UpHpPrice[pu.hp] -- 偵測各個玩家的血量升級
        end
        CUpAp.value = player.index
        if pu.ap >= 100 then
            UpAp.value = pu.ap
        else
            UpAp.value = UpApPrice[pu.ap] -- 偵測各個玩家的護甲升級
        end
        CUpSp.value = player.index
        if pu.sp >= 11 then
            UpSp.value = pu.sp
        else
            UpSp.value = UpSpPrice[pu.sp] -- 偵測各個玩家的跑速升級
        end
        CUpTp.value = player.index
        if pu.tp >= 100 then
            UpTp.value = pu.tp
        else
            UpTp.value = UpTpPrice[pu.tp] -- 偵測各個玩家的額外點擊數升級
        end
    
        CLUCKY.value = player.index
        CUpLucky.value = player.index
        if pu.luckyp >= 41 then
            UpLucky.value = pu.luckyp
        else
            UpLucky.value = UpLuckyPrice[pu.luckyp]
        end
        pu.lucky =  (1 + (pu.luckyp / 10 - 0.1)) * All_lucky -- 計算幸運加成
        LUCKY.value = pu.lucky
    
        CReTp.value = player.index
        if pu.rp >= 100 then
            ReTp.value = pu.rp
        else
            ReTp.value = RBTpPrice[pu.rp] -- 偵測各個玩家的重生次數
        end

        if pu.buyAT == 1 then
            AdviceUATOw.value = player.index
        end
        if pu.buyFAT == 1 then
            AdviceUFATOw.value = player.index
        end
        if pu.buyTH == 1 then
            AdviceUTHOw.value = player.index
        end
        if pu.buyAH == 1 then
            AdviceUAHOw.value = player.index
        end
        if pu.buySR == 1 then
            AdviceUSROw.value = player.index
        end
        if pu.buyUB == 1 then
            AdviceUUBOw.value = player.index
        end
    
        CATSV.value = player.index
        ATSV.value = pu.autotap -- 偵測各個玩家的自動連點
        CFATSV.value = player.index
        FATSV.value = pu.fastauto -- 偵測各個玩家的快速自動連點
        CTHSV.value = player.index
        THSV.value = pu.triplehatch -- 偵測各個玩家的轉蛋三連抽
        CAHSV.value = player.index
        AHSV.value = pu.autohatch -- 偵測各個玩家的自動抽獎
        CSRSV.value = player.index
        SRSV.value = pu.superrun -- 偵測各個玩家的超級跑速
        CASWSV.value = player.index
        ASWSV.value = pu.autosellweapon -- 偵測各個玩家的自動販售
        CASW2SV.value = player.index
        ASW2SV.value = pu.autosellweapon2
        CASW3SV.value = player.index
        ASW3SV.value = pu.autosellweapon3

        G_ShowPlayerData (player)

        G_CheckWeapons(player)
    end
end

-- 各玩家 save 資訊初始化
function G.R:OnClearGameSave(player)
    pu = player.user
    player.maxhealth = 100
    player.maxarmor = 100
    player.coin = 0
    pu.detection = 0
    pu.tap = 0
    pu.atm = 0
    pu.gems = 1
    pu.act = 0
    pu.lc = 0
    pu.rebirth = 0
    pu.hatch = 0
    pu.lucky = 1
    pu.hp = 1
    pu.ap = 1
    pu.sp = 1
    pu.tp = 1
    pu.rp = 1
    pu.luckyp = 1
    pu.tapbuff = 1
    pu.gemsbuff = 1
    pu.rebirthbuff = 1
    pu.si = 0
    pu.buyAT = 0
    pu.autotap = 0
    pu.buyFAT = 0
    pu.fastauto = 0
    pu.buyAR = 0
    pu.autorebirth = 0
    pu.buyTH = 0
    pu.triplehatch = 0
    pu.buyAH = 0
    pu.autohatch = 0
    pu.buySR = 0
    pu.superrun = 0
    pu.buyUB = 0
    pu.autosellweapon = 0
    pu.autosellweapon2 = 0
    pu.autosellweapon3 = 0
    pu.blacklist = 0
end