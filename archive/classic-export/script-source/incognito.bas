Sub Main(Player as Long)
Dim RandomStatus As Long

If GetPlayerFlag(Player, 10) > 0 Then Exit Sub
If GetPlayerFlag(Player, 109) > 0 Then Exit Sub
	If GetPlayerFlag(Player, 75) = 1 Then
		SetPlayerFlag(Player, 109, 1)
		Timer(Player, 1, "pushtimer")
		SetPlayerSprite(Player, Random(215)+1)
	If GetPlayerStatus(Player) = 1 Then Exit Sub		
		RandomStatus = Random(23) + 1
	If RandomStatus = 9 Then RandomStatus = 3
	If RandomStatus = 1 Then RandomStatus = 4
		SetPlayerStatus(Player, RandomStatus)
	End If
End Sub