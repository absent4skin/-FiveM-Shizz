--TruckFuckers V1-- by absent4skin--------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tables  -------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

local truckingCompany = { --
    ["utool"]      = {["x"] = 2685.036, ["y"] = 3515.579, ["z"] = 53.4 },------ utool
    ["lumbermill"] = {["x"] =   -568.3, ["y"] =   5253.1, ["z"] = 70.5 },------ Lumber Mill
    ["impound"]    = {["x"] =   409.50, ["y"] = -1623.75, ["z"] = 29.30}, ----- impound lot
    ["farm"]       = {["x"] =   2242.0, ["y"] =   5153.0, ["z"] = 57.3 }, ----- farm
    ["refinery"]   = {["x"] =   2670.0, ["y"] =   1613.0, ["z"] = 24.5 }, ----- oil refinery
    ["docks"]      = {["x"] =   -59.60, ["y"] = -2518.66, ["z"] = 7.40 } ------ docks gas station hut
}

local truckSpawnLocation = {
    ["utool"]      = {["x"] =  2678.28, ["y"] = 3531.75,  ["z"] = 53.40, ["h"] = 335.0},------ utool
    ["lumbermill"] = {["x"] =   -578.3, ["y"] =   5253.1, ["z"] = 70.5,  ["h"] = 180.0},------ Lumber Mill
    ["impound"]    = {["x"] =   399.50, ["y"] = -1623.75, ["z"] = 29.30, ["h"] = 180.0}, ----- impound lot
    ["farm"]       = {["x"] =   2232.0, ["y"] =   5153.0, ["z"] = 57.3,  ["h"] = 180.0}, ----- farm
    ["refinery"]   = {["x"] =  2672.65, ["y"] =  1661.33, ["z"] = 25.0,  ["h"] = 0.00}, ------ oil refinery
    ["docks"]      = {["x"] =   -45.54, ["y"] = -2529.75, ["z"] = 6.10,  ["h"] = 320.0} ------ dock gas station
}

local trailerSpawnLocation = {
    ["utool"]      = {["x"] = 2674.80,  ["y"] = 3517.00,  ["z"] = 53.1,  ["h"] = 68.0}, --- Utool
    ["lumbermill"] = {["x"] = -803.82,  ["y"] = 5405.32,  ["z"] = 34.25, ["h"] = 36.0},	--- Lumber Mill
    ["refinery"]   = {["x"] = 2684.53,  ["y"] = 1553.63,  ["z"] = 25.0,  ["h"] = 0.00}, --- tanker trailer
    ["docks"]      = {["x"] =   -25.93, ["y"] = -2539.35, ["z"] = 6.10,  ["h"] = 54.00} --- dock gas station
}

local refineryParkingLocations = { --these are randomly selected to overwrite parkingLocation["refinery"], the array actually used, at the start of each full mission loop
    [1] =  {["x"] = -67.0,["y"] = -2526.0, ["z"] = 6.1},  ------------------------GAS STATIONS
    [2] =  {["x"] = -66.0,["y"] = -1760.0, ["z"] = 57.0},
    [3] =  {["x"] = 173.0,["y"] = -1559.0, ["z"] = 34.0},
    [4] =  {["x"] = -318.0,["y"] = -1472.0,["z"] = 37.0},
    [5] =  {["x"] = 1207.0,["y"] = 1400.0, ["z"] = 42.0},
    [6] =  {["x"] = 267.0,["y"] = -1261.0, ["z"] = 35.0},
    [7] =  {["x"] = -524.0,["y"] = -1209.0,["z"] = 23.0},
    [8] =  {["x"] = 820.0,["y"] = -1029.0, ["z"] = 33.0},
    [9] =  {["x"] = -720.0,["y"] = -934.0, ["z"] = 75.0},
    [10] = {["x"] = 1178.0,["y"] = -328.0, ["z"] = 75.0},
    [11] = {["x"] = -2094.0,["y"] = -317.0,["z"] = 18.0},
    [12] = {["x"] = -1435.0,["y"] = -274.0,["z"] = 46.0},
    [13] = {["x"] = 623.0,["y"] = 267.0,   ["z"] = 109.0},
    [14] = {["x"] = 2578.0,["y"] = 360.75, ["z"] = 118.0},
    [15] = {["x"] = -1802.0,["y"] = 803.0, ["z"] = 144.0},
    [16] = {["x"] = -2552.0,["y"] = 2331.0,["z"] = 41.9},
    [17] = {["x"] = 2535.0,["y"] = 2596.0, ["z"] = 37.94},
    [18] = {["x"] = 262.0,["y"] = 2604.0,  ["z"] = 44.0},
    [19] = {["x"] = 1205.0,["y"] = 2658.0, ["z"] = 37.0},
    [20] = {["x"] = 1088.0,["y"] = 2669.0, ["z"] = 43.0},
    [21] = {["x"] = 52.0,["y"] = 2783.0,   ["z"] = 57.0},
    [22] = {["x"] = 2676.0,["y"] = 3265.0, ["z"] = 60.0},
    [23] = {["x"] = 1780.0,["y"] = 3326.0, ["z"] = 41.0},
    [24] = {["x"] = 1690.0,["y"] = 4926.0, ["z"] = 46.0},
    [25] = {["x"] = 2002.0,["y"] = 3775.0, ["z"] = 39.0},
    [26] = {["x"] = -90.0,["y"] = 6415.0,  ["z"] = 37.0},
    [27] = {["x"] = 1701.0,["y"] = 6418.0, ["z"] = 37.0},
    [28] = {["x"] = 177.0,["y"] = 6602.0,  ["z"] = 37.0} -----------------------GAS STATIONS
}

