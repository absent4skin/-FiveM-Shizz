Citizen.Trace("Drug Mule Says Hello There!")

local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

--DRUG MULE--
--this script will be a mission
--a marker will be on the pause map to start, cycling for each mission between disfferant locations...one at a time randomly
--different vehicles will be used based on level. Must use loadCargo script with this one
--packages will vary from small to very large
--AI will be placed to protect, rob, chase, and deal
--wanted level will be controlled by this program
--try to impliment a simple money system stored in a file, maybe xml or html or ini?, within the server
--assassination and robbery missions too

--future code:
--trigger a server event that triggers a client event for all clients using triggerClientEvent()
--will update and create the position of any non car objects being cargo loaded, so that all players will see the attachment and not just the player doing the attatching
--this program triggers server event, which then triggers client event for all clients
--be sure to make things into mission objects to keep them loaded around the map

--TODO


--------------------------------------------------------------------------------------COORDINATES LIBRARY
numStartLocations = 4 --UPDATE THIS WHEN ADDING NEW STARTING POINTS

local missionStartCoordinates = { --xyz
   [1] = { ['x'] = -11.30, ['y'] = -1438.07, ['z'] = 31.10 }, --franklins livingroom
   [2] = { ['x'] = 0.0, ['y'] = 0.0, ['z'] = 0.0 }, --CHANGEME
   [3] = { ['x'] = 0.0, ['y'] = 0.0, ['z'] = 0.0 }, --CHANGEME
   [4] = { ['x'] = 0.0, ['y'] = 0.0, ['z'] = 0.0 } --CHANGEME
}

