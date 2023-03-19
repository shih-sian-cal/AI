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

DDP = 0
MODA = nil
local lint = 0 -- 初始值設定
local GPW = {}
local GSW = {}

-- 千分位函式
function G_Thousandths (num)
	local function checknumber (value)
		return tonumber (value) or 0
	end
	local formatted = tostring (checknumber (num))
	local k
	while true do
		formatted, k = string.gsub (formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
		if k == 0 then 
			break end
		end
	return formatted
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

-- 四捨五入函式
function G_Round(number) 
    if (number - (number % 0.1)) - (number - (number % 1)) < 0.5 then 
        number = number - (number % 1) 
    else 
        number = (number - (number % 1)) + 1 
    end 
    return number 
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

-- 偵測開關函式
function G_CO(callerOn)
    if callerOn == nil or callerOn == false then
		return false
    else
        return true
	end
end

-- 偵測實體函式
function G_GTE(entity)
    entity = Game.GetTriggerEntity()
    if entity and entity:IsPlayer() then
        return entity
    end
end

-- 建立觸發方塊函式
function G_EB_C(a,b,c)
    return G.EB:Create({x = a,y = b,z = c})
end

-- 裝置控制方塊函式
function G_ST(str,bool)
    return Game.SetTrigger(str,bool)
end

-- 生成武器函式
function G_DBWP(pwp,map,wt,pos,wn)
    if pwp == 1 then
        wp = Game.Weapon.CreateAndDrop(wt,pos)
    elseif pwp == 0 then
        wp = Game.Weapon.CreateAndDrop(WeaponList[wt],pos)
    end

    wu = wp.user

    if map == 1 then
        if wn == 1.02 then
            wp.color = WeaponColor[1]
            wu.dtap = 2
        elseif wn == 1.04 then
            wp.color = WeaponColor[2]
            wu.dtap = 4
        elseif wn == 1.08 then
            wp.color = WeaponColor[3]
            wu.dtap = 8
        elseif wn == 1.16 then
            wp.color = WeaponColor[5]
            wu.dtap = 16
        elseif wn == 1.32 then
            wp.color = WeaponColor[4]
            wu.dtap = 32
        end
        wp.damage = wn
    elseif map == 2 then
        if wn == 1.16 then
            wp.color = WeaponColor[1]
            wu.dtap = 16
        elseif wn == 1.32 then
            wp.color = WeaponColor[2]
            wu.dtap = 32
        elseif wn == 1.64 then
            wp.color = WeaponColor[3]
            wu.dtap = 64
        elseif wn == 2.28 then
            wp.color = WeaponColor[5]
            wu.dtap = 128
        elseif wn == 3.56 then
            wp.color = WeaponColor[4]
            wu.dtap = 256
        end
        wp.damage = wn
    elseif map == 3 then
        if wn == 2.28 then
            wp.color = WeaponColor[1]
            wu.dtap = 128
        elseif wn == 3.56 then
            wp.color = WeaponColor[2]
            wu.dtap = 256
        elseif wn == 6.12 then
            wp.color = WeaponColor[3]
            wu.dtap = 512
        elseif wn == 11.24 then
            wp.color = WeaponColor[5]
            wu.dtap = 1024
        elseif wn == 21.48 then
            wp.color = WeaponColor[4]
            wu.dtap = 2048
        end
        wp.damage = wn
    end

    return wp
end

-- 偵測玩家實體和數據函式
function G_BugCheck(player)
    if player == nil then return end -- 偵測玩家實體是否空值
    pu = player.user
    CHP.value = player.index -- 偵測各個玩家的索引值
    MHP.value = player.maxhealth -- 偵測各個玩家的最大血量
    HP.value = player.health -- 偵測各個玩家的目前血量
    CAP.value = player.index -- 偵測各個玩家的索引值
    MAP.value = player.maxarmor -- 偵測各個玩家的最大護甲
    AP.value = player.armor -- 偵測各個玩家的目前護甲
    CGEMS.value = player.index  -- 偵測各個玩家的索引值
    GEMS.value = pu.gems -- 偵測各個玩家的寶石
    CATM.value = player.index -- 偵測各個玩家的索引值
    ATM.value = pu.atm -- 偵測各個玩家的存款
    CTAP.value = player.index -- 偵測各個玩家的索引值
    TAP.value = pu.tap -- 偵測各個玩家的點擊數

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
    if pu.hatch == nil then
        pu.hatch = 0
    end
    if pu.rebirth == nil then
        pu.rebirth = 0
    end
    if pu.rebuff == nil then
        pu.rebuff = 0
    end
    if pu.hp == nil then
        pu.hp = 0
    end
    if pu.ap == nil then
        pu.ap = 0
    end
    if pu.sp == nil then
        pu.sp = 0
    end
    if pu.tp == nil then
        pu.tp = 0
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
    if pu.si == nil then
        pu.si = false
    end
    if pu.buyAT == nil then
        pu.buyAT = false
    end
    if pu.autotap == nil then
        pu.autotap = false
    end
    if pu.buyFAT == nil then
        pu.buyFAT = false
    end
    if pu.fastauto == nil then
        pu.fastauto = false
    end
    if pu.buyAR == nil then
        pu.buyAR = false
    end
    if pu.autorebirth == nil then
        pu.autorebirth = false
    end
    if pu.buySR == nil then
        pu.buySR = false
    end
    if pu.superrun == nil then
        pu.superrun = false
    end
    if pu.buyTH == nil then
        pu.buyTH = false
    end
    if pu.triplehatch == nil then
        pu.triplehatch = false
    end
end

-- 在控制台顯示玩家數據函式
function G_ShowPlayerData (player)

    if player == nil then return end

    pu = player.user

    print('----- 玩家數據清單 -----\n')
    print('['..player.index..']'..player.name..', '..pu.detection)
    print('重生：'..G_NumberCarry(pu.rebirth)..'階')
    print('存款：'..G_NumberCarry(pu.atm)..'E')
    print('寶石：'..G_NumberCarry(pu.gems))
    print('金幣：'..G_NumberCarry(player.coin))
    print('抽蛋數'..G_NumberCarry(pu.hatch))
    print('點擊數：'..G_NumberCarry(pu.tap))
    print('活動券：'..G_NumberCarry(pu.act)..'張\n')
    print('------------------------')
end

-- 觸發方塊
E = {
    UP = {
        Omap1 = G_EB_C(163,-170,0),
        Cmap1 = G_EB_C(164,-170,0),
    },
    MAP = {
        GEMS = G_EB_C(179,-160,17),
        unlock1 = G_EB_C(169,-156,0),
        unlock2 = G_EB_C(169,-120,0),
    },
    ITEM = {
        CHP1 = G_EB_C(177,-164,1),
        HP1 = G_EB_C(177,-164,0),
        CAP1 = G_EB_C(177,-161,1),
        AP1 = G_EB_C(177,-161,0),
    },
    ATM = {
        Dposit = G_EB_C(179,-177,1),
        Withdraw = G_EB_C(179,-175,1),
    }
}

-- 武器顏色
WeaponColor = {
    G.WC.WHITE,
    G.WC.BLUE,
    G.WC.RED,
    G.WC.ORANGE,
    G.WC.YELLOW,
    G.WC.GREEN
}

-- 升級價格表
UpHpPrice = {}
UpApPrice = {}
UpSpPrice = {}
UpTpPrice = {}

Players = {} -- 儲存每個玩家的實體

OMapUP1 = G_SV_C('OMapUP1')
CMapUP1 = G_SV_C('CMapUP1')

CUpHp = G_SV_C('CUpHp')
UpHp = G_SV_C('UpHp')
CUpAp = G_SV_C('CUpAp')
UpAp = G_SV_C('UpAp')
CUpSp = G_SV_C('CUpSp')
UpSp = G_SV_C('UpSp')
CUpTp = G_SV_C('CUpTp')
UpTp = G_SV_C('UpTp')

CATSV = G_SV_C('CATSV')
ATSV = G_SV_C('ATSV')
CFATSV = G_SV_C('CFATSV')
FATSV = G_SV_C('FATSV')
CTHSV = G_SV_C('CTHSV')
THSV = G_SV_C('THSV')
CSRSV = G_SV_C('CSRSV')
SRSV = G_SV_C('SRSV')

ATOC = G_SV_C('ATOC')

CCSD = G_SV_C('CCSD')
SD = G_SV_C('SD')

CGEMS = G_SV_C('CGEMS')
GEMS = G_SV_C('GEMS')
CATM = G_SV_C('CATM')
ATM = G_SV_C('ATM')
CTAP = G_SV_C('CTAP')
TAP = G_SV_C('TAP')

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
Adviceilnt = G_SV_C('Adviceilnt')
Advicelimit = G_SV_C('Advicelimit')
AdviceATOw = G_SV_C('AdviceATOw')
AdviceNOw = G_SV_C('AdviceNOw')
AdviceNTAP = G_SV_C('AdviceNTAP')
AdviceCoin = G_SV_C('AdviceCoin')
AdviceATM = G_SV_C('AdviceATM')
AdviceGems = G_SV_C('AdviceGems')
AdviceGetGems = G_SV_C('AdviceGetGems')
AdviceLege =  G_SV_C('AdviceLege')
AdviceMyth =  G_SV_C('AdviceMyth')

-- 獲得武器後
function G.R:OnGetWeapon(player,weaponid,weapon)
    if weapon ~= nil then 
        wu = weapon.user
        if wu.dtap == nil then
            if weapon.color == WeaponColor[1] then
                weapon.damage = 1.02
                wu.dtap = 2
    
            elseif weapon.color == WeaponColor[2] then
                weapon.damage = 1.04
                wu.dtap = 4
    
            elseif weapon.color == WeaponColor[3] then
                weapon.damage = 1.08
                wu.dtap = 8
    
            elseif weapon.color == WeaponColor[5] then
                weapon.damage = 1.16
                wu.dtap = 16
    
            elseif weapon.color == WeaponColor[4] then
                weapon.damage = 1.32
                wu.dtap = 32
    
            end
        end
    end
end

-- UI傳GAME變數
function G.R:OnPlayerSignal(player,signal)
    pu = player.user
    if signal == 1001 then -- 升級血量
        if pu.hp < 1000 then
            if UpHpPrice[pu.hp] < 10^9 then
                if player.coin >= UpHpPrice[pu.hp] then
                    player.coin = player.coin - math.ceil(UpHpPrice[pu.hp])
                    pu.hp = pu.hp + 1
                    player.maxhealth = player.maxhealth + 10
                    player.health = player.maxhealth
                    CUpHp.value = player.index
                    UpHp.value = UpHpPrice[pu.hp]
                else
                    AdviceCoin.value = player.index
                end
            elseif UpHpPrice[pu.hp] >= 10^9  then
                if pu.atm >= UpHpPrice[pu.hp] then
                    pu.atm = pu.atm - math.ceil(UpHpPrice[pu.hp])
                    pu.hp = pu.hp + 1
                    player.maxhealth = player.maxhealth + 10
                    player.health = player.maxhealth
                    CUpHp.value = player.index
                    UpHp.value = UpHpPrice[pu.hp]
                else
                    AdviceCoin.value = player.index
                end
            else
                AdviceHp.value = player.index
            end
        end
           
    elseif signal == 1002 then -- 升級護甲
        if pu.ap < 1000 then
            if UpApPrice[pu.ap] < 10^9 then
                if player.coin >= UpApPrice[pu.ap] then
                    player.coin = player.coin - math.ceil(UpApPrice[pu.ap])
                    pu.ap = pu.ap + 1
                    player.maxarmor = player.maxarmor + 10
                    player.armor = player.maxarmor
                    CUpAp.value = player.index
                    UpAp.value = UpApPrice[pu.ap]
                else
                    AdviceCoin.value = player.index
                end
            end
        elseif  UpApPrice[pu.ap] >= 10^9 then
            if pu.atm >= UpApPrice[pu.ap] then
                pu.atm = pu.atm - math.ceil(UpApPrice[pu.ap])
                pu.ap = pu.ap + 1
                player.maxarmor = player.maxarmor + 10
                player.armor = player.maxarmor
                CUpAp.value = player.index
                UpAp.value = UpApPrice[pu.ap]
            else
                AdviceCoin.value = player.index
            end
        else
            AdviceAp.value = player.index
        end
       
    elseif signal == 1003 then -- 升級跑速
        if pu.sp < 10 then
            if player.coin >= UpSpPrice[pu.sp] then
                player.coin = player.coin - math.ceil(UpSpPrice[pu.sp])
                player.maxspeed = player.maxspeed + 0.1
                pu.sp = pu.sp + 1
                CUpSp.value = player.index
                UpSp.value = UpSpPrice[pu.sp]
            else
                AdviceCoin.value = player.index
            end
        else
            AdviceSp.value = player.index
        end

    elseif signal == 1004 then -- 購買自動連點
        if pu.autotap ~= true then
            if player.coin >= 10^4 then
                pu.autotap = true
                pu.buyAT = true
                AdviceATOw.value = player.index
            else
                AdviceCoin.value = player.index
            end
        else
            AdviceATOw.value = player.index
        end

    elseif signal == 1005 then -- 購買額外點擊
        if pu.tp < 1000 then
            if pu.gems >= UpTpPrice[pu.tp] then
                pu.gems = pu.gems - math.ceil(UpTpPrice[pu.tp])
                pu.tp = pu.tp + 1
                CUpTp.value = player.index
                UpTp.value = UpTpPrice[pu.tp]
            else
                AdviceGems.value = player.index
            end
        else
            AdviceTp.value = player.index
        end

    elseif signal == 1011 then -- 開關自動連點
        if pu.buyAT == true then
            if pu.autotap == true then
                pu.autotap = false
            else
                pu.autotap = true
            end
            CATSV.value = player.index
            ATSV.value = pu.autotap
        else
            AdviceNOw.value = player.index
        end

    elseif signal == 1012 then -- 開關快速自動連點
        if pu.buyFAT == true then
            if pu.fastauto == true then
                pu.fastauto = false
            else
                pu.fastauto = true
            end
            CFATSV.value = player.index
            FATSV.value = pu.fastauto
        else
            AdviceNOw.value = player.index
        end

    elseif signal == 1013 then -- 開關三連抽
        if pu.buyTH == true then
            if pu.triplehatch == true then
                pu.triplehatch = false
            else
                pu.triplehatch = true
            end
            CTHSV.value = player.index
            THSV.value = pu.triplehatch
        else
            AdviceNOw.value = player.index
        end

    elseif signal == 1014 then -- 開關超級跑速
        if pu.buySR == true then
            if pu.superrun == true then
                pu.superrun = false
            else
                pu.superrun = true
            end
            CSRSV.value = player.index
            SRSV.value = pu.superrun
        else
            AdviceNOw.value = player.index
        end

    elseif signal == 1021 then -- 傳送到重生點
        player.position = {x = 170, y = -175, z  = 3}
        player:Signal(1)

    elseif signal == 1022 then -- 傳送到平靜草原
        if pu.tap <= 25000 then
            AdviceNTAP.value = player.index
        else
            player.position = {x = 170, y = -150, z  = 3}
            player:Signal(2)
        end

    elseif signal == 1023 then -- 傳送到潮濕平地
       if pu.tap <= 250000 then
            AdviceNTAP.value = player.index
        else
            player.position = {x = 170, y = -115, z  = 3}
            player:Signal(3)        
        end

    elseif signal == 10001 then -- 武器庫
        player:ToggleWeaponInven()
        
    elseif signal == 10002 then -- 人稱
        if Players[player.index].SPTV == 0 then
            Players[player.index].SPTV = 1
            player:SetThirdPersonView(100,250)
        elseif Players[player.index].SPTV == 1 then
            Players[player.index].SPTV = 0
            player:SetFirstPersonView()
        end

    elseif signal == 10003 then -- 儲存

        G_BugCheck(player)

        player:SetGameSave('detection',pu.detection)
        player:SetGameSave('rebirth',pu.rebirth)
        player:SetGameSave('tap',pu.tap)
        player:SetGameSave('atm',pu.atm)
        player:SetGameSave('gems',pu.gems)
        player:SetGameSave('hatch',pu.hatch)
        player:SetGameSave('act',pu.act)
        player:SetGameSave('hp',pu.hp)
        player:SetGameSave('ap',pu.ap)
        player:SetGameSave('sp',pu.sp)
        player:SetGameSave('tp',pu.tp)
        player:SetGameSave('tapbuff',pu.tapbuff)
        player:SetGameSave('gemsbuff',pu.gemsbuff)
        player:SetGameSave('rebirthbuff',pu.rebirthbuff)
        player:SetGameSave('rebuff',pu.rebuff)
        player:SetGameSave('buyAT',pu.buyAT)
        player:SetGameSave('autotap',pu.autotap)
        player:SetGameSave('buyFAT',pu.buyFAT)
        player:SetGameSave('fastauto',pu.fastauto)
        player:SetGameSave('buyTH',pu.buyTH)
        player:SetGameSave('triplehatch',pu.triplehatch)
        player:SetGameSave('buySR',pu.buySR)
        player:SetGameSave('superrun',pu.superrun)

        G_ShowPlayerData (player)

    elseif signal == 10004 then -- 點擊
        if player:GetPrimaryWeapon() == nil and player:GetSecondaryWeapon() == nil then
            pu.tap = pu.tap + ((1 + pu.rebuff) * pu.tapbuff) + (pu.tp  - 1)
        elseif player:GetSecondaryWeapon() == nil then
            pu.tap = pu.tap + ((1 + pu.rebuff) * pu.tapbuff) + (pu.tp  - 1) + player:GetPrimaryWeapon().user.dtap
        elseif player:GetPrimaryWeapon() == nil then
            pu.tap = pu.tap + ((1 + pu.rebuff) * pu.tapbuff) + (pu.tp  - 1) + player:GetSecondaryWeapon().user.dtap
        else
            pu.tap = pu.tap + ((1 + pu.rebuff) * pu.tapbuff) + (pu.tp  - 1) + player:GetPrimaryWeapon().user.dtap + player:GetSecondaryWeapon().user.dtap
        end
        
        CTAP.value = player.index
        TAP.value = pu.tap

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

-- 轉蛋系統
function G_WP(t,pos)
    local wt,wn,wp,RN,RE,TE

    TE = G_GTE()
    TE = TE:ToPlayer()
    tu = TE.user

    if t == 1 then
        if tu.tap >= 100 then
            tu.tap = tu.tap - 100
            RN = G_RF(1,100)

            if RN > 0 and RN < 50.01 then
                wn = 1.02
                wt = 16
            elseif RN > 50.00 and RN < 90.01 then
                wn = 1.04
                wt = 16
            elseif RN > 90.00 and RN < 98.01 then
                wn = 1.08
                wt = 16
            elseif RN > 98.00 and RN < 99.51 then
                wn = 1.16
                wt = 11
                G_ST('map1_legend',true)
                AdviceLege.value = TE.name
            elseif RN > 99.50 and RN < 100.01 then
                wn = 1.32
                wt = 26
                G_ST('map1_mythic',true)
                AdviceMyth.value = TE.name
            end

            wp = G_DBWP(1,1,wt,pos,wn)
            return wp
        else
            AdviceNTAP.value = TE.index
        end
    elseif t == 2 then
        if tu.tap >= 1000 then
            tu.tap = tu.tap - 1000
            RN = G_RF(1,100)

            if RN > 0 and RN < 57.51 then
                wn = 1.16
                wt = 1
            elseif RN > 57.50 and RN < 95.01 then
                wn = 1.32
                wt = 1
            elseif RN > 95.00 and RN < 99.01 then
                wn = 1.64
                wt = 1
            elseif RN > 99.00 and RN < 99.91 then
                wn = 2.28
                wt = 17
                G_ST('map2_legend',true)
                AdviceLege.value = TE.name
            elseif RN > 99.90 and RN < 100.01 then
                wn = 3.56
                wt = 10
                G_ST('map2_mythic',true)
                AdviceMyth.value = TE.name
            end

            wp = G_DBWP(1,2,wt,pos,wn)
            return wp
        else
            AdviceNTAP.value = TE.index
        end
    elseif t == 3 then
        if tu.tap >= 10^4 then
            tu.tap = tu.tap - 10^4
            RN = G_RF(1,100)

            if RN > 0 and RN < 62.51 then
                wn = 2.28
                wt = 67
            elseif RN > 62.50 and RN < 97.01 then
                wn = 3.56
                wt = 67
            elseif RN > 97.00 and RN < 99.51 then
                wn = 6.12
                wt = 67
            elseif RN > 99.50 and RN < 99.96 then
                wn = 11.24
                wt = 70
                G_ST('map3_legend',true)
                AdviceLege.value = TE.name
            elseif RN > 99.95 and RN < 100.01 then
                wn = 21.48
                wt = 78
                G_ST('map3_mythic',true)
                AdviceMyth.value = TE.name
            end

            wp = G_DBWP(1,3,wt,pos,wn)
            return wp
        else
            AdviceNTAP.value = TE.index
        end
    end
end

-- 地圖轉蛋
function Map1_Egg(callerOn)
    if G_CO(callerOn) then
        G_WP(1,{x = 177,y = -170,z = 3})
    end
end
function Map1_Mythic()
    G_ST('map1_mythic',false)
end
function Map1_legend()
    G_ST('map1_legend',false)
end

function Map2_Egg(callerOn)
    if G_CO(callerOn) then
        G_WP(2,{x = 177,y = -140,z = 3})
    end
end
function Map2_Mythic()
    G_ST('map2_mythic',false)
end
function Map2_legend()
    G_ST('map2_legend',false)
end

function Map3_Egg(callerOn)
    if G_CO(callerOn) then
        G_WP(3,{x = 177,y = -102,z = 3})
    end
end
function Map3_Mythic()
    G_ST('map3_mythic',false)
end
function Map3_legend()
    G_ST('map3_legend',false)
end

-- 每幀執行時(約0.01秒)
function Game.Rule:OnUpdate (time)
    for i = 1, #Players do
        if Players[i] == nil then return end -- 偵測玩家實體是否空值
        PN = #Players -- 偵測遊戲內的玩家數量
        PU = Players[i].user

        G_BugCheck(Players[i])

        if PU.gems == 0 then
            Adviceilnt.value = Players[i].index
        end

        -- 偵測玩家是否開啟自動點擊
        if PU.autotap == true then
            if PU.TIME <= Game.GetTime() then
                if Players[i]:GetPrimaryWeapon() == nil and Players[i]:GetSecondaryWeapon() == nil then
                    PU.tap = PU.tap + ((1 + PU.rebuff) * PU.tapbuff) + (PU.tp - 1)
                elseif Players[i]:GetSecondaryWeapon() == nil then
                    PU.tap = PU.tap + ((1 + PU.rebuff) * PU.tapbuff) + (PU.tp - 1) + Players[i]:GetPrimaryWeapon().user.dtap
                elseif Players[i]:GetPrimaryWeapon() == nil then
                    PU.tap = PU.tap + ((1 + PU.rebuff) * PU.tapbuff) + (PU.tp - 1) + Players[i]:GetSecondaryWeapon().user.dtap
                else
                    PU.tap = PU.tap + ((1 + PU.rebuff) * PU.tapbuff) + (PU.tp - 1) + Players[i]:GetPrimaryWeapon().user.dtap + Players[i]:GetSecondaryWeapon().user.dtap
                end
                CTAP.value = Players[i].index
                TAP.value = PU.tap
                PU.TIME = Game.GetTime() + 1
            end
        end

        -- 偵測玩家是否開啟快速自動點擊
        if PU.fastauto == true then
            if Players[i]:GetPrimaryWeapon() == nil and Players[i]:GetSecondaryWeapon() == nil then
                PU.tap = PU.tap + ((1 + PU.rebuff) * PU.tapbuff) + (PU.tp - 1)
            elseif Players[i]:GetSecondaryWeapon() == nil then
                PU.tap = PU.tap + ((1 + PU.rebuff) * PU.tapbuff) + (PU.tp - 1) + Players[i]:GetPrimaryWeapon().user.dtap
            elseif Players[i]:GetPrimaryWeapon() == nil then
                PU.tap = PU.tap + ((1 + PU.rebuff) * PU.tapbuff) + (PU.tp - 1) + Players[i]:GetSecondaryWeapon().user.dtap
            else
                PU.tap = PU.tap + ((1 + PU.rebuff) * PU.tapbuff) + (PU.tp - 1) + Players[i]:GetPrimaryWeapon().user.dtap + Players[i]:GetSecondaryWeapon().user.dtap
            end
            CTAP.value = Players[i].index
            TAP.value = PU.tap
        end
    end

    -- 偵測怪物血量
    if MODA ~= nil then
        mu = MODA.user
        CMOHP.value = DDP
        if mu.maxhealth == nil then
            MOMHP.value = MODA.maxhealth
        else
            MOMHP.value = mu.maxhealth + MODA.maxhealth
        end
        if mu.health == nil then
            MOHP.value = MODA.health
        else
            MOHP.value = mu.health + MODA.health
        end
        if MOSHP <= Game.GetTime() then
            DMOHP.value = DDP
            MODA = nil
        end
    end
end

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

function E.MAP.GEMS:OnTouch(player)
    player.position = {x = 170, y = -175, z  = 3}
    pu.gems = pu.gems + 5
    AdviceGetGems.value = player.index
end

function E.MAP.unlock1:OnTouch(player)
    if player.user.tap <= 25000 then
        player.velocity = {y = -50}
        AdviceNTAP.value = player.index
    else
        if player.position.y < self.position.y then
            player.user.MAP = 1
            player:Signal(1) -- 顯示位置
            LVNU.Map1 = LVNU.Map1 - 1 -- 該區域玩家數量-1
        else
            player.user.MAP = 2
            player:Signal(2) -- 顯示位置
            LVNU.Map1 = LVNU.Map1 + 1 -- 該區域玩家數量+1
            MNC(1) -- 生成怪物
        end
    end
end

function E.MAP.unlock2:OnTouch(player)
    if player.user.tap <= 250000 then
        player.velocity = {y = -50}
        AdviceNTAP.value = player.index
    else
        if player.position.y < self.position.y then
            player.user.MAP = 2
            player:Signal(2) -- 顯示位置
            LVNU.Map2 = LVNU.Map2 - 1 -- 該區域玩家數量-1
        else
            player.user.MAP = 3
            player:Signal(3) -- 顯示位置
            LVNU.Map2 = LVNU.Map2 + 1 -- 該區域玩家數量+1
            MNC(2) -- 生成怪物
        end
    end
end

function E.ITEM.HP1:OnUse(player)
    E.ITEM.CHP1:Event({action="reset"},0)
end

function E.ITEM.AP1:OnUse(player)
    E.ITEM.CAP1:Event({action="reset"},0)
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

            if au.tap <= vu.limit then
                AdviceNTAP.value = attacker.index
                return 0
            end

            damage = ADD_damage(attacker,victim,weapontype,damage,hitbox)
            MODA = victim
            MOSHP = Game.GetTime() + 1

            return au.tap

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
            
        elseif victim:IsMonster() then
            victim = victim:ToMonster()
            vu = victim.user

            return 0
        end
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
    
    local MonsterHP = victim.health + vu.health

    damage = au.tap

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

-- 怪物擊殺系統
function G.R:OnKilled(victim,killer)
    if killer == nil then

        if victim:IsMonster() then
            victim = victim:ToMonster()
            vu = victim.user

        elseif victim:IsPlayer() then
            victim = victim:ToPlayer()
            vu = victim.user

        end

    elseif killer:IsPlayer() then
        killer = killer:ToPlayer()
        ku = killer.user

        if victim:IsMonster() then
            victim = victim:ToMonster()
            vu = victim.user

            Total_area(vu.MK,vu.B)

            if vu.gems ~= 0 then
                ku.gems = ku.gems + vu.gems
                AdviceGetGems.value = killer.index
            end

            CMOHP.value = killer.index
            MOMHP.value = victim.maxhealth + vu.maxhealth
            MOHP.value = 0
            MODA = nil

        elseif victim:IsPlayer() then
            victim = victim:ToPlayer()
            vu = victim.user

        end

    elseif killer:IsMonster() then
        killer = killer:ToMonster()
        ku = killer.user

        if victim:IsMonster() then
            victim = victim:ToMonster()
            vu = victim.user

        elseif victim:IsPlayer() then
            victim = victim:ToPlayer()
            vu = victim.user

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
        for i = 1,1000 do
            table.insert(UpHpPrice,i,G_Round(10^dn1))
            table.insert(UpApPrice,i,G_Round(15^dn1))
            table.insert(UpTpPrice,i,G_Round(2^dn1))
            dn1 = dn1 + 0.1
        end
        local dn2 = 1.0
        for i = 1,10 do
            table.insert(UpSpPrice,i,G_Round(100^dn2))
            dn2 = dn2 + 0.1
        end

        lint = 1
    end
    
    if player == nil then return end

    pu = player.user

    -- 儲存玩家排列
    Players[player.index] = player
    PU = Players[player.index].user
    PU.SPTV = 0
    PU.TIME = 0
    PU.UPEN = 0
    PU.MAP = 0

    -- 團隊設定
    if player.team == Game.TEAM.TR then
        player.team = Game.TEAM.CT
    end

    -- 基本能力
    player.maxhealth = 100 -- 最大血量
    player.maxarmor = 100 -- 最大護甲
    player.coin = 0 -- 金幣
    player.maxspeed = 1 -- 跑速
    pu.tap = 0 -- 點擊數
    pu.atm = 0 -- 存款
    pu.gems = 0 -- 鑽石
    pu.act = 0 -- 活動券
    pu.rebirth = 0 -- 重生
    pu.rebuff = 0 -- 重生獎勵
    pu.hatch = 0 -- 抽蛋數
    pu.detection = 0 -- 偵錯
    pu.hp = 1 -- 偵測玩家升級血量的價格逐增
    pu.ap = 1 -- 偵測玩家升級護甲的價格逐增
    pu.sp = 1 -- 偵測玩家升級跑速的價格逐增
    pu.tp = 1 -- 偵測玩家升級額外點擊的價格逐增
    pu.tapbuff = 1 -- 點擊增益
    pu.gemsbuff = 1 -- 鑽石增益
    pu.rebirthbuff = 1 -- 重生增益
    pu.si = false -- 無敵
    pu.buyAT = false -- 是否有購買自動連點
    pu.autotap = false -- 自動連點開關
    pu.buyFAT = false -- 是否有購買快速自動連點
    pu.fastauto = false -- 快速自動連點開關
    pu.buyAR = false -- 是否有購買自動重生
    pu.autorebirth = false -- 自動重生開關
    pu.buySR = false -- 是否有買超級跑速
    pu.superrun = false -- 超級跑速開關
    pu.buyTH = false -- 是否有買三連抽
    pu.triplehatch = false -- 三連抽開關

    if player.name == '珍惜現在所擁有' then
        player.maxhealth = 100
        player.maxarmor = 100
        player.coin = 1000000000
        pu.tap = 30000
        pu.atm = 10
        pu.gems = 10000
        pu.act = 0
        pu.rebirth = 0
        pu.rebuff = 0
        pu.hatch = 0
        pu.detection = 0
        pu.hp = 1
        pu.ap = 1
        pu.sp = 1
        pu.tp = 1
        pu.tapbuff = 1
        pu.gemsbuff = 1
        pu.rebirthbuff = 1
        pu.si = false
        pu.buyAT = false
        pu.autotap = false
        pu.buyFAT = false
        pu.fastauto = false
        pu.buyAR = false
        pu.autorebirth = false
        pu.buySR = false
        pu.superrun = false
        pu.buyTH = false
        pu.triplehatch = false
    end
end

-- 玩家離線
function G.R:OnPlayerDisconnect(player)

    if player == nil then return end

    pu = player.user

    G_BugCheck(player)

    for i = 1, #Players do
        if Players[i] ~= nil then
            if Players[i].name ~= player.name then
                G_ShowPlayerData (player)
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
    player:SetGameSave('hp',pu.hp)
    player:SetGameSave('ap',pu.ap)
    player:SetGameSave('sp',pu.sp)
    player:SetGameSave('tp',pu.tp)
    player:SetGameSave('tapbuff',pu.tapbuff)
    player:SetGameSave('gemsbuff',pu.gemsbuff)
    player:SetGameSave('rebirthbuff',pu.rebirthbuff)
    player:SetGameSave('rebuff',pu.rebuff)
    player:SetGameSave('buyAT',pu.buyAT)
    player:SetGameSave('autotap',pu.autotap)
    player:SetGameSave('buyFAT',pu.buyFAT)
    player:SetGameSave('fastauto',pu.fastauto)
    player:SetGameSave('buyTH',pu.buyTH)
    player:SetGameSave('triplehatch',pu.triplehatch)
    player:SetGameSave('buySR',pu.buySR)
    player:SetGameSave('superrun',pu.superrun)
end

-- 紀錄計算
function DoubleToInt(number)
    if number ~= nil then
        return math.floor(math.abs(number + EPSILON))
    end
end

-- 各玩家儲存資訊
function G.R:OnGameSave(player)

    if player == nil then return end

    pu = player.user

    G_BugCheck(player)

    player:SetGameSave('detection',pu.detection)
    player:SetGameSave('rebirth',pu.rebirth)
    player:SetGameSave('tap',pu.tap)
    player:SetGameSave('atm',pu.atm)
    player:SetGameSave('gems',pu.gems)
    player:SetGameSave('hatch',pu.hatch)
    player:SetGameSave('act',pu.act)
    player:SetGameSave('hp',pu.hp)
    player:SetGameSave('ap',pu.ap)
    player:SetGameSave('sp',pu.sp)
    player:SetGameSave('tp',pu.tp)
    player:SetGameSave('tapbuff',pu.tapbuff)
    player:SetGameSave('gemsbuff',pu.gemsbuff)
    player:SetGameSave('rebirthbuff',pu.rebirthbuff)
    player:SetGameSave('rebuff',pu.rebuff)
    player:SetGameSave('buyAT',pu.buyAT)
    player:SetGameSave('autotap',pu.autotap)
    player:SetGameSave('buyFAT',pu.buyFAT)
    player:SetGameSave('fastauto',pu.fastauto)
    player:SetGameSave('buyTH',pu.buyTH)
    player:SetGameSave('triplehatch',pu.triplehatch)
    player:SetGameSave('buySR',pu.buySR)
    player:SetGameSave('superrun',pu.superrun)
end

-- 各玩家 save 資訊Load
function G.R:OnLoadGameSave(player)

    if player == nil then return end

    pu = player.user

    -- 讀取各個玩家的數據
    if pu.rebirth == nil then
        pu.rebirth = 0
    else
        pu.rebirth = DoubleToInt(player:GetGameSave('rebirth'))
    end
    if pu.atm == nil then
        pu.atm = 0
    else
        pu.atm = DoubleToInt(player:GetGameSave('atm'))
    end
    if pu.tap == nil then
        pu.tap = 0
    else
        pu.tap = DoubleToInt(player:GetGameSave('tap'))
    end
    if pu.detection == nil then
        pu.detection = 0
    else
        pu.detection = DoubleToInt(player:GetGameSave('detection'))
    end
    if pu.gems == nil then
        pu.gems = 0
    else
        pu.gems = DoubleToInt(player:GetGameSave('gems'))
    end
    if pu.act == nil then
        pu.act = 0
    else
        pu.act = DoubleToInt(player:GetGameSave('act'))
    end
    if pu.hatch == nil then
        pu.hatch = 0
    else
        pu.hatch = DoubleToInt(player:GetGameSave('hatch'))
    end
    if pu.hp == nil then
        pu.hp = 0
    else
        pu.hp = DoubleToInt(player:GetGameSave('hp'))
    end
    if pu.ap == nil then
        pu.ap = 0
    else
        pu.ap = DoubleToInt(player:GetGameSave('ap'))
    end
    if pu.sp == nil then
        pu.sp = 0
    else
        pu.sp = DoubleToInt(player:GetGameSave('sp'))
    end
    if pu.tp == nil then
        pu.tp = 0
    else
        pu.tp = DoubleToInt(player:GetGameSave('tp'))
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
    if pu.rebuff == nil then
        pu.rebuff = 0
    else
        pu.rebuff = player:GetGameSave('rebuff')
    end
    if pu.buyAT == nil then
        pu.buyAT = false
    else
        pu.buyAT = player:GetGameSave('buyAT')
    end
    if pu.autotap == nil then
        pu.autotap = false
    else
        pu.autotap = player:GetGameSave('autotap')
    end
    if pu.buyFAT == nil then
        pu.buyFAT = false
    else
        pu.buyFAT = player:GetGameSave('buyFAT')
    end
    if pu.fastauto == nil then
        pu.fastauto = false
    else
        pu.fastauto = player:GetGameSave('fastauto')
    end
    if pu.buyTH == nil then
        pu.buyTH = false
    else
        pu.buyTH = player:GetGameSave('buyTH')
    end
    if pu.triplehatch == nil then
        pu.triplehatch = false
    else
        pu.triplehatch = player:GetGameSave('triplehatch')
    end
    if pu.buySR == nil then
        pu.buySR = false
    else
        pu.buySR = player:GetGameSave('buySR')
    end
    if pu.superrun == nil then
        pu.superrun = false
    else
        pu.superrun = player:GetGameSave('superrun')
    end

    G_ShowPlayerData (player)
end

-- 各玩家 save 資訊初始化
function G.R:OnClearGameSave(player)
    pu = player.user
    player.maxhealth = 100
    player.maxarmor = 100
    player.coin = 0
    pu.tap = 0
    pu.atm = 0
    pu.gems = 1
    pu.act = 0
    pu.rebirth = 0
    pu.rebuff = 0
    pu.hatch = 0
    pu.detection = 0
    pu.hp = 1
    pu.ap = 1
    pu.sp = 1
    pu.tp = 1
    pu.tapbuff = 1
    pu.gemsbuff = 1
    pu.rebirthbuff = 1
    pu.si = false
    pu.buyAT = false
    pu.autotap = false
    pu.buyFAT = false
    pu.fastauto = false
    pu.buyAR = false
    pu.autorebirth = false
    pu.buySR = false
    pu.superrun = false
    pu.buyTH = false
    pu.triplehatch = false
	player:RemoveWeapon()
    player:ClearWeaponInven()
end