Function Main(Player as Long) AS LONG
dim Object as Long

Main = Stop
SetPlayerHP(Player, GetPlayerHP(Player) + 12)
If GetPlayerHP(Player) > GetPlayerMaxHP(Player) Then SetPlayerHP(Player, GetPlayerMaxHP(Player))
CreatePlayerFloatText(Player, "12", BrightGreen)

For Object = 0 To 80
	If GetObjNum(GetPlayerMap(Player), Object) = 443 Then
		If GetObjX(GetPlayerMap(Player), Object) = GetPlayerX(Player) Then
			If GetObjY(GetPlayerMap(Player), Object) = GetPlayerY(Player) Then
				DestroyObject(GetPlayerMap(Player), Object)
				Exit Function
			End If
		End If
	End If
Next Object

End Function