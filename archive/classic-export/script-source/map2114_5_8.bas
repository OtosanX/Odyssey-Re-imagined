 FUNCTION Main(Player AS LONG) AS LONG
 dim x as long,y as long


SetPlayerEnergy(Player, GetPlayerEnergy(Player) - 40)

CreateTileEffect(GetPlayerMap(Player), GetPlayerX(Player), GetPlayerY(Player), 2, 2, 8, 0, 0)
END FUNCTION