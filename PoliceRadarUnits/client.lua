-- Police Radar Unit V1-- absent4skin
-------------------------------------


--Spawns police radar units on random roads around the map
--the units will consist of a cop ped in a police car parked on the side of the road
--when a player passes going over the speed limit, with random officer discression of 1 to 10 mph over, the player will become wanted 1 star until you pull over and get "arrested"
-- if you dont pull over, 2 stars will be attained

-- find how to:
-- spawn a ped
-- spawn a car
-- put ped into car
-- GET SPEED OF ALL PASSING PLAYER CARS
-- make ped follow friendly
-- turn on siren
-- when player stops, make cop come to door
-- press button to sign ticket

-- or

-- run and make the cop go from following to chasing more aggressively,
-- additional units spawn nearby to join pursuit


local carSpawnLocation = {
    [1] =  { ["x"] = 2375.30,  ["y"] = 2879.40,  ["z"] = 40.4,   ["h"] = 126.0},-- median at sandy shores exit, facing south, well hidden from SB lanes 
    [2] =  { ["x"] = 2854.00,  ["y"] = 4326.00,  ["z"] = 51.50,  ["h"] =  33.75} --side of NB by silos
}

local copSpawnLocation = {
    [1] =  { ["x"] = 2380.50,  ["y"] = 2883.00,  ["z"] = 40.4,   ["h"] = 315.0},-- median at sandy shores exit, facing south, well hidden from SB lanes 
    [2] =  { ["x"] = 2851.00,  ["y"] = 4322.60,  ["z"] = 50.50,  ["h"] =  189.9} --side of NB by silos
}

local car = {}
local cop = {}
local unitsDispatched = false
local playerPed = GetPlayerPed(-1)
local speed
local mph


Citizen.CreateThread(function()
    initialize()
    while true do
        Citizen.Wait(500)

        while (not isPlayerAtTarget(GetEntityCoords(cop[1]), 200.0) and not isPlayerAtTarget(GetEntityCoords(cop[2]), 200.0)) do --wait for player to get near target
            Citizen.Wait(1)
        end

        TriggerEvent("chatMessage", "SAHP:", { 255, 127, 0 }, "Spotted")

        checkSpeed()


    end
end) 



------------------------------      INITIALIZATION    --------------------------------------------------------
function initialize()
    --spawn peds and cars
    spawnCar("police3", 1, carSpawnLocation[1])
    spawnCar("police3", 2, carSpawnLocation[2])

    spawnCop("s_m_y_hwaycop_01", 1, copSpawnLocation[1])
    spawnCop("s_m_y_hwaycop_01", 2, copSpawnLocation[2])

end
----------------------------------------------------------------------------------------------------------------
function spawnCar(name, carNum, location)
    local carHash
    carHash = GetHashKey(name)
    RequestModel(carHash)
    while not HasModelLoaded(carHash) do
        Wait(1000)
        TriggerEvent("chatMessage", "::S.A. HWY PATROL::", { 255, 127, 0 }, "loading model...")
    end

    car[carNum] = CreateVehicle( carHash, location["x"], location["y"], location["z"], location["h"], true, false)
   
    SetVehicleOnGroundProperly(car[carNum])
    SetVehicleEngineOn(car[carNum], true, false, false)
    
    if IsVehicleDriveable(car[carNum], 0) then 
        TriggerEvent("chatMessage", "::S.A. HWY PATROL::", { 255, 127, 0 }, "Unit "..carNum.." On Duty")
    end
    SetEntityAsMissionEntity(car[carNum], true, true)
end

function spawnCop(name, badgeNum, location)
    local copHash
    copHash = GetHashKey(name)
    RequestModel(copHash)
    while not HasModelLoaded(copHash) do
        Wait(1000)
        TriggerEvent("chatMessage", "::S.A. HWY PATROL::", { 255, 127, 0 }, "loading model...")
    end

    cop[badgeNum] = CreatePed(6, copHash, location["x"], location["y"], location["z"], location["h"], true, false)

    TriggerEvent("chatMessage", "::S.A. HWY PATROL::", { 255, 127, 0 }, "officer "..badgeNum.." On Duty")
    SetEntityAsMissionEntity(cop[badgeNum], true, true)
