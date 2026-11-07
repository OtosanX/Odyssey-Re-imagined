FUNCTION Main(Player AS LONG, found AS LONG, hit AS LONG) AS LONG
'Global Variables
Dim a AS LONG
Dim x AS LONG

'Player
Dim map AS LONG
Dim playerx AS LONG
Dim playery AS LONG
map = GetPLayerMap(Player)
Playerx = GetPlayerX(Player)
Playery = GetPlayerY(Player)

'Other Player
Dim map1 AS LONG
DIm Playerx1 AS LONG
Dim Playery1 AS LONG
map1 = GetPLayerMap(found)
Playerx1 = GetPlayerX(found)
Playery1 = GetPlayerY(found)


If map = map1 Then
 'effect
 For a = -1 to 1
  CreateTileEffect(Map, PlayerX1 + a, PlayerY1, 8, 100, 5, 0, 0)
  CreateTileEffect(Map, PlayerX1, PlayerY1 + a, 8, 100, 5, 0, 0)
 Next a

 'damage

  For a = 0 to GetMaxUsers
   If Abs(PlayerX1 - GetPlayerX(a)) <= 1 & Abs(PlayerY1 - GetPlayerY(a)) <= 1 & GetPlayerMap(Player) = GetPlayerMap(a) Then AttackPlayer(PLayer, a, hit)
  Next a

End IF
END FUNCTION