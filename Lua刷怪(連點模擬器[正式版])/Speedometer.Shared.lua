SpeedMeter = {}
SpeedMeter.LABEL = {}
SpeedMeter.LABEL.CONFIG = {}

-- Game & UI Debug.
SpeedMeter.DEBUG_ENABLED = false

-- Speedometer label text format.
SpeedMeter.LABEL.PLAYERSPEED = "地速:%.2f"

-- Speedometer SyncVar
SpeedMeter.SYNCVAR = {
    SPEED = "SOM.Player.%i",
    CURRENT_TIME = ClientID.SYNCVAR.CURRENT_TIME
}

-- Prints debug msg.
function SpeedMeter:printdbg(msg)
    if self.DEBUG_ENABLED then
        print(msg)
    end
end