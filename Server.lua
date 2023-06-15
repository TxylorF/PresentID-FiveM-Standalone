-- Server-side FiveM script for /id command

local logo = {
    [[_____  _____  ______  _____ ______ _   _ _______ _____ _____  ]],
    [[|  __ \|  __ \|  ____|/ ____|  ____| \ | |__   __|_   _|  __ \ ]],
    [[| |__) | |__) | |__  | (___ | |__  |  \| |  | |    | | | |  | |]],
    [[|  ___/|  _  /|  __|  \___ \|  __| | . ` |  | |    | | | |  | |]],
    [[| |    | | \ \| |____ ____) | |____| |\  |  | |   _| |_| |__| |]],
    [[|_|    |_|  \_\______|_____/|______|_| \_|  |_|  |_____|_____/ ]],

    "",
    "PRESENTID by TxylorF (Discord)",
    "For the latest version please check",
    "https://github.com/TxylorF/PresentID-FiveM-Standalone/tree/main"
}

for _, line in ipairs(logo) do
    print(line)
end

AddEventHandler('chatMessage', function(source, name, message)
    if message:sub(1, 3) == '/id' then
        local playerCoords = GetEntityCoords(GetPlayerPed(source))
        local players = GetPlayers()

        for _, playerId in ipairs(players) do
            local targetCoords = GetEntityCoords(GetPlayerPed(playerId))
            local distance = #(playerCoords - targetCoords)

            if distance <= 20.0 then
                local additionalText = message:sub(4)
                local serverIdText = "^4[" .. source .. "]"
                local finalMessage = string.format("^4%s ^7%s ^7shows ID: ^7%s", name, serverIdText, additionalText)

                TriggerClientEvent('chatMessage', playerId, finalMessage)
            end
        end

        CancelEvent()
    end
end)
