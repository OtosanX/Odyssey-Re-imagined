 FUNCTION Main(Player AS LONG) AS LONG
 dim x as long,y as long

if getplayerguild(player) = getflag(186) & getflag(185) > 0 then 
	main = continue
else
'playermessage(player, "Mana sap.", white)
SetPlayerEnergy(Player, GetPlayerEnergy(Player) - 25)

CreateTileEffect(GetPlayerMap(Player), GetPlayerX(Player), GetPlayerY(Player), 2, 2, 8, 0, 0)
end if
END FUNCTION