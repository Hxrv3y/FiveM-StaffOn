Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vrp_staffmode")

local staffmode = {}

RegisterCommand("staffon", function(source, args)
	local user_id = vRP.getUserId({source})
	if vRP.hasPermission({user_id, "admin.tickets"}) then 
		if not staffmode[source] then 
			TriggerClientEvent("vRP:staffon", source, true)
			staffmode[source] = source
		end
	end
end)

RegisterCommand("staffoff", function(source, args)
	TriggerClientEvent("vRP:staffon", source, false)
	staffmode[source] = nil
end)
