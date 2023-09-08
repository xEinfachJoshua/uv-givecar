RegisterCommand(config.command, function(source, args)
    local id = args[1]
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local heading = GetEntityHeading(playerPed)
    local playerServerID = GetPlayerServerId(PlayerId())
    if PedinAnyVehicle(playerPed) then
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        TriggerServerEvent("uv-givecar:givecar", playerServerID, vehicle, destinationId)
    end
end, false)