component=require('component')
computer=require('computer')

modem = component.proxy(component.list('modem')())
modem.open(80)

while true do
  local evt, _, from, port, _, command = computer.pullSignal()





  --Used for OpenOS local useage (not remote) - here to remind how this shit works with ease 
  --[[
  local command = io.read()

  if not command then
    return
  end 
  ]]--


  if evt == 'modem_message' then
  


    code, reason = load(command) --loading the input as code
  
    if code then
      --modem.broadcast(port, "=success")
      result=table.pack(xpcall(code,debug.traceback))
      modem.broadcast(port, "=success")
    else
      xX = tostring(reason.."\n")
      modem.broadcast(port, xX)
    end



  end
end