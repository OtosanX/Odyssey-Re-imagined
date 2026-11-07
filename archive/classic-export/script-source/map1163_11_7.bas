Function Main(Player as Long) AS LONG

If GetPlayerHP(Player) = GetPlayerMaxHP(Player) Then
	Main = Continue
Else
	PlayerWarp(Player, 1163, 10, 7)
End If

End Function