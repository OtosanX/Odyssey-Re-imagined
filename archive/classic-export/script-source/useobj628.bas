Sub Main(Player as Long)
Dim Map as Long, X as Long, Y as Long
Dim CalcX as Long, CalcY as Long
Dim Mana as Long, Health as Long, Energy as Long, Loop as Long
'Leech Energy

Mana = 40
Map = GetPlayerMap(Player)
X = GetPlayerX(Player)
Y = GetPlayerY(Player)

'Stakes Arena
If GetPlayerMap(Player) = 1949 Then
	PlayerMessage(Player, "You can't use this spell here!", Grey)
	Exit Sub
End If



if getplayerflag(player, 250) < 3 | getplayerflag(player,250) > 3 then
	playermessage(player, "You must be a venerate Rogue to use this spell.", white)
	exit sub
end if

'If HasObj(Player, 280) >= 1 Then
'	TakeObj(Player, 280, 1) 
'Else
'	PlayerMessage(Player, "You need Ancient Relics to cast this spell!", Grey)
'	Exit Sub
'End If

If GetPlayerGuild(Player) = 0 Then
	PlayerMessage(Player, "You must be Guilded to cast this spell.", Grey)
	Exit Sub
End If
If GetPlayerFlag(Player, 23) > 0 Then
	PlayerMessage(Player, "You must wait to cast again.", Grey)
	Exit Sub
End If
If GetPlayerMana(Player) < Mana Then
	PlayerMessage(Player, "You must regenerate before casting.", Grey)
	Exit Sub
	
End If
	SetPlayerFlag(Player, 23, 1)
	RunScript1("SpellCooldown", Player)
	SetPlayerMana(Player, GetPlayerMana(Player) - Mana)
	'CreatePlayerFloatText(Player, "Lu Bei!", BrightGreen)

For Loop = 1 To GetMaxUsers()
	If IsPlaying(Loop) Then
		If GetPlayerMap(Loop) = Map Then
			'If GetPlayerGuild(Loop) = GetPlayerGuild(Player) Then
				CalcX = Abs(GetPlayerX(Loop) - X)
				CalcY = Abs(GetPlayerY(Loop) - Y)
				If CalcX < 2 & CalcY < 2 Then
					Energy = Divide(GetPlayerEnergy(Loop), 8)
					SetPlayerEnergy(Loop, GetPlayerEnergy(Loop) - Energy)
					'SetPlayerEnergy(Player, GetPlayerEnergy(Player) + Energy)
					'If GetPlayerEnergy(Player) > GetPlayerMaxEnergy(Player) Then SetPlayerEnergy(Player, GetPlayerMaxEnergy(Player))
					CreateCharacterEffect(GetPlayerMap(Loop), Loop, 3, 3, 8, 0, 0)
					'CreatePlayerFloatText(Player, str(Energy), Yellow)
				End If
			'End If
		End If
	End If
Next Loop

End Sub