local playerSpeed = {}

-- Returns the player's speed sync variable.
function SpeedMeter:GetPlayerVariable(index)
    return playerSpeed[index]
end

-- Sets the player's speed sync variable.
function SpeedMeter:SetPlayerVariable(index,value)
    playerSpeed[index] = value
    self:printdbg(string.format("[Game] SetSpeedVar(%s)(%s)",index,value))
end

-- Create a new sync variable.
function SpeedMeter:CreatePlayerVariable(player)
    if player == nil then return end

    local index = player.index
    local playerID = ClientID:GetID(index)
    local currentVar = self:GetPlayerVariable(index)
    
    if playerID ~= nil then
        local varName = string.format(self.SYNCVAR.SPEED,playerID)

        if currentVar == nil or currentVar.name ~= varName then
            self:SetPlayerVariable(index,G_SV_C(varName))
            self:printdbg(string.format("[Game] (%s) => (%s)",playerSpeed[index].name ,index))
            self:printdbg(string.format("[Game] playerSpeed(%s).",tostring(self:GetPlayerVariable(index))))
        end
    end
end

-- Returns the player's speed.
function SpeedMeter:GetPlayerSpeed(index)
    local syncvar = self:GetPlayerVariable(index)
    return syncvar == nil and nil or syncvar.value
end

-- Gets a player object by player's index.
function SpeedMeter:GetPlayerByIndex(index)
    player = nil
    player = Game.Player.Create(index)
    return player
end

-- Checks whether the player is alive.
function SpeedMeter:IsPlayerAlive(player)
    return player ~= nil and player.health > 0
end

-- Gets the length of a Vector table.
function SpeedMeter:VectorLength(table)
    x,y,z = table.x,table.y,table.z
    return math.sqrt(x * x + y * y)
end

function SpeedMeter:OnUpdate(time)
    ClientID:OnUpdate(time)

    for i = 1,32 do
        self:CreatePlayerVariable(self:GetPlayerByIndex(i))
    end

    for k,v in ipairs(playerSpeed) do
        local player = self:GetPlayerByIndex(k)
        if self:IsPlayerAlive(player) then
            v.value = self:VectorLength(player.velocity)
        end
    end
end

function G.R:OnUpdate(time)
    SpeedMeter:OnUpdate(time)
end