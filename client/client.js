let mqtt = require('mqtt')
 
let client = mqtt.connect('mqtt://localhost');
 

client.on('connect', function () {
  client.subscribe('node-01/light/on')
  client.publish('node-01/light/on', '4')
	console.log("la la")
})

 
client.on('message', function (topic, message) {
  // message is Buffer 
  console.log(message.toString())
  // client.end()
})