local refinerySignoffLocations = {
    [1] =  {["x"] = -67.0,["y"] = -2526.0, ["z"] = 6.1},  ------------------------GAS STATIONS
    [2] =  {["x"] = -66.0,["y"] = -1760.0, ["z"] = 57.0},
    [3] =  {["x"] = 173.0,["y"] = -1559.0, ["z"] = 34.0},
    [4] =  {["x"] = -318.0,["y"] = -1472.0,["z"] = 37.0},
    [5] =  {["x"] = 1207.0,["y"] = 1400.0, ["z"] = 42.0},
    [6] =  {["x"] = 267.0,["y"] = -1261.0, ["z"] = 35.0},
    [7] =  {["x"] = -524.0,["y"] = -1209.0,["z"] = 23.0},
    [8] =  {["x"] = 820.0,["y"] = -1029.0, ["z"] = 33.0},
    [9] =  {["x"] = -720.0,["y"] = -934.0, ["z"] = 75.0},
    [10] = {["x"] = 1178.0,["y"] = -328.0, ["z"] = 75.0},
    [11] = {["x"] = -2094.0,["y"] = -317.0,["z"] = 18.0},
    [12] = {["x"] = -1435.0,["y"] = -274.0,["z"] = 46.0},
    [13] = {["x"] = 623.0,["y"] = 267.0,   ["z"] = 109.0},
    [14] = {["x"] = 2578.0,["y"] = 360.75, ["z"] = 118.0},
    [15] = {["x"] = -1802.0,["y"] = 803.0, ["z"] = 144.0},
    [16] = {["x"] = -2552.0,["y"] = 2331.0,["z"] = 41.9},
    [17] = {["x"] = 2535.0,["y"] = 2596.0, ["z"] = 37.94},
    [18] = {["x"] = 262.0,["y"] = 2604.0,  ["z"] = 44.0},
    [19] = {["x"] = 1205.0,["y"] = 2658.0, ["z"] = 37.0},
    [20] = {["x"] = 1088.0,["y"] = 2669.0, ["z"] = 43.0},
    [21] = {["x"] = 52.0,["y"] = 2783.0,   ["z"] = 57.0},
    [22] = {["x"] = 2676.0,["y"] = 3265.0, ["z"] = 60.0},
    [23] = {["x"] = 1780.0,["y"] = 3326.0, ["z"] = 41.0},
    [24] = {["x"] = 1690.0,["y"] = 4926.0, ["z"] = 46.0},
    [25] = {["x"] = 2002.0,["y"] = 3775.0, ["z"] = 39.0},
    [26] = {["x"] = -90.0,["y"] = 6415.0,  ["z"] = 37.0},
    [27] = {["x"] = 1701.0,["y"] = 6418.0, ["z"] = 37.0},
    [28] = {["x"] = 177.0,["y"] = 6602.0,  ["z"] = 37.0} -----------------------GAS STATIONS
}

