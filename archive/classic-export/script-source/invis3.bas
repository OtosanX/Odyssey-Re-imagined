Function Main(Player as Long) AS LONG
'Mage Hide

If GetPlayerStatus(Player) = 9 & GetPlayerX(Player) = GetPlayerFlag(Player, 21) & GetPlayerY(Player) = GetPlayerFlag(Player, 22) Then
	If GetPlayerHP(Player) = GetPlayerMaxHP(Player) Then
		Timer(Player, 1, "Invis3")
	Else
		RunScript1("TurnVisible", Player)
	End If
Else
	RunScript1("TurnVisible", Player)
End If

End Function