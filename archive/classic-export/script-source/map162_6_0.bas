Function Main(Player as Long) AS LONG

If GetPlayerHP(Player) = GetPlayerMaxHP(Player) Then
	Main = Continue
Else
	PlayerWarp(Player, 162, 6, 1)
End If

End Function