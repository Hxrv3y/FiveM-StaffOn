tvRP = Proxy.getInterface("vRP")


local staffon = false 
local clothing = nil 

RegisterNetEvent("vRP:staffon")
AddEventHandler("vRP:staffon", function(staffmode)
    staffon = staffmode
    if staffon then 
        SetEntityInvincible(PlayerPedId(), true)
        local ped = PlayerPedId()
        SetPedComponentVariation(ped, 0, 3, 1, 2) --Head
	SetPedComponentVariation(ped, 1, 3, 1, 2) -- Beard
	SetPedComponentVariation(ped, 2, 3, 1, 2) -- Hair
	SetPedComponentVariation(ped, 3, 3, 1, 2) -- Upper/Undershirt
	SetPedComponentVariation(ped, 4, 3, 1, 2) --Lower/Pants
	SetPedComponentVariation(ped, 5, 3, 1, 2) -- Hands
	SetPedComponentVariation(ped, 6, 3, 1, 2) -- Feet/Shoes
	SetPedComponentVariation(ped, 7, 3, 1, 2) -- Teeth
	SetPedComponentVariation(ped, 8, 3, 1, 2) -- Accessories
	SetPedComponentVariation(ped, 9, 3, 1, 2) -- Task
	SetPedComponentVariation(ped, 10, 3, 1, 2) -- Decal
	SetPedComponentVariation(ped, 11, 3, 1, 2) -- Jbib/Jackets
	--Remove the ones you don't want won't make a difference. Don't change the first number, but second is the Component ID, third is texture and fourth is pallete ID
    else
        SetEntityInvincible(PlayerPedId(), false)
        tvRP.setCustomization({clothing})
        clothing = nil 
    end
end)


Citizen.CreateThread(function()
    while true do 
        if staffon then 
            DrawAdvancedText(0.955, 0.726, 0.025, 0.0048, 0.8, "Staff mode enabled:\nRemember to /staffoff", 255, 0, 0, 255, 6, 0)
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
