Sub Main(Player as Long)

If GetMonsterType(1428, 0) <> 238 Then
	ResetMap(1428)
	SpawnMonster(1428, 238, 6, 5, 0)
End If

End Sub