local docksParkingLocations = {
    [1] =  {["x"] = -67.0,["y"] = -2526.0, ["z"] = 6.1},  ------------------------Temporary locations for placeholders
    [2] =  {["x"] = -66.0,["y"] = -1760.0, ["z"] = 57.0},
    [3] =  {["x"] = 173.0,["y"] = -1559.0, ["z"] = 34.0},
    [4] =  {["x"] = -318.0,["y"] = -1472.0,["z"] = 37.0},
    [5] =  {["x"] = 1207.0,["y"] = 1400.0, ["z"] = 42.0},
    [6] =  {["x"] = 267.0,["y"] = -1261.0, ["z"] = 35.0},
    [7] =  {["x"] = -524.0,["y"] = -1209.0,["z"] = 23.0},
    [8] =  {["x"] = 820.0,["y"] = -1029.0, ["z"] = 33.0},
    [9] =  {["x"] = -720.0,["y"] = -934.0, ["z"] = 75.0},
    [10] = {["x"] = 1178.0,["y"] = -328.0, ["z"] = 75.0},
    [11] = {["x"] = -2094.0,["y"] = -317.0,["z"] = 18.0},
    [12] = {["x"] = -1435.0,["y"] = -274.0,["z"] = 46.0},
    [13] = {["x"] = 623.0,["y"] = 267.0,   ["z"] = 109.0},
    [14] = {["x"] = 2578.0,["y"] = 360.75, ["z"] = 118.0},
    [15] = {["x"] = -1802.0,["y"] = 803.0, ["z"] = 144.0},
    [16] = {["x"] = -2552.0,["y"] = 2331.0,["z"] = 41.9},
    [17] = {["x"] = 2535.0,["y"] = 2596.0, ["z"] = 37.94},
    [18] = {["x"] = 262.0,["y"] = 2604.0,  ["z"] = 44.0},
    [19] = {["x"] = 1205.0,["y"] = 2658.0, ["z"] = 37.0},
    [20] = {["x"] = 1088.0,["y"] = 2669.0, ["z"] = 43.0},
    [21] = {["x"] = 52.0,["y"] = 2783.0,   ["z"] = 57.0},
    [22] = {["x"] = 2676.0,["y"] = 3265.0, ["z"] = 60.0},
    [23] = {["x"] = 1780.0,["y"] = 3326.0, ["z"] = 41.0},
    [24] = {["x"] = 1690.0,["y"] = 4926.0, ["z"] = 46.0},
    [25] = {["x"] = 2002.0,["y"] = 3775.0, ["z"] = 39.0},
    [26] = {["x"] = -90.0,["y"] = 6415.0,  ["z"] = 37.0},
    [27] = {["x"] = 1701.0,["y"] = 6418.0, ["z"] = 37.0},
    [28] = {["x"] = 177.0,["y"] = 6602.0,  ["z"] = 37.0} -----------------------
}

