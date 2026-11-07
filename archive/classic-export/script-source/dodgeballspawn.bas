Sub Main(Player as Long)
dim Y as Long
Y = Random(6) + 3

If GetPlayerFlag(Player, 11) = 1 Then
	SpawnObject(1427, 362, 1, 0, Y)
End If
If GetPlayerFlag(Player, 11) = 2 Then
	SpawnObject(1427, 362, 1, 11, Y)
End If

End Sub