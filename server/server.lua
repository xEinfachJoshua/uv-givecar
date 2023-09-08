RegisterServerEvent('uv-givecar:givecar')
AddEventHandler('uv-givecar:givecar', function(source, vehicle, destinationId)
    local plate = GetVehicleNumberPlateText(vehicle)
    local xPlayer = ESX.GetPlayerFromId(destinationId)
    MySQL.update("UPDATE owned_vehicles SET owner = @owner WHERE plate = @plate", {
        ['@owner'] = xPlayer.identifier,
        ['@plate'] = plate
    })
end)