let mqtt = require('mqtt')
 
let client = mqtt.connect('mqtt://192.168.0.105');
 

client.on('connect', function () {
  console.log('Client started...');
  client.subscribe('blink')
})
 
client.on('message', function (topic, message) {
  // message is Buffer 
  console.log(message.toString())
  // client.end()
})

