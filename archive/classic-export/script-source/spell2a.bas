
Sub Main(Player as Long)
Dim Effect as Long, Damage as Long, HP as Long
Dim XCoord as Long, YCoord as Long, Loop as Long, MonsterLoop as Long

'Area of Effect - Mage Spell - Arcane Rain
'effect = 59
Effect = 3
Damage = GetPlayerDamage(Player) + 5

SetPlayerFlag(Player, 23, 0)

For Loop = 1 to GetMaxUsers()
	If IsPlaying(Loop) Then
		If GetPlayerMap(Loop) = GetPlayerFlag(Player, 24) Then
			XCoord = Abs(GetPlayerX(Loop) - GetPlayerFlag(Player, 21))
			YCoord = Abs(GetPlayerY(Loop) - GetPlayerFlag(Player, 22))
			If XCoord < 2 & YCoord < 2 Then
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

For XCoord = 1 to 3
	For YCoord = 1 to 3
		For MonsterLoop = 0 to 9
			If GetPlayerFlag(Player, 21) - 2 + XCoord = GetMonsterX(GetPlayerMap(Player), MonsterLoop) & GetPlayerFlag(Player, 22) - 2 + YCoord = GetMonsterY(GetPlayerMap(Player), MonsterLoop) Then
				MagicAttackMonster(Player, MonsterLoop, Damage)
			End If
		Next MonsterLoop
		CreateTileEffect(GetPlayerFlag(Player, 24), GetPlayerFlag(Player, 21) - 2 + Xcoord, GetPlayerFlag(Player, 22) - 2 + Ycoord, Effect, 33, 10, 0, 0)
	Next YCoord
Next XCoord

End Sub