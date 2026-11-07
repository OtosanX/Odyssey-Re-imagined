Function Main(Player as Long) AS LONG
dim Object as Long

Main = Stop

Select Case GetPlayerClass(Player)
	Case 1
		GiveObj(Player, 59, 1)
	Case 2
		GiveObj(Player, 120, 1)
	Case 3
		GiveObj(Player, 56, 1)
	Case 4
		GiveObj(Player, 53, 1)
End Select

CreateCharacterEffect(GetPlayerMap(Player), Player, 37, 40, 8, 0, 0)

For Object = 0 To 80
	If GetObjNum(GetPlayerMap(Player), Object) = 491 Then
		If GetObjX(GetPlayerMap(Player), Object) = GetPlayerX(Player) Then
			If GetObjY(GetPlayerMap(Player), Object) = GetPlayerY(Player) Then
				DestroyObject(GetPlayerMap(Player), Object)
				Exit Function
			End If
		End If
	End If
Next Object

End Function