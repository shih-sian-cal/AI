local playerSpeed = nil
local syncvar_current_time = U_SV_C(SpeedMeter.SYNCVAR.CURRENT_TIME)
local label = U.T.Create()
label = U_TB(1,'','small','center',0.49,0.915,0.5,0.1,255,255,255,255)
label:Hide()

-- Returns the player's speed.
function SpeedMeter:GetPlayerSpeed()
    return playerSpeed == nil and nil or playerSpeed.value
end

-- Creates the player's unique speed sync variable.
function SpeedMeter:CreatePlayerVariable()
    if ClientID:IsVerified() == false then return end

    local playerID = ClientID:GetID()
    if playerID ~= nil then
        playerSpeed = U_SV_C(string.format(self.SYNCVAR.SPEED,playerID))
        self:printdbg(string.format("[UI] %s is created.",playerSpeed.name))
        
        function playerSpeed:OnSync()
            SpeedMeter:UpdateHUD()
        end
    end
end

-- Updates the player's speed HUD.
function SpeedMeter:UpdateHUD()
    local value = self:GetPlayerSpeed()
    if value == nil then value = -1 end
    if value >= 0 then label:Set({r = 255,g = 255,b = 255})end
    if value >= 200 then label:Set({r = 130,g = 255,b = 40}) end
    if value >= 260 then label:Set({r = 255,g = 140,b = 40}) end
    if value >= 270 then label:Set({r = 255,g = 40,b = 40}) end
    if value >= 300 then label:Set({r = 218,g = 50,b = 214}) end
    UI.Signal(10010)
    label:Set({text = string.format(self.LABEL.PLAYERSPEED,value)})
    label:Show()
end

function SpeedMeter:CurrentTime_OnSync()
    if playerSpeed == nil then self:CreatePlayerVariable() end
end

function syncvar_current_time:OnSync()
    ClientID:CurrentTime_OnSync()
    SpeedMeter:CurrentTime_OnSync()
end