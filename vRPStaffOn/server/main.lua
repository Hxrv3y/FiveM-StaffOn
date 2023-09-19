Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vrp_staffmode")

--[[

For other scripts do TriggerClientEvent("vRP:staffon", source, true) for them to staff on and TriggerClientEvent("vRP:staffon", source, false) for them to staff off
    
]]

local staffmode = {}

RegisterCommand("staffmode", function(source, args)
	local user_id = vRP.getUserId({source})
	if vRP.hasPermission({user_id, "staff.mode"}) then 
		if not staffmode[source] then 
			TriggerClientEvent("vRP:staffon", source, true)
			staffmode[source] = source
		else
			TriggerClientEvent("vRP:staffon", source, false)
			staffmode[source] = nil
		end
	end
end)
