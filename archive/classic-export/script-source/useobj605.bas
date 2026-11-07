FUNCTION Main(Player AS LONG) AS LONG


If GetMapIsFriendly(GetPlayerMap(Player)) = False Then
	PlayerMessage(Player, "This item must be used on friendly maps.", Grey)

main = stop

else


takeobj(player, 605, 1)
SetGuildBank((GetPlayerGuild(Player)), (GetGuildBank(GetPlayerGuild(Player)) + 15000))
PlayerMessage(player, "Your guild has earned 15000 gold!", yellow)


end if

END FUNCTION


