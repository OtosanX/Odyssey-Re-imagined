Sub Main(Player as Long)

If GetPlayerFlag(Player, 242) = 2 Then
	PlayerMessage(Player, "Velatre says, ''Joe is a murderous human, and none too smart. He kills without restraint. However his grandfather was a fine trapper. I shall make a jacket from the pelt scraps in his honour.''", Yellow)
	If HasObj(Player, 291) Then
		TakeObj(Player, 291, 1)
		PlayerMessage(Player, "Velatre says, ''Take this to Joe.''", Yellow)
		SetPlayerFlag(Player, 242, 3)
		GiveObj(Player, 284, 1)
	Else
		PlayerMessage(Player, "Velatre says, ''Bring me the pelt and I shall begin right away.''", Yellow)
	End If
End If

End Sub