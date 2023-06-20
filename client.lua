local Main = {

}
Main.wezwanie = function(admin_name)
    SendNUIMessage({
        action = "show",
        admin_name = admin_names
    })
end
RegisterNetEvent("jhn_sprawdzanie:wejdz", Main.wezwanie)