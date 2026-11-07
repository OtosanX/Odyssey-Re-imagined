

Sub Main(Player as Long, Target as Long)
Dim Effect as Long, Damage as Long, Mana as Long, XCoord as Long, YCoord as Long, Loop as Long, MonsterLoop as Long, HP as Long



'Area of Effect - Mage Spell - Electric Pulse
If GetPlayerMap(Player) = 1427 | GetPlayerMap(Player) = 1828 | GetPlayerMap(Player) = 1829 Then Exit Sub

If GetPlayerFlag(Player, 23) > 0 Then
	PlayerMessage(Player, "You must wait to cast.", White)
	Exit Sub
End If

Mana = 35
If GetPlayerMana(Player) < Mana Then
	PlayerMessage(Player, "You must regenerate before casting.", Grey)
	Exit Sub
End If

SetPlayerMana(Player, GetPlayerMana(Player) - Mana)
SetPlayerFlag(Player, 23, 1)
RunScript1("SpellCooldown", Player)

Effect = 5
Damage = GetPlayerDamage(Player) + 5


For Loop = 1 to GetMaxUsers()
	If IsPlaying(Loop) Then
		If GetPlayerMap(Loop) = GetPlayerMap(Player) Then
			XCoord = Abs(GetPlayerX(Loop) - GetPlayerX(Player))
			YCoord = Abs(GetPlayerY(Loop) - GetPlayerY(Player))
			If XCoord < 3 & YCoord < 3 Then
				If Player <> Loop Then
					If GetPlayerAccess(Loop) = 0 Then
	'					HP = GetPlayerHP(Loop)
	'					If Abs(GetPlayerArmor(Loop, Damage)) >= HP Then Damage = HP - GetPlayerArmor(Loop, 1)
						MagicAttackPlayer(Player, Loop, Damage)
					End If
				End If
			End If
		End If
	End If
Next Loop

For XCoord = 1 to 4
	For YCoord = 1 to 4
		For MonsterLoop = 0 to 9
			If GetPlayerX(Player) - 3 + XCoord = GetMonsterX(GetPlayerMap(Player), MonsterLoop) & GetPlayerY(Player) - 3 + YCoord = GetMonsterY(GetPlayerMap(Player), MonsterLoop) Then
				MagicAttackMonster(Player, MonsterLoop, Damage)
			End If
		Next MonsterLoop
		CreateCharacterEffect(GetPlayerMap(Target), Target, 37, 40, 8, 0, 0)
		'CreateCharacterEffect(GetPlayerMap(A), A, 9, 9, 9, 0, 0)
		'CreateTileEffect(GetPlayerMap(Player), GetPlayerX(Player) - 3 + XCoord, GetPlayerY(Player) - 3 + YCoord, Effect, 12, 0, 0, 0)
		'CreateTileEffect(GetPlayerMap(Player), GetPlayerX(Player) - 2 + XCoord, GetPlayerY(Player) - 2 + YCoord, Effect, 0, 10, 0, 0)
	Next YCoord
Next XCoord


End Sub

