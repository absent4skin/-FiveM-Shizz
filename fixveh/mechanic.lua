--------------------------------------------------------------------------
----------Mechanic V2-----------------------------------------------------
--------------------------------------------------------------------------

--type /fix, if in vehicle, pop the hood and say get out


-------------if out of vehicle and infront of hood, fix under timer, do animation bum trash
    --repairs vehicle slightly


--go to mechanic locations to fix further


--damage is multiplied

local mechanic = {
    [1] =  {["x"] = -71.70,  ["y"] = 6426.5,   ["z"] =31.4},
    [2] =  {["x"] = 110.70,  ["y"] = 6626.00,  ["z"] = 31.7},
    [3] =  {["x"] = 2005.90, ["y"] = 3798.00,  ["z"] = 32.2},
    [4] =  {["x"] = 1694.50, ["y"] = 6428.00,  ["z"] = 32.6},
    [5] =  {["x"] = 1774.50, ["y"] = 3333.80,  ["z"] = 41.3},
    [6] =  {["x"] = 636.10,  ["y"] = 252.30,   ["z"] = 103.2},
    [7] =  {["x"] = 1175.00, ["y"] = 2640.70,  ["z"] = 37.7},
    [8] =  {["x"] = -336.47, ["y"] = -137.20,  ["z"] = 39.0},
    [9] =  {["x"] = 733.10,  ["y"] = -1088.70, ["z"] = 22.16},
    [10] = {["x"] = -198.00, ["y"] = -1382.00, ["z"] = 30.6}
}

local blip = {}



Citizen.CreateThread(function() -- MODIFIED ENGINE DAMAGE --
	init()
	while true do
		Citizen.Wait(10)
		---------------------------------CONFIG--------------------------------------
		-------------------------------------------------------------------------------------
		local hModifier = 0.4000 -- 0.100 to 0.999  damage multiplier, 1.000 being normal GTAV damage, 0.100 being one hit K.O.
		local broken = 100.0 ------ health for engine to fail; 0.000 to 400.0 is practical; -
		-------------------------------------------------------------------------------------
		-------------------------------------------------------------------------------------
		local Ped = GetPlayerPed(-1)
		local inVeh = IsPedInAnyVehicle(Ped, false)
		
		if inVeh then
			local Car = GetPlayersLastVehicle()
			local healthA = GetVehicleEngineHealth(Car)
			Citizen.Wait(200)
			local healthB = GetVehicleEngineHealth(Car)
		
			if (healthB < healthA) then -- has vehicle engine been damaged in the last 200 milliseconds
				TriggerEvent('chatMessage', "test  "..healthB, {100, 200, 240}, " test")
				SetVehicleEngineHealth(Car, healthB*hModifier)
			end
			if healthB < broken then
				SetVehicleUndriveable(Car, true)
			end
		end
	end
end)



RegisterNetEvent("fixVehicle")   

AddEventHandler('fixVehicle', function() -- roadside mechanic --
    local playerPed = GetPlayerPed(-1)
    local playerCar = GetPlayersLastVehicle()
    SetEntityAsMissionEntity(playerCar, true, true)
    local inVeh = IsPedInAnyVehicle(playerPed, false)
	
	
	--main function
	if not inVeh then   

		if AtMechanic() then
			SetVehicleDoorOpen(playerCar, 4, false, false)
			TriggerEvent("chatMessage", "CAR:", { 255, 127, 0 }, "attempting to fix...")
			Citizen.Wait(5000)
			SetVehicleEngineHealth(playerCar, 999.999)
			SetVehicleBodyHealth(playerCar, 999.999)
			SetVehicleDeformationFixed(playerCar)
			SetVehicleFixed(playerCar)
			SetVehicleUndriveable(playerCar, false) 
			TriggerEvent("chatMessage", "CAR:", { 255, 127, 0 }, "FIXED!")
			SetVehicleDoorShut(playerCar, 4, false)	--auto shuts hood	
		else
			SetVehicleDoorOpen(playerCar, 4, false, false)
			TriggerEvent("chatMessage", "CAR:", { 255, 127, 0 }, "attempting to fix...")
			Citizen.Wait(5000)
			SetVehicleEngineHealth(playerCar, 400.0)
			SetVehicleUndriveable(playerCar, false)
			TriggerEvent("chatMessage", "CAR:", { 255, 127, 0 }, "it works, for now...")
			SetVehicleDoorShut(playerCar, 4, false)	--auto shuts hood	
		end
	else
		TriggerEvent("chatMessage", "CAR:", { 255, 127, 0 }, "Get out and fix the thing!") --prints if player is still in car
	end

end)

RegisterCommand("fix", function(source, args, raw)
    TriggerEvent("fixVehicle")         --adds /fix to sugestion list in textchat
end, false)

function AtMechanic ()
	
	local playerPed = GetPlayerPed(-1)
	local playerCoords = GetEntityCoords(playerPed, 0)

	-- MECHANIC LOCATIONS --
	


	for i = 0, 14, 1
	do
		if  (GetDistanceBetweenCoords(playerCoords,mechanic[i]["x"],mechanic[i]["y"],mechanic[i]["z"]) < 10) then
			return true
		end
	end


end

function init() 
	TriggerEvent("chatMessage", "Mechanic:", { 255, 127, 0 }, " drawing blips!") --prints if player is still in car
    blip[1] = AddBlipForCoord(mechanic[1]["x"], mechanic[1]["y"], mechanic[1]["z"] + 3.0)
	SetBlipSprite(blip[1], 140)
    SetBlipDisplay(blip[1], 1)
    SetBlipScale(blip[1], 1.0)
    TriggerEvent("chatMessage", "Mechanic:", { 255, 127, 0 }, " blips drawn!") --prints if player is still in car
end



