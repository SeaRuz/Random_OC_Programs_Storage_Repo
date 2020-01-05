senders = {}
recievers = {}
ports = {8080}

computer=require("computer")
component=require("component")
ncard=component.proxy(component.list("modem")()) or nil
if not ncard then computer.shutdown(true) end
for i=1,#ports do ncard.open(ports[i]) end

function processMessage(_, _, from, port, _,...)
  for i=1,#senders do
    if senders[i]==from then
      for ii=1,#recievers do
        for iii=1,#ports do
          ncard.send(from,ports[iii],...)
        end
      end
    end
  end
end

while true do
  processMessage(computer.pullSignal())
end