local missionPickupsCoordinates = { --xyz
    [1] = {['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220} --harbor_boat
}
--        ["ally_behind_FireDept"]         = { ['x'] = 145.72, ['y'] = -1655.60, ['z'] = 29.30}, --ally behind FireDept
 


local missionDropoffsCoordinates = { --xyz
    [1] = {
        ["harbor_drop"]                  = { ['x'] = 113.69, ['y'] = -2991.50, ['z'] = 5.5}, --harbor
        ['harbor_boat']                  = { ['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220}, --harbor_boat
        ["harbor car 1"]                 = { ['x'] = -24.26, ['y'] = -1434.86, ['z'] = 30.65, ['h'] = 180.0}, --CHANGEME
        ["harbor car 2"]                 = { ['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220} --CHANGEME
    },
    [2] = {
        ["franks_driveway"]              = { ['x'] = -24.26, ['y'] = -1434.86, ['z'] = 30.65, ['h'] = 180.0}, --franklins driveway
        ['harbor_boat']                  = { ['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220}, --harbor_boat
        ["harbor car 1"]                 = { ['x'] = -24.26, ['y'] = -1434.86, ['z'] = 30.65, ['h'] = 180.0}, --CHANGEME
        ["harbor car 2"]                 = { ['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220} --CHANGEME
    },
    [3] = {
        ["franks_driveway"]              = { ['x'] = -24.26, ['y'] = -1434.86, ['z'] = 30.65, ['h'] = 180.0}, --franklins driveway
        ['harbor_boat']                  = { ['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220}, --harbor_boat
        ["harbor car 1"]                 = { ['x'] = -24.26, ['y'] = -1434.86, ['z'] = 30.65, ['h'] = 180.0}, --CHANGEME
        ["harbor car 2"]                 = { ['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220} --CHANGEME
    },
    [4] = {
        ["franks_driveway"]              = { ['x'] = -24.26, ['y'] = -1434.86, ['z'] = 30.65, ['h'] = 180.0}, --franklins driveway
        ['harbor_boat']                  = { ['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220}, --harbor_boat
        ["harbor car 1"]                 = { ['x'] = -24.26, ['y'] = -1434.86, ['z'] = 30.65, ['h'] = 180.0}, --CHANGEME
        ["harbor car 2"]                 = { ['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220} --CHANGEME
    }
}

local missionVehicleSpawnCoordinates = { 
    [1] = {
        ["franks_driveway"]              = { ['x'] = -24.26, ['y'] = -1434.86, ['z'] = 30.65, ['h'] = 180.0}, --franklins driveway
        ['harbor_boat']                  = { ['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220}, --harbor_boat
        ["harbor car 1"]                 = { ['x'] = -24.26, ['y'] = -1434.86, ['z'] = 30.65, ['h'] = 180.0}, --CHANGEME
        ["harbor car 2"]                 = { ['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220} --CHANGEME
    },
    [2] = {
        ["franks_driveway"]              = { ['x'] = -24.26, ['y'] = -1434.86, ['z'] = 30.65, ['h'] = 180.0}, --franklins driveway
        ['harbor_boat']                  = { ['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220}, --harbor_boat
        ["harbor car 1"]                 = { ['x'] = -24.26, ['y'] = -1434.86, ['z'] = 30.65, ['h'] = 180.0}, --CHANGEME
        ["harbor car 2"]                 = { ['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220} --CHANGEME
    },
    [3] = {
        ["franks_driveway"]              = { ['x'] = -24.26, ['y'] = -1434.86, ['z'] = 30.65, ['h'] = 180.0}, --franklins driveway
        ['harbor_boat']                  = { ['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220}, --harbor_boat
        ["harbor car 1"]                 = { ['x'] = -24.26, ['y'] = -1434.86, ['z'] = 30.65, ['h'] = 180.0}, --CHANGEME
        ["harbor car 2"]                 = { ['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220} --CHANGEME
    },
    [4] = {
        ["franks_driveway"]              = { ['x'] = -24.26, ['y'] = -1434.86, ['z'] = 30.65, ['h'] = 180.0}, --franklins driveway
        ['harbor_boat']                  = { ['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220}, --harbor_boat
        ["harbor car 1"]                 = { ['x'] = -24.26, ['y'] = -1434.86, ['z'] = 30.65, ['h'] = 180.0}, --CHANGEME
        ["harbor car 2"]                 = { ['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220} --CHANGEME
    }
}

local missionFriendSpawnCoordinates = { --xyzh
    [1] = {
        ["franks_driveway"]              = { ['x'] = -24.26, ['y'] = -1434.86, ['z'] = 30.65, ['h'] = 180.0}, --franklins driveway
        ['harbor_boat']                  = { ['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220}, --harbor_boat
        ["harbor car 1"]                 = { ['x'] = -24.26, ['y'] = -1434.86, ['z'] = 30.65, ['h'] = 180.0}, --CHANGEME
        ["harbor car 2"]                 = { ['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220} --CHANGEME
    },
    [2] = {
        ["franks_driveway"]              = { ['x'] = -24.26, ['y'] = -1434.86, ['z'] = 30.65, ['h'] = 180.0}, --franklins driveway
        ['harbor_boat']                  = { ['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220}, --harbor_boat
        ["harbor car 1"]                 = { ['x'] = -24.26, ['y'] = -1434.86, ['z'] = 30.65, ['h'] = 180.0}, --CHANGEME
        ["harbor car 2"]                 = { ['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220} --CHANGEME
    },
    [3] = {
        ["franks_driveway"]              = { ['x'] = -24.26, ['y'] = -1434.86, ['z'] = 30.65, ['h'] = 180.0}, --franklins driveway
        ['harbor_boat']                  = { ['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220}, --harbor_boat
        ["harbor car 1"]                 = { ['x'] = -24.26, ['y'] = -1434.86, ['z'] = 30.65, ['h'] = 180.0}, --CHANGEME
        ["harbor car 2"]                 = { ['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220} --CHANGEME
    },
    [4] = {
        ["franks_driveway"]              = { ['x'] = -24.26, ['y'] = -1434.86, ['z'] = 30.65, ['h'] = 180.0}, --franklins driveway
        ['harbor_boat']                  = { ['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220}, --harbor_boat
        ["harbor car 1"]                 = { ['x'] = -24.26, ['y'] = -1434.86, ['z'] = 30.65, ['h'] = 180.0}, --CHANGEME
        ["harbor car 2"]                 = { ['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220} --CHANGEME
    }
}

local missionEnemySpawnCoordinates = {
    [1] = {
        [1]  = { ['x'] = 105.75, ['y'] = -2992.85, ['z'] =   20.0, ['h'] =  220.0}, --harbor_boat
        [2]  = { ['x'] = 105.75, ['y'] = -2994.85, ['z'] =   20.0, ['h'] =  220.0}, --harbor_boat
        [3]  = { ['x'] = 105.75, ['y'] = -2996.85, ['z'] =   20.0, ['h'] =  220.0}, --harbor_boat
        [4]  = { ['x'] = 105.75, ['y'] = -2998.85, ['z'] =   20.0, ['h'] =  220.0} --harbor_boat
    }
}

local missionTargetSpawnCoordinates = {
    [1] = {
        ["franks_driveway"]              = { ['x'] = -24.26, ['y'] = -1434.86, ['z'] = 30.65, ['h'] = 180.0}, --franklins driveway
        ['harbor_boat']                  = { ['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220}, --harbor_boat
        ["harbor car 1"]                 = { ['x'] = -24.26, ['y'] = -1434.86, ['z'] = 30.65, ['h'] = 180.0}, --CHANGEME
        ["harbor car 2"]                 = { ['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220} --CHANGEME
    },
    [2] = {
        ["franks_driveway"]              = { ['x'] = -24.26, ['y'] = -1434.86, ['z'] = 30.65, ['h'] = 180.0}, --franklins driveway
        ['harbor_boat']                  = { ['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220}, --harbor_boat
        ["harbor car 1"]                 = { ['x'] = -24.26, ['y'] = -1434.86, ['z'] = 30.65, ['h'] = 180.0}, --CHANGEME
        ["harbor car 2"]                 = { ['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220} --CHANGEME
    },
    [3] = {
        ["franks_driveway"]              = { ['x'] = -24.26, ['y'] = -1434.86, ['z'] = 30.65, ['h'] = 180.0}, --franklins driveway
        ['harbor_boat']                  = { ['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220}, --harbor_boat
        ["harbor car 1"]                 = { ['x'] = -24.26, ['y'] = -1434.86, ['z'] = 30.65, ['h'] = 180.0}, --CHANGEME
        ["harbor car 2"]                 = { ['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220} --CHANGEME
    },
    [4] = {
        ["franks_driveway"]              = { ['x'] = -24.26, ['y'] = -1434.86, ['z'] = 30.65, ['h'] = 180.0}, --franklins driveway
        ['harbor_boat']                  = { ['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220}, --harbor_boat
        ["harbor car 1"]                 = { ['x'] = -24.26, ['y'] = -1434.86, ['z'] = 30.65, ['h'] = 180.0}, --CHANGEME
        ["harbor car 2"]                 = { ['x'] = 100.75, ['y'] = -2992.85, ['z'] =   2.0, ['h'] =  220} --CHANGEME
    }
}

--------------------------------------------------------------------------------- MODEL NAME LIBRARY

local drugBagNames = {
    "bkr_prop_weed_bigbag_01a",
    "bkr_prop_weed_bigbag_02a",
    "bkr_prop_weed_bigbag_03a",
    "bkr_prop_weed_smallbag_01a"
}

local thugNames = {
    [1] = "a_m_m_eastsa_02",
    [1] = "s_m_y_dealer_01",
    [1] = "a_m_m_eastsa_02",
    [1] = "a_m_m_eastsa_02"
}


--------------------------------------------------------------------------------- Variables
local onMission = false
local startMission = false
local isMissionOver = true
local i = 1
local vehicleHash
local blip = {}
local missionVehicle = {}
local cop = {}


--------------------------------------------------------------------------------- Functions

function runMissionObjectives(missionNumber)
    isMissionOver = false
    spawnMissionVehicles(missionNumber)
    spawnMissionObjects(missionNumber)
    spawnMissionModels(missionNumber)
    TriggerEvent("mt:missiontext", "running mission now", 3000)
    Wait(3000)

    while not isMissionOver do --test for mission ending situations
        local playerPed = GetPlayerPed(-1)
        --check if player is dead
        --check if vehicle was destroyed
        --check if time ran out
        --dealer or dealer thugs killed or spooked before deal was finished
        drawMissionBlips(missionNumber)
        --walkthrough:
        --get into car
        while not IsPedInVehicle(playerPed, missionVehicle["franks_driveway"], false) do
            TriggerEvent("mt:missiontext", "Get In The Car!", 3000)
            Wait(3000)
        end
        --drive to pickup
        
        local playerCoords = GetEntityCoords(playerPed, 0)
        while not (GetDistanceBetweenCoords(playerCoords,missionPickupsCoordinates[missionNumber]['x'], missionPickupsCoordinates[missionNumber]['y'],missionPickupsCoordinates[missionNumber]['z']) < 10) do
            TriggerEvent("mt:missiontext", "Drive To The Meeting!", 3000)
            Wait(3000)
            playerCoords = GetEntityCoords(playerPed, 0)
        end
        --get out and talk to dealer

        --'roll dice' to determine outcome of deal
        --if deal goes good:
        --give player duffel bag
        --open trunk
        --put duffel bag into trunk
        --close trunk
        --give player destination 
        --spawn thugs or goons

        TriggerEvent("mt:missiontext", "finishing mission now...", 3000)
        isMissionOver = true
    end    

    clearMission()
    clearMissionBlips("harbor_boat")
    clearMissionBlips("franks_driveway")
    clearMissionBlips(1)
end

function clearMission()

end

function drawMissionBlips(missionNumber)

    drawBlip("franks_driveway", 1, missionVehicleSpawnCoordinates, 67, 0.8)
    drawBlip("harbor_boat", 1, missionVehicleSpawnCoordinates, 67, 0.8)
    drawDestinationBlip(1, missionPickupsCoordinates, 1, 0.8)

end

function drawBlip(name, missionNumber, location, blipType, size)

    blip[name] = AddBlipForCoord(location[missionNumber][name]["x"], location[missionNumber][name]["y"], location[missionNumber][name]["z"])
    SetBlipSprite(blip[name], blipType) --sets icon design, this is 'armoured van'
    SetBlipDisplay(blip[name], 2) --displayId, see id #'s below, 2 shows on map and minimap, and is selectable
    SetBlipScale(blip[name], size) --size

end

function drawDestinationBlip(missionNumber, location, blipType, size)

    blip[missionNumber] = AddBlipForCoord(location[missionNumber]["x"], location[missionNumber]["y"], location[missionNumber]["z"])
    SetBlipSprite(blip[missionNumber], blipType) --sets icon design, this is 'armoured van'
    SetBlipDisplay(blip[missionNumber], 2) --displayId, see id #'s below, 2 shows on map and minimap, and is selectable
    SetBlipScale(blip[missionNumber], size) --size

end

function clearMissionBlips(name)
    SetBlipDisplay(blip[name], 0) --displayId, see id #'s below, 2 shows on map and minimap, and is selectable
end

function spawnMissionVehicles(missionNumber) 
    TriggerEvent("mt:missiontext", "Attempting to Spawn Vehicles...", 3000)
    if (missionNumber == 1) then 
        --spawn dominator in franks_driveway and boat next to dock
        Wait(3000)
        spawnVehicle('dominator', 1, "franks_driveway")
        TriggerEvent("mt:missiontext", "vehicle 1 spawned", 3000)
        Wait(3000)
        spawnVehicle('dinghy2', 1, "harbor_boat")
        TriggerEvent("mt:missiontext", "vehicle 2 spawned", 3000)
        Wait(3000)
    end
end

function spawnMissionObjects(missionNumber) 

    if (missionNumber == 1) then 
        --spawn bag in allyway
        TriggerEvent("mt:missiontext", "object spawned", 3000)
        Wait(3000)
    end
end    

function spawnMissionModels(missionNumber) 

    if (missionNumber == 1) then 
        --spawn guy in allyway and guys at boat
        spawnCop("s_m_y_dealer_01", 1, missionEnemySpawnCoordinates[1][1])
        spawnCop("a_m_m_eastsa_02", 2, missionEnemySpawnCoordinates[1][2])
        spawnCop("a_m_m_eastsa_02", 3, missionEnemySpawnCoordinates[1][3])
        spawnCop("a_m_m_eastsa_02", 4, missionEnemySpawnCoordinates[1][4])
        TriggerEvent("mt:missiontext", "all thugs Spawned", 3000)
        Wait(3000)
    end
end   

function spawnVehicle(vehicleName, missionNumber, locationName)
    vehicleHash = GetHashKey(vehicleName)
    RequestModel(vehicleHash)
    while not HasModelLoaded(vehicleHash) do
        Wait(4)
    end
    missionVehicle[locationName] = CreateVehicle(vehicleHash, missionVehicleSpawnCoordinates[missionNumber][locationName]["x"], missionVehicleSpawnCoordinates[missionNumber][locationName]["y"], missionVehicleSpawnCoordinates[missionNumber][locationName]["z"], missionVehicleSpawnCoordinates[missionNumber][locationName]["h"], true, false)
    SetVehicleOnGroundProperly(missionVehicle[locationName])
    SetVehicleEngineOn(missionVehicle[locationName], true, false, false)
    SetEntityAsMissionEntity(missionVehicle[locationName], true, true);
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

    TriggerEvent("chatMessage", "::S.A. HWY PATROL::", { 255, 127, 0 }, "Thug "..badgeNum.." On Duty")
    SetEntityAsMissionEntity(cop[badgeNum], true, true)
end






--Threads

Citizen.CreateThread(function()  --Check for mission start proximity
    
    while true do
        
        TriggerEvent("chatMessage", "TEST", { 25, 127, 75 }, "start of while true do")
        Citizen.Wait(1000)
        local playerPed = GetPlayerPed(-1)
        local playerCoords = GetEntityCoords(playerPed, 0)

        while(not startMission and (GetDistanceBetweenCoords(playerCoords,missionStartCoordinates[i]['x'], missionStartCoordinates[i]['y'],missionStartCoordinates[i]['z']) < 10.0))do
            TriggerEvent("mt:missiontext", "I need some work done...you dig? Press N+ to start.", 5000) 
            Wait(5000)
             --key controlling
            if( IsControlPressed(1, Keys["N+"]) ) then --start mission
                TriggerEvent("mt:missiontext", "Mission Started!", 3000) 
                startMission = true
                onMission = true
            end
            playerCoords = GetEntityCoords(playerPed, 0)
        end

        --Check for start, then spawn stuff
        if startMission then 
            TriggerEvent("mt:missiontext", i, 5000)
            Wait(3000)
            --call functions to spawn everything

            startMission = false
            runMissionObjectives(i)
        end
        i=i+1
        if i > numStartLocations then --reset i to 1
            i=1
        end
    end --endloop
end)