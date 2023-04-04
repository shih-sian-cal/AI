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

-- 減少內存溢位
local function G_PlayerDataNil (player)
    CHP.value = nil
    MHP.value = nil
    HP.value = nil
    CAP.value = nil
    MAP.value = nil
    AP.value = nil
    CGEMS.value = nil
    GEMS.value = nil
    CATM.value = nil
    ATM.value = nil
    CTAP.value = nil
    TAP.value = nil
    CHATCH.value = nil
    HATCH.value = nil
    CUpHp.value = nil
    UpHp.value = nil
    CUpAp.value = nil
    UpAp.value = nil
    CUpSp.value = nil
    UpSp.value = nil
    CUpTp.value = nil
    UpTp.value = nil
    CReTp.value = nil
    ReTp.value = nil
    CUpLucky.value = nil
    CLUCKY.value = nil
    UpLucky.value = nil
    LUCKY.value = nil
    CREBIRTH.value = nil
    REBIRTH.value = nil
    CACT.value = nil
    ACT.value = nil
    CLC.value = nil
    LC.value = nil
    CATSV.value = nil
    ATSV.value = nil
    CFATSV.value = nil
    FATSV.value = nil
    CTHSV.value = nil
    THSV.value = nil
    CAHSV.value = nil
    AHSV.value = nil
    CSRSV.value = nil
    SRSV.value = nil
    AdviceHp.value = nil
    AdviceAp.value = nil
    AdviceSp.value = nil
    AdviceTp.value = nil
    AdviceRp.value = nil
    AdviceLucky.value = nil
    AdviceATM.value = nil
    AdviceCoin.value = nil
    AdviceGems.value = nil
    AdviceGetGems.value = nil
    AdviceGetAct.value = nil
    Advicelimit.value = nil
    AdviceNATM.value = nil
    AdviceNOw.value = nil
    AdviceNTAP.value = nil
    AdviceNWP.value = nil
    AdviceNACT.value = nil
    AdviceNLC.value = nil
    AdviceSave.value = nil
    AdviceATOw.value = nil
    AdviceUATOw.value = nil
    AdviceFATOw.value = nil
    AdviceUFATOw.value = nil
    AdviceTHOw.value = nil
    AdviceUTHOw.value = nil
    AdviceAHOw.value = nil
    AdviceUAHOw.value = nil
    AdviceSROw.value = nil
    AdviceUSROw.value = nil
    AdviceUUBOw.value = nil
    AdviceATSW.value = nil
    AdviceATSW2.value = nil
    AdviceATSW3.value = nil
    AdviceBL.value = nil
    Adviceilnt.value = nil
    AdviceRebirth.value = nil
    AdviceDeBUG.value = nil
end

