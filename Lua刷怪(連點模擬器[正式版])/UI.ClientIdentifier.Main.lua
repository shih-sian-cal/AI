local playerID = nil
local isVerified = false
local doVerify = false
local verifyDelay = nil
local syncvar_verify = U_SV_C(ClientID.SYNCVAR.VERIFY)
local syncvar_current_time = U_SV_C(ClientID.SYNCVAR.CURRENT_TIME)

-- Returns current game time.
function ClientID:GetGameTime()
    return syncvar_current_time.value
end

-- Returns my unique identity.
function ClientID:GetID()
    return playerID
end

-- Checks whether my unique ID is verified.
function ClientID:IsVerified()
    return isVerified
end

-- Checks whether the ID verification has started.
function ClientID:IsVerificationStarted()
    return doVerify
end

-- Verify my player ID.
function ClientID:StartVerification()
    -- Stop the old verification first.
    if self:IsVerificationStarted() then
        self:StopVerification()
    end

    isVerified = false
    doVerify = true
    verifyDelay = self:GetGameTime() + self.VERIFY_DELAY
    UI.Signal(self.SIGNAL.VERIFY)
    self:printdbg("[UI] ID verification is started.")
end

-- Stop the ID verification.
function ClientID:StopVerification()
    if self:IsVerificationStarted() == false then return end
    doVerify = false
    self:printdbg("[UI] ID verification is halted.")
end

-- Assigns my player ID.
function ClientID:Assign(time)
    if self:IsVerified() then return end
    if self:IsVerificationStarted() then return end
    if time == nil then return end

    local screenSize = UI.ScreenSize()
    local int_time = math.ceil(time + math.random(screenSize.height,screenSize.width))
    self:printdbg(string.format("[UI] int_time (%i).",int_time ))

    -- This is my ID.
    playerID = int_time

    -- Sends "OK" signal.
    local signal = self.SIGNAL.OK + self:GetID()
    UI.Signal(signal)

    self:printdbg( string.format("[UI] playerID(%i).",self:GetID()))

    -- Verify this ID.
    self:StartVerification()
end

function ClientID:CurrentTime_OnSync()
    local value = self:GetGameTime()

    if value ~= nil then
        self:Assign(value)
    end
end

function ClientID:Verify_OnSync()
    local currentTime = self:GetGameTime()
    if verifyDelay ~= nil and currentTime ~= nil and verifyDelay <= currentTime then
        local value = syncvar_verify.value
        if doVerify and value ~= nil then
            isVerified = (value == self:GetID())

            if self:IsVerified() then
                self:printdbg("[UI] My ID is Verified.")
            else
                self:printdbg("[UI] My ID is NOT Verified.")
            end
        end
        self:StopVerification()
    end
end

function syncvar_current_time:OnSync()
    ClientID:CurrentTime_OnSync()
end
function syncvar_verify:OnSync()
    ClientID:Verify_OnSync()
end