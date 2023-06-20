ESX = exports["es_extended"]:getSharedObject()
local Main = {
    sprawdzani = {}
}
Main.wezwanie = function(xTarget, xPlayer)
    local admin_name = GetPlayerName(xPlayer.source)
    print(xTarget.source)
    TriggerClientEvent('jhn_sprawdzanie:wejdz', xTarget.source, admin_name)
    Main.sprawdzani[xTarget.source] = xTarget
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
            Main.wezwanie(xTarget, xPlayer)
        else 
            xPlayer.showNotification('Uzytkownik o tym id jest offline!')
        end
    end
end, true, {help = "Wezwij na sprawdzanie", validate = true, arguments = {
    {name = 'id', help = "ID gracza", type = 'number'},
}})

AddEventHandler('playerDropped', function(reason)
    local playerId = source
    if Main.sprawdzani[playerId] then
        local playerName = GetPlayerName(playerId)
        print("Gracz " .. playerName .. " opuścił grę.")
    end
end)