-- Server-side FiveM script for /id command

AddEventHandler('chatMessage', function(source, name, message)
    if message:sub(1, 3) == '/id' then
        local playerCoords = GetEntityCoords(GetPlayerPed(source))
        local players = GetPlayers()

        for _, playerId in ipairs(players) do
            local targetCoords = GetEntityCoords(GetPlayerPed(playerId))
            local distance = #(playerCoords - targetCoords)

            if distance <= 20.0 then -- Change 20 to your liking, this is in metres, you can also just get rid of the if and just add it to the main if at the top if you want it to be global :)
                local additionalText = message:sub(4)
                local serverIdText = "^4[" .. source .. "]"
                local finalMessage = string.format("^4%s ^7%s ^7shows ID: ^7%s", name, serverIdText, additionalText)

                TriggerClientEvent('chatMessage', playerId, finalMessage)
            end
        end

        CancelEvent()
    end
end)