-- UI傳GAME變數
function G.R:OnPlayerSignal(player,signal)
    local pu = player.user
    ClientID:OnPlayerSignal(player,signal)
    if signal == 901 then -- 升級血量
        CUpHp.value = player.index
        if pu.hp < 100 then
            if UpHpPrice[pu.hp] < 10^8 then
                if player.coin >= UpHpPrice[pu.hp] then
                    player.coin = player.coin - math.ceil(UpHpPrice[pu.hp])
                    pu.hp = pu.hp + 1
                    player.maxhealth = player.maxhealth + 10
                    player.health = player.maxhealth
                else
                    AdviceCoin.value = player.index
                end
            elseif UpHpPrice[pu.hp] >= 10^8  then
                if pu.atm >= math.floor(UpHpPrice[pu.hp] / 10^8) then
                    pu.atm = pu.atm - math.floor(UpHpPrice[pu.hp] / 10^8)
                    pu.hp = pu.hp + 1
                    player.maxhealth = player.maxhealth + 10
                    player.health = player.maxhealth
                    CATM.value = player.index
                    ATM.value = pu.atm -- 偵測各個玩家的存款
                else
                    AdviceNATM.value = player.index
                end
            end
            UpHp.value = UpHpPrice[pu.hp]
        else
            AdviceHp.value = player.index
            UpHp.value = pu.hp
        end
           
    elseif signal == 902 then -- 升級護甲
        CUpAp.value = player.index
        if pu.ap < 100 then
            if UpApPrice[pu.ap] < 10^8 then
                if player.coin >= UpApPrice[pu.ap] then
                    player.coin = player.coin - math.ceil(UpApPrice[pu.ap])
                    pu.ap = pu.ap + 1
                    player.maxarmor = player.maxarmor + 10
                    player.armor = player.maxarmor
                else
                    AdviceCoin.value = player.index
                end
            elseif  UpApPrice[pu.ap] >= 10^8 then
                if pu.atm >= math.floor(UpApPrice[pu.ap] / 10^8) then
                    pu.atm = pu.atm - math.floor(UpApPrice[pu.ap] / 10^8)
                    pu.ap = pu.ap + 1
                    player.maxarmor = player.maxarmor + 10
                    player.armor = player.maxarmor
                    CATM.value = player.index
                    ATM.value = pu.atm -- 偵測各個玩家的存款
                else
                    AdviceNATM.value = player.index
                end
            end
            UpAp.value = UpApPrice[pu.ap]
        else
            AdviceAp.value = player.index
            UpAp.value = pu.ap
        end
       
    elseif signal == 903 then -- 升級跑速
        CUpSp.value = player.index
        if pu.sp < 11 then
            if player.coin >= UpSpPrice[pu.sp] then
                player.coin = player.coin - math.ceil(UpSpPrice[pu.sp])
                player.maxspeed = player.maxspeed + 0.01
                pu.sp = pu.sp + 1
            else
                AdviceCoin.value = player.index
            end
            UpSp.value = UpSpPrice[pu.sp]
        else
            AdviceSp.value = player.index
            UpSp.value = pu.sp
        end

    elseif signal == 904 then -- 購買自動連點
        if pu.autotap ~= 1 then
            if player.coin >= 10000 then
                player.coin = player.coin - 10000
                pu.autotap = 1
                pu.buyAT = 1
                AdviceATOw.value = player.index
                AdviceUATOw.value = player.index
            else
                AdviceCoin.value = player.index
            end
        else
            AdviceATOw.value = player.index
            AdviceUATOw.value = player.index
        end

    elseif signal == 905 then -- 購買額外點擊
        CUpTp.value = player.index
        if pu.tp < 100 then
            if pu.gems >= UpTpPrice[pu.tp] then
                pu.gems = pu.gems - math.ceil(UpTpPrice[pu.tp])
                pu.tp = pu.tp + 1
                CGEMS.value = player.index
                GEMS.value = pu.gems
            else
                AdviceGems.value = player.index
            end
            UpTp.value = UpTpPrice[pu.tp]
        else
            AdviceTp.value = player.index
            UpTp.value = pu.tp
        end

    elseif signal == 906 then -- 購買幸運加成
        if pu.luckyp < 41 then
            if pu.gems >= UpLuckyPrice[pu.luckyp] then
                pu.gems = pu.gems - math.ceil(UpLuckyPrice[pu.luckyp])
                pu.luckyp = pu.luckyp + 1
                pu.lucky =  (1 + pu.luckyp / 10 - 0.1) * All_lucky -- 計算幸運加成
                CLUCKY.value = player.index
                LUCKY.value = pu.lucky
                CGEMS.value = player.index
                GEMS.value = pu.gems
            else
                AdviceGems.value = player.index
            end
            CUpLucky.value = player.index
            UpLucky.value = UpLuckyPrice[pu.luckyp]
        else
            AdviceLucky.value = player.index
            UpLucky.value = pu.luckyp
        end

    elseif signal == 907 then -- 購買轉蛋三連抽
        if pu.triplehatch ~= 1 then
            if pu.gems >= 10000 then
                pu.gems = pu.gems - 10000
                pu.triplehatch = 1
                pu.buyTH = 1
                AdviceTHOw.value = player.index
                AdviceUTHOw.value = player.index
                CGEMS.value = player.index
                GEMS.value = pu.gems
            else
                AdviceGems.value = player.index
            end
        else
            AdviceTHOw.value = player.index
            AdviceUTHOw.value = player.index
        end

    elseif signal == 908 then -- 購買超級跑速
        if pu.superrun ~= 1 then
            if pu.gems >= 100000 then
                pu.gems = pu.gems - 100000
                pu.superrun = 1
                pu.buySR = 1
                AdviceSROw.value = player.index
                AdviceUSROw.value = player.index
                CGEMS.value = player.index
                GEMS.value = pu.gems
            else
                AdviceGems.value = player.index
            end
        else
            AdviceSROw.value = player.index
            AdviceUSROw.value = player.index
        end

    elseif signal == 909 then -- 購買快速自動連點器
        if pu.fastauto ~= 1 then
            if pu.gems >= 1000000 then
                pu.gems = pu.gems - 1000000
                pu.fastauto = 1
                pu.buyFAT = 1
                AdviceFATOw.value = player.index
                AdviceUFATOw.value = player.index
                CGEMS.value = player.index
                GEMS.value = pu.gems
            else
                AdviceGems.value = player.index
            end
        else
            AdviceFATOw.value = player.index
            AdviceUFATOw.value = player.index
        end

    elseif signal == 910 then -- 購買機率性開出無限彈匣武器
        if pu.buyUB ~= 1 then
            if pu.gems >= 100000000 then
                pu.gems = pu.gems - 100000000
                pu.buyUB = 1
                AdviceUUBOw.value = player.index
                CGEMS.value = player.index
                GEMS.value = pu.gems
            else
                AdviceGems.value = player.index
            end
        else
            AdviceUUBOw.value = player.index
        end

    elseif signal == 911 then -- 購買自動抽獎
        if pu.buyAH ~= 1 then
            if pu.gems >= 1000000000 then
                pu.gems = pu.gems - 1000000000
                pu.buyAH = 1
                AdviceUAHOw.value = player.index
                CGEMS.value = player.index
                GEMS.value = pu.gems
            else
                AdviceGems.value = player.index
            end
        else
            AdviceUAHOw.value = player.index
        end

    elseif signal == 1011 then -- 開關自動連點
        if pu.buyAT == 1 then
            if pu.autotap == 1 then
                pu.autotap = 0
            else
                pu.autotap = 1
            end
            CATSV.value = player.index
            ATSV.value = pu.autotap
        else
            AdviceNOw.value = player.index
        end

    elseif signal == 1012 then -- 開關快速自動連點
        if pu.buyFAT == 1 then
            if pu.fastauto == 1 then
                pu.fastauto = 0
            else
                pu.fastauto = 1
            end
            CFATSV.value = player.index
            FATSV.value = pu.fastauto
        else
            AdviceNOw.value = player.index
        end

    elseif signal == 1013 then -- 開關三連抽
        if pu.buyTH == 1 then
            if pu.triplehatch == 1 then
                pu.triplehatch = 0
            else
                pu.triplehatch = 1
            end
            CTHSV.value = player.index
            THSV.value = pu.triplehatch
        else
            AdviceNOw.value = player.index
        end

    elseif signal == 1014 then -- 開關自動抽獎
        if pu.buyAH == 1 then
            if pu.autohatch == 1 then
                pu.autohatch = 0
            else
                pu.autohatch = 1
            end
            CAHSV.value = player.index
            AHSV.value = pu.autohatch
        else
            AdviceNOw.value = player.index
        end

    elseif signal == 1015 then -- 開關超級跑速
        if pu.buySR == 1 then
            if pu.superrun == 1 then
                pu.superrun = 0
            else
                pu.superrun = 1
            end
            CSRSV.value = player.index
            SRSV.value = pu.superrun
        else
            AdviceNOw.value = player.index
        end

    elseif signal == 1016 then -- 開關自動販售史詩級以下的武器
        if pu.autosellweapon == 1 then
            pu.autosellweapon = 0
        else
            pu.autosellweapon = 1
        end
        CASWSV.value = player.index
        ASWSV.value = pu.autosellweapon

    elseif signal == 1017 then -- 開關自動販售傳說級武器
        if pu.autosellweapon2 == 1 then
            pu.autosellweapon2 = 0
        else
            pu.autosellweapon2 = 1
        end
        CASW2SV.value = player.index
        ASW2SV.value = pu.autosellweapon2

    elseif signal == 1018 then -- 開關自動販售神話級武器
        if pu.autosellweapon3 == 1 then
            pu.autosellweapon3 = 0
        else
            pu.autosellweapon3 = 1
        end
        CASW3SV.value = player.index
        ASW3SV.value = pu.autosellweapon3

    elseif signal == 1021 then -- 傳送到重生點
        player.position = {x = 170, y = -175, z  = 3}
        player:Signal(1)

    elseif signal == 1022 then -- 傳送到平靜草原
        if pu.tap < 10000 then
            AdviceNTAP.value = player.index
        else
            player.position = {x = 170, y = -150, z  = 3}
            player:Signal(2)
            LVNU.Map1 = 1
            MNC(1)
        end

    elseif signal == 1023 then -- 傳送到潮濕平地
       if pu.tap < 250000 then
            AdviceNTAP.value = player.index
        else
            player.position = {x = 170, y = -115, z  = 3}
            player:Signal(3)
            LVNU.Map2 = 1
            MNC(2)
        end

    elseif signal == 1024 then -- 傳送到古代都市
        if pu.tap < 2500000 then
            AdviceNTAP.value = player.index
        else
            player.position = {x = 170, y = -75, z  = 3}
            player:Signal(4)
            LVNU.Map3 = 1
            MNC(3)
        end

    elseif signal == 1025 then -- 傳送到未知時空
        if pu.tap < 25000000 then
            AdviceNTAP.value = player.index
        else
            player.position = {x = 170, y = -35, z  = 3}
            player:Signal(5)
            LVNU.Map4 = 1
            MNC(4)
        end

    elseif signal == 1026 then -- 傳送到朝鮮村莊
        if pu.tap < 250000000 then
            AdviceNTAP.value = player.index
        else
            player.position = {x = 170, y = 5, z  = 3}
            player:Signal(6)
            LVNU.Map5 = 1
            MNC(5)
        end

    elseif signal == 1027 then -- 傳送到無名峽谷
        if pu.tap < 2500000000 then
            AdviceNTAP.value = player.index
        else
            player.position = {x = 170, y = 45, z  = 3}
            player:Signal(7)
        end

    elseif signal == 1028 then -- 傳送到靈異木屋
        if pu.tap < 10^10 then
            AdviceNTAP.value = player.index
        else
            player.position = {x = 170, y = 65, z  = 3}
            player:Signal(8)
            LVNU.Map6 = 1
            MNC(6)
        end
    elseif signal == 1029 then -- 傳送到廢棄空地
        if pu.tap < 10^11 then
            AdviceNTAP.value = player.index
        else
            player.position = {x = 170, y = 105, z  = 3}
            player:Signal(9)
            LVNU.Map7 = 1
            MNC(7)
        end

    elseif signal == 1030 then -- 傳送到死亡路口
        if pu.tap < 10^12 then
            AdviceNTAP.value = player.index
        else
            player.position = {x = 170, y = 145, z  = 3}
            player:Signal(10)
            LVNU.Map8 = 1
            MNC(8)
        end

    elseif signal == 1031 then -- 傳送到奪命醫院
        if pu.tap < 10^13 then
            AdviceNTAP.value = player.index
        else
            player.position = {x = 140, y = -175, z  = 3}
            player:Signal(11)
            LVNU.Map9 = 1
            MNC(9)
        end
    elseif signal == 1032 then -- 傳送到荒廢警局
        if pu.tap < 10^14 then
            AdviceNTAP.value = player.index
        else
            player.position = {x = 140, y = -135, z  = 3}
            player:Signal(12)
            LVNU.Map10 = 1
            MNC(10)
        end

    elseif signal == 1033 then -- 傳送到時尚大廳
        if pu.tap < 10^15 then
            AdviceNTAP.value = player.index
        else
            player.position = {x = 140, y = -95, z  = 3}
            player:Signal(13)
        end

    elseif signal == 1034 then -- 傳送到騷亂球場
        if pu.tap < 10^16 then
            AdviceNTAP.value = player.index
        else
            player.position = {x = 140, y = -70, z  = 3}
            player:Signal(14)
            LVNU.Map11 = 1
            MNC(11)
        end

    elseif signal == 1035 then -- 傳送到雪白領域
        if pu.tap < 10^18 then
            AdviceNTAP.value = player.index
        else
            player.position = {x = 140, y = -35, z  = 3}
            player:Signal(15)
            LVNU.Map12 = 1
            MNC(12)
        end

    elseif signal == 1036 then -- 傳送到黑暗領域
        if pu.tap < 10^19 then
            AdviceNTAP.value = player.index
        else
            player.position = {x = 140, y = 5, z  = 3}
            player:Signal(16)
            LVNU.Map13 = 1
            MNC(13)
        end
    elseif signal == 1037 then -- 傳送到機械工廠
        if pu.tap < 10^20 then
            AdviceNTAP.value = player.index
        else
            player.position = {x = 140, y = 50, z  = 3}
            player:Signal(17)
            LVNU.Map14 = 1
            MNC(14)
        end

    elseif signal == 1038 then -- 傳送到變異巢穴
        if pu.tap < 10^21 then
            AdviceNTAP.value = player.index
        else
            player.position = {x = 140, y = 85, z  = 3}
            player:Signal(18)
            LVNU.Map15 = 1
            MNC(15)
        end
    
    elseif signal == 1501 then -- 給予領主券
        if pu.ENBOSS1 == 2 then
            pu.lc = pu.lc + 1
            AdviceGetLC.value = player.index
            CLC.value = player.index
            LC.value = pu.lc
            pu.ENBOSS1 = 1
        end

    elseif signal == 2000 then -- 確定重生
        if pu.rp < 100 then
            if pu.tap >= RBTpPrice[pu.rp] then
                pu.tap = 0
                pu.rebirth = pu.rebirth + 1
                pu.rp = pu.rp + 1
                player.position = {x = 170, y = -175, z  = 3}
                player:Signal(1)
                CMapRE.value = player.index
                AdviceRebirth.value = player.index
                CREBIRTH.value = player.index
                REBIRTH.value = pu.rebirth
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
                player:SetGameSave('blacklist',pu.blacklist)
            else
                AdviceNTAP.value = player.index
            end
            CReTp.value = player.index
            ReTp.value = RBTpPrice[pu.rp]
        else
            AdviceRp.value = player.index
            ReTp.value = pu.rp
        end

    elseif signal == 3001 then -- 房間幸運加成X2
        if pu.act >= 1 then
            pu.act = pu.act - 1
            All_lucky = 2
            if All_lucky_time ~= 0 then
                All_lucky_time = All_lucky_time + 1200
            else
                All_lucky_time = All_lucky_time + Game.GetTime() + 1200
            end
            RBLT.value = All_lucky_time
            CLUCKY.value = player.index
            CUpLucky.value = player.index
            if pu.luckyp >= 41 then
                UpLucky.value = pu.luckyp
            else
                UpLucky.value = UpLuckyPrice[pu.luckyp]
            end
            pu.lucky =  (1 + (pu.luckyp / 10 - 0.1)) * All_lucky -- 計算幸運加成
            LUCKY.value = pu.lucky
        else
            AdviceNACT.value = player.index
        end
    elseif signal == 3002 then -- 房間寶石加成X2
        if pu.act >= 1 then
            pu.act = pu.act - 1
            All_gems = 2
            if All_gems_time ~= 0 then
                All_gems_time = All_gems_time + 1200
            else
                All_gems_time = All_gems_time + Game.GetTime() + 1200
            end
            RBGT.value = All_gems_time
        else
            AdviceNACT.value = player.index
        end
    elseif signal == 3003 then -- 房間金幣加成X2
        if pu.act >= 1 then
            pu.act = pu.act - 1
            All_coin = 2
            if All_coin_time ~= 0 then
                All_coin_time = All_coin_time + 1200
            else
                All_coin_time = All_coin_time + Game.GetTime() + 1200
            end
            RBCT.value = All_coin_time
        else
            AdviceNACT.value = player.index
        end
    elseif signal == 3004 then -- 房間點擊數加成X2
        if pu.act >= 1 then
            pu.act = pu.act - 1
            All_tap = 2
            if All_tap_time ~= 0 then
                All_tap_time = All_tap_time + 1200
            else
                All_tap_time = All_tap_time + Game.GetTime() + 1200
            end
            RBTT.value = All_tap_time
        else
            AdviceNACT.value = player.index
        end
    elseif signal == 10001 then -- 武器庫
        player:ToggleWeaponInven()
        
    elseif signal == 10002 then -- 人稱
        if pu.SPTV == 0 then
            pu.SPTV = 1
            player:SetThirdPersonView(100,250)
        elseif pu.SPTV == 1 then
            pu.SPTV = 0
            player:SetFirstPersonView()
        end

    elseif signal == 10003 then -- 儲存

        G_ShowPlayerData (player)

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
        player:SetGameSave('blacklist',pu.blacklist)

        AdviceSave.value = player.index

    elseif signal == 10004 then -- 點擊
        if player:GetPrimaryWeapon() == nil and player:GetSecondaryWeapon() == nil then
            pu.tap = pu.tap + math.ceil((1 + pu.rebirth / 2) + (pu.tp * 2)) * (pu.tapbuff - 1 + All_tap)
        elseif player:GetSecondaryWeapon() == nil then
            if player:GetPrimaryWeapon().user.dtap == nil then return end
            pu.tap = pu.tap + player:GetPrimaryWeapon().user.dtap * math.ceil((1 + pu.rebirth / 2) + (pu.tp * 2)) * (pu.tapbuff - 1 + All_tap)
        elseif player:GetPrimaryWeapon() == nil then
            if player:GetSecondaryWeapon().user.dtap == nil then return end
            pu.tap = pu.tap + player:GetSecondaryWeapon().user.dtap * math.ceil((1 + pu.rebirth / 2) + (pu.tp * 2)) * (pu.tapbuff - 1 + All_tap)
        else
            if player:GetPrimaryWeapon().user.dtap == nil then return end
            if player:GetSecondaryWeapon().user.dtap == nil then return end
            pu.tap = pu.tap + (player:GetPrimaryWeapon().user.dtap + player:GetSecondaryWeapon().user.dtap) * math.ceil((1 + pu.rebirth / 2) + (pu.tp * 2)) * (pu.tapbuff - 1 + All_tap)
        end
        
        CTAP.value = player.index
        TAP.value = pu.tap
    elseif signal == 10010 then
        if player == nil then return end
        
        if player.team == Game.TEAM.TR then
            player.team = Game.TEAM.CT
        end

        if G.R.breakable == true then
            pu.swp.user.dtap = 0
            pu.gwp.user.dtap = 0
            AdviceDeBUG.value = player.index
            G.R.breakable = false
        end

        if Monster_KCtime <= Game.GetTime() then
            RMKC.value = 0
        end

        if All_lucky_time <= Game.GetTime() then
            All_lucky = 1
            RBLT.value = 0
        end
        if All_gems_time <= Game.GetTime() then
            All_gems = 1
            RBGT.value = 0
        end
        if All_coin_time <= Game.GetTime() then
            All_coin = 1
            RBCT.value = 0
        end
        if All_tap_time <= Game.GetTime() then
            All_tap = 1
            RBTT.value = 0
        end

        if pu.autohatch == 1 and pu.AHtime <= Game.GetTime() and pu.AHmap ~= 0 then
            if pu.AHmap == 1 then
                G_WP(player,1,{x = 177,y = -170,z = 3})
            elseif pu.AHmap == 2 then
                G_WP(player,2,{x = 177,y = -140,z = 3})
            elseif pu.AHmap == 3 then
                G_WP(player,3,{x = 177,y = -102,z = 3})
            elseif pu.AHmap == 4 then
                G_WP(player,4,{x = 177,y = -60,z = 3})
            elseif pu.AHmap == 5 then
                G_WP(player,5,{x = 177,y = -21,z = 3})
            elseif pu.AHmap == 6 then
                G_WP(player,6,{x = 177,y = 20,z = 3})
            elseif pu.AHmap == 7 then
                G_WP(player,7,{x = 177,y = 82,z = 3})
            elseif pu.AHmap == 8 then
                G_WP(player,8,{x = 177,y = 121,z = 3})
            elseif pu.AHmap == 9 then
                G_WP(player,9,{x = 177,y = 161,z = 3})
            elseif pu.AHmap == 10 then
                G_WP(player,10,{x = 145,y = -161,z = 3})
            elseif pu.AHmap == 11 then
                G_WP(player,11,{x = 145,y = -122,z = 3})
            elseif pu.AHmap == 12 then
                G_WP(player,12,{x = 145,y = -60,z = 3})
            elseif pu.AHmap == 13 then
                G_WP(player,13,{x = 145,y = -20,z = 3})
            elseif pu.AHmap == 14 then
                G_WP(player,14,{x = 145,y = 20,z = 3})
            elseif pu.AHmap == 15 then
                G_WP(player,15,{x = 145,y = 60,z = 3})
            elseif pu.AHmap == 16 then
                WP(player,16,{x = 145,y = 100,z = 3})
            elseif pu.AHmap == 1001 then
                G_WP(player,1001,{x = 145,y = -90,z = 3})
            end
            pu.AHtime = Game.GetTime() + 1
        elseif pu.autohatch == 0 then
            pu.AHmap = 0
        end

        if pu.tap >= 9200000000000000000 and pu.tap < 9250000000000000000 then
            pu.tap = 9250000000000000000
        elseif pu.tap < 0 then
            pu.tap = 9250000000000000000
        end

        G_PlayerDataNil (player)

        CHP.value = player.index
        MHP.value = player.maxhealth -- 偵測各個玩家的最大血量
        HP.value = player.health -- 偵測各個玩家的目前血量
        CAP.value = player.index
        MAP.value = player.maxarmor -- 偵測各個玩家的最大護甲
        AP.value = player.armor -- 偵測各個玩家的目前護甲

        CLUCKY.value = player.index
        CUpLucky.value = player.index
        if pu.luckyp >= 41 then
            UpLucky.value = pu.luckyp
        else
            UpLucky.value = UpLuckyPrice[pu.luckyp]
        end
        pu.lucky =  (1 + (pu.luckyp / 10 - 0.1)) * All_lucky -- 計算幸運加成
        LUCKY.value = pu.lucky

        if player.coin >= 900000000 then
            player.coin = player.coin - 100000000
            pu.atm = pu.atm + 1
            CATM.value = player.index
            ATM.value = pu.atm
        end

        if player.position.z == -10 or player.position.z == 100 then
            pu.blacklist = 1
        elseif player.position.x > 149 and player.position.x < 158 then
            pu.blacklist = 1
        elseif player.position.x < 126 then
            pu.blacklist = 1
        elseif player.position.y > 185 then
            pu.blacklist = 1
        elseif player.position.y < -181 then
            pu.blacklist = 1
        end

        if pu.blacklist == 1 then
            player.position = {x = -192, y = -192, z = 94}
            AdviceBL.value = player.index
        end

        player.maxhealth = 100 + (100 * (pu.hp - 1)) -- 偵測各個玩家的血量
        player.maxarmor = 100 + (100 * (pu.ap - 1)) -- 偵測各個玩家的護甲

        if pu.superrun == 1 then
            player.maxspeed = 1 + (pu.sp / 10) -- 偵測各個玩家的跑速
        else
            player.maxspeed = 1 + (pu.sp / 100) -- 偵測各個玩家的跑速
        end

        
        if pu.gems == 0 and pu.tap == 0 then
            Adviceilnt.value = player.index
        end

        G_CheckWeapons(player)

        if E.ITEM.HP1.onoff == true and timehp1 <= Game.GetTime()  then
            E.ITEM.CHP1:Event({action="reset"},0)
            E.ITEM.HP1:Event({action="reset"},0)
        end
        if E.ITEM.AP1.onoff == true and timeap1 <= Game.GetTime()  then
            E.ITEM.CAP1:Event({action="reset"},0)
            E.ITEM.AP1:Event({action="reset"},0)
        end
        if E.ITEM.PP1.onoff == true and timepp1 <= Game.GetTime()  then
            E.ITEM.CPP1:Event({action="reset"},0)
            E.ITEM.PP1:Event({action="reset"},0)
        end
        if E.ITEM.HP2.onoff == true and timehp2 <= Game.GetTime()  then
            E.ITEM.CHP2:Event({action="reset"},0)
            E.ITEM.HP2:Event({action="reset"},0)
        end
        if E.ITEM.AP2.onoff == true and timeap2 <= Game.GetTime()  then
            E.ITEM.CAP2:Event({action="reset"},0)
            E.ITEM.AP2:Event({action="reset"},0)
        end
        if E.ITEM.PP2.onoff == true and timepp2 <= Game.GetTime()  then
            E.ITEM.CPP2:Event({action="reset"},0)
            E.ITEM.PP2:Event({action="reset"},0)
        end

        -- 偵測玩家是否開啟自動點擊
        if pu.autotap == 1 then
            if pu.TIME <= Game.GetTime() then
                if player:GetPrimaryWeapon() == nil and player:GetSecondaryWeapon() == nil then
                    pu.tap = pu.tap + math.ceil((1 + pu.rebirth / 2) + (pu.tp * 2)) * (pu.tapbuff - 1 + All_tap)
                elseif player:GetSecondaryWeapon() == nil then
                    if player:GetPrimaryWeapon().user.dtap == nil then return end
                    pu.tap = pu.tap + player:GetPrimaryWeapon().user.dtap * math.ceil((1 + pu.rebirth / 2) + (pu.tp * 2)) * (pu.tapbuff - 1 + All_tap)
                elseif player:GetPrimaryWeapon() == nil then
                    if player:GetSecondaryWeapon().user.dtap == nil then return end
                    pu.tap = pu.tap + player:GetSecondaryWeapon().user.dtap * math.ceil((1 + pu.rebirth / 2) + (pu.tp * 2)) * (pu.tapbuff - 1 + All_tap)
                else
                    if player:GetPrimaryWeapon().user.dtap == nil then return end
                    if player:GetSecondaryWeapon().user.dtap == nil then return end
                    pu.tap = pu.tap + (player:GetPrimaryWeapon().user.dtap + player:GetSecondaryWeapon().user.dtap) * math.ceil((1 + pu.rebirth / 2) + (pu.tp * 2)) * (pu.tapbuff - 1 + All_tap)
                end
                CTAP.value = player.index
                TAP.value = pu.tap
                pu.TIME = Game.GetTime() + 1
            end
        end

        -- 偵測玩家是否開啟快速自動點擊
        if pu.fastauto == 1 then
            if player:GetPrimaryWeapon() == nil and player:GetSecondaryWeapon() == nil then
                pu.tap = pu.tap + math.ceil((1 + pu.rebirth / 2) + (pu.tp * 2)) * (pu.tapbuff - 1 + All_tap)
            elseif player:GetSecondaryWeapon() == nil then
                if player:GetPrimaryWeapon().user.dtap == nil then return end
                pu.tap = pu.tap + player:GetPrimaryWeapon().user.dtap * math.ceil((1 + pu.rebirth / 2) + (pu.tp * 2)) * (pu.tapbuff - 1 + All_tap)
            elseif player:GetPrimaryWeapon() == nil then
                if player:GetSecondaryWeapon().user.dtap == nil then return end
                pu.tap = pu.tap + player:GetSecondaryWeapon().user.dtap * math.ceil((1 + pu.rebirth / 2) + (pu.tp * 2)) * (pu.tapbuff - 1 + All_tap)
            else
                if player:GetPrimaryWeapon().user.dtap == nil then return end
                if player:GetSecondaryWeapon().user.dtap == nil then return end
                pu.tap = pu.tap + (player:GetPrimaryWeapon().user.dtap + player:GetSecondaryWeapon().user.dtap) * math.ceil((1 + pu.rebirth / 2) + (pu.tp * 2)) * (pu.tapbuff - 1 + All_tap)
            end
            CTAP.value = player.index
            TAP.value = pu.tap
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
end