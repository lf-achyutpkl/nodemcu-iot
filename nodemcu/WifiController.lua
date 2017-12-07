WifiConfig = require ("WifiConfig")

local WifiController = {}
local station_cfg = {auto = true}

-- Check if available APs are present on our config file or not
-- if present then try to connect
local function initiateConnection(list_aps)
    if list_aps then
        for key, value in pairs(list_aps) do
            if WifiConfig[key] then
                station_cfg.ssid = key
                station_cfg.pwd = WifiConfig[key]
                wifi.sta.config(station_cfg)
                print("Connecting to " ..key .. "...")
            end
        end
    else
        print("No access point available currently!")
    end
end


-- Start wifi service
function WifiController.start()
    print("Starting Wifi...")
    wifi.setmode(wifi.STATION)
    wifi.sta.getap(initiateConnection)
end

return WifiController
