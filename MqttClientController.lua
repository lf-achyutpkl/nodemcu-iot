require("MqttConfig")

local MqttClientController = {}

local function subscribe(mqttClient)
   mqttClient:subscribe(LIGHT_ON, 0, function(client) print("subscribed to topic light on!") end) 
   mqttClient:subscribe(LIGHT_OFF, 0, function(client) print("subscribed to topic light off!") end) 

   mqttClient:publish(LIGHT_ON,'4', 0, 1, function(client) print("published to light off") end)
end

local function onMessageReceived(client, topic, data)
    print('data: ', data)
    print('topic: ', topic)
    local pin_no = tonumber(data)
    if pin_no ~= nil then
        if topic == LIGHT_ON then
            print('on topic ma chu ma')
            gpio.write(pin_no, gpio.HIGH)
        else
            gpio.write(pin_no, gpio.LOW)
        end
    end
    
end

function MqttClientController.initiatlizeClient()

    m = mqtt.Client("clientId-PSSJPxIdLn",3600, "achyut", "achyut")

  
    m:on("connect", function(client) print("connected") end)
    m:on("offline", function(client) print ("offline") end)

    m:on("message", function(client, topic, data) 
        print("yeha samma ta ayo")
      onMessageReceived(client, topic, data)

    end)

    m:connect("192.168.0.107", 1883, 0, function(client) subscribe(m) end, 
                                         function(client, reason) print("failed reason: "..reason) end) 

end



return MqttClientController
