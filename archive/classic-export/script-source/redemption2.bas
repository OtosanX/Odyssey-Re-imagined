Sub Main(Player as Long)
dim Map as Long, X as Long, Y as Long
dim CalcX as Long, CalcY as Long
dim Loop as Long, Damage as Long
Damage = GetPlayerDamage(Player) + Divide(GetPlayerDamage(Player), 3)
Map = GetPlayerMap(Player)
X = GetPlayerX(Player)
Y = GetPlayerY(Player)

SetPlayerFlag(Player, 207, 0)
If HasObj(Player, 411) = 0 Then
	PlayerMessage(Player, "You require a Living Essence to cast this spell.", Grey)
	Exit Sub
End If

TakeObj(Player, 411, 1)
SetPlayerFlag(Player, 15, 2)
CreatePlayerFloatText(Player, "Decerto!", BrightRed)
SetPlayerIsDead(Player, 0)
For Loop = 1 To GetMaxUsers()
	If GetPlayerMap(Loop) = Map Then
		If Loop <> Player Then
			CalcX = Abs(GetPlayerX(Loop) - X)
			CalcY = Abs(GetPlayerY(Loop) - Y)
			If CalcX < 4 & CalcY < 4 Then
				MagicAttackPlayer(Player, Loop, Damage)
				CreateCharacterEffect(GetPlayerMap(Loop), Loop, 20, 40, 8, 0, 0)
			End If
		End If
	End If
Next Loop
SetPlayerIsDead(Player, 1)

End Sub