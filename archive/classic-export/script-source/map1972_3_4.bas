Function Main(Player as Long) AS LONG

If GetFlag(91) = 0 Then
	SpawnMonster(1972, 31, 5, 5, 0)
	SetFlag(91, 1)
Else
	GiveObj(Player, 48, 1)
	SetFlag(91, 0)
End If

End Function