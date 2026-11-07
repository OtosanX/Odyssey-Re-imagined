Sub Main(Player as Long)

If HasObj(Player, 393) Then
	TakeObj(Player, 393, HasObj(Player, 393))
	SpawnObject(1551, 393, 1, 1, 2)
	GlobalMessage("The Babylon Torch has been replaced.", Yellow)
End If
If HasObj(Player, 389) Then
	TakeObj(Player, 389, HasObj(Player, 389))
	SpawnObject(355, 389, 1, 9, 9)
	GlobalMessage("The Dragonia Candle has been replaced.", Yellow)
End If

End Sub