local docksSignoffLocations = {
    [1] =  {["x"] = -67.0,["y"] = -2526.0, ["z"] = 6.1},  ------------------------Temporary locations for placeholders
    [2] =  {["x"] = -66.0,["y"] = -1760.0, ["z"] = 57.0},
    [3] =  {["x"] = 173.0,["y"] = -1559.0, ["z"] = 34.0},
    [4] =  {["x"] = -318.0,["y"] = -1472.0,["z"] = 37.0},
    [5] =  {["x"] = 1207.0,["y"] = 1400.0, ["z"] = 42.0},
    [6] =  {["x"] = 267.0,["y"] = -1261.0, ["z"] = 35.0},
    [7] =  {["x"] = -524.0,["y"] = -1209.0,["z"] = 23.0},
    [8] =  {["x"] = 820.0,["y"] = -1029.0, ["z"] = 33.0},
    [9] =  {["x"] = -720.0,["y"] = -934.0, ["z"] = 75.0},
    [10] = {["x"] = 1178.0,["y"] = -328.0, ["z"] = 75.0},
    [11] = {["x"] = -2094.0,["y"] = -317.0,["z"] = 18.0},
    [12] = {["x"] = -1435.0,["y"] = -274.0,["z"] = 46.0},
    [13] = {["x"] = 623.0,["y"] = 267.0,   ["z"] = 109.0},
    [14] = {["x"] = 2578.0,["y"] = 360.75, ["z"] = 118.0},
    [15] = {["x"] = -1802.0,["y"] = 803.0, ["z"] = 144.0},
    [16] = {["x"] = -2552.0,["y"] = 2331.0,["z"] = 41.9},
    [17] = {["x"] = 2535.0,["y"] = 2596.0, ["z"] = 37.94},
    [18] = {["x"] = 262.0,["y"] = 2604.0,  ["z"] = 44.0},
    [19] = {["x"] = 1205.0,["y"] = 2658.0, ["z"] = 37.0},
    [20] = {["x"] = 1088.0,["y"] = 2669.0, ["z"] = 43.0},
    [21] = {["x"] = 52.0,["y"] = 2783.0,   ["z"] = 57.0},
    [22] = {["x"] = 2676.0,["y"] = 3265.0, ["z"] = 60.0},
    [23] = {["x"] = 1780.0,["y"] = 3326.0, ["z"] = 41.0},
    [24] = {["x"] = 1690.0,["y"] = 4926.0, ["z"] = 46.0},
    [25] = {["x"] = 2002.0,["y"] = 3775.0, ["z"] = 39.0},
    [26] = {["x"] = -90.0,["y"] = 6415.0,  ["z"] = 37.0},
    [27] = {["x"] = 1701.0,["y"] = 6418.0, ["z"] = 37.0},
    [28] = {["x"] = 177.0,["y"] = 6602.0,  ["z"] = 37.0} -----------------------
}

local signoffLocation = {
    ["lumbermill"] = {["x"] = 1240.00,   ["y"] = -3179.00,   ["z"] = 7.15},	 -- dock warehouse
    ["refinery"] =   {["x"] = 0.00000,   ["y"] = 0.00,       ["z"] = 0.00},  -- gets randomly assigned from tables above
    ["utool"] =      {["x"] = 78.80,     ["y"] = 111.78,     ["z"] = 81.17}, -- PostOP warehouse
    ["docks"] =      {["x"] =  0.00,     ["y"] = 0.00,       ["z"] = 0.00 }  -- gets randomly assigned from tables above
}

local parkingLocation = {
    ["lumbermill"] = {["x"] = 1267.50,   ["y"] = -3185.35,   ["z"] = 6.00},	 -- dock warehouse
    ["refinery"] =   {["x"] = 0.00000,   ["y"] = 0.00,       ["z"] = 0.00}, --gets randomly overwritten with 1 of 28 locations at start and restart of main loop
    ["utool"] =      {["x"] = 93.42,     ["y"] = 104.53,     ["z"] = 79.86}, -- PostOP warehouse
    ["docks"] =      {["x"] =  0.00,     ["y"] = 0.00,       ["z"] = 0.000} --gets randomly overwritten with 1 of 28 locations at start and restart of main loop
}

local truckModel = { --assigned trucks for each start location, mission is controlled, essentially,  by the strings in the indicies
    ["utool"] = "phantom",
    ["lumbermill"] = "hauler",
    ["refinery"] = "phantom",
    ["impound"] = "flatbed",
    ["farm"] = "sadler",
    ["docks"] = "phantom"
}

local trailerModel = {
    ["utool"] = "trailers",
    ["lumbermill"] = "trailerlogs",
    ["refinery"] = "tanker",
    ["impound"] = "washington", --program will accept cars as 'trailers', for attatching to tow truck using seperate tow mod, works same as other missions
    ["farm"] = "baletrailer",
    ["docks"] = "trailers2"
}

--------------------------------------------------------------
--------------------------------------------------------------
-- Variables -------------------------------------------------
local playerPed -- object containing player model, location, etc...
local playerCoords -- array of x y z
local nearestMission --string, name of mission to be passed into indicies of tables and functions
local onMission = false --for looping
local inRange = false --for looping while in range of mission
local truck -- vehicle object
local truckHash --hash
local trailer --vehicle object
local trailerHash --hash
local randInt = 0 --used for selecting random locations
local blip = {} --array of blip objects
local textDisplayed = {}
textDisplayed["Welcome"] = false --used to only print welcome message once while looping checking if in range still


