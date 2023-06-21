ESX = exports["es_extended"]:getSharedObject()
local Main = {
    sprawdzani = {}
}
Main.wezwanie = function(xTarget, xPlayer)
    local admin_name = GetPlayerName(xPlayer.source)
    TriggerClientEvent('jhn_sprawdzanie:wejdz', xTarget.source, admin_name)
    Main.sprawdzani[xTarget.source] = xTarget
end
Main.infodb = function(xTarget, xPlayer)
    local discord = ""
    local dcid = ""
    
    identifiers = GetNumPlayerIdentifiers(xTarget.source)
    for i = 0, identifiers + 1 do
        if GetPlayerIdentifier(xTarget.source, i) ~= nil then
            if string.match(GetPlayerIdentifier(xTarget.source, i), "discord") then
                discord = GetPlayerIdentifier(xTarget.source, i)
                dcid = string.sub(discord, 9, -1)
            end
        end
    end
    MySQL.query('SELECT * FROM `sprawdzanie` WHERE `dcid` = ?', {
        dcid
    }, function(response)
        if response then
            for i = 1, #response do
                local row = response[i]
                xPlayer.showNotification("Gracz byl sprawdzany przez: "..row.hounds..". Z wynikiem: "..row.wynik)
            end
        else 
        end
    end)
end
Main.wynik = function(xTarget, xPlayer, wynik, hounds)
    if xTarget or xPlayer or wynik or hounds then 
        if Main.sprawdzani[xTarget.source] then 
            if wynik <= 0 or wynik >= 3 then 
                xPlayer.showNotification('Zle podano wynik!')
            else
                Main.sprawdzani[xTarget.source] = nil
                if wynik == 1 then -- clear
                
                    local discord = ""
                    local id = ""
                    
                    identifiers = GetNumPlayerIdentifiers(xTarget.source)
                    for i = 0, identifiers + 1 do
                        if GetPlayerIdentifier(xTarget.source, i) ~= nil then
                            if string.match(GetPlayerIdentifier(xTarget.source, i), "discord") then
                                discord = GetPlayerIdentifier(xTarget.source, i)
                                id = string.sub(discord, 9, -1)
                            end
                        end
                    end
                
                    MySQL.insert('INSERT INTO sprawdzanie (dcid, hounds, wynik) VALUES (?, ?, ?)',
                    {id,hounds,'clear'})
                    TriggerClientEvent("jhn_sprawdzanie:koniec", xTarget.source)
                else -- cheater
                
                    local discord = ""
                    local id = ""
                    
                    identifiers = GetNumPlayerIdentifiers(xTarget.source)
                    for i = 0, identifiers + 1 do
                        if GetPlayerIdentifier(xTarget.source, i) ~= nil then
                            if string.match(GetPlayerIdentifier(xTarget.source, i), "discord") then
                                discord = GetPlayerIdentifier(xTarget.source, i)
                                id = string.sub(discord, 9, -1)
                            end
                        end
                    end
                
                    MySQL.insert('INSERT INTO sprawdzanie (dcid, hounds, wynik) VALUES (?, ?, ?)',
                    {id,hounds,'cheater'})
                    TriggerClientEvent("jhn_sprawdzanie:koniec", xTarget.source)
                    --- ban function
                    DropPlayer(xTarget.source, "Ban mm")
                end
            end
        else 
            xPlayer.showNotification('Gracz nie jest sprawdzany!')
        end
    else 
        xPlayer.showNotification('Uzulepnij wszystko!')
    end
end
ESX.RegisterCommand('sprawdzanie', {'best', 'mod', 'admin', 'superadmin'}, function(xPlayer, args, showError)
    if args.id then
        local xTarget = ESX.GetPlayerFromId(args.id)
        if xPlayer and xTarget then
            Main.wezwanie(xTarget, xPlayer)
        else 
            xPlayer.showNotification('Uzytkownik o tym id jest offline!')
        end
    end
end, true, {help = "Wezwij na sprawdzanie", validate = true, arguments = {
    {name = 'id', help = "ID gracza", type = 'number'},
}})
ESX.RegisterCommand('wynik_sprawdzania', {'best', 'mod', 'admin', 'superadmin'}, function(xPlayer, args, showError)
    if args.id then
        local xTarget = ESX.GetPlayerFromId(args.id)
        if xPlayer and xTarget then
            Main.wynik(xTarget, xPlayer, args.wynik, args.hounds)
        else 
            xPlayer.showNotification('Uzytkownik o tym id jest offline!')
        end
    end
end, true, {help = "Wezwij na sprawdzanie", validate = true, arguments = {
    {name = 'id', help = "ID gracza", type = 'number'},
    {name = 'wynik', help = "Daj wynik sprawdzania 1 clear, 2 cheater", type = 'number'},
    {name = 'hounds', help = "Hounds", type = 'any'},
}})

AddEventHandler('playerDropped', function(reason)
    local playerId = source
    if Main.sprawdzani[playerId] then
        local playerName = GetPlayerName(playerId)
        local xTarget = Main.sprawdzani[source]
        -- ban func
        local discord = ""
        local id = ""
        
        identifiers = GetNumPlayerIdentifiers(xTarget.source)
        for i = 0, identifiers + 1 do
            if GetPlayerIdentifier(xTarget.source, i) ~= nil then
                if string.match(GetPlayerIdentifier(xTarget.source, i), "discord") then
                    discord = GetPlayerIdentifier(xTarget.source, i)
                    id = string.sub(discord, 9, -1)
                end
            end
        end
    
        MySQL.insert('INSERT INTO sprawdzanie (dcid, hounds, wynik) VALUES (?, ?, ?)',
        {id,hounds,'cheater'})
        Main.sprawdzani[source] = nil
    end
end)

ESX.RegisterCommand('sprawdzanie_info', {'best', 'mod', 'admin', 'superadmin'}, function(xPlayer, args, showError)
    if args.id then
        local xTarget = ESX.GetPlayerFromId(args.id)
        if xPlayer and xTarget then
            Main.infodb(xTarget, xPlayer)
        else 
            xPlayer.showNotification('Uzytkownik o tym id jest offline!')
        end
    end
end, true, {help = "Wezwij na sprawdzanie", validate = true, arguments = {
    {name = 'id', help = "ID gracza", type = 'number'},
}})
