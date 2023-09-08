fx_version 'cerulean'
game 'gta5'

author 'Yoshi by UrbanV'
description 'Give Cars to Friends by UrbanV'
version '1.0.0'

client_scripts {
    'config.lua',
    'client/main.lua',
    -- Füge hier weitere Client-Skriptdateien hinzu, wenn du welche hast
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
}