-----------------------------------------------------------
--MAIN LOOP------------------------------------------------
-----------------------------------------------------------
Citizen.CreateThread(function()

    initializeTruckingCompanyBlips() --print blips on map for starting locations, happens only once

    while true do --loop
        Citizen.Wait(500)
    
       nearestMission = getMissionInRange() --sets inRange to true or false, returns string "missionname" i.e. "utool" or "refinery" etc.., or nil if not close enough

        while (inRange) do

            Citizen.Wait(1000)
            promptMissionStart() --displays text and keeps checking for input to modify onMission
            if onMission then
                textDisplayed["Welcome"] = false --prompt text can now reappear next time near and after mission is over
                runMission(nearestMission) --controls mission checkpoints
            end
            getMissionInRange() --modifies inRange var to see if player leaves area, exiting loop
        end
        textDisplayed["Welcome"] = false --a flag to make the text only display once in promptMissionStart, on the first loop of -while inRange do-
        

    end
end)

-----------------------------------------------------------
----------functions----------------------------------------
-----------------------------------------------------------
function initializeTruckingCompanyBlips() --works
   
    TriggerEvent("chatMessage", "truckwork", { 255, 127, 0 }, "blips loading")
    
    blip["utool"] = AddBlipForCoord(truckingCompany["utool"]["x"], truckingCompany["utool"]["y"], truckingCompany["utool"]["z"])
    SetBlipSprite(blip["utool"], 67) --sets icon design, this is 'armoured van'
    SetBlipDisplay(blip["utool"], 2) --displayId, see id #'s below, 2 shows on map and minimap, and is selectable
    SetBlipScale(blip["utool"], 0.8) --size

    blip["lumbermill"] = AddBlipForCoord(truckingCompany["lumbermill"]["x"], truckingCompany["lumbermill"]["y"], truckingCompany["lumbermill"]["z"])
    SetBlipSprite(blip["lumbermill"], 67)
    SetBlipDisplay(blip["lumbermill"], 2)
    SetBlipScale(blip["lumbermill"], 0.8)

    blip["impound"] = AddBlipForCoord(truckingCompany["impound"]["x"], truckingCompany["impound"]["y"], truckingCompany["impound"]["z"])
    SetBlipSprite(blip["impound"], 67)
    SetBlipDisplay(blip["impound"], 2)
    SetBlipScale(blip["impound"], 0.8)

    blip["farm"] = AddBlipForCoord(truckingCompany["farm"]["x"], truckingCompany["farm"]["y"], truckingCompany["farm"]["z"])
    SetBlipSprite(blip["farm"], 67)
    SetBlipDisplay(blip["farm"], 2)
    SetBlipScale(blip["farm"], 0.8)

    blip["refinery"] = AddBlipForCoord(truckingCompany["refinery"]["x"], truckingCompany["refinery"]["y"], truckingCompany["refinery"]["z"])
    SetBlipSprite(blip["refinery"], 67)
    SetBlipDisplay(blip["refinery"], 2)
    SetBlipScale(blip["refinery"], 0.8)

    blip["docks"] = AddBlipForCoord(truckingCompany["docks"]["x"], truckingCompany["docks"]["y"], truckingCompany["docks"]["z"])
    SetBlipSprite(blip["docks"], 67)
    SetBlipDisplay(blip["docks"], 2)
    SetBlipScale(blip["docks"], 0.8)
    
    TriggerEvent("chatMessage", "truckwork", { 255, 127, 0 }, "blips loaded successfully")

    --displayId = 2 : Shows on Main map and Radar, selectable
    --displayId = 3 : Shows on Main map but not Radar (not selectable on map)
    --displayId = 5 : Shows on Radar but not Main map
    --displayId = 8 : shows on Main map and Radar, not selectable
end

