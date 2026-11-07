Function Main(Player as Long) AS LONG
dim Slot as Long

For Slot = 1 To 20
	If GetPlayerInvObject(Player, Slot) = 248 Then
		TakeObj(Player, 248, 1)
		GiveObj(Player, 248, 1)
		PlayerMessage(Player, "You have repaired your Hero's Guard!", Grey)
		Exit Function
	End If
Next Slot

End Function