fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'John Doe <j.doe@example.com>'
description 'Example resource'
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'locales.lua',
    'config.lua',
    'server.lua'  
} 
files {
    "ui/index.html",
    "ui/script.js",
    "ui/style.css"
}
client_scripts {
    'client.lua'
}
ui_page "ui/index.html"