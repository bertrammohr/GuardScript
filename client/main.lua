local ped = 0

Citizen.CreateThread(function()
    while not HasModelLoaded("csb_mweather") do
        RequestModel("csb_mweather")
        Wait(0)
    end
end)
RegisterCommand("ped", function()
    ped = CreatePed(4, "csb_mweather", 750.9, 1303.37, 360.3, 90.0, true, true)
    GiveWeaponToPed(ped, "WEAPON_CARBINERIFLE", 1, true, true)
end, false)
RegisterCommand("go", function()
    if ped == 0 then
        print("noped")
    end
    TaskGoStraightToCoord(ped, 737.33, 1303.1, 360.3, 1, 7500, 265.77, 0.5)
    Wait(13000)
    TaskGoStraightToCoord(ped, 750.9, 1303.37, 360.3, 1, 7500, 90.0, 0.5)
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if HasEntityClearLosToEntityInFront(ped, PlayerPedId(), 17) then
            TaskShootAtEntity(ped, PlayerPedId(), 2000, GetHashKey("FIRING_PATTERN_FULL_AUTO"))
        end
    end
end)