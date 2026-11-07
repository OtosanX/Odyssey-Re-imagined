Sub Main(Player as Long)

PlayerWarp(Player, 1213, 7, 4)
	SetPlayerSprite(Player, Random(51)+165)
	If GetPlayerStatus(Player) = 1 Then 
		Exit Sub
	End If
	Dim RandomStatus As Long
	RandomStatus = Random(23) + 1
	If RandomStatus = 9 Then RandomStatus = 3
	If RandomStatus = 1 Then RandomStatus = 4
	SetPlayerStatus(Player, RandomStatus)
End Sub