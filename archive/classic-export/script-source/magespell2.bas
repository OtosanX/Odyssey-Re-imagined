Sub Main(Player as Long, Map as Long, X as Long, Y as Long)
dim Loop as Long, CalcX as Long, CalcY as Long, Damage as Long
Damage = GetPlayerDamage(Player)
SetPlayerFlag(Player, 196, 0)

TakeObj(Player, 413, 1)
RunScript3("ExplosionEffect", Map, X, Y)
CreatePlayerFloatText(Player, "Damnatio!", BrightRed)

For Loop = 1 To GetMaxUsers()
	If GetPlayerMap(Loop) = Map Then
		If Loop <> Player Then
			CalcX = Abs(GetPlayerX(Loop) - X)
			CalcY = Abs(GetPlayerY(Loop) - Y)
			If CalcX < 2 & CalcY < 2 Then
				MagicAttackPlayer(Player, Loop, Damage)
			End If
		End If
	End If
Next Loop

End Sub