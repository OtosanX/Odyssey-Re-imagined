Sub Main(Player as Long)

CreateTileEffect(90, 5, 6, 1, 40, 8, 0, 0)
CreateTileEffect(90, 5, 6, 45, 40, 8, 1, 0)

If GetMonsterX(90, 0) = 5 & GetMonsterY(90, 0) = 6 Then
	AttackMonster(Player, 0, 60)
End If

End Sub