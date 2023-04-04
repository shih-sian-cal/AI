-- 計算各區域怪物生成數量
MLC = {
    [1] = 0,
    [2] = 0,
    [3] = 0,
    [4] = 0,
    [5] = 0,
    [7] = 0,
    [8] = 0,
    [9] = 0,
    [10] = 0,
    [11] = 0,
    [12] = 0,
    [13] = 0,
    [14] = 0,
    [15] = 0,
    [16] = 0,
    [17] = 0,
    [18] = 0,
    [19] = 0,
    [20] = 0,
    [1001] = 0,
}

-- 各區域玩家數量
LVNU = {
    Map1 = 0,
    Map2 = 0,
    Map3 = 0,
    Map4 = 0,
    Map5 = 0,
    Map6 = 0,
    Map7 = 0,
    Map8 = 0,
    Map9 = 0,
    Map10 = 0,
    Map11 = 0,
    Map12 = 0,
    Map13 = 0,
    Map14 = 0,
    Map15 = 0,
    Map16 = 0,
    Map17 = 0,
    Map18 = 0,
    Map19 = 0,
    Map20 = 0,
    Map1001 = 0,
}

-- 計算各區域怪物擊殺
LVC = {
    [1] = 0,
    [2] = 0,
    [3] = 0,
    [4] = 0,
    [5] = 0,
    [6] = 0,
    [7] = 0,
    [8] = 0,
    [9] = 0,
    [10] = 0,
    [11] = 0,
    [12] = 0,
    [13] = 0,
    [14] = 0,
    [15] = 0,
    [16] = 0,
    [17] = 0,
    [18] = 0,
    [19] = 0,
    [20] = 0,
    [1001] = 0,
}

-- 怪物種類
local MonsterTypes = {
    G.MT.NORMAL0,
    G.MT.RUNNER0,
    G.MT.NORMAL1,
    G.MT.RUNNER1,
    G.MT.NORMAL2,
    G.MT.RUNNER2,
    G.MT.NORMAL3,
    G.MT.RUNNER3,
    G.MT.NORMAL4,
    G.MT.RUNNER4,
    G.MT.NORMAL5,
    G.MT.RUNNER5,
    G.MT.NORMAL6,
    G.MT.RUNNER6,
	G.MT.HEAVY1,--15
	G.MT.HEAVY2,
	G.MT.A101AR,--17
	G.MT.A104RL,
	G.MT.GHOST,--19
	G.MT.PUMPKIN,
    G.MT.PUMPKINHEAD,
    763, --雪人22
    248, --楓之谷23
    249,
    250,
    251,
    687,
    688, --黃巾28
    689,
    940, --機甲30
    941,
    1097, --足球32
    1098,
    1509, --毒花34
    1520, --狂暴35
    1521, --自爆36
    1650, --朝鮮37
    1651,
    1652,
    1653,
    [1951] = 1951
}

-- 巨獸種類
local MonsterBOSS = {
    1289, --巨獸雷比亞
    1950, --機甲魁儡
    1951, --奧茲
}

-- 計算怪物數量
function MNC(LVMO)
    if LVMO > 0 and LVMO < 16 then
        MLC[LVMO] = 5 - LVC[LVMO]
    elseif LVMO == 1001 then
        MLC[LVMO] = 3 - LVC[LVMO]
    end

    LCM = MLC[LVMO]
    LVM = LVMO
    MonsterC(LCM,LVM)
end

