fx_version 'cerulean'

game 'gta5'

author 'c7pek'
description 'Prosty Job Rzeźnika. https://discord.gg/wtuc73KNDu'
lua54 'yes'
version '1.0'

client_scripts {
	'config.lua',
	'client/main.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
	'@es_extended/imports.lua'
}

server_scripts {
	'config.lua',
	'server/main.lua'
}

dependencies {
	'ox_lib',
	'ox_inventory',
	'ox_target'
}
