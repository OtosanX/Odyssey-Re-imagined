
FUNCTION Main(Player AS LONG) AS LONG

If GetMapIsFriendly(GetPlayerMap(Player)) = False Then
	PlayerMessage(Player, "This item must be used on friendly maps.", yellow)

main = stop

else

if getplayerguild(player) = getflag(186) & getflag(185) > 0 then
	takeobj(player, 606, 1)
	Playerwarp(player, 2114,10,11)  
	CreatePlayerFloatText(Player, "Darkcone Fort!", BrightGreen)
else
PlayerMessage(Player, "You must have temporary access to Darkcone Fort to use this item.", yellow)


end if
end if
END FUNCTION
