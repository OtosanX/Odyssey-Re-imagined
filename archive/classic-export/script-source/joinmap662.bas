Function Main(Player as Long) AS LONG

If GetPlayerFlag(Player, 92) = 0 Then
	PlayerMessage(Player, "Cundi says, ''Hey there how can I help you. Potions, rings? Anything you need is right here. I am also well diverse in most languages, if you need help to clarify something, I'll be glad to do it.''", Grey)
	Exit Function
End If

If GetPlayerFlag(Player, 92) = 3 Then
	If HasObj(Player, 280) Then
		PlayerMessage(Player, "Cundi says, ''Ahh you've brought me an ancient text! Good job child, I'll get to work translating it for you now.''", Yellow)
		TakeObj(Player, 280, 1)
		PlayerMessage(Player, "...", Grey)
		PlayerMessage(Player, "...", Grey)
		PlayerMessage(Player, "Cundi says, ''Here you go, you may understand this a little better. Send Ness my regards!''", Yellow)
		GiveObj(Player, 281, 1)
		SetPlayerFlag(Player, 92, 4)
		Exit Function
	Else
		PlayerMessage(Player, "Cundi says, ''What's that? You had something for me? But you don't have it now? Well thats not very helpful is it.", Yellow)
		Exit Function
	End If
End If

If GetPlayerFlag(Player, 92) = 4 Then
	If HasObj(Player, 281) = 0 Then
		PlayerMessage(Player, "Cundi says, ''You've lost it haven't you... *sighs* Good thing I always keep copies.''", Yellow)
		GiveObj(Player, 281, 1)
		Exit Function
	End If
	If HasObj(Player, 281) Then
		PlayerMessage(Player, "Cundi says, ''You better hurry back to Ness with that. He'll be eager to read it.''", Yellow)
		Exit Function
	End If
End If

If GetPlayerFlag(Player, 92) > 4 Then
	PlayerMessage(Player, "Cundi says, ''Hey there how can I help you. Potions, rings? Anything you need is right here. I am also well diverse in most languages, if you need help to clarify something, I'll be glad to do it.''", Grey)
End If

End Function	