Sub Main(Player as Long)

If GetPlayerFlag(Player, 243) = 1 Then
	PlayerMessage(Player, "Granny Gertrude says, ''So the Wench has sent you on her errand. Typical of her. Unfortunately I cannot create the potion for you, as I've lost my Shaman's Amulet.''", Yellow)
	PlayerMessage(Player, "1. Where can I get a Shaman's Amulet?", DarkGrey)
	PlayerMessage(Player, "2. That's a shame.", DarkGrey)
End If

End Sub