function getMissionInRange() --works

    inRange = false
    --TriggerEvent("chatMessage", "truckwork", { 255, 127, 0 }, "gmir starting")
    playerPed = GetPlayerPed(-1)
    playerCoords = GetEntityCoords(playerPed, 0)
    --TriggerEvent("chatMessage", "truckwork", { 255, 127, 0 }, "player found")

    if (GetDistanceBetweenCoords(playerCoords, truckingCompany["utool"]["x"], truckingCompany["utool"]["y"], truckingCompany["utool"]["z"]) < 5.0) then
        inRange = true
        return "utool"
    end

    if (GetDistanceBetweenCoords(playerCoords, truckingCompany["lumbermill"]["x"], truckingCompany["lumbermill"]["y"], truckingCompany["lumbermill"]["z"]) < 5.0) then
        inRange = true
        return "lumbermill"
    end

    if (GetDistanceBetweenCoords(playerCoords, truckingCompany["impound"]["x"], truckingCompany["impound"]["y"], truckingCompany["impound"]["z"]) < 5.0) then
        inRange = true
        return "impound"
    end

    if (GetDistanceBetweenCoords(playerCoords, truckingCompany["farm"]["x"], truckingCompany["farm"]["y"], truckingCompany["farm"]["z"]) < 5.0) then
        inRange = true
        return "farm"
    end

    if (GetDistanceBetweenCoords(playerCoords, truckingCompany["refinery"]["x"], truckingCompany["refinery"]["y"], truckingCompany["refinery"]["z"]) < 5.0) then
        inRange = true
        return "refinery"
    end

    if (GetDistanceBetweenCoords(playerCoords, truckingCompany["docks"]["x"], truckingCompany["docks"]["y"], truckingCompany["docks"]["z"]) < 5.0) then
        inRange = true
        return "docks"
    end

end

function promptMissionStart()
    if textDisplayed["Welcome"] == false then
        TriggerEvent("chatMessage", "truckwork", { 255, 127, 0 }, "Welcome to "..nearestMission..". Hold NumberPad+ to start your shift!")
        textDisplayed["Welcome"] = true
    end
    --check for user input
    if IsControlPressed(1, 96) then
        onMission = true
    end
end

function runMission(mission) -- this single function calls on other functions to sequence the mission events, simply put mission into parameter
    TriggerEvent("chatMessage", "truckwork", { 255, 127, 0 }, "running mission....."..mission)
    setRefineryDestination() --selects random dest for refinery
    setDocksDestination()    --selects random dest for docks

    spawnTruck(truckModel[nearestMission])
    spawnTrailer(trailerModel[nearestMission])
    drawVehicleBlips()
    
    updateMissionStatus() --waits for events to happen(i.e. arrival, detatchment, truck destroyed or not, etc...)
    resetMission()

end

function setRefineryDestination()
    randInt = GetRandomIntInRange(1, 28)
    parkingLocation["refinery"] = refineryParkingLocations[randInt]
    signoffLocation["refinery"] = refinerySignoffLocations[randInt]
end

function setDocksDestination()
    randInt = GetRandomIntInRange(1, 28)
    parkingLocation["docks"] = docksParkingLocations[randInt]
    signoffLocation["docks"] = docksSignoffLocations[randInt]
end

function spawnTruck(name)

    truckHash = GetHashKey(name)
    RequestModel(truckHash)
    while not HasModelLoaded(truckHash) do
        Wait(1)
    end

    truck = CreateVehicle( truckHash, truckSpawnLocation[nearestMission]["x"], truckSpawnLocation[nearestMission]["y"], truckSpawnLocation[nearestMission]["z"], truckSpawnLocation[nearestMission]["h"], true, false)
   
    SetVehicleOnGroundProperly(truck)
    SetVehicleEngineOn(truck, true, false, false)
    
    if IsVehicleDriveable(truck, 0) then 
        TriggerEvent("chatMessage", "truckwork", { 255, 127, 0 }, "truck spawned")
    end
    SetEntityAsMissionEntity(truck, true, true);
end

function spawnTrailer(name)
    trailerHash = GetHashKey(name)
    RequestModel(trailerHash)
    while not HasModelLoaded(trailerHash) do
        Wait(1)
    end
    trailer = CreateVehicle( trailerHash, trailerSpawnLocation[nearestMission]["x"], trailerSpawnLocation[nearestMission]["y"], trailerSpawnLocation[nearestMission]["z"], trailerSpawnLocation[nearestMission]["h"], true, false)
    SetVehicleOnGroundProperly(trailer)
    SetVehicleEngineOn(trailer, true, false, false)
    if IsVehicleDriveable(trailer, 0) then 
        TriggerEvent("chatMessage", "truckwork", { 255, 127, 0 }, "trailer spawned")
    end
    SetEntityAsMissionEntity(trailer, true, true);
