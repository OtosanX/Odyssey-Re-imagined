Function Main(Player as Long) AS LONG
'Thief-Mage Hide

If GetPlayerFlag(Player, 25) = 1 Then
	If GetPlayerX(Player) = GetPlayerFlag(Player, 21) & GetPlayerY(Player) = GetPlayerFlag(Player, 22) & GetPlayerHP(Player) = GetPlayerMaxHP(Player) Then
		Timer(Player, 1, "Invis1")
	Else
		RunScript1("TurnVisible", Player)
	End If
End If

End Function