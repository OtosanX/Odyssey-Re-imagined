Function Main(Player as Long) AS LONG

If GetPlayerGuild(Player) > 0 Then	
If GetPlayerHP(Player) <> GetPlayerMaxHP(Player) Then
PlayerWarp(Player, 2114, 10, 7)
playermessage(player, "You need full health to enter.", grey)
		else
			if getplayerguild(player) = getflag(186) & getflag(185) > 0 then 
			PlayerWarp(Player, 2114, 7, 1)
			else
			playermessage(player, "Your guild does not have special access to the Darkcone Fort.", white)
			PlayerWarp(Player, 2114, 10, 7)
			
		end if 
end if
else
playermessage(player, "You are not in a guild.", white)
PlayerWarp(Player, 2114, 10, 7)
end if
end function

