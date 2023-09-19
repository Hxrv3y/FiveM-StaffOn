tvRP = Proxy.getInterface("vRP")


local staffon = false 
local clothing = nil 

RegisterNetEvent("vRP:staffon")
AddEventHandler("vRP:staffon", function(staffmode)
    staffon = staffmode
    if staffon then 
        if clothing == nil then 
            clothing = tvRP.getCustomization()
        end
        SetEntityInvincible(PlayerPedId(), true)
        local ped = "u_m_m_jesus_01" -- staff ped 
        RequestModel(ped)
        while not HasModelLoaded(ped) do
          Citizen.Wait(0)
        end

        SetPlayerModel(PlayerId(), ped)
        SetModelAsNoLongerNeeded(ped)
        SetPedComponentVariation(ped, 0, 0, 0, 0) --- https://docs.fivem.net/natives/?_0x262B14F48D29DE80 if you wanna change component or something
    else
        SetEntityInvincible(PlayerPedId(), false)
        tvRP.setCustomization({clothing})
        clothing = nil 
    end
end)


Citizen.CreateThread(function()
    while true do 
        if staffon then 
            DrawAdvancedText(0.955, 0.726, 0.025, 0.0048, 0.8, "Staff mode enabled", 255, 0, 0, 255, 6, 0)
        end
        Wait(0)
    end
end)



function DrawAdvancedText(x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
	N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextEntry("STRING")
    AddTextComponentString(text)
	DrawText(x - 0.1+w, y - 0.02+h)
end


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if staffon then
			SetEntityInvincible(PlayerPedId(), true)
			SetPedCanRagdoll(PlayerPedId(), false)
		else
			SetEntityInvincible(PlayerPedId(), false)
			SetPedCanRagdoll(PlayerPedId(), true)
		end
	end
end)