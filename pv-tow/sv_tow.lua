AddEventHandler('chatMessage', function(source, n, message)
    command = stringsplit(message, " ")

    if(command[1] == "/tow") then
		CancelEvent()
		TriggerClientEvent("pv:tow", source)
	
	elseif (command[1] == "/cargo") then
		CancelEvent()
        TriggerClientEvent("cargo", source)
    elseif (command[1] == "/hunt") then
		CancelEvent()
		TriggerClientEvent("hunt", source)    
	end
end)

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end