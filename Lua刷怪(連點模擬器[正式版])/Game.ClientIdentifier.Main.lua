local playerID = {}
local verify_id = nil
local syncvar_get = G_SV_C(ClientID.SYNCVAR.GET)
local syncvar_get_all = G_SV_C(ClientID.SYNCVAR.GET_ALL)
local syncvar_verify = G_SV_C(ClientID.SYNCVAR.VERIFY)
local syncvar_current_time = G_SV_C( ClientID.SYNCVAR.CURRENT_TIME)
syncvar_current_time.value = -1

-- Returns the player's unique identity.
function ClientID:GetID(index)
    return playerID[index]
end

-- Sets the player's unique identity.
function ClientID:SetID(index,value)
    playerID[index] = value
    self:printdbg(string.format("[Game] SetID(%s)(%s).",index,value))
end

function ClientID:OnPlayerSignal(player,signal)
    local index = player.index

    if signal == self.SIGNAL.GET then
        -- Receives "GET" signal.
        self:printdbg("[Game] Received ClientID.GET signal.")
        syncvar_get.value = self:GetID(index)
        self:printdbg("[Game] Return:".. tostring(syncvar_get.value))
    elseif signal == self.SIGNAL.GET_ALL then
        -- Receives "GET_ALL" signal.
        self:printdbg("[Game] Received ClientID.GET_ALL signal.")
        syncvar_get_all.value = tostring(table.concat(playerID,"\n"))
    elseif signal == self.SIGNAL.VERIFY then
        -- Receives "VERIFY" signal.
        self:printdbg("[Game] Received ClientID.VERIFY signal.")
        verify_id = self:GetID(index)
    else
        local newPlrID = signal - self.SIGNAL.OK
        if newPlrID > 0 then
            -- Received "OK" signal.
            self:printdbg("[Game] Received ClientID.OK signal.")
            self:printdbg(string.format("[Game] (%i) => ID(%i).",index , newPlrID))

            for _,v in pairs(playerID) do
                if v == newPlrID then
                    self:printdbg("[Game] ID is exists, cancel...")
                    return
                end
            end

            self:SetID(index,newPlrID);
            self:printdbg(string.format("[Game] playerID(%s).",tostring(self:GetID(index))))
        end
    end
end

function ClientID:OnUpdate(time)
    syncvar_current_time.value = time
    syncvar_verify.value = verify_id
end