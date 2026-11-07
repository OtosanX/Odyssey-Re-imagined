Sub Main(Player AS LONG)
	If GetPlayerHP(Player) = GetPlayerMaxHP(Player) Then
		PlayerWarp(Player, 8, 5, 2)
	Else
		Dim A As Long
		A = GetPlayerDirection(Player)
		If A = 3 Then
			PlayerWarp(Player, 6, 3, 2)
		Else
			PlayerWarp(Player, 6, 4, 3)
		End If
	End If
End Sub