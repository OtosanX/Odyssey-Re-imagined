Sub Main()

dim Map as Long, X as Long, Y as Long
dim Item as Long, Value as Long

Map = 1799

For Item = 0 To 50
	For X = 1 To 2
		For Y = 5 To 6
			If GetObjX(Map, Item) = X & GetObjY(Map, Item) = Y Then
				Value = GetObjVal(Map, Item)
				SpawnObject(Map, GetObjNum(Map, Item), Value, X+3, Y-5)
				DestroyObject(Map, Item)
				GoTo NextItem
			End If
		Next Y
	Next X
	For X = 9 To 10
		For Y = 5 To 6
			If GetObjX(Map, Item) = X & GetObjY(Map, Item) = Y Then
				Value = GetObjVal(Map, Item)
				SpawnObject(Map, GetObjNum(Map, Item), Value, X-3, Y-5)
				DestroyObject(Map, Item)
				GoTo NextItem
			End If
		Next Y
	Next X
NextItem:
Next Item

End Sub