Sub Main(Player as Long)
dim Map as Long, X as Long, Y as Long
dim Damage as Long, Loop as Long, Energy as Long

Map = GetPlayerFlag(Player, 24)
X = GetPlayerFlag(Player, 21)
Y = GetPlayerFlag(Player, 22)
Damage = GetPlayerDamage(Player) + Random(6)
If Damage < 10 Then Damage = 10

RunScript1("SpellCooldown", Player)
CreateTileEffect(Map, X, Y, 1, 40, 8, 0, 0)

For Loop = 1 To GetMaxUsers()
	If IsPlaying(Loop) Then
		If GetPlayerMap(Loop) = Map Then
			If GetPlayerX(Loop) = X & GetPlayerY(Loop) = Y Then
				If Player = Loop Then
					Energy = Divide(GetPlayerEnergy(Loop), 10)
					SetPlayerEnergy(Loop, GetPlayerEnergy(Loop) - Energy)
					SetPlayerEnergy(Player, GetPlayerEnergy(Player) + Energy)
				'Else
					'MagicAttackPlayer(Player, Loop, Damage - 10)
				End If
			End If
		End If
	End If
Next Loop

end sub