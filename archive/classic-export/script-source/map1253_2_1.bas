Sub Main(Player as Long)
dim Object as Long

PlayerWarp(Player, 1253, 2, 2)

For Object = 0 To 50
	If GetTileAtt(1253, GetObjX(1253, Object), GetObjY(1253, Object)) = 5 Then
		DestroyObject(1253, Object)
	End If
Next Object

SpawnObject(1253, 1, 1, 4, 1)
SpawnObject(1253, 11, 1, 5, 1)
SpawnObject(1253, 35, 1, 6, 1)
SpawnObject(1253, 10, 1, 7, 1)

End Sub