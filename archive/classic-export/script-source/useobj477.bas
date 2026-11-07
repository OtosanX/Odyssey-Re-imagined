Function Main(Player as Long) AS LONG

Main = Stop
If GetPlayerMap(Player) = 1971 Then
	If GetPlayerX(Player) = 5 | GetPlayerX(Player) = 6 Then
	If GetPlayerY(Player) = 2 Then
		If GetPlayerDirection(Player) = Up Then
			TakeObj(Player, 477, 1)
		End If
	End If
	End If
End If

End Function