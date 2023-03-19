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
}

-- 各區域玩家數量
LVNU = {
    Map1 = 0,
    Map2 = 0,
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
}

-- 怪物種類
MonsterTypes = {
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
    1653
}

-- 巨獸種類
MonsterBOSS = {
    1289, --巨獸雷比亞
    1950, --機甲魁儡
    1951, --奧茲
}

-- 計算怪物數量
function MNC(LVMO)
    if LVMO == 1 or 2 then
        MLC[LVMO] = 10 - LVC[LVMO]
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
            Moi = G.M:Create(MonsterTypes[MT],{x = G_RI(165,175),y = G_RI(-145,-135),z = 10}) -- 怪物生成
            LVC[1] = LVC[1] + 1
        elseif LVNU.Map2 ~= 0 and LVM == 2 then
            MT = G_RI(26,27) -- 怪物種類
            Moi = G.M:Create(MonsterTypes[MT],{x = G_RI(165,175),y = G_RI(-105,-95),z = 10}) -- 怪物生成
            LVC[2] = LVC[2] + 1
        end

        if Moi == nil then
            i = i - 1
            return
        end

        Mu = Moi.user

        if LVM == 1 then
            if MT == 23 then
                Moi.health = 125000
                Moi.armor = 125000
                Moi.damage = 10
                Moi.coin = 250
                Moi.speed = 1
                Moi.viewDistance = 10
                Mu.maxhealth = 0
                Mu.health = 0
                Mu.gems = G_RI(0,1)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            elseif MT == 24 then
                Moi.health = 250000
                Moi.armor = 250000
                Moi.damage = 25
                Moi.coin = 500
                Moi.speed = 1
                Moi.viewDistance = 10
                Mu.maxhealth = 0
                Mu.health = 0
                Mu.gems = G_RI(0,2)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            elseif MT == 25 then
                Moi.health = 500000
                Moi.armor = 500000
                Moi.damage = 50
                Moi.coin = 1000
                Moi.speed = 1
                Moi.viewDistance = 10
                Mu.maxhealth = 0
                Mu.health = 0
                Mu.gems = G_RI(0,3)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            end
            Mu.limit = 25000
            
        elseif LVM == 2 then
            if MT == 26 then
                Moi.health = 10^6
                Moi.armor = 10^6
                Moi.damage = 50
                Moi.coin = 4000
                Moi.speed = 1.1
                Moi.viewDistance = 10
                Mu.maxhealth = 1500000
                Mu.health = 1500000
                Mu.gems = G_RI(0,6)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            elseif MT == 27 then
                Moi.health = 10^6
                Moi.armor = 10^6
                Moi.damage = 75
                Moi.coin = 8000
                Moi.speed = 1.2
                Moi.viewDistance = 10
                Mu.maxhealth = 4000000
                Mu.health = 4000000
                Mu.gems = G_RI(0,9)
                Mu.SI = Game.GetTime() + 1
                Mu.MK = LVM
            end
            Mu.limit = 250000
        end
    end
end

-- 區域計算
function Total_area(vu_MK,vu_B)

    if vu_MK == nil then return end

    if vu_MK == 1 or 2 then
        LVC[vu_MK] = LVC[vu_MK] - 1
        if LVC[vu_MK] ~= 10 then
            MNC(vu_MK)
        end
    end 
end