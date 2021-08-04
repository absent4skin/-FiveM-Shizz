RegisterNetEvent('SpawnVehicle')

AddEventHandler('SpawnVehicle', function(vehiclemodel)

    playerPed = GetPlayerPed(-1)
    playerCoords = GetEntityCoords(playerPed, 0)

    vehicleHash = GetHashKey(vehiclemodel)
    RequestModel(vehicleHash)
    while not HasModelLoaded(vehicleHash) do
        Wait(1)
    end
    vehicle = CreateVehicle( vehicleHash, playerCoords['x'] + 5,  playerCoords['y'],  playerCoords['z'], 1, true, false)
       
    SetVehicleOnGroundProperly(vehicle)
    SetVehicleEngineOn(vehicle, true, false, false)
    
    if IsVehicleDriveable(vehicle, 0) then 
        TriggerEvent("chatMessage", " ", { 255, 127, 0 }, "vehicle spawned")
    end
    SetEntityAsMissionEntity(vehicle, true, true);



end) 

RegisterCommand("SpawnVehicle", function(source, args, raw)
    TriggerEvent("SpawnVehicle")         --adds /fix to sugestion list in textchat
end, false)