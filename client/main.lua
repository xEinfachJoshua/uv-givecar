RegisterCommand(config.command, function(source, args)
    local id = args[1]
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local heading = GetEntityHeading(playerPed)
    local playerServerID = GetPlayerServerId(PlayerId())
    if PedinAnyVehicle(playerPed) then
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        -- TriggerServerEvent("uv-givecar:givecar", playerServerID, vehicle, destinationId)
        TriggerServerEvent("uv-givecar:checkowner", playerServerID, vehicle, destinationId)
    else
        ESX.ShowNotification("Du musst in einem Fahrzeug sitzen!")
    end
end, false)