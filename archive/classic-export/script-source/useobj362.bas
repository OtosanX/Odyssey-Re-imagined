Function Main(Player as Long) as Long
dim X as Long, Y as Long
X = GetPlayerX(Player)
Y = GetPlayerY(Player)

TakeObj(Player, 362, 1)
If GetPlayerMap(Player) = 1427 Then
	If GetPlayerFlag(Player, 11) = 1 Then CreatePlayerMagicProjectile(Player, GetPlayerDirection(Player), 2, 255)
	If GetPlayerFlag(Player, 11) = 2 Then CreatePlayerMagicProjectile(Player, GetPlayerDirection(Player), 4, 255)
	RunScript3("DodgeballSpawn1", Player, X, Y)
End If

End Function
