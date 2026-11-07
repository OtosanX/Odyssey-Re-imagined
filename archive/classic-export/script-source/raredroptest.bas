Sub Main(Player as Long, Chance as Long, Object as Long)

'X = GetPlayerX(Player)
'Y = GetPlayerY(Player)
'If GetPlayerDirection(Player) = Up Then Y = Y - 0
'If GetPlayerDirection(Player) = Down Then Y = Y + 0 
'If GetPlayerDirection(Player) = Left Then X = X - 0
'If GetPlayerDirection(Player) = Right Then X = X + 0
'If X < 0 | X > 11 Then X = GetPlayerX(Player)
'If Y < 0 | Y > 11 Then Y = GetPlayerY(Player)
'If GetTileAtt(GetPlayerMap(Player), X, Y) <> 0 Then
'	X = GetPlayerX(Player)
'	Y = GetPlayerY(Player)
'End If

'If Random(Chance) + 1 = 1 Then 


dim Map as Long, X as Long, Y as Long
Dim a as long
a = random(4)



select case a
case 0
SpawnObject(2119, 615, 1, 6, 7)
case 1
SpawnObject(2119, 609, 1, 6, 7)
case 2
SpawnObject(2119, 614, 1, 6, 7)
case 3
SpawnObject(2119, 617, 1, 6, 7)
end select



End sub
 

