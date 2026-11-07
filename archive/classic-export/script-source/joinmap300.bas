Sub Main(Player as Long)

If GetPlayerFlag(Player, 240) = 0 Then PlayerMessage(Player, "Madargan Gar says, ''Type /craft to use my workshop.''", White)

If GetPlayerFlag(Player, 240) = 1 Then
	PlayerMessage(Player, "Madargan Gar says, ''Manny has told me of your arrival. Alas I am in need of materials. Bring me 100 Lumber and 2 Metal Bands and I will make you the bucket.''", Yellow)
	PlayerMessage(Player, "1. Why do you need 100 Lumber?", DarkGrey)
	PlayerMessage(Player, "2. Where can I get these Metal Bands?", DarkGrey)
	SetPlayerFlag(Player, 240, 2)
End If
If GetPlayerFlag(Player, 240) = 2 Then
	PlayerMessage(Player, "Madargan Gar says, ''Manny has told me of your arrival. Alas I am in need of materials. Bring me 100 Lumber and 2 Metal Bands and I will make you the bucket.''", Yellow)
	PlayerMessage(Player, "1. Why do you need 100 Lumber?", DarkGrey)
	PlayerMessage(Player, "2. Where can I get these Metal Bands?", DarkGrey)
End If
If GetPlayerFlag(Player, 240) = 3 Then
	PlayerMessage(Player, "Madargan Gar says, ''I am still in need of materials. Bring me 100 Lumber and 2 Metal Bands and I will make you the bucket.''", Yellow)
	PlayerMessage(Player, "1. Why do you need 100 Lumber?", DarkGrey)
	PlayerMessage(Player, "2. Where can I get these Metal Bands?", DarkGrey)
	
End If
If GetPlayerFlag(Player, 240) = 4 Then
	If HasObj(Player, 215) >= 100 & HasObj(Player, 461) >= 2 Then
		PlayerMessage(Player, "Madargan Gar says, ''You have all the materials? Type /Craft and I'll get to work.''", Yellow)
	Else
		PlayerMessage(Player, "Madargan Gar says, ''I am still in need of materials. Bring me 100 Lumber and 2 Metal Bands and I will make you the bucket.''", Yellow)
		PlayerMessage(Player, "1. Why do you need 100 Lumber?", DarkGrey)
		PlayerMessage(Player, "2. Where can I get these Metal Bands?", DarkGrey)
	End If
End If
If GetPlayerFlag(Player, 240) = 5 Then
	Playermessage(Player, "Madargan Gar says, ''Did you take that bucket to Manny?", Yellow)
	PlayerMessage(Player, "1. I'm just on my way now.", DarkGrey)
	PlayerMessage(Player, "2. I lost the bucket... Can you make a new one for me?", DarkGrey)
End If

End Sub