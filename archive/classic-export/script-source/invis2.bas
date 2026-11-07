Function Main(Player as Long) AS LONG
'Thief - Stealth

If GetPlayerFlag(Player, 25) = 1 Then
	If GetPlayerHP(Player) = GetPlayerMaxHP(Player) Then
		Timer(Player, 1, "Invis2")
	Else
		RunScript1("TurnVisible", Player)
	End If
End If

End Function