ClientID = {}

-- Game & UI debug mode.
ClientID.DEBUG_ENABLED = false

-- ClientID verification delay.
ClientID.VERIFY_DELAY = 1.5

-- Client ID signals
ClientID.SIGNAL = {
    OK = 417994124,
    GET = 13371337,
    GET_ALL = 31733173,
    VERIFY = 13377331
}

-- Client ID SyncVar
ClientID.SYNCVAR = {
    GET = "ClientIdentifier.Get",
    GET_ALL = "ClientIdentifier.GetAll",
    CURRENT_TIME = "ClientIdentifier.CurrentTime",
    VERIFY = "ClientIdentifier.Verify"
}

-- Prints debug msg.
function ClientID:printdbg(msg)
    if self.DEBUG_ENABLED then
        print(msg)
    end
end