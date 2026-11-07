Function Main(Player as Long) AS LONG

Select Case GetPlayerClass(Player)
	Case 1
		Timer(Player, 7, "Cooldown")
	Case 2
		If GetPlayerEquipped(Player, 1) = 463 Then
			Timer(Player, 7, "Cooldown")
		Else
			 Timer(Player, 10, "Cooldown")
		End If
	Case 3
		Timer(Player, 15, "Cooldown")
	Case 4
		If GetPlayerEquipped(Player, 1) = 463 Then
			Timer(Player, 7, "Cooldown")
		Else
			Timer(Player, 10, "Cooldown")
		End If
End Select

End Function