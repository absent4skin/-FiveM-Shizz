--lock and unlock car with keyfob by pressing some key
--save locked vehicle as mission entity

local locked = false
local playerPed = GetPlayerPed(-1)
local playerCar = GetVehiclePedIsIn(playerPed, false)

--[[                            anim@mp_player_intmenu@key_fob@         fob_click
void TASK_PLAY_ANIM(  Ped ped,      char *animDictionary,          char *animationName, float speed, float speedMultiplier, int duration, int flag, float playbackRate,    BOOL lockX, BOOL lockY, BOOL lockZ)
]]--
RegisterNetEvent("ClaimCar")
AddEventHandler("ClaimCar", function()
    locked = false
    playerPed = GetPlayerPed(-1)
    playerCar = GetVehiclePedIsIn(playerPed, false)
    SetEntityAsMissionEntity(playerCar, true, true)
end)

RegisterNetEvent("Lock/Unlock Car")
AddEventHandler("Lock/Unlock Car", function()

    RequestAnimDict("anim@mp_player_intmenu@key_fob@")
    while not HasAnimDictLoaded("anim@mp_player_intmenu@key_fob@") do
        Citizen.Wait(0)
    end

    TaskPlayAnim(playerPed, "anim@mp_player_intmenu@key_fob@", "fob_click", 5.0, 1.0, -1, 0, 0, false, false, false)

    if locked then
        SetVehicleDoorsLockedForAllPlayers(playerCar, false)
        locked = false
        StartVehicleHorn(playerCar, 1, GetHashKey("normal"), 0)
    else
        SetVehicleDoorsLockedForAllPlayers(playerCar, true)
        locked = true
        StartVehicleHorn(playerCar, 1, GetHashKey("normal"), 0)
    end

end)

RegisterCommand("claim", function(source, args, raw)
    TriggerEvent("ClaimCar")
end, false)

RegisterCommand("key", function(source, args, raw)
    TriggerEvent("Lock/Unlock Car")
end, false)