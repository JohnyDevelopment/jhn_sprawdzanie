local Main = {

}
Main.wezwanie = function(admin_name)
    SendNUIMessage({
        action = "show",
        admin_name = admin_name

    })
end
Main.koniec = function()
    SendNUIMessage({
        action = "close"
  })
end
RegisterNetEvent("jhn_sprawdzanie:wejdz", Main.wezwanie)
RegisterNetEvent("jhn_sprawdzanie:koniec", Main.koniec)