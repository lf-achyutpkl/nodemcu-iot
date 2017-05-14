WifiController = require("WifiController")
LightController = require("LightController")
MqttClientController = require("MqttClientController")


wifi.eventmon.register(wifi.eventmon.STA_GOT_IP, 
    function()
        print("Connected to wifi!!")
        MqttClientController.initiatlizeClient(LightController.handleLight)
    end
)


WifiController.start()
LightController.initialSetup()

 