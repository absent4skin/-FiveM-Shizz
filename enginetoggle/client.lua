-- ENGINE TOGGLE --
--by Jake Lotz--

local inputKey = 168   --F7 key, go to Fivem forums to find other keycodes

RegisterNetEvent("ToggleEngine")
AddEventHandler('ToggleEngine', function()
    local playerPed = GetPlayerPed(-1)       
    if IsPedInAnyVehicle(playerPed, false) then
		local playerCar = GetVehiclePedIsIn(playerPed, false)			
		local engineOn = GetIsVehicleEngineRunning(playerCar)
		if ( GetPedInVehicleSeat( playerCar, -1 ) == playerPed ) then 
            SetEntityAsMissionEntity( playerCar, true, true )
		
			if ( engineOn ) then
				SetVehicleEngineOn (playerCar, false, false)
				SetVehicleUndriveable(playerCar,true)    --or else player will turn car immediately back on
			else
				SetVehicleUndriveable(playerCar,false)
				SetVehicleEngineOn(playerCar, true)
			end
		end
	end
end )
Citizen.CreateThread(function()         --constantly looking for input of F7, then triggers above Event
	while true do Citizen.Wait(1)
		if IsControlJustPressed( 0, inputKey) then
			TriggerEvent("ToggleEngine")
		end
	end		
end)