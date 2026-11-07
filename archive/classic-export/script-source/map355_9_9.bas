Sub Main(Player as Long)
dim Loop as Long

PlayerWarp(Player, 355, 9, 8)
If GetPlayerGuild(Player) > 0 Then
	If HasObj(Player, 393) Then
		PlayerMessage(Player, "You are already holding an Artifact.", Grey)
		Exit Sub
	End If
	For Loop = 1 To GetMaxUsers()
		If HasObj(Loop, 389) Then
			PlayerMessage(Player, "The Candle has been taken.", Grey)
			Exit Sub
		End If
	Next Loop
	If RunScript1("Invent", Player) = 1 Then
		PlayerMessage(Player, "Your inventory is full.", Grey)
		Exit Sub
	End If
	GlobalMessage(strcat(GetPlayerName(Player), " has picked up the Dragonia Candle!"), Yellow)
	GiveObj(Player, 389, 1)
	For Loop = 0 To 80
		If GetObjNum(355, Loop) = 389 Then DestroyObject(355, Loop)
	Next Loop
Else
	PlayerMessage(Player, "You must be Guilded to handle this Artifact.", Grey)
End If

End Sub