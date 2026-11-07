Sub Main(Player as Long)

If GetFlag(160) = 5 Then
	CreateMapFloatText(1434, 4, 7, "Ping!", BrightGreen)
	SetFlag(160, 0)
	MagicAttackMonster(Player, 0, 255)
Else
	CreateMapFloatText(1434, 4, 7, "Bzzt!", BrightRed)
	SetFlag(160, 0)
End If

End Sub