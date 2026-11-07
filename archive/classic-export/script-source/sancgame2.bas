Sub Main(Player as Long)
dim Loop as Long

SetFlag(145, 1)
SetFlag(146, 2)
For Loop = 1 To GetMaxUsers()
	If GetPlayerFlag(Loop, 10) = 16 Then
		SetPlayerFlag(Loop, 11, 1)
		SetPlayerSprite(Loop, 113)
		MapMessage(620, strcat(GetPlayerName(Loop), " is it!!"), Yellow)
		Exit Sub
	End If
Next Loop

End Sub