Function Main(Player as Long) AS LONG

	dim Cost as Long
	Cost = 6
	
	

	If getplayerguild(player) = getflag(186) & getflag(185) > 0 then		
		If HasObj(Player, 421) >= Cost then
			PlayerWarp(Player, 2114, 4, 0)
			TakeObj(Player, 421, cost)
			spawnmonster(2114,401,6,10)
			MapMessage(2114, "Fort Berzerker yells, ''I obey only the true Fort Commander!''", grey)
			playermessage(player, "Beware. When given the opportunity, he will attack anyone.", brightred)
		else 
			playermessage(player, "You need 6 Fort Ammo to summon a Berzerker.", white)
			PlayerWarp(Player, 2114, 4, 0)
		end if
	else
	playermessage(player, "You do not have access to summon a Fort Berzerker.", white)
	PlayerWarp(Player, 2114, 4, 0)
	end if
end function