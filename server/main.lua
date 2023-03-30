local rob = false
local robbers = {}
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local ServerConfig = {
    webhooks = "https://discord.com/api/webhooks/998294194449813504/ArJK5Xjuy1Jci3WEh04_Gk1YLxEsb6vMIr1D-js6KrONNv3dNKfz4XyAVKVNnQD0omvL",
    webhooksTitle = "Braquage de Supérette",
    webhooksColor = 3066993,
	webhooksColor2 = 2303786,
	webhooksColor3 = 15548997,
}

ServerToDiscord = function(name, message, color)
	date_local1 = os.date('%H:%M:%S', os.time())
	local date_local = date_local1
	local DiscordWebHook = ServerConfig.webhooks

    local embeds = {
	    {
		    ["title"]= message,
		    ["type"]="rich",
		    ["color"] =color,
		    ["footer"]=  {
			["text"]= "Heure : " ..date_local.. "",
		    },
	    }
    }

	if message == nil or message == '' then return FALSE end
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end 


--

RegisterServerEvent('esx_holdup:robberyStarted')
AddEventHandler('esx_holdup:robberyStarted', function(currentStore)
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
	local timeElapsed = 0

	if Stores[currentStore] then
		local store = Stores[currentStore]

		if (os.time() - store.lastRobbed) < Config.TimerBeforeNewRob and store.lastRobbed ~= 0 then
			TriggerClientEvent('esx:showNotification', _source, _U('recently_robbed', Config.TimerBeforeNewRob - (os.time() - store.lastRobbed)))
			return
		end

		local cops = 0
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' or xPlayer.job.name == 'sheriff1' or xPlayer.job.name == 'fbi' then
				cops = cops + 1
			end
		end

		if not rob then
			if cops >= Config.PoliceNumberRequired then
				rob = true

				for i=1, #xPlayers, 1 do
					local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
					if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' or xPlayer.job.name == 'sheriff1' or xPlayer.job.name == 'fbi' then
						TriggerClientEvent('esx:showNotification', xPlayers[i], _U('rob_in_prog', store.nameOfStore))
						TriggerClientEvent('esx_holdup:setBlip', xPlayers[i], Stores[currentStore].position)
					end
				end

				TriggerClientEvent('esx:showNotification', _source, _U('started_to_rob', store.nameOfStore))
				TriggerClientEvent('esx:showNotification', _source, _U('alarm_triggered'))

				TriggerClientEvent('esx_holdup:currentlyRobbing', _source, currentStore)
				TriggerClientEvent('esx_holdup:startTimer', _source)

				Stores[currentStore].lastRobbed = os.time()
				robbers[_source] = currentStore

				ServerToDiscord(ServerConfig.webhooksTitle, '[Braquage Lancé] __'  ..xPlayer.getName().. '__ vient de lancer un braquage de supérette (`'..store.nameOfStore..'`)', ServerConfig.webhooksColor)

				SetTimeout(2000, function()
					while robbers[_source] and timeElapsed < store.secondsRemaining do
						xPlayer.addInventoryItem('moneybag', 1)
						timeElapsed = timeElapsed + 2
						Citizen.Wait(2000)
					end
				end)		

				SetTimeout(store.secondsRemaining * 1000, function()
					if robbers[_source] then
						rob = false
						if xPlayer then
							local nbMoneyBags = 0
							SetTimeout(2000, function()
								while robbers[_source] and timeElapsed < store.secondsRemaining do
									xPlayer.addInventoryItem('moneybag', 1)
									nbMoneyBags = nbMoneyBags + 1
									timeElapsed = timeElapsed + 2
									Citizen.Wait(2000)
								end
								TriggerClientEvent('esx_holdup:robberyComplete', _source, 100)
								if Config.GiveBlackMoney then
									ServerToDiscord(ServerConfig.webhooksTitle, '[Braquage Réussi] __' ..xPlayer.getName().. '__ vient de réussir son braquage à la supérette : (`'..store.nameOfStore..'`) il a obtenu 100 sac(s) d\'argent', ServerConfig.webhooksColor2)
								end
							end)

							if not Config.GiveBlackMoney then
								SetTimeout(5000, function()
									xPlayer.addInventoryItem('moneybag', 1)
								end)
							end
						end
						local xPlayers, xPlayer = ESX.GetPlayers(), nil
						for i=1, #xPlayers, 1 do
							xPlayer = ESX.GetPlayerFromId(xPlayers[i])
							if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' or xPlayer.job.name == 'sheriff1' or xPlayer.job.name == 'fbi' then
								TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_complete_at', store.nameOfStore))
								TriggerClientEvent('esx_holdup:killBlip', xPlayers[i])
							end
						end
					end
				end)
			end
		end
	end
end)

RegisterServerEvent('esx_holdup:tooFar')
AddEventHandler('esx_holdup:tooFar', function(currentStore)
	local _source = source
	local xPlayers = ESX.GetPlayers()
	rob = false

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		
		if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' or xPlayer.job.name == 'sheriff1' or xPlayer.job.name == 'fbi' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_cancelled_at', Stores[currentStore].nameOfStore))
			TriggerClientEvent('esx_holdup:killBlip', xPlayers[i])
		end
	end

	if robbers[_source] then
		TriggerClientEvent('esx_holdup:tooFar', _source)
		robbers[_source] = nil
		TriggerClientEvent('esx:showNotification', _source, _U('robbery_cancelled_at', Stores[currentStore].nameOfStore))
		ServerToDiscord(ServerConfig.webhooksTitle, '[Braquage Annulé] à la supérette (`'..Stores[currentStore].nameOfStore..'`)', ServerConfig.webhooksColor3)
	end
end)

