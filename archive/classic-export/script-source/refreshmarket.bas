Sub Main(Player as Long)
dim Map as Long, Item as Long

Map = 534

For Item = 0 To 49
	If GetTileAtt(Map, GetObjX(Map, Item), GetObjY(Map, Item)) = 5 Then
		DestroyObject(Map, Item)
	End If
Next Item

If GetFlag(130) > 0 Then SpawnObject(Map, 215, GetFlag(130), 6, 4)	'Lumber
If GetFlag(131) > 0 Then SpawnObject(Map, 216, GetFlag(131), 3, 3)	'C Ore
If GetFlag(132) > 0 Then SpawnObject(Map, 217, GetFlag(132), 5, 3)	'F Ore
If GetFlag(133) > 0 Then SpawnObject(Map, 218, GetFlag(133), 4, 4)	'P Ore
If GetFlag(134) > 0 Then SpawnObject(Map, 153, GetFlag(134), 7, 3)	'S Fish
If GetFlag(135) > 0 Then SpawnObject(Map, 152, GetFlag(135), 9, 3)	'M Fish
If GetFlag(136) > 0 Then SpawnObject(Map, 148, GetFlag(136), 8, 4)	'B Fish

End Sub