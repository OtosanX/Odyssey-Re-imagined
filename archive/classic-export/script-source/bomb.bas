Sub Main(Player as Long)
dim Map as Long, X as Long, Y as Long, Loop as Long

Map = GetPlayerFlag(Player, 24)
X = GetPlayerFlag(Player, 21)
Y = GetPlayerFlag(Player, 22)

SetPlayerFlag(Player, 23, 0)
CreateTileEffect(Map, X, Y, 1, 40, 8, 0, 0)

For Loop = 1 To GetMaxUsers()
	If IsPlaying(Loop) Then
		If GetPlayerMap(Loop) = Map & GetPlayerX(Loop) = X & GetPlayerY(Loop) = Y Then
			If Player = Loop Then
'				SetPlayerHP(Player, GetPlayerHP(Player) - 30)
'				CreatePlayerFloatText(Player, "30", BrightRed)
				MonsterMagicAttackPlayer(GetPlayerMap(Loop), 0, Loop, 30)
			Else
				MagicAttackPlayer(Player, Loop, 30)
			End If
		End If
	End If
Next Loop
For Loop = 0 To 5
	If GetMonsterX(Map, Loop) = X & GetMonsterY(Map, Loop) = Y Then
		MagicAttackMonster(Player, Loop, 50)
	End If
Next Loop

End Sub