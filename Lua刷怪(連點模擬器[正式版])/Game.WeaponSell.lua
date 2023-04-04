-- 自動販售武器的價格計算
function G_AutoSellWeapon(mw,player,pwp,map,wt,pos,wn)
    local wp
    local pu = player.user

    for i, prize in ipairs(mw) do
        if i > 2 then
            prize.chance = prize.chance / (player.user.lucky)
        end
    end

    if pu.autosellweapon == 1 then
        if map == 1 then
            if wn <= map_weapon.map1[3].value then
                player.coin = player.coin + wn
                AdviceATSW.value = player.index
            else
                if (pu.autosellweapon2 == 1 and wn == map_weapon.map1[4].value) or
                    (pu.autosellweapon3 == 1 and wn == map_weapon.map1[5].value) then
                    player.coin = player.coin + wn
                    if pu.autosellweapon2 == 1 then
                        AdviceATSW2.value = player.index
                    else
                        AdviceATSW3.value = player.index
                    end
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end

        elseif map == 2 then
            if wn <= map_weapon.map2[3].value then
                player.coin = player.coin + wn
                AdviceATSW.value = player.index
            else
                if (pu.autosellweapon2 == 1 and wn == map_weapon.map2[4].value) or
                    (pu.autosellweapon3 == 1 and wn == map_weapon.map2[5].value) then
                    player.coin = player.coin + wn
                    if pu.autosellweapon2 == 1 then
                        AdviceATSW2.value = player.index
                    else
                        AdviceATSW3.value = player.index
                    end
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end

        elseif map == 3 then
            if wn <= map_weapon.map3[3].value then
                player.coin = player.coin + wn
                AdviceATSW.value = player.index
            else
                if (pu.autosellweapon2 == 1 and wn == map_weapon.map3[4].value) or
                    (pu.autosellweapon3 == 1 and wn == map_weapon.map3[5].value) then
                    player.coin = player.coin + wn
                    if pu.autosellweapon2 == 1 then
                        AdviceATSW2.value = player.index
                    else
                        AdviceATSW3.value = player.index
                    end
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end

        elseif map == 4 then
            if wn <= map_weapon.map4[3].value then
                player.coin = player.coin + wn
                AdviceATSW.value = player.index
            else
                if (pu.autosellweapon2 == 1 and wn == map_weapon.map4[4].value) or
                    (pu.autosellweapon3 == 1 and wn == map_weapon.map4[5].value) then
                    player.coin = player.coin + wn
                    if pu.autosellweapon2 == 1 then
                        AdviceATSW2.value = player.index
                    else
                        AdviceATSW3.value = player.index
                    end
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end

        elseif map == 5 then
            if wn <= map_weapon.map5[3].value then
                player.coin = player.coin + wn
                AdviceATSW.value = player.index
            else
                if (pu.autosellweapon2 == 1 and wn == map_weapon.map5[4].value) or
                    (pu.autosellweapon3 == 1 and wn == map_weapon.map5[5].value) then
                    player.coin = player.coin + wn
                    if pu.autosellweapon2 == 1 then
                        AdviceATSW2.value = player.index
                    else
                        AdviceATSW3.value = player.index
                    end
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end

        elseif map == 6 then
            if wn <= map_weapon.map6[3].value then
                player.coin = player.coin + wn
                AdviceATSW.value = player.index
            else
                if (pu.autosellweapon2 == 1 and wn == map_weapon.map6[4].value) or
                    (pu.autosellweapon3 == 1 and wn == map_weapon.map6[5].value) then
                    player.coin = player.coin + wn
                    if pu.autosellweapon2 == 1 then
                        AdviceATSW2.value = player.index
                    else
                        AdviceATSW3.value = player.index
                    end
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end

        elseif map == 7 then
            if wn <= map_weapon.map7[3].value then
                player.coin = player.coin + wn
                AdviceATSW.value = player.index
            else
                if (pu.autosellweapon2 == 1 and wn == map_weapon.map7[4].value) or
                    (pu.autosellweapon3 == 1 and wn == map_weapon.map7[5].value) then
                    player.coin = player.coin + wn
                    if pu.autosellweapon2 == 1 then
                        AdviceATSW2.value = player.index
                    else
                        AdviceATSW3.value = player.index
                    end
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end

        elseif map == 8 then
            if wn <= map_weapon.map8[3].value then
                player.coin = player.coin + wn
                AdviceATSW.value = player.index
            else
                if (pu.autosellweapon2 == 1 and wn == map_weapon.map8[4].value) or
                    (pu.autosellweapon3 == 1 and wn == map_weapon.map8[5].value) then
                    player.coin = player.coin + wn
                    if pu.autosellweapon2 == 1 then
                        AdviceATSW2.value = player.index
                    else
                        AdviceATSW3.value = player.index
                    end
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end

        elseif map == 9 then
            if wn <= map_weapon.map9[3].value then
                pu.atm = pu.atm + math.ceil(wn/100000000)
                AdviceATSW.value = player.index
                CATM.value = player.index
                ATM.value = pu.atm
            else
                if (pu.autosellweapon2 == 1 and wn == map_weapon.map9[4].value) or
                    (pu.autosellweapon3 == 1 and wn == map_weapon.map9[5].value) then
                    pu.atm = pu.atm + math.ceil(wn/100000000)
                    if pu.autosellweapon2 == 1 then
                        AdviceATSW2.value = player.index
                    else
                        AdviceATSW3.value = player.index
                    end
                    CATM.value = player.index
                    ATM.value = pu.atm
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end

        elseif map == 10 then
            if wn <= map_weapon.map10[3].value then
                pu.atm = pu.atm + math.ceil(wn/100000000)
                AdviceATSW.value = player.index
                CATM.value = player.index
                ATM.value = pu.atm
            else
                if (pu.autosellweapon2 == 1 and wn == map_weapon.map10[4].value) or
                    (pu.autosellweapon3 == 1 and wn == map_weapon.map10[5].value) then
                    pu.atm = pu.atm + math.ceil(wn/100000000)
                    if pu.autosellweapon2 == 1 then
                        AdviceATSW2.value = player.index
                    else
                        AdviceATSW3.value = player.index
                    end
                    CATM.value = player.index
                    ATM.value = pu.atm
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end

        elseif map == 11 then
            if wn <= map_weapon.map11[3].value then
                pu.atm = pu.atm + math.ceil(wn/100000000)
                AdviceATSW.value = player.index
                CATM.value = player.index
                ATM.value = pu.atm
            else
                if (pu.autosellweapon2 == 1 and wn == map_weapon.map11[4].value) or
                    (pu.autosellweapon3 == 1 and wn == map_weapon.map11[5].value) then
                    pu.atm = pu.atm + math.ceil(wn/100000000)
                    if pu.autosellweapon2 == 1 then
                        AdviceATSW2.value = player.index
                    else
                        AdviceATSW3.value = player.index
                    end
                    CATM.value = player.index
                    ATM.value = pu.atm
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end

        elseif map == 12 then
            if wn <= map_weapon.map12[3].value then
                pu.atm = pu.atm + math.ceil(wn/100000000)
                AdviceATSW.value = player.index
                CATM.value = player.index
                ATM.value = pu.atm
            else
                if (pu.autosellweapon2 == 1 and wn == map_weapon.map12[4].value) or
                    (pu.autosellweapon3 == 1 and wn == map_weapon.map12[5].value) then
                    pu.atm = pu.atm + math.ceil(wn/100000000)
                    if pu.autosellweapon2 == 1 then
                        AdviceATSW2.value = player.index
                    else
                        AdviceATSW3.value = player.index
                    end
                    CATM.value = player.index
                    ATM.value = pu.atm
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end

        elseif map == 13 then
            if wn <= map_weapon.map13[3].valu then
                pu.atm = pu.atm + math.ceil(wn/100000000)
                AdviceATSW.value = player.index
                CATM.value = player.index
                ATM.value = pu.atm
            else
                if (pu.autosellweapon2 == 1 and wn == map_weapon.map13[4].value) or
                    (pu.autosellweapon3 == 1 and wn == map_weapon.map13[5].value) then
                    pu.atm = pu.atm + math.ceil(wn/100000000)
                    if pu.autosellweapon2 == 1 then
                        AdviceATSW2.value = player.index
                    else
                        AdviceATSW3.value = player.index
                    end
                    CATM.value = player.index
                    ATM.value = pu.atm
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end

        elseif map == 14 then
            if wn <= map_weapon.map14[3].value then
                pu.atm = pu.atm + math.ceil(wn/100000000)
                AdviceATSW.value = player.index
                CATM.value = player.index
                ATM.value = pu.atm
            else
                if (pu.autosellweapon2 == 1 and wn == map_weapon.map14[4].value) or
                    (pu.autosellweapon3 == 1 and wn == map_weapon.map14[5].value) then
                    pu.atm = pu.atm + math.ceil(wn/100000000)
                    if pu.autosellweapon2 == 1 then
                        AdviceATSW2.value = player.index
                    else
                        AdviceATSW3.value = player.index
                    end
                    CATM.value = player.index
                    ATM.value = pu.atm
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end

        elseif map == 15 then
            if wn <= map_weapon.map15[3].value then
                pu.atm = pu.atm + math.ceil(wn/100000000)
                AdviceATSW.value = player.index
                CATM.value = player.index
                ATM.value = pu.atm
            else
                if (pu.autosellweapon2 == 1 and wn == map_weapon.map15[4].value) or
                    (pu.autosellweapon3 == 1 and wn == map_weapon.map15[5].value) then
                    pu.atm = pu.atm + math.ceil(wn/100000000)
                    if pu.autosellweapon2 == 1 then
                        AdviceATSW2.value = player.index
                    else
                        AdviceATSW3.value = player.index
                    end
                    CATM.value = player.index
                    ATM.value = pu.atm
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end

        elseif map == 16 then
            if wn <= map_weapon.map16[3].value then
                pu.atm = pu.atm + math.ceil(wn/100000000)
                AdviceATSW.value = player.index
                CATM.value = player.index
                ATM.value = pu.atm
            else
                if (pu.autosellweapon2 == 1 and wn == map_weapon.map16[4].value) or
                    (pu.autosellweapon3 == 1 and wn == map_weapon.map16[5].value) then
                    pu.atm = pu.atm + math.ceil(wn/100000000)
                    if pu.autosellweapon2 == 1 then
                        AdviceATSW2.value = player.index
                    else
                        AdviceATSW3.value = player.index
                    end
                    CATM.value = player.index
                    ATM.value = pu.atm
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end

        elseif map == 1001 then
            if wn <= map_weapon.map1001[3].value then
                pu.atm = pu.atm + math.ceil(wn/100000000)
                AdviceATSW.value = player.index
                CATM.value = player.index
                ATM.value = pu.atm
            else
                if (pu.autosellweapon2 == 1 and wn == map_weapon.map1001[4].value) or
                    (pu.autosellweapon3 == 1 and wn == map_weapon.map1001[5].value) then
                    pu.atm = pu.atm + math.ceil(wn/100000000)
                    if pu.autosellweapon2 == 1 then
                        AdviceATSW2.value = player.index
                    else
                        AdviceATSW3.value = player.index
                    end
                    CATM.value = player.index
                    ATM.value = pu.atm
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end
        end

    elseif pu.autosellweapon2 == 1 then
        if map == 1 then
            if wn == map_weapon.map1[4].value then
                player.coin = player.coin + wn
                AdviceATSW2.value = player.index
            else
                if pu.autosellweapon3 == 1 then
                    if wn == map_weapon.map1[5].value then
                        player.coin = player.coin + wn
                        AdviceATSW3.value = player.index
                    else
                        wp = G_DBWP(player,pwp,map,wt,pos,wn)
                        return wp
                    end
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end

        elseif map == 2 then
            if wn == map_weapon.map2[4].value then
                player.coin = player.coin + wn
                AdviceATSW2.value = player.index
            else
                if pu.autosellweapon3 == 1 then
                    if wn == map_weapon.map2[5].value then
                        player.coin = player.coin + wn
                        AdviceATSW3.value = player.index
                    else
                        wp = G_DBWP(player,pwp,map,wt,pos,wn)
                        return wp
                    end
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end

        elseif map == 3 then
            if wn == map_weapon.map3[4].value then
                player.coin = player.coin + wn
                AdviceATSW2.value = player.index
            else
                if pu.autosellweapon3 == 1 then
                    if wn == map_weapon.map3[5].value then
                        player.coin = player.coin + wn
                        AdviceATSW3.value = player.index
                    else
                        wp = G_DBWP(player,pwp,map,wt,pos,wn)
                        return wp
                    end
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end

        elseif map == 4 then
            if wn == map_weapon.map4[4].value then
                player.coin = player.coin + wn
                AdviceATSW2.value = player.index
            else
                if pu.autosellweapon3 == 1 then
                    if wn == map_weapon.map4[5].value then
                        player.coin = player.coin + wn
                        AdviceATSW3.value = player.index
                    else
                        wp = G_DBWP(player,pwp,map,wt,pos,wn)
                        return wp
                    end
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end

        elseif map == 5 then
            if wn == map_weapon.map5[4].value then
                player.coin = player.coin + wn
                AdviceATSW2.value = player.index
            else
                if pu.autosellweapon3 == 1 then
                    if wn == map_weapon.map5[5].value then
                        player.coin = player.coin + wn
                        AdviceATSW3.value = player.index
                    else
                        wp = G_DBWP(player,pwp,map,wt,pos,wn)
                        return wp
                    end
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end

        elseif map == 6 then
            if wn == map_weapon.map6[4].value then
                player.coin = player.coin + wn
                AdviceATSW2.value = player.index
            else
                if pu.autosellweapon3 == 1 then
                    if wn == map_weapon.map6[5].value then
                        player.coin = player.coin + wn
                        AdviceATSW3.value = player.index
                    else
                        wp = G_DBWP(player,pwp,map,wt,pos,wn)
                        return wp
                    end
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end

        elseif map == 7 then
            if wn == map_weapon.map7[4].value then
                player.coin = player.coin + wn
                AdviceATSW2.value = player.index
            else
                if pu.autosellweapon3 == 1 then
                    if wn == map_weapon.map7[5].value then
                        player.coin = player.coin + wn
                        AdviceATSW3.value = player.index
                    else
                        wp = G_DBWP(player,pwp,map,wt,pos,wn)
                        return wp
                    end
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end

        elseif map == 8 then
            if wn == map_weapon.map8[4].value then
                player.coin = player.coin + wn
                AdviceATSW2.value = player.index
            else
                if pu.autosellweapon3 == 1 then
                    if wn == map_weapon.map8[5].value then
                        player.coin = player.coin + wn
                        AdviceATSW3.value = player.index
                    else
                        wp = G_DBWP(player,pwp,map,wt,pos,wn)
                        return wp
                    end
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end

        elseif map == 9 then
            if wn == map_weapon.map9[4].value then
                pu.atm = pu.atm + math.ceil(wn/100000000)
                AdviceATSW2.value = player.index
                CATM.value = player.index
                ATM.value = pu.atm
            else
                if pu.autosellweapon3 == 1 then
                    if wn == map_weapon.map9[5].value then
                        pu.atm = pu.atm + math.ceil(wn/100000000)
                        AdviceATSW3.value = player.index
                        CATM.value = player.index
                        ATM.value = pu.atm
                    else
                        wp = G_DBWP(player,pwp,map,wt,pos,wn)
                        return wp
                    end
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end

        elseif map == 10 then
            if wn == map_weapon.map10[4].value then
                pu.atm = pu.atm + math.ceil(wn/100000000)
                AdviceATSW2.value = player.index
                CATM.value = player.index
                ATM.value = pu.atm
            else
                if pu.autosellweapon3 == 1 then
                    if wn == map_weapon.map10[5].value then
                        pu.atm = pu.atm + math.ceil(wn/100000000)
                        AdviceATSW3.value = player.index
                        CATM.value = player.index
                        ATM.value = pu.atm
                    else
                        wp = G_DBWP(player,pwp,map,wt,pos,wn)
                        return wp
                    end
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end

        elseif map == 11 then
            if wn == map_weapon.map11[4].value then
                pu.atm = pu.atm + math.ceil(wn/100000000)
                AdviceATSW2.value = player.index
                CATM.value = player.index
                ATM.value = pu.atm
            else
                if pu.autosellweapon3 == 1 then
                    if wn == map_weapon.map11[5].value then
                        pu.atm = pu.atm + math.ceil(wn/100000000)
                        AdviceATSW3.value = player.index
                        CATM.value = player.index
                        ATM.value = pu.atm
                    else
                        wp = G_DBWP(player,pwp,map,wt,pos,wn)
                        return wp
                    end
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end

        elseif map == 12 then
            if wn == map_weapon.map12[4].value then
                pu.atm = pu.atm + math.ceil(wn/100000000)
                AdviceATSW2.value = player.index
                CATM.value = player.index
                ATM.value = pu.atm
            else
                if pu.autosellweapon3 == 1 then
                    if wn == map_weapon.map12[5].value then
                        pu.atm = pu.atm + math.ceil(wn/100000000)
                        AdviceATSW3.value = player.index
                        CATM.value = player.index
                        ATM.value = pu.atm
                    else
                        wp = G_DBWP(player,pwp,map,wt,pos,wn)
                        return wp
                    end
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end

        elseif map == 13 then
            if wn == map_weapon.map13[4].value then
                pu.atm = pu.atm + math.ceil(wn/100000000)
                AdviceATSW2.value = player.index
                CATM.value = player.index
                ATM.value = pu.atm
            else
                if pu.autosellweapon3 == 1 then
                    if wn == map_weapon.map13[5].value then
                        pu.atm = pu.atm + math.ceil(wn/100000000)
                        AdviceATSW3.value = player.index
                        CATM.value = player.index
                        ATM.value = pu.atm
                    else
                        wp = G_DBWP(player,pwp,map,wt,pos,wn)
                        return wp
                    end
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end

        elseif map == 14 then
            if wn == map_weapon.map14[4].value then
                pu.atm = pu.atm + math.ceil(wn/100000000)
                AdviceATSW2.value = player.index
                CATM.value = player.index
                ATM.value = pu.atm
            else
                if pu.autosellweapon3 == 1 then
                    if wn == map_weapon.map14[5].value then
                        pu.atm = pu.atm + math.ceil(wn/100000000)
                        AdviceATSW3.value = player.index
                        CATM.value = player.index
                        ATM.value = pu.atm
                    else
                        wp = G_DBWP(player,pwp,map,wt,pos,wn)
                        return wp
                    end
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end

        elseif map == 15 then
            if wn == map_weapon.map15[4].value then
                pu.atm = pu.atm + math.ceil(wn/100000000)
                AdviceATSW2.value = player.index
                CATM.value = player.index
                ATM.value = pu.atm
            else
                if pu.autosellweapon3 == 1 then
                    if wn == map_weapon.map15[5].value then
                        pu.atm = pu.atm + math.ceil(wn/100000000)
                        AdviceATSW3.value = player.index
                        CATM.value = player.index
                        ATM.value = pu.atm
                    else
                        wp = G_DBWP(player,pwp,map,wt,pos,wn)
                        return wp
                    end
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end

        elseif map == 16 then
            if wn == map_weapon.map16[4].value then
                pu.atm = pu.atm + math.ceil(wn/100000000)
                AdviceATSW2.value = player.index
                CATM.value = player.index
                ATM.value = pu.atm
            else
                if pu.autosellweapon3 == 1 then
                    if wn == map_weapon.map16[5].value then
                        pu.atm = pu.atm + math.ceil(wn/100000000)
                        AdviceATSW3.value = player.index
                        CATM.value = player.index
                        ATM.value = pu.atm
                    else
                        wp = G_DBWP(player,pwp,map,wt,pos,wn)
                        return wp
                    end
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end

        elseif map == 1001 then
            if wn == map_weapon.map1001[4].value then
                pu.atm = pu.atm + math.ceil(wn/100000000)
                AdviceATSW2.value = player.index
                CATM.value = player.index
                ATM.value = pu.atm
            else
                if pu.autosellweapon3 == 1 then
                    if wn == map_weapon.map1001[5].value then
                        pu.atm = pu.atm + math.ceil(wn/100000000)
                        AdviceATSW3.value = player.index
                        CATM.value = player.index
                        ATM.value = pu.atm
                    else
                        wp = G_DBWP(player,pwp,map,wt,pos,wn)
                        return wp
                    end
                else
                    wp = G_DBWP(player,pwp,map,wt,pos,wn)
                    return wp
                end
            end
        end
    
    elseif pu.autosellweapon3 == 3 then
        if map == 1 then
            if wn == map_weapon.map1[5].value then
                player.coin = player.coin + wn
                AdviceATSW3.value = player.index
            else
                wp = G_DBWP(player,pwp,map,wt,pos,wn)
                return wp
            end

        elseif map == 2 then
            if wn == map_weapon.map2[5].value then
                player.coin = player.coin + wn
                AdviceATSW3.value = player.index
            else
                wp = G_DBWP(player,pwp,map,wt,pos,wn)
                return wp
            end

        elseif map == 3 then
            if wn == map_weapon.map3[5].value then
                player.coin = player.coin + wn
                AdviceATSW3.value = player.index
            else
                wp = G_DBWP(player,pwp,map,wt,pos,wn)
                return wp
            end

        elseif map == 4 then
            if wn == map_weapon.map4[5].value then
                player.coin = player.coin + wn
                AdviceATSW3.value = player.index
            else
                wp = G_DBWP(player,pwp,map,wt,pos,wn)
                return wp
            end

        elseif map == 5 then
            if wn == map_weapon.map5[5].value then
                player.coin = player.coin + wn
                AdviceATSW3.value = player.index
            else
                wp = G_DBWP(player,pwp,map,wt,pos,wn)
                return wp
            end

        elseif map == 6 then
            if wn == map_weapon.map6[5].value then
                player.coin = player.coin + wn
                AdviceATSW3.value = player.index
            else
                wp = G_DBWP(player,pwp,map,wt,pos,wn)
                return wp
            end

        elseif map == 7 then
            if wn == map_weapon.map7[5].value then
                player.coin = player.coin + wn
                AdviceATSW3.value = player.index
            else
                wp = G_DBWP(player,pwp,map,wt,pos,wn)
                return wp
            end

        elseif map == 8 then
            if wn == map_weapon.map8[5].value then
                player.coin = player.coin + wn
                AdviceATSW3.value = player.index
            else
                wp = G_DBWP(player,pwp,map,wt,pos,wn)
                return wp
            end

        elseif map == 9 then
            if wn == map_weapon.map9[5].value then
                pu.atm = pu.atm + math.ceil(wn/100000000)
                AdviceATSW3.value = player.index
                CATM.value = player.index
                ATM.value = pu.atm
            else
                wp = G_DBWP(player,pwp,map,wt,pos,wn)
                return wp
            end

        elseif map == 10 then
            if wn == map_weapon.map10[5].value then
                pu.atm = pu.atm + math.ceil(wn/100000000)
                AdviceATSW3.value = player.index
                CATM.value = player.index
                ATM.value = pu.atm
            else
                wp = G_DBWP(player,pwp,map,wt,pos,wn)
                return wp
            end

        elseif map == 11 then
            if wn == map_weapon.map11[5].value then
                pu.atm = pu.atm + math.ceil(wn/100000000)
                AdviceATSW3.value = player.index
                CATM.value = player.index
                ATM.value = pu.atm
            else
                wp = G_DBWP(player,pwp,map,wt,pos,wn)
                return wp
            end

        elseif map == 12 then
            if wn == map_weapon.map12[5].value then
                pu.atm = pu.atm + math.ceil(wn/100000000)
                AdviceATSW3.value = player.index
                CATM.value = player.index
                ATM.value = pu.atm
            else
                wp = G_DBWP(player,pwp,map,wt,pos,wn)
                return wp
            end

        elseif map == 13 then
            if wn == map_weapon.map13[5].value then
                pu.atm = pu.atm + math.ceil(wn/100000000)
                AdviceATSW3.value = player.index
                CATM.value = player.index
                ATM.value = pu.atm
            else
                wp = G_DBWP(player,pwp,map,wt,pos,wn)
                return wp
            end

        elseif map == 14 then
            if wn == map_weapon.map14[5].value then
                pu.atm = pu.atm + math.ceil(wn/100000000)
                AdviceATSW3.value = player.index
                CATM.value = player.index
                ATM.value = pu.atm
            else
                wp = G_DBWP(player,pwp,map,wt,pos,wn)
                return wp
            end

        elseif map == 15 then
            if wn == map_weapon.map15[5].value then
                pu.atm = pu.atm + math.ceil(wn/100000000)
                AdviceATSW3.value = player.index
                CATM.value = player.index
                ATM.value = pu.atm
            else
                wp = G_DBWP(player,pwp,map,wt,pos,wn)
                return wp
            end

        elseif map == 16 then
            if wn == map_weapon.map16[5].value then
                pu.atm = pu.atm + math.ceil(wn/100000000)
                AdviceATSW3.value = player.index
                CATM.value = player.index
                ATM.value = pu.atm
            else
                wp = G_DBWP(player,pwp,map,wt,pos,wn)
                return wp
            end

        elseif map == 1001 then
            if wn == map_weapon.map1001[5].value then
                pu.atm = pu.atm + math.ceil(wn/100000000)
                AdviceATSW3.value = player.index
                CATM.value = player.index
                ATM.value = pu.atm
            else
                wp = G_DBWP(player,pwp,map,wt,pos,wn)
                return wp
            end
        end

    else
        wp = G_DBWP(player,pwp,map,wt,pos,wn)
        return wp
    end
end