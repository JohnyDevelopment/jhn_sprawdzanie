ESX = exports["es_extended"]:getSharedObject()
local Main = {
    sprawdzani = {}
}
ESX.RegisterCommand({'sprawdzanie'}, 'admin', function(xPlayer, args, showError)
    Main.id = args.id 
    if Main.id then 
        if GetPlayerName(Main.id) then 
            xPlayer.Scaleform.ShowFreemodeMessage('~r~zapraszam na sprawdzanie', 'quit = perm', 5)
            xPlayer.showNotification('Wezwales '..GetPlayerName(Main.id)..". Na sprawdzanie")
        else 
        end
    else 
        xPlayer.ShowNotification(Locales[Config.lang]['id'])
    end
end, false, {help = Locales[Config.lang]['check_sugestion'], arguments = {{name = 'id', help = Locales[Config.lang]['id_info'], type = 'any'}}})
