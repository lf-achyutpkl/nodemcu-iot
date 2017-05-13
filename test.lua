WifiController = require("WifiController")
MqttClientController = require("MqttClientController")

PINS = {0, 1, 2, 3, 4, 5, 6, 7, 8}

-- Set all GPIO pins to low
local index, pin
for index = 1, #PINS, 1 do
    pin = PINS[index]
    gpio.mode(pin, gpio.OUTPUT)
    gpio.write(pin, gpio.LOW)
end


WifiController.start();


 wifi.eventmon.register(wifi.eventmon.STA_GOT_IP, 
    function()
        print("op: ", wifi.sta.getip())
        MqttClientController.initiatlizeClient()
    end
 )

 