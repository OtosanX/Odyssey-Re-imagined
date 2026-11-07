
Sub Main(Player as Long)
dim Mana as Long, Loop as Long, X as Long, Y as Long, Gate as Long
'Thief Hide Others
Mana = 30
If RunScript1("CheckMap", Player) = 1 Then
	PlayerMessage(Player, "You cannot cast that here.", Grey)
	Exit Sub
End If
If GetPlayerFlag(Player, 23) <> 0 Then
	PlayerMessage(Player, "You must wait to use this ability.", Grey)
	Exit Sub
End If
If GetPlayerHP(Player) <> GetPlayerMaxHP(Player) Then
	PlayerMessage(Player, "You need full Health to use this ability.", Grey)
	Exit Sub
End If
If GetPlayerMana(Player) < Mana Then
	PlayerMessage(Player, "You must regenerate to use this ability.", Grey)
	Exit Sub
End If

SetPlayerFlag(Player, 23, 1)
SetPlayerMana(Player, GetPlayerMana(Player) - Mana)
RunScript1("SpellCooldown", Player)

X = GetPlayerX(Player)
Y = GetPlayerY(Player)
Select Case GetPlayerDirection(Player)
	Case Up
		Y = Y - 1
	Case Down
		Y = Y + 1
	Case Left
		X = X - 1
	Case Right
		X = X + 1
End Select

For Loop = 1 To GetMaxUsers()
	If GetPlayerMap(Player) = GetPlayerMap(Loop) Then
		If GetPlayerX(Loop) = X & GetPlayerY(Loop) = Y Then
			If GetPlayerFlag(Loop, 25) = 0 Then
				If GetPlayerFlag(Player, 27) = 0 Then
					If GetPlayerGuild(Player) > 0 Then
						If GetPlayerGuild(Player) = GetPlayerGuild(Loop) Then
							If Player <> Loop Then
								SetPlayerFlag(Loop, 25, 1)
								SetPlayerFlag(Loop, 19, GetPlayerSprite(Loop))
								SetPlayerFlag(Loop, 20, GetPlayerStatus(Loop))
								SetPlayerFlag(Loop, 21, GetPlayerX(Loop))
								SetPlayerFlag(Loop, 22, GetPlayerY(Loop))
								SetPlayerStatus(Loop, 9)
								SetPlayerSprite(Loop, 255)
								Timer(Loop, 20, "TurnVisible")
								Timer(Loop, 1, "Invis1")
								Gate = 1
							End If
						else
							PlayerMessage(Player, "You must be in the same guild as your target.", Grey)
						end if
					else
						PlayerMessage(Player, "You must be in the same guild as your target.", Grey)
					end if
				Else
					PlayerMessage(Player, "Target cannot hide yet.", Grey)
				End If
			End If
		End If
	End If
Next Loop
If Gate = 1 Then 'Worked
	CreateCharacterEffect(GetPlayerMap(Player), Player, 61, 40, 8, 0, 0)
	CreateTileEffect(GetPlayerMap(Player), X, Y, 57, 40, 8, 0, 0)
Else
	CreateTileEffect(GetPlayerMap(Player), X, Y, 52, 40, 8, 0, 0)
End If

End Sub

