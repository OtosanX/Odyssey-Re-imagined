Function Main(Player as Long) as Long
dim X as Long, Y as Long
X = GetPlayerX(Player)
Y = GetPlayerY(Player)

If GetPlayerMap(Player) = 620 Then
	If GetPlayerFlag(Player, 10) = 16 Then
		CreatePlayerMagicProjectile(Player, GetPlayerDirection(Player), 4, 255)
	End If
End If

End Function
