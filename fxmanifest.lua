fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'John Doe <j.doe@example.com>'
description 'Example resource'
server_scripts {
    'locales.lua',
    'config.lua',
    'server.lua'
} 
files {
    "ui/index.html",
    "ui/script.js",
    "ui/style.css"
}
<<<<<<< Updated upstream
client_scripts { 
=======
client_scripts {
>>>>>>> Stashed changes
    'client.lua'
}
ui_page "ui/index.html"