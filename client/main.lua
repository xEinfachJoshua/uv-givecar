RegisterCommand(config.command, function(source, args)
    local id = args[1]
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local heading = GetEntityHeading(playerPed)
    local playerServerID = GetPlayerServerId(PlayerId())
    if IsPedInAnyVehicle(playerPed, false) then
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        TriggerServerEvent("uv-givecar:checkowner", playerServerID, vehicle, destinationId)
    else
        TriggerEvent("esx:ShowNotification", "~r~Du bist in keinem Fahrzeug!")
    end
end, false)