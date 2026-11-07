Sub Main(Player as Long)
dim Loop as Long

PlayerMessage(Player, strcat("You go bust with ", strcat(str(GetPlayerFlag(Player, 230)), "!")), White)

For Loop = 230 To 235
	SetPlayerFlag(Player, Loop, 0)
Next Loop

End Sub