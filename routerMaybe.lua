senders = {}
recievers = {}
ncard=component.proxy(component.list("gpu")()) or nil
if not ncard then computer.shutdown(true) end
function processMessage(_, _, from, port, _,...)
  for i=1,#senders do
    if senders[i]==from then
      for ii=1,#recievers do
        ncard.send(from,port,...)
      end
    end
  end
end

while true do
  processMessage(computer.pullSignal())
end
