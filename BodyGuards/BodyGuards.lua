--[[    Body Guards
using textchat commands
    spawn a crew of 3 allied guards, and 3 enemy guards at a location


]]

local ballasSpawnLocations = {}
local groveSpawnLocations = {}

local bodyGuard = {}

local enemyGuard = {}

local playerPed

local playerCoordinates

RegisterCommand("spawn grove crew", function(source, args, raw)
    TriggerEvent("spawngrovecrew")
end, false)

RegisterCommand("spawn ballas crew", function(source, args, raw)
    TriggerEvent("spawnballascrew")
end, false)

RegisterNetEvent("spawngrovecrew")
RegisterNetEvent("spawnballascrew")

AddEventHandler("spawngrovecrew", function()
    playerPed = GetPlayerPed(-1)
    playerCoordinates = GetPlayerCoordinates(playerPed)
    spawnBodyGuard("ig_ballasog", 1, playerCoordinates)
    spawnBodyGuard("ig_ballasog", 2, playerCoordinates)
    spawnBodyGuard("ig_ballasog", 3, playerCoordinates)
end)

AddEventHandler("spawnballascrew", function()
    playerPed = GetPlayerPed(-1)
    playerCoordinates = GetPlayerCoordinates(playerPed)
    spawnBodyGuard("ig_ballasog", 1, playerCoordinates)
    spawnBodyGuard("ig_ballasog", 2, playerCoordinates)
    spawnBodyGuard("ig_ballasog", 3, playerCoordinates)
end)




function spawnBodyGuard(name, num, location)

    local pedHash
    pedHash = GetHashKey(name)
    RequestModel(pedHash)
    while not HasModelLoaded(pedHash) do
        Wait(500)
        TriggerEvent("chatMessage", "::BodyGuards::", { 0, 127, 127 }, "loading model...")
    end

    bodyGuard[num] = CreatePed(6, pedHash, location["x"], location["y"], location["z"], location["h"], true, false)

    TriggerEvent("chatMessage", "::BodyGuards::", { 0, 127, 127 }, "spawned guard")
    SetEntityAsMissionEntity(bodyGuard[num], true, true)
end

function spawnEnemyGuard(name, num, location)

    local pedHash
    pedHash = GetHashKey(name)
    RequestModel(pedHash)
    while not HasModelLoaded(pedHash) do
        Wait(500)
        TriggerEvent("chatMessage", "::BodyGuards::", { 0, 127, 127 }, "loading model...")
    end

    enemyGuard[num] = CreatePed(6, pedHash, location["x"], location["y"], location["z"], location["h"], true, false)

    TriggerEvent("chatMessage", "::BodyGuards::", { 0, 127, 127 }, "spawned enemy guard")
    SetEntityAsMissionEntity(enemyGuard[num], true, true)
end