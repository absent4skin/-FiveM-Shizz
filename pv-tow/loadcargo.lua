---------- CARGO LOADER V 1.1 ---------------
---------- absent4skin -------------------------
---------- NYSRP -----------------------------
--note, to add a vehicle, add towmodelXX variables and isVehicletowXX variables, copy the bison if statement in main, change towmodelxx, and adjust attach coords to fit vehicle
-- works for almost all spawned objects, naturally spawning objects in the world can't be taken more than a mile without disappearing tho
------- SUPPORTED VEHICLES -----------
-- mule
-- sadler
-- bison
-- bobcat
-- sandking XL
-- sandking SWB
-- washington
-- primo


local currentlyLoadedObject = nil

RegisterNetEvent('cargo')  -- To use: get in and out of driver seat, go stand on object and do /cargo to load, then either in or out of the vehicle, do /cargo to unload a few feet behind vehicle
AddEventHandler('cargo', function()
	
	local playerped = GetPlayerPed(-1)
	local vehicle = GetVehiclePedIsIn(playerped, true) -- actually returns current vehicle OR last vehicle entered if not in one, respectively
	
	----------TEMPLATE-----------------------  copy this and replace the "xx" on each variable, replace vehiclename
	-- local towmodelxx = GetHashKey('vehiclename')  
	-- local isVehicleTowxx = IsVehicleModel(vehicle, towmodelxx)
	-----------------------------------------

	local towmodel = GetHashKey('mule') --works, not with barrels tho
	local isVehicleTow = IsVehicleModel(vehicle, towmodel)

	local towmodel2 = GetHashKey('sadler') --works 
	local isVehicleTow2 = IsVehicleModel(vehicle, towmodel2)	

	local towmodel3 = GetHashKey('bison') --works
	local isVehicleTow3 = IsVehicleModel(vehicle, towmodel3)

	local towmodel4 = GetHashKey('washington') --WORKS! trunk
	local isVehicleTow4 = IsVehicleModel(vehicle, towmodel4)

	local towmodel5 = GetHashKey('bobcatxl') --works
	local isVehicleTow5 = IsVehicleModel(vehicle, towmodel5)

	local towmodel6 = GetHashKey('sandking') --works
	local isVehicleTow6 = IsVehicleModel(vehicle, towmodel6)

	local towmodel7 = GetHashKey('sandking2')  --works
	local isVehicleTow7 = IsVehicleModel(vehicle, towmodel7)

	local towmodel8 = GetHashKey('stratum') -- works
	local isVehicleTow8 = IsVehicleModel(vehicle, towmodel8)

	local towmodel9 = GetHashKey('picador') -- works
	local isVehicleTow9 = IsVehicleModel(vehicle, towmodel9)

	local towmodel10 = GetHashKey('primo') -- works
	local isVehicleTow10 = IsVehicleModel(vehicle, towmodel10)

	local towmodel11 = GetHashKey('stockade') --
	local isVehicleTow10 = IsVehicleModel(vehicle, towmodel10)

	local towmodel12 = GetHashKey('primo') --
	local isVehicleTow10 = IsVehicleModel(vehicle, towmodel10)

	local towmodel13 = GetHashKey('primo') --
	local isVehicleTow10 = IsVehicleModel(vehicle, towmodel10)

	local towmodel14 = GetHashKey('primo') --
	local isVehicleTow10 = IsVehicleModel(vehicle, towmodel10)

	local towmodel15 = GetHashKey('primo') --
	local isVehicleTow10 = IsVehicleModel(vehicle, towmodel10)

	local towmodel16 = GetHashKey('primo') --
	local isVehicleTow10 = IsVehicleModel(vehicle, towmodel10)

	local towmodel17 = GetHashKey('primo') --
	local isVehicleTow10 = IsVehicleModel(vehicle, towmodel10)

	local towmodel18 = GetHashKey('primo') --
	local isVehicleTow10 = IsVehicleModel(vehicle, towmodel10)

	local towmodel19 = GetHashKey('primo') --
	local isVehicleTow10 = IsVehicleModel(vehicle, towmodel10)

	local towmodel20 = GetHashKey('primo') --
	local isVehicleTow10 = IsVehicleModel(vehicle, towmodel10)





  ------MAIN----------------------------------------------
	--[[ ---------- T E M P L A T E ---------------------------------- copy everything between comments and modify to fit vehicle --------------------------------
	if isVehicleTowxx then --replace xx
	
		local coordA = GetEntityCoords(playerped, 1)           --   x    y     z  --
		local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 0.0, -6.0) ----player must stand on obect
		local targetObject = GetObjectInDirection(coordA, coordB) --this function does a ray cast from A to B and whatever OBJECT the ray hits first is saved to variable
	
		if currentlyLoadedObject  == nil then -- if no cargo loaded
			if targetObject ~= 0 then -- if a target was found from the ray cast
				if not IsPedInAnyVehicle(playerped, true) then              
					if vehicle ~= targetObject then              --BoneID  x     y    z   xrot yrot zrot -----CHANGE THESE X Y Z 's below
						AttachEntityToEntity(targetObject, vehicle, 0, 0.0, -5.0, 0.1, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -----attach to vehicle
						currentlyLoadedObject = targetObject
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Cargo Loaded!")
					else
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "do /cargo while standing on top of the cargo!")
					end
				end
			else
				TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Theres no cargo to load?")
			end
		else
			AttachEntityToEntity(currentlyLoadedObject, vehicle, 0, 0.0, -10.0, -0.818, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -- unload onto ground
			DetachEntity(currentlyLoadedObject, true, true)
			currentlyLoadedObject = nil
			TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "The cargo has been unloaded!")
		end
	end  
	]]





	if isVehicleTow then --mule
	
		local coordA = GetEntityCoords(playerped, 1)
		local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 0.0, -6.0) ----player must stand on obect
		local targetObject = GetObjectInDirection(coordA, coordB) --this function does a ray cast from A to B and whatever OBJECT the ray hits first is saved to variable
		
		if currentlyLoadedObject  == nil then -- if no cargo loaded
			if targetObject ~= 0 then -- if a target was found from the ray cast
				if not IsPedInAnyVehicle(playerped, true) then
					if vehicle ~= targetObject then               --Bone  x      y     z  xrot yrot zrot
						AttachEntityToEntity(targetObject, vehicle, 20, 1.23, -5.0, 0.13, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -----Load into back of box truck
						currentlyLoadedObject = targetObject
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Cargo Loaded up!")
					else
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "do /cargo while standing on top of the cargo!")
					end
				end
			else
				TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Theres no cargo to load?")
			end
		else											-------boneID  x     y       z     xr   yr   zr
			AttachEntityToEntity(currentlyLoadedObject, vehicle, 20, 0.150, -10.0, -0.818, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -- unload onto ground
			DetachEntity(currentlyLoadedObject, true, true)
			currentlyLoadedObject = nil
			TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "The cargo has been unloaded!")
		end
	end

	if isVehicleTow2 then --sadler
	
		local coordA = GetEntityCoords(playerped, 1)
		local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 0.0, -6.0) ----player must stand on obect
		local targetObject = GetObjectInDirection(coordA, coordB) --this function does a ray cast from A to B and whatever OBJECT the ray hits first is saved to variable
		
		if currentlyLoadedObject  == nil then -- if no cargo loaded
			if targetObject ~= 0 then --if a target was found from the ray cast
				if not IsPedInAnyVehicle(playerped, true) then
					if vehicle ~= targetObject then               --Bone  x     y     z    xrot yrot zrot
						AttachEntityToEntity(targetObject, vehicle, 20, 0.00, 0.4760, 0.25, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -----Load into back of pickup
						currentlyLoadedObject = targetObject
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Cargo Loaded up!")
					else
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "do /cargo while standing on top of the cargo!")
					end
				end
			else
				TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Theres no cargo to load?")
			end
		else
			AttachEntityToEntity(currentlyLoadedObject, vehicle, 20, -0.5, -2.50, -0.818, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -- unload onto ground behind truck
			DetachEntity(currentlyLoadedObject, true, true)
			currentlyLoadedObject = nil
			TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "The cargo has been unloaded!")
		end
	end

	if isVehicleTow3 then --bison
	
		local coordA = GetEntityCoords(playerped, 1)
		local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 0.0, -6.0) ----player must stand on obect
		local targetObject = GetObjectInDirection(coordA, coordB) --this function does a ray cast from A to B and whatever OBJECT the ray hits first is saved to variable
		
		if currentlyLoadedObject  == nil then -- if no cargo loaded
			if targetObject ~= 0 then --if a target was found from the ray cast
				if not IsPedInAnyVehicle(playerped, true) then
					if vehicle ~= targetObject then               --Bone  x     y     z    xrot yrot zrot
						AttachEntityToEntity(targetObject, vehicle, 0, 0.00, -1.3, 0.25, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -----Load into back of pickup
						currentlyLoadedObject = targetObject
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Cargo Loaded up!")
					else
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "do /cargo while standing on top of the cargo!")
					end
				end
			else
				TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Theres no cargo to load?")
			end
		else
			AttachEntityToEntity(currentlyLoadedObject, vehicle, 0, 0.0, -3.850, -0.818, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -- unload onto ground behind truck
			DetachEntity(currentlyLoadedObject, true, true)
			currentlyLoadedObject = nil
			TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "The cargo has been unloaded!")
		end
	end

	if isVehicleTow4 then --washington
	
		local coordA = GetEntityCoords(playerped, 1)
		local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 0.0, -6.0) ----player must stand on obect
		local targetObject = GetObjectInDirection(coordA, coordB) --this function does a ray cast from A to B and whatever OBJECT the ray hits first is saved to variable
		
		if currentlyLoadedObject  == nil then -- if no cargo loaded
			if targetObject ~= 0 then --if a target was found from the ray cast
				if not IsPedInAnyVehicle(playerped, true) then
					if vehicle ~= targetObject then               --Bone  x     y     z    xrot yrot zrot
						AttachEntityToEntity(targetObject, vehicle, 20, 0.00, -2.08, -0.070, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -----Load into back of pickup
						currentlyLoadedObject = targetObject
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Cargo Loaded up!")
					else
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "do /cargo while standing on top of the cargo!")
					end
				end
			else
				TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Theres no cargo to load?")
			end
		else
			AttachEntityToEntity(currentlyLoadedObject, vehicle, 20, -0.5, -3.90, -0.20, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -- unload onto ground behind truck
			DetachEntity(currentlyLoadedObject, true, true)
			currentlyLoadedObject = nil
			TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "The cargo has been unloaded!")
		end
	end

	if isVehicleTow5 then --bobcatxl
	
		local coordA = GetEntityCoords(playerped, 1)
		local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 0.0, -6.0) ----player must stand on obect
		local targetObject = GetObjectInDirection(coordA, coordB) --this function does a ray cast from A to B and whatever OBJECT the ray hits first is saved to variable
		
		if currentlyLoadedObject  == nil then -- if no cargo loaded
			if targetObject ~= 0 then --if a target was found from the ray cast
				if not IsPedInAnyVehicle(playerped, true) then
					if vehicle ~= targetObject then               --Bone  x     y     z    xrot yrot zrot
						AttachEntityToEntity(targetObject, vehicle, 0, 0.00, -1.6, -0.070, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -----Load into back of pickup
						currentlyLoadedObject = targetObject
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Cargo Loaded up!")
					else
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "do /cargo while standing on top of the cargo!")
					end
				end
			else
				TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Theres no cargo to load?")
			end
		else
			AttachEntityToEntity(currentlyLoadedObject, vehicle, 0, -0.5, -3.90, -0.818, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -- unload onto ground behind truck
			DetachEntity(currentlyLoadedObject, true, true)
			currentlyLoadedObject = nil
			TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "The cargo has been unloaded!")
		end
	end

	if isVehicleTow6 then --sandking XL
	
		local coordA = GetEntityCoords(playerped, 1)
		local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 0.0, -6.0) ----player must stand on obect
		local targetObject = GetObjectInDirection(coordA, coordB) --this function does a ray cast from A to B and whatever OBJECT the ray hits first is saved to variable
		
		if currentlyLoadedObject  == nil then -- if no cargo loaded
			if targetObject ~= 0 then --if a target was found from the ray cast
				if not IsPedInAnyVehicle(playerped, true) then
					if vehicle ~= targetObject then               --Bone  x     y     z    xrot yrot zrot
						AttachEntityToEntity(targetObject, vehicle, 20, 0.00, 1.6, 0.13, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -----Load into back of pickup
						currentlyLoadedObject = targetObject
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Cargo Loaded up!")
					else
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "do /cargo while standing on top of the cargo!")
					end
				end
			else
				TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Theres no cargo to load?")
			end
		else
			AttachEntityToEntity(currentlyLoadedObject, vehicle, 20, -0.5, -2.30, -0.818, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -- unload onto ground behind truck
			DetachEntity(currentlyLoadedObject, true, true)
			currentlyLoadedObject = nil
			TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "The cargo has been unloaded!")
		end
	end

	if isVehicleTow7 then --sandking swb
	
		local coordA = GetEntityCoords(playerped, 1)
		local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 0.0, -6.0) ----player must stand on obect
		local targetObject = GetObjectInDirection(coordA, coordB) --this function does a ray cast from A to B and whatever OBJECT the ray hits first is saved to variable
		
		if currentlyLoadedObject  == nil then -- if no cargo loaded
			if targetObject ~= 0 then --if a target was found from the ray cast
				if not IsPedInAnyVehicle(playerped, true) then
					if vehicle ~= targetObject then               --Bone  x     y    z    xrot yrot zrot
						AttachEntityToEntity(targetObject, vehicle, 0, 0.00, -2.0, 0.50, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -----Load into back of pickup
						currentlyLoadedObject = targetObject
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Cargo Loaded up!")
					else
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "do /cargo while standing on top of the cargo!")
					end
				end
			else
				TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Theres no cargo to load?")
			end
		else
			AttachEntityToEntity(currentlyLoadedObject, vehicle, 00, -0.5, -4.40, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -- unload onto ground behind truck
			DetachEntity(currentlyLoadedObject, true, true)
			currentlyLoadedObject = nil
			TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "The cargo has been unloaded!")
		end
	end

	if isVehicleTow8 then --stratum
	
		local coordA = GetEntityCoords(playerped, 1)
		local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 0.0, -6.0) ----player must stand on obect
		local targetObject = GetObjectInDirection(coordA, coordB) --this function does a ray cast from A to B and whatever OBJECT the ray hits first is saved to variable
		
		if currentlyLoadedObject  == nil then -- if no cargo loaded
			if targetObject ~= 0 then --if a target was found from the ray cast
				if not IsPedInAnyVehicle(playerped, true) then
					if vehicle ~= targetObject then               --Bone  x     y     z    xrot yrot zrot
						AttachEntityToEntity(targetObject, vehicle, 0, 0.00, -1.8, 0.09, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -----Load into back of pickup
						currentlyLoadedObject = targetObject
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Cargo Loaded up!")
					else
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "do /cargo while standing on top of the cargo!")
					end
				end
			else
				TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Theres no cargo to load?")
			end
		else
			AttachEntityToEntity(currentlyLoadedObject, vehicle, 0, 0.0, -2.90, -0.1, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -- unload onto ground behind truck
			DetachEntity(currentlyLoadedObject, true, true)
			currentlyLoadedObject = nil
			TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "The cargo has been unloaded!")
		end
	end

	if isVehicleTow9 then --picador
	
		local coordA = GetEntityCoords(playerped, 1)
		local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 0.0, -6.0) ----player must stand on obect
		local targetObject = GetObjectInDirection(coordA, coordB) --this function does a ray cast from A to B and whatever OBJECT the ray hits first is saved to variable
		
		if currentlyLoadedObject  == nil then -- if no cargo loaded
			if targetObject ~= 0 then --if a target was found from the ray cast
				if not IsPedInAnyVehicle(playerped, true) then
					if vehicle ~= targetObject then               --Bone  x     y     z    xrot yrot zrot
						AttachEntityToEntity(targetObject, vehicle, 20, -1.00, -2.6, -0.35, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -----Load into back of pickup
						currentlyLoadedObject = targetObject
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Cargo Loaded up!")
					else
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "do /cargo while standing on top of the cargo!")
					end
				end
			else
				TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Theres no cargo to load?")
			end
		else
			AttachEntityToEntity(currentlyLoadedObject, vehicle, 20, -0.5, -4.90, -0.818, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -- unload onto ground behind truck
			DetachEntity(currentlyLoadedObject, true, true)
			currentlyLoadedObject = nil
			TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "The cargo has been unloaded!")
		end
	end

	if isVehicleTow10 then --primo
	
		local coordA = GetEntityCoords(playerped, 1)
		local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 0.0, -6.0) ----player must stand on obect
		local targetObject = GetObjectInDirection(coordA, coordB) --this function does a ray cast from A to B and whatever OBJECT the ray hits first is saved to variable
		
		if currentlyLoadedObject  == nil then -- if no cargo loaded
			if targetObject ~= 0 then --if a target was found from the ray cast
				if not IsPedInAnyVehicle(playerped, true) then
					if vehicle ~= targetObject then               --Bone  x     y     z    xrot yrot zrot
						AttachEntityToEntity(targetObject, vehicle, 0, 0.00, -1.88, -0.070, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -----Load into back of pickup
						currentlyLoadedObject = targetObject
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Cargo Loaded up!")
					else
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "do /cargo while standing on top of the cargo!")
					end
				end
			else
				TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Theres no cargo to load?")
			end
		else
			AttachEntityToEntity(currentlyLoadedObject, vehicle, 0, 0.0, -3.90, 0.018, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -- unload onto ground behind truck
			DetachEntity(currentlyLoadedObject, true, true)
			currentlyLoadedObject = nil
			TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "The cargo has been unloaded!")
		end
	end



	if isVehicleTow11 then --replace xx
	
		local coordA = GetEntityCoords(playerped, 1)           --   x    y     z  --
		local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 0.0, -6.0) ----player must stand on obect
		local targetObject = GetObjectInDirection(coordA, coordB) --this function does a ray cast from A to B and whatever OBJECT the ray hits first is saved to variable
	
		if currentlyLoadedObject  == nil then -- if no cargo loaded
			if targetObject ~= 0 then -- if a target was found from the ray cast
				if not IsPedInAnyVehicle(playerped, true) then              
					if vehicle ~= targetObject then              --BoneID  x     y    z   xrot yrot zrot -----CHANGE THESE X Y Z 's below
						AttachEntityToEntity(targetObject, vehicle, 0, 0.0, -5.0, 0.1, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -----attach to vehicle
						currentlyLoadedObject = targetObject
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Cargo Loaded!")
					else
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "do /cargo while standing on top of the cargo!")
					end
				end
			else
				TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Theres no cargo to load?")
			end
		else
			AttachEntityToEntity(currentlyLoadedObject, vehicle, 0, 0.0, -10.0, -0.818, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -- unload onto ground
			DetachEntity(currentlyLoadedObject, true, true)
			currentlyLoadedObject = nil
			TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "The cargo has been unloaded!")
		end
	end

	if isVehicleTow12 then --replace xx
	
		local coordA = GetEntityCoords(playerped, 1)           --   x    y     z  --
		local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 0.0, -6.0) ----player must stand on obect
		local targetObject = GetObjectInDirection(coordA, coordB) --this function does a ray cast from A to B and whatever OBJECT the ray hits first is saved to variable
	
		if currentlyLoadedObject  == nil then -- if no cargo loaded
			if targetObject ~= 0 then -- if a target was found from the ray cast
				if not IsPedInAnyVehicle(playerped, true) then              
					if vehicle ~= targetObject then              --BoneID  x     y    z   xrot yrot zrot -----CHANGE THESE X Y Z 's below
						AttachEntityToEntity(targetObject, vehicle, 0, 0.0, -5.0, 0.1, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -----attach to vehicle
						currentlyLoadedObject = targetObject
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Cargo Loaded!")
					else
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "do /cargo while standing on top of the cargo!")
					end
				end
			else
				TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Theres no cargo to load?")
			end
		else
			AttachEntityToEntity(currentlyLoadedObject, vehicle, 0, 0.0, -10.0, -0.818, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -- unload onto ground
			DetachEntity(currentlyLoadedObject, true, true)
			currentlyLoadedObject = nil
			TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "The cargo has been unloaded!")
		end
	end

	if isVehicleTow13 then --replace xx
	
		local coordA = GetEntityCoords(playerped, 1)           --   x    y     z  --
		local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 0.0, -6.0) ----player must stand on obect
		local targetObject = GetObjectInDirection(coordA, coordB) --this function does a ray cast from A to B and whatever OBJECT the ray hits first is saved to variable
	
		if currentlyLoadedObject  == nil then -- if no cargo loaded
			if targetObject ~= 0 then -- if a target was found from the ray cast
				if not IsPedInAnyVehicle(playerped, true) then              
					if vehicle ~= targetObject then              --BoneID  x     y    z   xrot yrot zrot -----CHANGE THESE X Y Z 's below
						AttachEntityToEntity(targetObject, vehicle, 0, 0.0, -5.0, 0.1, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -----attach to vehicle
						currentlyLoadedObject = targetObject
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Cargo Loaded!")
					else
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "do /cargo while standing on top of the cargo!")
					end
				end
			else
				TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Theres no cargo to load?")
			end
		else
			AttachEntityToEntity(currentlyLoadedObject, vehicle, 0, 0.0, -10.0, -0.818, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -- unload onto ground
			DetachEntity(currentlyLoadedObject, true, true)
			currentlyLoadedObject = nil
			TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "The cargo has been unloaded!")
		end
	end

	if isVehicleTow14 then --replace xx
	
		local coordA = GetEntityCoords(playerped, 1)           --   x    y     z  --
		local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 0.0, -6.0) ----player must stand on obect
		local targetObject = GetObjectInDirection(coordA, coordB) --this function does a ray cast from A to B and whatever OBJECT the ray hits first is saved to variable
	
		if currentlyLoadedObject  == nil then -- if no cargo loaded
			if targetObject ~= 0 then -- if a target was found from the ray cast
				if not IsPedInAnyVehicle(playerped, true) then              
					if vehicle ~= targetObject then              --BoneID  x     y    z   xrot yrot zrot -----CHANGE THESE X Y Z 's below
						AttachEntityToEntity(targetObject, vehicle, 0, 0.0, -5.0, 0.1, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -----attach to vehicle
						currentlyLoadedObject = targetObject
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Cargo Loaded!")
					else
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "do /cargo while standing on top of the cargo!")
					end
				end
			else
				TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Theres no cargo to load?")
			end
		else
			AttachEntityToEntity(currentlyLoadedObject, vehicle, 0, 0.0, -10.0, -0.818, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -- unload onto ground
			DetachEntity(currentlyLoadedObject, true, true)
			currentlyLoadedObject = nil
			TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "The cargo has been unloaded!")
		end
	end

	if isVehicleTow15 then --replace xx
	
		local coordA = GetEntityCoords(playerped, 1)           --   x    y     z  --
		local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 0.0, -6.0) ----player must stand on obect
		local targetObject = GetObjectInDirection(coordA, coordB) --this function does a ray cast from A to B and whatever OBJECT the ray hits first is saved to variable
	
		if currentlyLoadedObject  == nil then -- if no cargo loaded
			if targetObject ~= 0 then -- if a target was found from the ray cast
				if not IsPedInAnyVehicle(playerped, true) then              
					if vehicle ~= targetObject then              --BoneID  x     y    z   xrot yrot zrot -----CHANGE THESE X Y Z 's below
						AttachEntityToEntity(targetObject, vehicle, 0, 0.0, -5.0, 0.1, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -----attach to vehicle
						currentlyLoadedObject = targetObject
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Cargo Loaded!")
					else
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "do /cargo while standing on top of the cargo!")
					end
				end
			else
				TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Theres no cargo to load?")
			end
		else
			AttachEntityToEntity(currentlyLoadedObject, vehicle, 0, 0.0, -10.0, -0.818, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -- unload onto ground
			DetachEntity(currentlyLoadedObject, true, true)
			currentlyLoadedObject = nil
			TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "The cargo has been unloaded!")
		end
	end

	if isVehicleTow16 then --replace xx
	
		local coordA = GetEntityCoords(playerped, 1)           --   x    y     z  --
		local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 0.0, -6.0) ----player must stand on obect
		local targetObject = GetObjectInDirection(coordA, coordB) --this function does a ray cast from A to B and whatever OBJECT the ray hits first is saved to variable
	
		if currentlyLoadedObject  == nil then -- if no cargo loaded
			if targetObject ~= 0 then -- if a target was found from the ray cast
				if not IsPedInAnyVehicle(playerped, true) then              
					if vehicle ~= targetObject then              --BoneID  x     y    z   xrot yrot zrot -----CHANGE THESE X Y Z 's below
						AttachEntityToEntity(targetObject, vehicle, 0, 0.0, -5.0, 0.1, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -----attach to vehicle
						currentlyLoadedObject = targetObject
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Cargo Loaded!")
					else
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "do /cargo while standing on top of the cargo!")
					end
				end
			else
				TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Theres no cargo to load?")
			end
		else
			AttachEntityToEntity(currentlyLoadedObject, vehicle, 0, 0.0, -10.0, -0.818, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -- unload onto ground
			DetachEntity(currentlyLoadedObject, true, true)
			currentlyLoadedObject = nil
			TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "The cargo has been unloaded!")
		end
	end

	if isVehicleTow17 then --replace xx
	
		local coordA = GetEntityCoords(playerped, 1)           --   x    y     z  --
		local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 0.0, -6.0) ----player must stand on obect
		local targetObject = GetObjectInDirection(coordA, coordB) --this function does a ray cast from A to B and whatever OBJECT the ray hits first is saved to variable
	
		if currentlyLoadedObject  == nil then -- if no cargo loaded
			if targetObject ~= 0 then -- if a target was found from the ray cast
				if not IsPedInAnyVehicle(playerped, true) then              
					if vehicle ~= targetObject then              --BoneID  x     y    z   xrot yrot zrot -----CHANGE THESE X Y Z 's below
						AttachEntityToEntity(targetObject, vehicle, 0, 0.0, -5.0, 0.1, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -----attach to vehicle
						currentlyLoadedObject = targetObject
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Cargo Loaded!")
					else
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "do /cargo while standing on top of the cargo!")
					end
				end
			else
				TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Theres no cargo to load?")
			end
		else
			AttachEntityToEntity(currentlyLoadedObject, vehicle, 0, 0.0, -10.0, -0.818, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -- unload onto ground
			DetachEntity(currentlyLoadedObject, true, true)
			currentlyLoadedObject = nil
			TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "The cargo has been unloaded!")
		end
	end

	if isVehicleTow18 then --replace xx
	
		local coordA = GetEntityCoords(playerped, 1)           --   x    y     z  --
		local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 0.0, -6.0) ----player must stand on obect
		local targetObject = GetObjectInDirection(coordA, coordB) --this function does a ray cast from A to B and whatever OBJECT the ray hits first is saved to variable
	
		if currentlyLoadedObject  == nil then -- if no cargo loaded
			if targetObject ~= 0 then -- if a target was found from the ray cast
				if not IsPedInAnyVehicle(playerped, true) then              
					if vehicle ~= targetObject then              --BoneID  x     y    z   xrot yrot zrot -----CHANGE THESE X Y Z 's below
						AttachEntityToEntity(targetObject, vehicle, 0, 0.0, -5.0, 0.1, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -----attach to vehicle
						currentlyLoadedObject = targetObject
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Cargo Loaded!")
					else
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "do /cargo while standing on top of the cargo!")
					end
				end
			else
				TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Theres no cargo to load?")
			end
		else
			AttachEntityToEntity(currentlyLoadedObject, vehicle, 0, 0.0, -10.0, -0.818, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -- unload onto ground
			DetachEntity(currentlyLoadedObject, true, true)
			currentlyLoadedObject = nil
			TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "The cargo has been unloaded!")
		end
	end

	if isVehicleTow19 then --replace xx
	
		local coordA = GetEntityCoords(playerped, 1)           --   x    y     z  --
		local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 0.0, -6.0) ----player must stand on obect
		local targetObject = GetObjectInDirection(coordA, coordB) --this function does a ray cast from A to B and whatever OBJECT the ray hits first is saved to variable
	
		if currentlyLoadedObject  == nil then -- if no cargo loaded
			if targetObject ~= 0 then -- if a target was found from the ray cast
				if not IsPedInAnyVehicle(playerped, true) then              
					if vehicle ~= targetObject then              --BoneID  x     y    z   xrot yrot zrot -----CHANGE THESE X Y Z 's below
						AttachEntityToEntity(targetObject, vehicle, 0, 0.0, -5.0, 0.1, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -----attach to vehicle
						currentlyLoadedObject = targetObject
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Cargo Loaded!")
					else
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "do /cargo while standing on top of the cargo!")
					end
				end
			else
				TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Theres no cargo to load?")
			end
		else
			AttachEntityToEntity(currentlyLoadedObject, vehicle, 0, 0.0, -10.0, -0.818, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -- unload onto ground
			DetachEntity(currentlyLoadedObject, true, true)
			currentlyLoadedObject = nil
			TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "The cargo has been unloaded!")
		end
	end

	if isVehicleTow20 then --replace xx
	
		local coordA = GetEntityCoords(playerped, 1)           --   x    y     z  --
		local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 0.0, -6.0) ----player must stand on obect
		local targetObject = GetObjectInDirection(coordA, coordB) --this function does a ray cast from A to B and whatever OBJECT the ray hits first is saved to variable
	
		if currentlyLoadedObject  == nil then -- if no cargo loaded
			if targetObject ~= 0 then -- if a target was found from the ray cast
				if not IsPedInAnyVehicle(playerped, true) then              
					if vehicle ~= targetObject then              --BoneID  x     y    z   xrot yrot zrot -----CHANGE THESE X Y Z 's below
						AttachEntityToEntity(targetObject, vehicle, 0, 0.0, -5.0, 0.1, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -----attach to vehicle
						currentlyLoadedObject = targetObject
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Cargo Loaded!")
					else
						TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "do /cargo while standing on top of the cargo!")
					end
				end
			else
				TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "Theres no cargo to load?")
			end
		else
			AttachEntityToEntity(currentlyLoadedObject, vehicle, 0, 0.0, -10.0, -0.818, 0.0, 0.0, 0.0, false, false, false, false, 20, true) -- unload onto ground
			DetachEntity(currentlyLoadedObject, true, true)
			currentlyLoadedObject = nil
			TriggerEvent("chatMessage", "[CARGO]", {255, 255, 0}, "The cargo has been unloaded!")
		end
	end
end)----------------------------------------------------------








function GetObjectInDirection(coordFrom, coordTo) --shoots a ray from player dirctly down and 
	local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 16, GetPlayerPed(-1), 0) -- use '16' to tell raycast to stop when it hits an OBJECT type
	local a, b, c, d, objectHit = GetRaycastResult(rayHandle)
	return objectHit
end
