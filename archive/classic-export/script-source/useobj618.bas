
Sub Main(Player AS LONG)
takeobj(player, 618, 1)
	If GetPlayerStatus(Player) = 1 Then
		SetPlayerStatus(Player, 0)
		RunScript1("SPRITE", Player)
	End If
End Sub