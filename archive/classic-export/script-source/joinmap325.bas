Sub Main(Player as Long)

If GetPlayerFlag(Player, 242) = 4 Then
	If HasObj(Player, 284) Then
		PlayerMessage(Player, "The Old Wizard says, ''Ah, I'd been expecting ye. Pass the garment this way.''", Yellow)
		TakeObj(Player, 284, 1)
		PlayerMessage(Player, "The Old Wizard says, ''Here it be. Water shall never pass it.''", Yellow)
		GiveObj(Player, 319, 1)
		SetPlayerFlag(Player, 242, 5)
	Else
		PlayerMessage(Player, "The Old Wizard says, ''Ah, I'd been expecting ye. But what of the garment of need enchanting?''", Yellow)
	End If
End If

End Sub