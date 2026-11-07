Sub Main(Player as Long)
dim Loop as Long

PlayerWarp(Player, 1551, 2, 2)
If GetPlayerGuild(Player) > 0 Then
	If HasObj(Player, 389) Then
		PlayerMessage(Player, "You are already holding an Artifact.", Grey)
		Exit Sub
	End If
	For Loop = 1 To GetMaxUsers()
		If HasObj(Loop, 393) Then
			PlayerMessage(Player, "The Torch has been taken.", Grey)
			Exit Sub
		End If
	Next Loop
	If RunScript1("Invent", Player) = 1 Then
		PlayerMessage(Player, "Your inventory is full.", Grey)
		Exit Sub
	End If
	GlobalMessage(strcat(GetPlayerName(Player), " has picked up the Babylon Torch!"), Yellow)
	GiveObj(Player, 393, 1)
	For Loop = 0 To 80
		If GetObjNum(1551, Loop) = 393 Then DestroyObject(1551, Loop)
	Next Loop
Else
	PlayerMessage(Player, "You must be Guilded to handle this Artifact.", Grey)
End If

End Sub