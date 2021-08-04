

-------------------------------------Locations-------------------------------------
local carSpawnLocation = {
    [1] =  { ["x"] = 2375.30,  ["y"] = 2879.40,  ["z"] = 40.4,   ["h"] = 126.0},-- median at sandy shores exit, facing south, well hidden from SB lanes 
    [2] =  { ["x"] = 2854.00,  ["y"] = 4326.00,  ["z"] = 51.50,  ["h"] =  33.75}, --side of NB by silos

}

local copSpawnLocation = {
    [1] =  { ["x"] = 2380.50,  ["y"] = 2883.00,  ["z"] = 40.4,   ["h"] = 315.0},-- median at sandy shores exit, facing south, well hidden from SB lanes 
    [2] =  { ["x"] = 2851.00,  ["y"] = 4322.60,  ["z"] = 50.50,  ["h"] =  189.9}, --side of NB by silos

}
------------------------------------------------------------------------------------
-------------------------------------entities---------------------------------------

local car = {}
local cop = {}

------------------------------------------------------------------------------------
-------------------------------------MAIN FUNCTION----------------------------------
Citizen.CreateThread(function()
   
    initialize()

    while true do
        
        Citizen.Wait(500)


        while (not isPlayerAtTarget(GetEntityCoords(cop[1]), 200.0) and not isPlayerAtTarget(GetEntityCoords(cop[2]), 200.0)) do
            Citizen.Wait(1)--wait for player to get near target
        end

        TriggerEvent("chatMessage", "SAHP:", { 255, 127, 0 }, "Spotted")

        checkSpeed()

        if (unitsDispatched and (GetPlayerWantedLevel(playerPed) == 0)) then
            resetCops(1)
            resetCops(2)
            unitsDispatched = false
        end

    end

end) 
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------


































function spawnCar(name, carNum, location)
    local carHash
    carHash = GetHashKey(name)
    RequestModel(carHash)
    while not HasModelLoaded(carHash) do
        Wait(1)
    end

    car[carNum] = CreateVehicle( carHash, location["x"], location["y"], location["z"], location["h"], true, false)
   
    SetVehicleOnGroundProperly(car[carNum])
    SetVehicleEngineOn(car[carNum], true, false, false)
    
    if IsVehicleDriveable(car[carNum], 0) then 
        TriggerEvent("chatMessage", "::S.A. HWY PATROL::", { 255, 127, 0 }, "Unit "..car[carNum].." On Duty")
    end
    SetEntityAsMissionEntity(car[carNum], true, true);
end

function spawnCop(name, badgeNum, location)
    local copHash
    copHash = GetHashKey(name)
    RequestModel(copHash)
    while not HasModelLoaded(copHash) do
        Wait(1)
    end

    cop[badgeNum] = CreatePed( 6, copHash, location["x"], location["y"], location["z"], location["h"], true, false)

    TriggerEvent("chatMessage", "::S.A. HWY PATROL::", { 255, 127, 0 }, "officer "..cop[badgeNum].." On Duty")
    SetEntityAsMissionEntity(cop[badgeNum], true, true);


end