ESX = exports['es_extended']:getSharedObject()
RegisterServerEvent('uv-givecar:givecar')
AddEventHandler('uv-givecar:givecar', function(source, vehicle, destinationId)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(destinationId)
    local plate = vehicle.plate
    local response = MySQL.prepare.await('SELECT * FROM `owned_vehicles` WHERE `plate` = ?', {
        plate
    })
    if xTarget == nil then
        TriggerClientEvent("esx:ShowNotification", source, "~r~Dieser Spieler ist nicht online!")
        return
    else

    if response["owner"] == xPlayer.identifier then
        MySQL.update.await('UPDATE `owned_vehicles` SET `owner` = ? WHERE `plate` = ?', {
            xTarget.identifier,
            plate
        })
        TriggerClientEvent("esx:ShowNotification", source, "~g~Du hast das Fahrzeug erfolgreich an "..xTarget.name.." gegeben!")
        TriggerClientEvent("esx:ShowNotification", destinationId, "~g~Du hast ein Fahrzeug erhalten!")
    else
        TriggerClientEvent("esx:ShowNotification", source, "~r~Du bist nicht der Besitzer dieses Fahrzeugs!")
    end
end)