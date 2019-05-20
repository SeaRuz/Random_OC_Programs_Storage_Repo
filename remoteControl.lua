component = require('component')
event = require('event')

modem = component.proxy(component.list('modem')())

modem.open(80)

while true do



io.write('send>')
x = io.read()

if not x then
  return
end

modem.broadcast(80, tostring(x))

local _, _, from, port, dist, msg = event.pull('modem_message')
print(msg)

end