print("xx")
local Main = {

}
Main.wezwanie = function(admin_name)
<<<<<<< Updated upstream
    SendNUIMessage({
        action = "show",
        admin_name = admin_names
=======
    print("zostales wezwany na sprawdzanie! przez: "..admin_name)
    SendNUIMessage({
        action = "show",
        admin_name = admin_name
>>>>>>> Stashed changes
    })
end
RegisterNetEvent("jhn_sprawdzanie:wejdz", Main.wezwanie)