-- 怪物系統
function MonsterC(LCM,LVM)
    local MT = 0
    local MS = 0
    for i = 1, LCM do
        if LVNU.Map1 ~= 0 and LVM == 1 then
            MT = G_RI(23,25) -- 怪物種類
            Moi = G.M:Create(MonsterTypes[MT],{x = G_RI(165,170),y = G_RI(-145,-135),z = 10}) -- 怪物生成
            LVC[LVM] = LVC[LVM] + 1

        elseif LVNU.Map2 ~= 0 and LVM == 2 then
            MT = G_RI(26,27)
            Moi = G.M:Create(MonsterTypes[MT],{x = G_RI(165,170),y = G_RI(-105,-95),z = 10})
            LVC[LVM] = LVC[LVM] + 1

        elseif LVNU.Map3 ~= 0 and LVM == 3 then
            MT = G_RI(28,29)
            Moi = G.M:Create(MonsterTypes[MT],{x = G_RI(165,170),y = G_RI(-65,-55),z = 10})
            LVC[LVM] = LVC[LVM] + 1

        elseif LVNU.Map4 ~= 0 and LVM == 4 then
            MT = G_RI(30,31)
            Moi = G.M:Create(MonsterTypes[MT],{x = G_RI(165,170),y = G_RI(-26,-16),z = 10})
            LVC[LVM] = LVC[LVM] + 1

        elseif LVNU.Map5 ~= 0 and LVM == 5 then
            MT = G_RI(37,40)
            Moi = G.M:Create(MonsterTypes[MT],{x = G_RI(165,170),y = G_RI(15,25),z = 10})
            LVC[LVM] = LVC[LVM] + 1

        elseif LVNU.Map6 ~= 0 and LVM == 6 then
            MT = G_RI(19,21)
            Moi = G.M:Create(MonsterTypes[MT],{x = G_RI(165,170),y = G_RI(77,87),z = 10})
            LVC[LVM] = LVC[LVM] + 1

        elseif LVNU.Map7 ~= 0 and LVM == 7 then
            MT = G_RI(1,4)
            Moi = G.M:Create(MonsterTypes[MT],{x = G_RI(165,170),y = G_RI(116,126),z = 10})
            LVC[LVM] = LVC[LVM] + 1

        elseif LVNU.Map8 ~= 0 and LVM == 8 then
            MT = G_RI(5,8)
            Moi = G.M:Create(MonsterTypes[MT],{x = G_RI(165,170),y = G_RI(156,166),z = 10})
            LVC[LVM] = LVC[LVM] + 1

        elseif LVNU.Map9 ~= 0 and LVM == 9 then
            MT = G_RI(9,12)
            Moi = G.M:Create(MonsterTypes[MT],{x = G_RI(135,140),y = G_RI(-166,-156),z = 10})
            LVC[LVM] = LVC[LVM] + 1

        elseif LVNU.Map10 ~= 0 and LVM == 10 then
            MT = G_RI(13,16)
            Moi = G.M:Create(MonsterTypes[MT],{x = G_RI(135,140),y = G_RI(-127,-117),z = 10})
            LVC[LVM] = LVC[LVM] + 1
            
        elseif LVNU.Map11 ~= 0 and LVM == 11 then
            MT = G_RI(32,33)
            Moi = G.M:Create(MonsterTypes[MT],{x = G_RI(135,140),y = G_RI(-65,-55),z = 10})
            LVC[LVM] = LVC[LVM] + 1

        elseif LVNU.Map12 ~= 0 and LVM == 12 then
            MT = 22
            Moi = G.M:Create(MonsterTypes[MT],{x = G_RI(135,140),y = G_RI(-25,-15),z = 10})
            LVC[LVM] = LVC[LVM] + 1

        elseif LVNU.Map13 ~= 0 and LVM == 13 then
            MT = 19
            Moi = G.M:Create(MonsterTypes[MT],{x = G_RI(135,140),y = G_RI(15,25),z = 10})
            LVC[LVM] = LVC[LVM] + 1
        elseif LVNU.Map14 ~= 0 and LVM == 14 then
            MT = G_RI(17,18)
            Moi = G.M:Create(MonsterTypes[MT],{x = G_RI(135,140),y = G_RI(55,65),z = 10})
            LVC[LVM] = LVC[LVM] + 1
        elseif LVNU.Map15 ~= 0 and LVM == 15 then
            MT = G_RI(34,36)
            Moi = G.M:Create(MonsterTypes[MT],{x = G_RI(135,140),y = G_RI(95,105),z = 10})
            LVC[LVM] = LVC[LVM] + 1
        elseif LVNU.Map1001 ~= 0 and LVM == 1001 then
            MT = 3
            Moi = G.M:Create(MonsterBOSS[MT],{x = G_RI(135,140),y = G_RI(-165,-155),z = 35})
            LVC[1001] = LVC[1001] + 1

        end

        if Moi == nil then
            i = i - 1
            return
        end

        Mu = Moi.user

        if LVM == 1 and MT ~= 1951 then
            if MT == 23 then
                Moi.health = 50000
                Moi.armor = 50000
                Moi.damage = 10
                Moi.coin = 100
                Moi.speed = 1
                Moi.viewDistance = 10
                Mu.maxhealth = 0
                Mu.health = 0
                Mu.gems = G_RI(0,1)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            elseif MT == 24 then
                Moi.health = 100000
                Moi.armor = 100000
                Moi.damage = 25
                Moi.coin = 250
                Moi.speed = 1
                Moi.viewDistance = 10
                Mu.maxhealth = 0
                Mu.health = 0
                Mu.gems = G_RI(0,2)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            elseif MT == 25 then
                Moi.health = 250000
                Moi.armor = 250000
                Moi.damage = 50
                Moi.coin = 500
                Moi.speed = 1
                Moi.viewDistance = 10
                Mu.maxhealth = 0
                Mu.health = 0
                Mu.gems = G_RI(0,3)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            end
            Mu.limit = 10000
            
        elseif LVM == 2 then
            if MT == 26 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 50
                Moi.coin = 2500
                Moi.speed = 1.1
                Moi.viewDistance = 10
                Mu.maxhealth = 1500000
                Mu.health = 1500000
                Mu.gems = G_RI(0,6)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            elseif MT == 27 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 75
                Moi.coin = 5000
                Moi.speed = 1.2
                Moi.viewDistance = 10
                Mu.maxhealth = 4000000
                Mu.health = 4000000
                Mu.gems = G_RI(0,9)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            end
            Mu.limit = 250000

        elseif LVM == 3 then
            if MT == 28 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 100
                Moi.coin = 10000
                Moi.speed = 1.2
                Moi.viewDistance = 10
                Mu.maxhealth = 11500000
                Mu.health = 11500000
                Mu.gems = G_RI(0,12)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            elseif MT == 29 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 125
                Moi.coin = 25000
                Moi.speed = 1.25
                Moi.viewDistance = 10
                Mu.maxhealth = 49000000
                Mu.health = 49000000
                Mu.gems = G_RI(0,15)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            end
            Mu.limit = 2500000

        elseif LVM == 4 then
            if MT == 30 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 150
                Moi.coin = 50000
                Moi.speed = 1.3
                Moi.viewDistance = 10
                Mu.maxhealth = 124000000
                Mu.health = 124000000
                Mu.gems = G_RI(0,18)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            elseif MT == 31 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 175
                Moi.coin = 75000
                Moi.speed = 1.35
                Moi.viewDistance = 10
                Mu.maxhealth = 499000000
                Mu.health = 499000000
                Mu.gems = G_RI(0,21)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            end
            Mu.limit = 25000000

        elseif LVM == 5 then
            if MT == 38 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 200
                Moi.coin = 100000
                Moi.speed = 1
                Moi.viewDistance = 10
                Mu.maxhealth = 249000000
                Mu.health = 249000000
                Mu.gems = G_RI(0,24)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            elseif MT == 39 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 225
                Moi.coin = 150000
                Moi.speed = 1.1
                Moi.viewDistance = 10
                Mu.maxhealth = 999000000
                Mu.health = 999000000
                Mu.gems = G_RI(0,27)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            elseif MT == 40 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 250
                Moi.coin = 200000
                Moi.speed = 1.2
                Moi.viewDistance = 10
                Mu.maxhealth = 1999000000
                Mu.health = 1999000000
                Mu.gems = G_RI(0,30)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            elseif MT == 37 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 275
                Moi.coin = 250000
                Moi.speed = 1.3
                Moi.viewDistance = 10
                Mu.maxhealth = 2499000000
                Mu.health = 2499000000
                Mu.gems = G_RI(0,33)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            end
            Mu.limit = 250000000
            
        elseif LVM == 6 then
            if MT == 21 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 300
                Moi.coin = 250000
                Moi.speed = 1.25
                Moi.viewDistance = 10
                Mu.maxhealth = 24999000000
                Mu.health = 24999000000
                Mu.gems = G_RI(0,50)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            elseif MT == 20 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 350
                Moi.coin = 500000
                Moi.speed = 1.4
                Moi.viewDistance = 10
                Mu.maxhealth = 49999000000
                Mu.health = 49999000000
                Mu.gems = G_RI(0,75)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            elseif MT == 19 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 400
                Moi.coin = 1000000
                Moi.speed = 1.5
                Moi.viewDistance = 10
                Mu.maxhealth = 99999000000
                Mu.health = 99999000000
                Mu.gems = G_RI(0,100)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            end
            Mu.limit = 10^10

        elseif LVM == 7 then
            if MT == 1 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 425
                Moi.coin = 1250000
                Moi.speed = 1.1
                Moi.viewDistance = 10
                Mu.maxhealth = 249999000000
                Mu.health = 249999000000
                Mu.gems = G_RI(0,125)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            elseif MT == 2 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 450
                Moi.coin = 1500000
                Moi.speed = 1.2
                Moi.viewDistance = 10
                Mu.maxhealth = 499999000000
                Mu.health = 499999000000
                Mu.gems = G_RI(0,150)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            elseif MT == 3 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 475
                Moi.coin = 1750000
                Moi.speed = 1.1
                Moi.viewDistance = 10
                Mu.maxhealth = 749999000000
                Mu.health = 749999000000
                Mu.gems = G_RI(0,175)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            elseif MT == 4 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 500
                Moi.coin = 2000000
                Moi.speed = 1.2
                Moi.viewDistance = 10
                Mu.maxhealth = 999999000000
                Mu.health = 999999000000
                Mu.gems = G_RI(0,200)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            end
            Mu.limit = 10^11

        elseif LVM == 8 then
            if MT == 5 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 525
                Moi.coin = 2250000
                Moi.speed = 1.2
                Moi.viewDistance = 10
                Mu.maxhealth = 2499999000000
                Mu.health = 2499999000000
                Mu.gems = G_RI(0,225)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            elseif MT == 6 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 550
                Moi.coin = 2500000
                Moi.speed = 1.3
                Moi.viewDistance = 10
                Mu.maxhealth = 4999999000000
                Mu.health = 4999999000000
                Mu.gems = G_RI(0,250)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            elseif MT == 7 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 575
                Moi.coin = 2750000
                Moi.speed = 1.2
                Moi.viewDistance = 10
                Mu.maxhealth = 7499999000000
                Mu.health = 7499999000000
                Mu.gems = G_RI(0,275)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            elseif MT == 8 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 600
                Moi.coin = 3000000
                Moi.speed = 1.3
                Moi.viewDistance = 10
                Mu.maxhealth = 9999999000000
                Mu.health = 9999999000000
                Mu.gems = G_RI(0,300)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            end
            Mu.limit = 10^12

        elseif LVM == 9 then
            if MT == 9 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 625
                Moi.coin = 2250000
                Moi.speed = 1.3
                Moi.viewDistance = 10
                Mu.maxhealth = 24999999000000
                Mu.health = 2499999000000
                Mu.gems = G_RI(0,325)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            elseif MT == 10 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 650
                Moi.coin = 2500000
                Moi.speed = 1.4
                Moi.viewDistance = 10
                Mu.maxhealth = 49999999000000
                Mu.health = 49999999000000
                Mu.gems = G_RI(0,350)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            elseif MT == 11 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 675
                Moi.coin = 2750000
                Moi.speed = 1.3
                Moi.viewDistance = 10
                Mu.maxhealth = 74999999000000
                Mu.health = 74999999000000
                Mu.gems = G_RI(0,375)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            elseif MT == 12 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 700
                Moi.coin = 3000000
                Moi.speed = 1.4
                Moi.viewDistance = 10
                Mu.maxhealth = 99999999000000
                Mu.health = 99999999000000
                Mu.gems = G_RI(0,400)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            end
            Mu.limit = 10^13

        elseif LVM == 10 then
            if MT == 13 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 725
                Moi.coin = 3500000
                Moi.speed = 1.4
                Moi.viewDistance = 10
                Mu.maxhealth = 249999999000000
                Mu.health = 24999999000000
                Mu.gems = G_RI(0,425)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            elseif MT == 14 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 750
                Moi.coin = 4000000
                Moi.speed = 1.5
                Moi.viewDistance = 10
                Mu.maxhealth = 499999999000000
                Mu.health = 499999999000000
                Mu.gems = G_RI(0,450)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            elseif MT == 15 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 775
                Moi.coin = 4500000
                Moi.speed = 1.6
                Moi.viewDistance = 10
                Mu.maxhealth = 749999999000000
                Mu.health = 749999999000000
                Mu.gems = G_RI(0,475)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            elseif MT == 16 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 800
                Moi.coin = 5000000
                Moi.speed = 1.6
                Moi.viewDistance = 10
                Mu.maxhealth = 999999999000000
                Mu.health = 999999999000000
                Mu.gems = G_RI(0,500)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            end
            Mu.limit = 10^14
            
        elseif LVM == 11 then
            if MT == 33 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 900
                Moi.coin = 6000000
                Moi.speed = 1.75
                Moi.viewDistance = 10
                Mu.maxhealth = 49999999999000000
                Mu.health = 49999999999000000
                Mu.gems = G_RI(0,600)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            elseif MT == 32 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 1000
                Moi.coin = 7500000
                Moi.speed = 1.75
                Moi.viewDistance = 10
                Mu.maxhealth = 99999999999000000
                Mu.health = 99999999999000000
                Mu.gems = G_RI(0,750)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            end
            Mu.limit = 10^16
            
        elseif LVM == 12 then
            if MT == 22 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 1250
                Moi.coin = 10000000
                Moi.speed = 2
                Moi.viewDistance = 10
                Mu.maxhealth = 999999999999000000
                Mu.health = 999999999999000000
                Mu.gems = G_RI(0,1000)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            end
            Mu.limit = 10^17

        elseif LVM == 13 then
            if MT == 19 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 1500
                Moi.coin = 15000000
                Moi.speed = 2.5
                Moi.viewDistance = 10
                Moi:SetRenderFX(18)
                Mu.maxhealth = 9999999999999000000
                Mu.health = 9999999999999000000
                Mu.gems = G_RI(0,1250)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            end
            Mu.limit = 10^18

        elseif LVM == 14 then
            if MT == 18 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 2000
                Moi.coin = 20000000
                Moi.speed = 2.75
                Moi.viewDistance = 10
                Mu.maxhealth = 49999999999999000000
                Mu.health = 49999999999999000000
                Mu.gems = G_RI(0,1500)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            elseif MT == 17 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 100
                Moi.coin = 20000000
                Moi.speed = 2.75
                Moi.viewDistance = 10
                Mu.maxhealth = 99999999999999000000
                Mu.health = 99999999999999000000
                Mu.gems = G_RI(0,2000)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            end
            Mu.limit = 10^19

        elseif LVM == 15 then
            if MT == 34 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 150
                Moi.coin = 25000000
                Moi.speed = 1
                Moi.viewDistance = 10
                Mu.maxhealth = 49999999999999000000
                Mu.health = 49999999999999000000
                Mu.gems = G_RI(0,2500)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            elseif MT == 35 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 1000
                Moi.coin = 35000000
                Moi.speed = 2.5
                Moi.viewDistance = 10
                Mu.maxhealth = 74999999999999000000
                Mu.health = 74999999999999000000
                Mu.gems = G_RI(0,3500)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            elseif MT == 36 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 2500
                Moi.coin = 50000000
                Moi.speed = 3
                Moi.viewDistance = 10
                Mu.maxhealth = 99999999999999000000
                Mu.health = 99999999999999000000
                Mu.gems = G_RI(0,5000)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            end
            Mu.limit = 10^20

        elseif LVM == 1001 then
            if MT == 3 then
                Moi.health = 1000000
                Moi.armor = 1000000
                Moi.damage = 2500
                Moi.coin = 25000000
                Moi.speed = 2
                Moi.viewDistance = 10
                Mu.maxhealth = 9999999999999999000000
                Mu.health = 9999999999999999000000
                Mu.gems = G_RI(0,2500)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            end
            Mu.limit = 10^13
            
        end
    end
end

-- 區域計算
function Total_area(vu_MK,vu_B)

    if vu_MK == nil then return end

    if vu_MK > 0 and vu_MK < 16 then
        LVC[vu_MK] = LVC[vu_MK] - 1
        if LVC[vu_MK] ~= 5 then
            MNC(vu_MK)
        end
    elseif vu_MK == 1001 then
        LVC[vu_MK] = LVC[vu_MK] - 1
        if LVC[vu_MK] ~= 3 then
            MNC(vu_MK)
        end
    end 
end