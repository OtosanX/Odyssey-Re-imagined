Sub Main(Player as Long)
dim Mana as Long, Loop as Long, Damage as Long, Cast as Long
dim Map as Long, X as Long, Y as Long, CalcX as Long, CalcY as Long

Map = GetPlayerMap(Player)
X = GetPlayerX(Player)
Y = GetPlayerY(Player)
Mana = 1
Damage = Divide(GetPlayerDamage(Player), 10)

If GetPlayerMana(Player) < Mana Then
	PlayerMessage(Player, "You must regenerate to cast.", Grey)
	Exit Sub
End If
If GetPlayerFlag(Player, 23) > 0 Then
	PlayerMessage(Player, "You must wait to cast.", Grey)
	Exit Sub
End If

SetPlayerMana(Player, GetPlayerMana(Player) - Mana)
SetPlayerFlag(Player, 23, 1)
RunScript1("SpellCooldown", Player)
CreatePlayerFloatText(Player, "KIXFACE!", BrightGreen)


For Loop = 1 To GetMaxUsers()
	If Player <> Loop Then
		If GetPlayerMap(Loop) = Map Then
			CalcX = Abs(GetPlayerX(Loop) - X)
			CalcY = Abs(GetPlayerY(Loop) - Y)
			If CalcX < 3 & CalcY < 3 Then
				Cast = 1
				SetPlayerFlag(Loop, 31, Damage)
				SetPlayerFlag(Loop, 33, Player)
				CreateCharacterEffect(GetPlayerMap(Loop), Loop, 18, 40, 2, 2, 0)
				PlayerMessage(Loop, strcat(GetPlayerName(Player), " has poisoned you!"), White)
				Timer(Loop, 2, "Poison1")
				Timer(Loop, 20, "PoisonCooldown")
			End If
		End If
	End If
Next Loop

If Cast = 1 Then SetPlayerFlag(Player, 32, 1)

End Sub