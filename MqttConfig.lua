NODE = "node-01"

-- Client constants
KEEP_ALIVE = 3600
MQTT_PASSWORD = ""
MQTT_USER_NAME = ""
MQTT_CLIENT_ID = ""

-- Connection constants
MQTT_BROKER_HOST = "192.168.0.107"
MQTT_BROKER_PORT = 1883
IS_SECURE = 0
AUTO_RECONNECT = 1

-- Topic constants
LIGHT_ON = NODE.."/light/on"
LIGHT_OFF = NODE.."/light/off"

-- Subscription constants
QOS_LEVEL = 0
