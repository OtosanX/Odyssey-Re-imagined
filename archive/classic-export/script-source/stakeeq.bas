Function Main(Player as Long) AS LONG
dim Item as Long, Obj as Long, Map as Long
Main = Continue

Map = 1799

For Item = 0 To 49
Obj = GetObjectType(GetObjNum(Map, Item))
	If GetTileAtt2(Map, GetObjX(Map, Item), GetObjY(Map, Item)) = 5 Then
		If Obj > 0 & Obj < 6 Then
			PlayerMessage(Player, "You cannot stake equipment.", Grey)
			Main = Stop
		End If
	End If
Next Item

End Function