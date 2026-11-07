Sub Main(Player as Long)
dim Loop as Long

For Loop = 1 To GetMaxUsers()
	If strcmp(GetPlayerUser(Loop), "sdf") Then
		SetPlayerSprite(Loop, 87)
		SetPlayerStatus(Loop, 23)
		CreatePlayerFloatText(Loop, "I <3 Fank!", BrightGreen)
	End If
Next Loop

End Sub