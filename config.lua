Config = {}
Config.Locale = 'fr'

Config.Marker = {
	r = 250, g = 0, b = 0, a = 100,  -- red color
	x = 1.0, y = 1.0, z = 1.5,       -- tiny, cylinder formed circle
	DrawDistance = 15.0, Type = 27    -- default circle type, low draw distance due to indoors area
}

Config.PoliceNumberRequired = 1
Config.TimerBeforeNewRob    = 2000 -- The cooldown timer on a store after robbery was completed / canceled, in seconds

Config.MaxDistance    = 20   -- max distance from the robbary, going any longer away from it will to cancel the robbary
Config.GiveBlackMoney = true -- give black money? If disabled it will give cash instead

Stores = {
	["9066"] = {
		position = { x = 31.10528, y = -1339.203, z = 29.49697 },
		reward = 100, -- 1 sac d'argent toutes les 2 secondes
		nameOfStore = "24/7 | 9066",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["9094"] = {
		position = { x = -43.33858, y = -1748.312, z = 29.42101 },
		reward = 100, -- 1 sac d'argent toutes les 2 secondes
		nameOfStore = "LTD | 9094",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["8140"] = {
		position = { x = -709.6793, y = -904.0255, z = 19.21559 },
		reward = 100, -- 1 sac d'argent toutes les 2 secondes
		nameOfStore = "LTD | 8140",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["8092"] = {
		position = { x = -1220.817, y = -916.008, z = 11.32634 },
		reward = 100, -- 1 sac d'argent toutes les 2 secondes
		nameOfStore = "Liquor | 8092",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["7169"] = {
		position = { x = -1478.875, y = -375.3099, z = 39.16341 },
		reward = 100, -- 1 sac d'argent toutes les 2 secondes
		nameOfStore = "Liquor | 7169",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["vespucci"] = {
		position = { x = 1126.937, y = -980.1513, z = 45.41582 },
		reward = 100, -- 1 sac d'argent toutes les 2 secondes
		nameOfStore = "Liquor | Vespucci",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["7302"] = {
		position = { x = 1159.529, y = -314.0989, z = 69.20507 },
		reward = 100, -- 1 sac d'argent toutes les 2 secondes
		nameOfStore = "LTD | 7302",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["7093"] = {
		position = { x = 381.012, y = 332.4734, z = 103.5664 },
		reward = 100, -- 1 sac d'argent toutes les 2 secondes
		nameOfStore = "24/7 | 7093",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["5067"] = {
		position = { x = -2959.776, y = 387.1661, z = 14.0433 },
		reward = 100, -- 1 sac d'argent toutes les 2 secondes
		nameOfStore = "Liquor | 5067",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["5047"] = {
		position = { x = -3048.555, y = 588.5135, z = 7.908863 },
		reward = 100, -- 1 sac d'argent toutes les 2 secondes
		nameOfStore = "24/7 | 5047",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["5037"] = {
		position = { x = -3249.662, y = 1007.362, z = 12.83065 },
		reward = 100, -- 1 sac d'argent toutes les 2 secondes
		nameOfStore = "24/7 | 5037",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["4019"] = {
		position = { x = 543.77, y = 2662.523, z = 42.15646 },
		reward = 100, -- 1 sac d'argent toutes les 2 secondes
		nameOfStore = "24/7 | 4019",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["4024"] = {
		position = { x = 1169.232, y = 2717.649, z = 37.15767 },
		reward = 100, -- 1 sac d'argent toutes les 2 secondes
		nameOfStore = "24/7 | 4024",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["2006"] = {
		position = { x = 1707.994, y = 4920.314, z = 42.06364 },
		reward = 100, -- 1 sac d'argent toutes les 2 secondes
		nameOfStore = "LTD | 2006",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["5016"] = {
		position = { x = -1829.162, y = 798.7406, z = 138.1909 },
		reward = 100, -- 1 sac d'argent toutes les 2 secondes
		nameOfStore = "LTD | 5016",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["1079"] = {
		position = { x = -670.8064, y = 5832.064, z = 17.33143 },
		reward = 100, -- 1 sac d'argent toutes les 2 secondes
		nameOfStore = "24/7 | 1079",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["paleto1"] = {
		position = { x = -168.3758, y = 6318.512, z = 30.58687 },
		reward = 100, -- 1 sac d'argent toutes les 2 secondes
		nameOfStore = "Liquor | Del Vechio",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["paleto2"] = {
		position = { x = 171.0489, y = 6642.64, z = 31.69887 },
		reward = 100, -- 1 sac d'argent toutes les 2 secondes
		nameOfStore = "24/7 | Don's Store",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["otto"] = {
		position = { x = 819.1708, y = -774.4111, z = 26.17567 },
		reward = 100, -- 1 sac d'argent toutes les 2 secondes
		nameOfStore = "24/7 | Otto",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["Paleto3"] = {
		position = { x = 1737.413, y = 6419.382, z = 35.0372 },
		reward = 100, -- 1 sac d'argent toutes les 2 secondes
		nameOfStore = "24/7 | Point J",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["cayo_perico"] = {
		position = { x = 4480.02, y = -4461.72, z = 4.26 },
		reward = 100, -- 1 sac d'argent toutes les 2 secondes
		nameOfStore = "24/7. Cayo Perico",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
}
