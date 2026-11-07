 FUNCTION Main(Player AS LONG) AS LONG
 dim x as long,y as long


SetPlayerEnergy(Player, GetPlayerEnergy(Player) - 10)
CreateTileEffect(GetPlayerMap(Player), GetPlayerX(Player), GetPlayerY(Player), 2, 2, 8, 0, 0)
Attackplayer(player,player,35)

'if getplayerguild(player) = 0 then
'playerwarp(player, 1,5,5)
'end if 


   Main = Continue
END FUNCTION