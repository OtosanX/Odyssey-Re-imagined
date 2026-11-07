Sub Main(Player as long)

If getplayerlevel(player) >= 70 Then
	If HasObj(Player,234) Then
		TakeObj(Player,234,1)
		PlayerMessage(Player,"You use your Glacial Key",white)
		PlayerWarp(Player, 1313, 4, 4)
	Else
		PlayerMessage(Player,"You need a Glacial Key to enter!",white)
		PlayerWarp(Player,1313,4,6)
	End If
Else
	PlayerMessage(Player,"You are too low level to enter!",white)
	PlayerWarp(Player,1313,4,6)
End If

End Sub