require("LightConfig")

local LightController = {}



-- Set all GPIO pins to low i.e turn off all lights
function LightController.initialSetup()
    local index, pin
    for index = 1, #PINS, 1 do
        pin = PINS[index]
        gpio.mode(pin, gpio.OUTPUT)
        gpio.write(pin, gpio.LOW)
    end
end


function LightController.handleLight(client, topic, data)
    local pin_no = tonumber(data)
    if pin_no ~= nil then
        if topic == LIGHT_ON then
            gpio.write(pin_no, gpio.HIGH)
        else
            gpio.write(pin_no, gpio.LOW)
        end
    end
end

return LightController
