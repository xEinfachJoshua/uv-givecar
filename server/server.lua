RegisterServerEvent('uv-givecar:givecar')
AddEventHandler('uv-givecar:givecar', function(source, vehicle, destinationId)
    local plate = GetVehicleNumberPlateText(vehicle)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(destinationId)
    MySQL.prepere("SELECT * FROM onwed_vehicles WHERE plate = @plate", {
        ['@plate'] = plate
    }, function(result)
        result = json.encode(result)
        result = json.decode(result)
        if result["owner"] == xPlayer.identifier then
            MySQL.update("UPDATE owned_vehicles SET owner = @owner WHERE plate = @plate", {
                ['@owner'] = xTarget.identifier,
                ['@plate'] = plate
            })
            TriggerClientEvent("esx:ShowNotification", source, "Du hast das Fahrzeug mit dem Kennzeichen ~g~" .. plate .. "~w~ an ~g~" .. xTarget.name .. "~w~ gegeben!")
            TriggerClientEvent("esx:ShowNotification", destinationId, "Du hast das Fahrzeug mit dem Kennzeichen ~g~" .. plate .. "~w~ von ~g~" .. xPlayer.name .. "~w~ bekommen!")
        else
            TriggerClientEvent("esx:ShowNotification", source, "Du bist nicht der Besitzer des Fahrzeugs mit dem Kennzeichen ~g~" .. plate .. "~w~!")
        end
    end)
    
end)


