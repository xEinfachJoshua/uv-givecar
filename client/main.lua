ESX = exports['es_extended']:getSharedObject()
RegisterCommand(config.command, function(source, args)
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local heading = GetEntityHeading(playerPed)
        local playerServerID = GetPlayerServerId(PlayerId())
        local destinationId = tonumber(args[1])
        if IsPedInAnyVehicle(playerPed, false) then
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
            TriggerServerEvent("uv-givecar:givecar", playerServerID, vehicleProps, destinationId)
        else
            TriggerEvent("esx:ShowNotification", "~r~Du bist in keinem Fahrzeug!")
        end
end, false)