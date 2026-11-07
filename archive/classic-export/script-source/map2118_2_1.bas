Sub Main(Player as Long)
dim Cost as Long
Cost = 1000
PlayerWarp(Player, 2118, 2, 2)

	
if getplayerguild(player) = getflag(186) & getflag(185) > 0 then 
		If HasObj(Player, 6) >= Cost Then
			TakeObj(Player, 6, Cost)
			SetPlayerEnergy(Player, GetPlayerMaxEnergy(Player))
			PlayerMessage(Player, "You take a drink and are restored to full Energy!", White)
			SetPlayerFlag(Player, 109, 1)
			Timer(Player, 3, "PushTimer")
		Else
			PlayerMessage(Player, strcat("Fort Worker says, ''That'll cost you ", strcat(str(Cost), " Gold. You wont find lower prices anywhere else!''")), Grey)
		End If
	else
	playermessage(player, "Your guild does not have special access to the Darkcone Fort.", white)
	PlayerWarp(Player, 2118, 2, 2)
	end if
End Sub




