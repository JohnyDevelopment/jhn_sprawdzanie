print("xx")
local Main = {

}
Main.wezwanie = function(admin_name)
    print("zostales wezwany na sprawdzanie! przez: "..admin_name)
    SendNUIMessage({
        action = "show",
        admin_name = admin_name

    })
end
RegisterNetEvent("jhn_sprawdzanie:wejdz", Main.wezwanie)