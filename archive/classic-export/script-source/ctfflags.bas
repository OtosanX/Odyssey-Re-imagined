Sub Main(Player as Long)
dim Loop as Long

For Loop = 1 To GetMaxUsers()
	If HasObj(Loop, 508) Then PlayerMessage(Player, GetPlayerName(Loop), White)
	If HasObj(Loop, 509) Then PlayerMessage(Player, GetPlayerName(Loop), White)
Next Loop

End Sub