require("MqttConfig")

local MqttClientController = {}

local function subscribe(mqttClient)
   mqttClient:subscribe(LIGHT_ON, 0, function(client) print("subscribed to topic light on!") end) 
   mqttClient:subscribe(LIGHT_OFF, 0, function(client) print("subscribed to topic light off!") end) 

   mqttClient:publish(LIGHT_ON,'4', 0, 1, function(client) print("published to light on") end)
end


function MqttClientController.initiatlizeClient(handleLight)

    m = mqtt.Client(MQTT_CLIENT_ID, KEEP_ALIVE, MQTT_USER_NAME, MQTT_PASSWORD)

  
    m:on("connect", function(client) print("Connected to broker") subscribe(m) end)
    m:on("offline", function(client) print ("offline") end)

    m:on("message",  function(client, topic, data)
      handleLight(client, topic, data)
    end)

    m:connect(MQTT_BROKER_HOST, MQTT_BROKER_PORT, IS_SECURE, function(client) subscribe(m) end, 
                                         function(client, reason) print("failed reason: "..reason) end) 

end


return MqttClientController
