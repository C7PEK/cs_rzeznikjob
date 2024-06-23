ESX = exports["es_extended"]:getSharedObject()

local PlayerData, JobBlips = {}, {}, {}, {}
local przebieralniablip = {}
local maauto = false
local maubrania = false

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
	blips()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	deleteBlips()
	blips()
end)

-----------
-- Blipy --
-----------

function deleteBlips()
	if JobBlips[1] ~= nil then
		for i=1, #JobBlips, 1 do
		RemoveBlip(JobBlips[i])
		JobBlips[i] = nil
		end
	end
end

function blips()

    if PlayerData.job ~= nil and PlayerData.job.name == 'rzeznik' then

		local blip2 = AddBlipForCoord(-71.17, 6266.33, 31.12)

		SetBlipSprite (blip2, 442)
		SetBlipDisplay(blip2, 4)
		SetBlipScale  (blip2, 0.6)
		SetBlipColour (blip2, 7)
		SetBlipAsShortRange(blip2, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString('Baza Rzeźnika')
		EndTextCommandSetBlipName(blip2)
		table.insert(JobBlips, blip2)
	end

	if PlayerData.job ~= nil and PlayerData.job.name == 'rzeznik' then

		local blip6 = AddBlipForCoord(-76.18, 6252.83, 31.09)

		SetBlipSprite (blip6, 73)
		SetBlipDisplay(blip6, 4)
		SetBlipScale  (blip6, 0.6)
		SetBlipColour (blip6, 0)
		SetBlipAsShortRange(blip6, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString('Przebieralnia')
		EndTextCommandSetBlipName(blip6)
		table.insert(JobBlips, blip6)
	end
end

function przebranieblip()


		local blip3 = AddBlipForCoord(-85.1, 6234.19, 31.12)

		SetBlipSprite (blip3, 1)
		SetBlipDisplay(blip3, 4)
		SetBlipScale  (blip3, 0.4)
		SetBlipColour (blip3, 5)
		SetBlipAsShortRange(blip3, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString('#1 Zbieranie')
		EndTextCommandSetBlipName(blip3)
		table.insert(przebieralniablip, blip3)


		local blip4 = AddBlipForCoord(-102.92, 6209.94, 31.12)

		SetBlipSprite (blip4, 1)
		SetBlipDisplay(blip4, 4)
		SetBlipScale  (blip4, 0.4)
		SetBlipColour (blip4, 5)
		SetBlipAsShortRange(blip4, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString('#2 Przeróbka')
		EndTextCommandSetBlipName(blip4)
		table.insert(przebieralniablip, blip4)


		local blip5 = AddBlipForCoord(-154.15, 6141.44, 32.34)

		SetBlipSprite (blip5, 1)
		SetBlipDisplay(blip5, 4)
		SetBlipScale  (blip5, 0.4)
		SetBlipColour (blip5, 5)
		SetBlipAsShortRange(blip5, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString('#3 Pakowanie')
		EndTextCommandSetBlipName(blip5)
		table.insert(przebieralniablip, blip5)

		local blip6 = AddBlipForCoord(-72.01, 6279.99, 32.33)

		SetBlipSprite (blip6, 290)
		SetBlipDisplay(blip6, 4)
		SetBlipScale  (blip6, 0.4)
		SetBlipColour (blip6, 3)
		SetBlipAsShortRange(blip6, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString('Garaż')
		EndTextCommandSetBlipName(blip6)
		table.insert(przebieralniablip, blip6)

		local blip7 = AddBlipForCoord(-184.85, 6167.35, 31.51)

		SetBlipSprite (blip7, 290)
		SetBlipDisplay(blip7, 4)
		SetBlipScale  (blip7, 0.4)
		SetBlipColour (blip7, 3)
		SetBlipAsShortRange(blip7, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString('Garaż')
		EndTextCommandSetBlipName(blip7)
		table.insert(przebieralniablip, blip7)

		local blip8 = AddBlipForCoord(954.17, -2110.05, 30.55)

		SetBlipSprite (blip8, 500)
		SetBlipDisplay(blip8, 4)
		SetBlipScale  (blip8, 0.6)
		SetBlipColour (blip8, 2)
		SetBlipAsShortRange(blip8, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString('#4 Sprzedaż')
		EndTextCommandSetBlipName(blip8)
		table.insert(przebieralniablip, blip8)
end

function deleteBlips2()
	if przebieralniablip[1] ~= nil then
		for i=1, #przebieralniablip, 1 do
		RemoveBlip(przebieralniablip[i])
		przebieralniablip[i] = nil
		end
	end
end
------------------------------
--		Przebieralnia		--
------------------------------

RegisterNetEvent('cs_rzeznikjob:szatnia')
AddEventHandler('cs_rzeznikjob:szatnia', function()
	Otworzubraniamenumechanik()
end)

exports.ox_target:addSphereZone({
	coords = vec3( -76.0, 6252.99, 32.09),
	radius = 1.5,
	debug = false,
	options = {
		{
			name = 'przebieralnia',
			icon = 'fa-solid fa-shirt',
			label = 'Przebieralnia',
			event = 'cs_rzeznikjob:szatnia',
			groups = {["rzeznik"] = 0},
			distance = 2,
		}
	}
})

function cleanPlayer(playerPed)
	SetPedArmour(playerPed, 0)
	ClearPedBloodDamage(playerPed)
	ResetPedVisibleDamage(playerPed)
	ClearPedLastWeaponDamage(playerPed)
	ResetPedMovementClipset(playerPed, 0)
end

function setUniform(job, playerPed)
	TriggerEvent('skinchanger:getSkin', function(skin)
  
	  if skin.sex == 0 then
		if Config.Ubrania[job].male ~= nil then
		  TriggerEvent('skinchanger:loadClothes', skin, Config.Ubrania[job].male)
		else
			lib.notify({
				title = 'Informacja',
				description = 'Brak ubrań w szafce!',
				type = 'info',
				position = 'top-left'
				
			})
		end
	  else
		if Config.Ubrania[job].female ~= nil then
		  TriggerEvent('skinchanger:loadClothes', skin, Config.Ubrania[job].female)
		else
			lib.notify({
				title = 'Informacja',
				description = 'Brak ubrań w szafce!',
				type = 'info',
				position = 'top-left'
				
			})

		end
	  end
  
	end)
  end





function Otworzubraniamenumechanik()

  local playerPed = GetPlayerPed(-1)

  local elements = {
    { label = ('Ubrania Cywilne'), value = 'citizen_wear' }, 
	{ label = ('Ubrania Robocze'), value = 'robocze' },
  }


  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'cloakroom',
    {
      title    = ('Szatnia'),
      align    = 'right',
      elements = elements,
    },
    function(data, menu)

      cleanPlayer(playerPed)

      if data.current.value == 'citizen_wear' then
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
          TriggerEvent('skinchanger:loadSkin', skin)
		  deleteBlips2()
        end)
      end

      if
	    data.current.value == 'robocze'
      then
        setUniform(data.current.value, playerPed)
		maubrania = true
		przebranieblip()
      end
    end,
    function(data, menu)
      menu.close()

    end
  )
end

----------------------
--		Garaż		--
----------------------

RegisterNetEvent('cs_rzeznikjob:oddaj')
AddEventHandler('cs_rzeznikjob:oddaj', function()
	OddajPojazd()
end)

RegisterNetEvent('cs_rzeznikjob:spawnauto')
AddEventHandler('cs_rzeznikjob:spawnauto', function()

		local coords = vec3(-74.43, 6278.22, 30.43)
		local heading = 45.99
		local oplata = 50

		if ESX.Game.IsSpawnPointClear(coords, 5) then
			ESX.TriggerServerCallback('cypek:checkmoney', function(cb)
				if cb then
					ESX.Game.SpawnVehicle(Config.Auto, coords, heading, function(vehicle)
						maauto = true
						platenum = math.random(100, 2000)
						local plate =  "CS"..platenum
						SetVehicleNumberPlateText(vehicle, plate)
						SetPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
						SetNewWaypoint(954.17, -2110.05)
						lib.notify({
							title = 'Informacja',
							description = 'Van został wynajęty.',
							type = 'success',
							position = 'top-left'
						})
					end)
				end
			end)
		else

			lib.notify({
				title = 'Informacja',
				description = 'Miejsce wyjmowania pojazdu jest zablokowane!',
				type = 'info',
				position = 'top-left'
			})

		end
end)

-- Garaż 2

RegisterNetEvent('cs_rzeznikjob:spawnauto2')
AddEventHandler('cs_rzeznikjob:spawnauto2', function()

		local coords = vec3(-189.94, 6171.59, 31.05)
		local heading = 314.21
		local oplata = 50

		if ESX.Game.IsSpawnPointClear(coords, 5) then
			ESX.TriggerServerCallback('cypek:checkmoney', function(cb)
				if cb then
					ESX.Game.SpawnVehicle(Config.Auto, coords, heading, function(vehicle)
						maauto = true
						platenum = math.random(100, 2000)
						local plate =  "CS"..platenum
						SetVehicleNumberPlateText(vehicle, plate)
						SetPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
						SetNewWaypoint(954.17, -2110.05)
						lib.notify({
							title = 'Informacja',
							description = 'Van został wynajęty.',
							type = 'success',
							position = 'top-left'
						})
					end)
				end
			end)
		else

			lib.notify({
				title = 'Informacja',
				description = 'Miejsce wyjmowania pojazdu jest zablokowane!',
				type = 'info',
				position = 'top-left'
			})

		end
end)

 function OddajPojazd()
	local playerCoords = GetEntityCoords(PlayerPedId())
	vehicles = ESX.Game.GetVehiclesInArea(playerCoords, 5.0)

	if #vehicles > 0 then
		for i=1, #vehicles, 1 do
			Model = GetEntityModel(vehicles[i])

			if true then
				local plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicles[i]))
				ESX.Game.DeleteVehicle(vehicles[i])
				maauto = false
				malawete = false
				lib.notify({
					title = 'Informacja',
					description = 'Oddano Pojazd',
					type = 'success',
					position = 'top-left'
				})

				ESX.TriggerServerCallback('cypek:oddajmoney')

			end
		end
	else
		lib.notify({
			title = 'Informacja',
			description = 'Pojazd jest zbyt daleko!',
			type = 'error',
			position = 'top-left'
		})
	end
end

-- Target Garaze

exports.ox_target:addSphereZone({
	coords = vec3( -72.01, 6279.99, 32.33),
	radius = 1.5,
	debug = false,
	options = {
		{
			name = 'garaz',
			icon = 'fa-solid fa-car',
			label = 'Wynajmij Pojazd',
			event = 'cs_rzeznikjob:spawnauto',
			groups = {["rzeznik"] = 0},
			distance = 2,
			canInteract = function()
				return maubrania
			  end
		},
		{
			name = 'oddajpojazd',
			icon = 'fa-solid fa-car',
			label = 'Oddaj Pojazd',
			event = 'cs_rzeznikjob:oddaj',
			groups = {["rzeznik"] = 0},
			distance = 2,
			canInteract = function()
				return maauto
			  end
		}
	}
})

-- #2

exports.ox_target:addSphereZone({
	coords = vec3( -185.33, 6166.85, 32.5),
	radius = 1.5,
	debug = false,
	options = {
		{
			name = 'garaz',
			icon = 'fa-solid fa-car',
			label = 'Wynajmij Pojazd',
			event = 'cs_rzeznikjob:spawnauto2',
			groups = {["rzeznik"] = 0},
			distance = 2,
			canInteract = function()
				return maubrania
			  end
		},
		{
			name = 'oddajpojazd',
			icon = 'fa-solid fa-car',
			label = 'Oddaj Pojazd',
			event = 'cs_rzeznikjob:oddaj',
			groups = {["rzeznik"] = 0},
			distance = 2,
			canInteract = function()
				return maauto
			  end
		}
	}
})

-- PEDY

-- Garaż
Citizen.CreateThread(function() 
	RequestModel(GetHashKey('s_m_y_factory_01'))
	while not HasModelLoaded(GetHashKey('s_m_y_factory_01')) do
		Wait(155)
	end
	while CreatePed == nil do
		Citizen.Wait(100)
	end
	local ped = CreatePed(4, GetHashKey('s_m_y_factory_01'), -72.01, 6279.99, 31.42-1, 132.14, false, true)
	TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_CLIPBOARD', 0, true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
end)

-- Garaż #2

Citizen.CreateThread(function() 
	RequestModel(GetHashKey('s_m_y_factory_01'))
	while not HasModelLoaded(GetHashKey('s_m_y_factory_01')) do
		Wait(155)
	end
	while CreatePed == nil do
		Citizen.Wait(100)
	end
	local ped2 = CreatePed(4, GetHashKey('s_m_y_factory_01'), -185.33, 6166.85, 31.5-1, 45.56, false, true)
	TaskStartScenarioInPlace(ped2, 'WORLD_HUMAN_CLIPBOARD', 0, true)
	FreezeEntityPosition(ped2, true)
	SetEntityInvincible(ped2, true)
	SetBlockingOfNonTemporaryEvents(ped2, true)
end)

-- Sprzedaż

Citizen.CreateThread(function() 
	RequestModel(GetHashKey('cs_manuel'))
	while not HasModelLoaded(GetHashKey('cs_manuel')) do
		Wait(155)
	end
	while CreatePed == nil do
		Citizen.Wait(100)
	end
	local ped3 = CreatePed(4, GetHashKey('cs_manuel'), 957.08, -2116.9, 30.55-1, 36.79, false, true)
	TaskStartScenarioInPlace(ped3, 'WORLD_HUMAN_CLIPBOARD', 0, true)
	FreezeEntityPosition(ped3, true)
	SetEntityInvincible(ped3, true)
	SetBlockingOfNonTemporaryEvents(ped3, true)
end)


----------------------------------
--		Zbieranie Kuraków		--
----------------------------------


exports.ox_target:addSphereZone({
	coords = vec3( -89.5, 6234.48, 31.85),
	radius = 1.5,
	debug = false,
	options = {
		{
			name = 'zbieranie1',
			icon = 'fa-solid fa-dove',
			label = 'Zabierz Kurczaki',
			event = 'cs_rzeznikjob:zbieranie',
			groups = {["rzeznik"] = 0},
			distance = 2,
			canInteract = function()
				return maubrania
			  end
		}
	}
})

exports.ox_target:addSphereZone({
	coords = vec3( -89.5, 6234.48, 31.85),
	radius = 1.5,
	debug = false,
	options = {
		{
			name = 'zbieranie2',
			icon = 'fa-solid fa-dove',
			label = 'Zabierz Kurczaki',
			event = 'cs_rzeznikjob:zbieranie',
			groups = {["rzeznik"] = 0},
			distance = 2,
			canInteract = function()
				return maubrania
			  end
		}
	}
})

exports.ox_target:addSphereZone({
	coords = vec3( -90.77, 6236.84, 31.85),
	radius = 1.5,
	debug = false,
	options = {
		{
			name = 'zbieranie3',
			icon = 'fa-solid fa-dove',
			label = 'Zabierz Kurczaki',
			event = 'cs_rzeznikjob:zbieranie',
			groups = {["rzeznik"] = 0},
			distance = 2,
			canInteract = function()
				return maubrania
			  end
		}
	}
})

exports.ox_target:addSphereZone({
	coords = vec3( -80.82, 6230.81, 31.85),
	radius = 1.5,
	debug = false,
	options = {
		{
			name = 'zbieranie4',
			icon = 'fa-solid fa-dove',
			label = 'Zabierz Kurczaki',
			event = 'cs_rzeznikjob:zbieranie',
			groups = {["rzeznik"] = 0},
			distance = 2,
			canInteract = function()
				return maubrania
			  end
		}
	}
})

exports.ox_target:addSphereZone({
	coords = vec3( -78.90, 6228.45, 31.85),
	radius = 1.5,
	debug = false,
	options = {
		{
			name = 'zbieranie5',
			icon = 'fa-solid fa-dove',
			label = 'Zabierz Kurczaki',
			event = 'cs_rzeznikjob:zbieranie',
			groups = {["rzeznik"] = 0},
			distance = 2,
			canInteract = function()
				return maubrania
			  end
		}
	}
})

--------------------------------------
--		Przeriabianie Kuraków		--
--------------------------------------


exports.ox_target:addSphereZone({
	coords = vec3( -100.44, 6211.94, 30.85),
	radius = 1.5,
	debug = false,
	options = {
		{
			name = 'przetwarzanie1',
			icon = 'fa-solid fa-rotate',
			label = 'Przygotuj Kurczaka',
			event = 'cs_rzeznikjob:przerabianie',
			groups = {["rzeznik"] = 0},
			distance = 2,
			canInteract = function()
				return maubrania
			  end
		}
	}
})

exports.ox_target:addSphereZone({
	coords = vec3( -102.69, 6209.6, 30.85),
	radius = 1.5,
	debug = false,
	options = {
		{
			name = 'przetwarzanie2',
			icon = 'fa-solid fa-rotate',
			label = 'Przygotuj Kurczaka',
			event = 'cs_rzeznikjob:przerabianie',
			groups = {["rzeznik"] = 0},
			distance = 2,
			canInteract = function()
				return maubrania
			  end
		}
	}
})

exports.ox_target:addSphereZone({
	coords = vec3( -104.74, 6207.74, 30.99),
	radius = 1.5,
	debug = false,
	options = {
		{
			name = 'przetwarzanie3',
			icon = 'fa-solid fa-rotate',
			label = 'Przygotuj Kurczaka',
			event = 'cs_rzeznikjob:przerabianie',
			groups = {["rzeznik"] = 0},
			distance = 2,
			canInteract = function()
				return maubrania
			  end
		}
	}
})

exports.ox_target:addSphereZone({
	coords = vec3( -106.9, 6205.66, 30.99),
	radius = 1.5,
	debug = false,
	options = {
		{
			name = 'przetwarzanie4',
			icon = 'fa-solid fa-rotate',
			label = 'Przygotuj Kurczaka',
			event = 'cs_rzeznikjob:przerabianie',
			groups = {["rzeznik"] = 0},
			distance = 2,
			canInteract = function()
				return maubrania
			  end
		}
	}
})

----------------------------------
--		Pakowanie Kuraków		--
----------------------------------


exports.ox_target:addSphereZone({
	coords = vec3( -150.93, 6140.78, 33.34),
	radius = 1.5,
	debug = false,
	options = {
		{
			name = 'pakowanie1',
			icon = 'fa-solid fa-box',
			label = 'Zapakuj Kurczaki',
			event = 'cs_rzeznikjob:pakownie',
			groups = {["rzeznik"] = 0},
			distance = 2,
			canInteract = function()
				return maubrania
			  end
		}
	}
})

exports.ox_target:addSphereZone({
	coords = vec3( -156.77, 6138.33, 33.34),
	radius = 1.5,
	debug = false,
	options = {
		{
			name = 'pakowanie2',
			icon = 'fa-solid fa-box',
			label = 'Zapakuj Kurczaki',
			event = 'cs_rzeznikjob:pakownie',
			groups = {["rzeznik"] = 0},
			distance = 2,
			canInteract = function()
				return maubrania
			  end
		}
	}
})

exports.ox_target:addSphereZone({
	coords = vec3( -155.53, 6143.86, 33.34),
	radius = 1.5,
	debug = false,
	options = {
		{
			name = 'pakowanie3',
			icon = 'fa-solid fa-box',
			label = 'Zapakuj Kurczaki',
			event = 'cs_rzeznikjob:pakownie',
			groups = {["rzeznik"] = 0},
			distance = 2,
			canInteract = function()
				return maubrania
			  end
		}
	}
})

----------------------------------
--		Sprzedaż Kuraków		--
----------------------------------

exports.ox_target:addSphereZone({
	coords = vec3( 957.08, -2116.9, 31.55),
	radius = 1.5,
	debug = false,
	options = {
		{
			name = 'sprzedaz',
			icon = 'fa-solid fa-money-bill',
			label = 'Sprzedaj Produkty',
			event = 'cs_rzeznikjob:sprzedaz',
			groups = {["rzeznik"] = 0},
			distance = 2,
			canInteract = function()
				return maubrania
			  end
		}
	}
})
--------------------------------------
--		Zbiernie Kuraków Event		--
--------------------------------------

RegisterNetEvent('cs_rzeznikjob:zbieranie')
AddEventHandler('cs_rzeznikjob:zbieranie', function()
	if lib.progressCircle({
		duration = 3500,
		label = 'Sciąganie Kurczaków',
		useWhileDead = false,
		canCancel = false,
		position = 'bottom',
		disable = {
			car = true,
			move = true,
		},
		anim = {
			scenario = 'WORLD_HUMAN_HIKER_STANDING'
		}
		}) 
		
	then 
		TriggerServerEvent('cypek:zbierz')
	end
end)

--------------------------------------
--		Przeróbka Kuraków Event		--
--------------------------------------

RegisterNetEvent('cs_rzeznikjob:przerabianie')
AddEventHandler('cs_rzeznikjob:przerabianie', function()
	if lib.progressCircle({
		duration = 5000,
		label = 'Obrabianie Kurczaków',
		useWhileDead = false,
		canCancel = false,
		position = 'bottom',
		disable = {
			car = true,
			move = true,
		},
		anim = {
			scenario = 'PROP_HUMAN_BUM_BIN'
		}
		}) 
		
	then 
		TriggerServerEvent('cypek:przerobka')
	end
end)

--------------------------------------
--		Pakowanie Kuraków Event		--
--------------------------------------

RegisterNetEvent('cs_rzeznikjob:pakownie')
AddEventHandler('cs_rzeznikjob:pakownie', function()
	if lib.progressCircle({
		duration = 5000,
		label = 'Pakowanie Kurczaków',
		useWhileDead = false,
		canCancel = false,
		position = 'bottom',
		disable = {
			car = true,
			move = true,
		},
		anim = {
			scenario = 'PROP_HUMAN_BUM_BIN'
		}
		}) 
		
	then 
		TriggerServerEvent('cypek:pakownie')
	end
end)

------------------------------------------
--		Sprzedawanie Kuraków Event		--
------------------------------------------

RegisterNetEvent('cs_rzeznikjob:sprzedaz')
AddEventHandler('cs_rzeznikjob:sprzedaz', function()
	if lib.progressCircle({
		duration = 5000,
		label = 'Sprzedaz...',
		useWhileDead = false,
		canCancel = false,
		position = 'bottom',
		disable = {
			car = true,
			move = true,
		},
		anim = {
			scenario = 'PROP_HUMAN_STAND_IMPATIENT'
		}
		}) 
		
	then 
		TriggerServerEvent('cypek:sprzedaz')
	end
end)
