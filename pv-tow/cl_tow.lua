local currentlyTowedObject = nil

RegisterNetEvent('pv:tow')
AddEventHandler('pv:tow', function()
	
	local playerped = GetPlayerPed(-1)
	local vehicle = GetVehiclePedIsIn(playerped, true)
	
	local towmodel = GetHashKey('flatbed')
	local isVehicleTow = IsVehicleModel(vehicle, towmodel)
			
	if isVehicleTow then
	
		local coordA = GetEntityCoords(playerped, 1)
		local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 5.0, -0.80)
		local targetVehicle = getVehicleInDirection(coordA, coordB)
		
		if currentlyTowedObject == nil then
			if targetVehicle ~= 0 then
				if not IsPedInAnyVehicle(playerped, true) then
					if vehicle ~= targetVehicle then
						AttachEntityToEntity(targetVehicle, vehicle, 20, -0.5, -5.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
						currentlyTowedObject = targetVehicle
						TriggerEvent("chatMessage", "[TOWFuckers]", {255, 255, 0}, "Vehicle successfully attached to towtruck!")
					else
						TriggerEvent("chatMessage", "[TOWFuckers]", {255, 255, 0}, "Are you retarded? You cant tow your own towtruck with your own towtruck?")
					end
				end
			else
				TriggerEvent("chatMessage", "[TOWFuckers]", {255, 255, 0}, "Theres no vehicle to tow?")
			end
		else
			AttachEntityToEntity(currentlyTowedObject, vehicle, 20, -0.5, -12.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
			DetachEntity(currentlyTowedObject, true, true)
			currentlyTowedObject = nil
			TriggerEvent("chatMessage", "[TOWFuckers]", {255, 255, 0}, "The vehicle has been successfully detached!")
		end
	end
end)

function getVehicleInDirection(coordFrom, coordTo)
	local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed(-1), 0)
	local a, b, c, d, vehicle = GetRaycastResult(rayHandle)
	return vehicle
end