end

function drawVehicleBlips()    
    blip["truck"] = AddBlipForEntity(truck)
    SetBlipSprite(blip["truck"], 1) --1 for vis, 2 for invis
    SetBlipColour(blip["truck"], 17)
    SetBlipRoute(blip["truck"], false)
    Wait(50)

    blip["trailer"] = AddBlipForEntity(trailer)
    SetBlipSprite(blip["trailer"], 1) --1 for vis, 2 for invis
    SetBlipColour(blip["trailer"], 17)
    SetBlipRoute(blip["trailer"], false)
    Wait(50)
end

function updateMissionStatus()

    
    while (not IsEntityAttachedToAnyVehicle(trailer)) do --wait for attatchment
        Citizen.Wait(1)
    end

    drawParkingBlip()

    while (not atParkingLocation()) do --wait for arrival
        Citizen.Wait(3000)
    end

    TriggerEvent("chatMessage", "truckwork", { 255, 127, 0 }, "Disconnect trailer and go get a signature!")
    SetBlipSprite(blip["parkinglocation"], 2)
    SetBlipRoute(blip["parkinglocation"], false)
    drawSignoffBlip()

    while (IsEntityAttachedToAnyVehicle(trailer) or not atSignoffLocation()) do --wait for detatchment and signoff
        Citizen.Wait(1)
    end

    Citizen.Wait(1000)
    TriggerEvent("chatMessage", "truckwork", { 255, 127, 0 }, "Job Finished!")

end

function drawParkingBlip()

        blip["parkinglocation"] = AddBlipForCoord(parkingLocation[nearestMission]["x"], parkingLocation[nearestMission]["y"], parkingLocation[nearestMission]["z"])
        SetBlipSprite(blip["parkinglocation"], 1)
        SetBlipColour(blip["parkinglocation"], 2)
        SetBlipRoute(blip["parkinglocation"], true)
        TriggerEvent("chatMessage", "truckwork", { 255, 127, 0 }, "Drive the trailer to the destination")

end

function atParkingLocation()

    playerPed = GetPlayerPed(-1)
    playerCoords = GetEntityCoords(playerPed, 0)

  
    if (GetDistanceBetweenCoords(playerCoords, parkingLocation[nearestMission]["x"], parkingLocation[nearestMission]["y"], parkingLocation[nearestMission]["z"]) < 5.0) then 
        return true
    else 
        return false
    end

end

function drawSignoffBlip()

    blip["signofflocation"] = AddBlipForCoord(signoffLocation[nearestMission]["x"], signoffLocation[nearestMission]["y"], signoffLocation[nearestMission]["z"])
    SetBlipSprite(blip["signofflocation"], 1)
    SetBlipColour(blip["signofflocation"], 2)
    SetBlipRoute(blip["signofflocation"], true)

end

function atSignoffLocation()

    playerPed = GetPlayerPed(-1)
    playerCoords = GetEntityCoords(playerPed, 0)

  
    if (GetDistanceBetweenCoords(playerCoords, signoffLocation[nearestMission]["x"], signoffLocation[nearestMission]["y"], signoffLocation[nearestMission]["z"]) < 5.0) then 
        return true
    else 
        return false
    end

end

function resetMission()
    
    Citizen.Wait(3000)
    TriggerEvent("chatMessage", "truckwork", { 255, 127, 0 }, "mission over, resetting...!")
    hideVehicleBlips()
    hideMissionBlips()
    SetEntityAsNoLongerNeeded(truck)
    SetEntityAsNoLongerNeeded(trailer)
    onMission = false
    inRange = false

end   

function hideVehicleBlips()    
   
    SetBlipSprite(blip["truck"], 2) --1 for vis, 2 for invis
    SetBlipSprite(blip["trailer"], 2) --1 for vis, 2 for invis
    Wait(50)
end

function hideMissionBlips()
    SetBlipSprite(blip["parkinglocation"], 2)
    SetBlipRoute(blip["parkinglocation"], false)
    SetBlipSprite(blip["signofflocation"], 2)
    SetBlipRoute(blip["signofflocation"], false)
end