resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

author "Shaz"


client_scripts {
	"@vrp/client/Tunnel.lua",
    "@vrp/client/Proxy.lua",
	'client/main.lua',
}


server_scripts {
	"@vrp/lib/utils.lua",
	'server/main.lua',
}
