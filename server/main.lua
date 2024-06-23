ESX = exports["es_extended"]:getSharedObject()

----------------------
--		Opłata		--
----------------------

ESX.RegisterServerCallback('cypek:checkmoney', function(source, cb)
    local oplata = 50
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getMoney() >= oplata then
        xPlayer.removeMoney(oplata)
        cb(true)
    else
		TriggerClientEvent('ox_lib:notify', source, {title= 'Błąd', description ='Opłata za Pojazd wynosi '..oplata..'$', position = 'top-left',type ='error'})
        cb(false)
    end
end)

ESX.RegisterServerCallback('cypek:oddajmoney', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local oplata = 50
    xPlayer.addMoney(oplata)
end)

-----------------------
-- Zbieranie Kuraków --
-----------------------

RegisterServerEvent('cypek:zbierz')
AddEventHandler('cypek:zbierz', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    local item = xPlayer.getInventoryItem('kurczak')

    if item.count > 100 then --tutaj ustalasz max ilość Kuraków

        TriggerClientEvent('ox_lib:notify', source, {title= 'Uwaga!', description ='Masz zbyt Dużo Kuraków!', position = 'top-left',type ='error'})

    else
        xPlayer.addInventoryItem('kurczak', math.random(1, 5)) -- item który zbierasz i min,max ilość 
    end
end)

-----------------------
-- Przeróbka Kuraków --
-----------------------

RegisterServerEvent('cypek:przerobka')
AddEventHandler('cypek:przerobka', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem('kurczak') -- item co przerabiasz

    if item.count < 1 then 

        TriggerClientEvent('ox_lib:notify', source, {title= 'Uwaga!', description ='Nazbieraj więcej kuraków!', position = 'top-left',type ='error'})

    else
        xPlayer.removeInventoryItem('kurczak', 2) -- item , ilość potrzebna do przróbki
        xPlayer.addInventoryItem('przerobionykurczak', 1) -- item po przeróbce
    end
end)

-----------------------
-- Pakowanie Kuraków --
-----------------------

RegisterServerEvent('cypek:pakownie')
AddEventHandler('cypek:pakownie', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem('przerobionykurczak') -- item co sprzedaje

    if item.count < 1 then 

        TriggerClientEvent('ox_lib:notify', source, {title= 'Uwaga!', description ='Nazbieraj więcej Pierśi z kurczaka!', position = 'top-left',type ='error'})

    else
        xPlayer.removeInventoryItem(item, 1) -- item , ilość potrzebna do przróbki
        xPlayer.addInventoryItem('zapakowanykurczak', 1) -- item po przeróbce
    end
end)

--------------
-- Sprzedaz --
--------------

RegisterServerEvent('cypek:sprzedaz')
AddEventHandler('cypek:sprzedaz', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem('zapakowanykurczak') -- item co sprzedajesz
    local itemCount = xPlayer.getInventoryItem('zapakowanykurczak').count
    local losowailosc = math.random(15, 25) -- min,max cena sprzedazy

    if item.count < 1 then 

        TriggerClientEvent('ox_lib:notify', source, {title= 'Informacja', description ='Nie masz nic do sprzedania!', position = 'top-left',type ='info'})

    else
        xPlayer.removeInventoryItem('zapakowanykurczak', itemCount) -- 
        xPlayer.addInventoryItem('money', losowailosc * itemCount)
    end
end)