end

function isPlayerAtTarget(target, distance) --checks if player vehicle is on the location

   local playerPed = GetPlayerPed(-1)
   local playerCoords = GetEntityCoords(playerPed, 0)

    if (GetDistanceBetweenCoords(playerCoords, target["x"], target["y"], target["z"]) < distance) then 
        return true
    else 
        return false
    end
end

function checkSpeed()
    local playerPed = GetPlayerPed(-1)
    speed = GetEntitySpeed(GetVehiclePedIsIn(playerPed, false))
    mph = (speed * 2.236936)
    TriggerEvent("chatMessage", "::S.A. HWY PATROL::", { 255, 127, 0 }, speed.." MPH")
    if (mph > 65.0) then
        if isPlayerAtTarget(GetEntityCoords(cop[1]), 500.0) then
            pursuePlayer(1)
        end
        if isPlayerAtTarget(GetEntityCoords(cop[2]), 500.0) then 
            pursuePlayer(2)
        end
    end

end

function pursuePlayer(copNum)

    TriggerEvent("chatMessage", "SAHP:", { 255, 127, 0 }, "Busted!")



    TaskEnterVehicle(cop[copNum], car[copNum], 10000, -1, 2.0, 1, 0)
    while not IsPedInAnyVehicle(cop[copNum]) do
    Citizen.Wait(1)
    end

    playerPed = GetPlayerPed(-1)
    TaskVehicleFollow(cop[copNum], car[copNum], playerPed, 100.0, 1074528293, 10)--TASK_GO_TO_ENTITY(Entity entity, Entity target, int duration, float distance, float speed, float p5, int p6) -- makes him run only
    BlipSiren(car[copNum])

    unitsDispatched = true


    Citizen.Wait(30000) -- wait 30 seconds for pull over
    if ( GetEntitySpeed(GetVehiclePedIsIn(playerPed, false)) > 1.0 ) then 
        SetPlayerWantedLevel(GetPlayerIndex(), 1, false)
        SetPlayerWantedLevelNow(GetPlayerIndex(), true)
        SetWantedLevelDifficulty(GetPlayerIndex(), 0.25)
    end
    if ( GetEntitySpeed(GetVehiclePedIsIn(playerPed, false)) < 1.0 ) then 
        issueTicket(copNum)
    end

end

function issueTicket(copNum) 


    TaskGoToEntity(cop[copNum], playerPed, 30000, 2.0, 1.0, 0, 0)
    Citizen.Wait(10000)
    PlayAmbientSpeech1(cop[copNum], "GENERIC_HI", "SPEECH_PARAMS_STANDARD")
    Citizen.Wait(5000)
    TriggerEvent("chatMessage", "SAHP:", { 255, 127, 0 }, "issuing ticket!")
    TaskEnterVehicle(cop[copNum], car[copNum], 10000, -1, 2.0, 1, 0)
    Citizen.Wait(10000)
    TaskVehiclePark(cop[copNum], car[copNum], carSpawnLocation[copNum]["x"],carSpawnLocation[copNum]["y"], carSpawnLocation[copNum]["z"], carSpawnLocation[copNum]["h"], 1, 5.0, true) --1074528293
    unitsDispatched = false
end

function resetCops(carNum)
    TriggerEvent("chatMessage", "SAHP:", { 255, 127, 0 }, "cop "..copNum.." returning")
    
end

-- void TASK_VEHICLE_PARK(Ped ped, Vehicle vehicle, float x, float y,
-- float z, float heading, int mode, float radius, BOOL keepEngineOn)


--different levels of pursuit

 