Function Main(Player as Long) AS LONG

Select Case GetPlayerClass(Player)
	Case 1
		Timer(Player, 60, "Cooldown3")
	Case 2
		If GetPlayerEquipped(Player, 1) = 463 Then
			Timer(Player, 35, "Cooldown3")
		Else
			Timer(Player, 45, "Cooldown3")
		End If
	Case 3
		Timer(Player, 45, "Cooldown3")
	Case 4
		If GetPlayerEquipped(Player, 1) = 463 Then
			Timer(Player, 35, "Cooldown3")
		Else
			Timer(Player, 45, "Cooldown3")
		End If
End Select

End Function