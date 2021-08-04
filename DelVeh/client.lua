
RegisterNetEvent("DeleteVehicle")
AddEventHandler('DeleteVehicle', function()
    local playerPed = GetPlayerPed(-1)
    if IsPedInAnyVehicle(playerPed, false) then
        local playerCar = GetVehiclePedIsIn(playerPed, false)
		if ( GetPedInVehicleSeat( playerCar, -1 ) == playerPed ) then 
            SetEntityAsMissionEntity( playerCar, true, true )
				
				DeleteVehicle(playerCar)
			
		end
	end
end )

RegisterCommand("dv", function(source, args, raw)
    TriggerEvent("DeleteVehicle")
end, false)