
Function Main(Player as Long) AS LONG
'Store Command - Push
Dim Map as Long, StartX as Long, StartY as Long
Dim CheckX as Long, CheckY as Long, DestX as Long, DestY as Long
Dim Loop as Long

Map = GetPlayerMap(Player)
StartX = GetPlayerX(Player)
StartY = GetPlayerY(Player)

'if getplayerhp(player) <> getplayermaxhp(player) then
	'playermessage(player, "Push requires full hp to use.",white)
	'exit function
'end if

'Push timer - currently disabled
If GetPlayerFlag(Player, 109) > 0 Then Exit Function

If GetPlayerHP(Player) > Divide(GetPlayerMaxHP(Player), 2) Then
	PlayerMessage(Player, "You must be below 50% health to cast this spell.", White)
	Exit Function
End If

If GetPlayerGuild(Player) = 0 Then
	playermessage(player, "You need to be in a guild.", grey)
	Exit function
end if

If GetPlayerEquipped(Player, 2) = 0 Then
	playermessage(player, "You cannot use this ability without a shield!", grey)
	Exit function
end if

'If HasObj(Player, 280) >= 1 Then
'	TakeObj(Player, 280, 4) 
'Else
'	PlayerMessage(Player, "You need Ancient Relics to cast this spell!", Grey)
	'Exit function
'End If


SetPlayerFlag(Player, 109, 1)
Timer(Player, 1, "PushTimer")
Select Case GetPlayerDirection(Player)
	Case Up
		CheckX = StartX
		CheckY = StartY - 1
		DestX = CheckX
		DestY = CheckY - 1
	Case Down
		CheckX = StartX
		CheckY = StartY + 1
		DestX = CheckX
		DestY = CheckY + 1
	Case Left
		CheckX = StartX - 1
		CheckY = StartY
		DestX = CheckX - 1
		DestY = CheckY
	Case Right
		CheckX = StartX + 1
		CheckY = StartY
		DestX = CheckX + 1
		DestY = CheckY
End Select

'Check bounds, if an invalid place to check then exit the script
If CheckX < 0 | CheckY < 0 | CheckX > 11 | CheckY > 11 Then Exit Function
If DestX < 0 | DestY < 0 | DestX > 11 | DestY > 11 Then Exit Function

If RunScript3("CheckAtt", Player, CheckX, CheckY) = Stop Then Exit Function
If RunScript3("CheckAtt2", Player, CheckX, CheckY) = Stop Then Exit Function
If RunScript3("CheckAtt", Player, DestX, DestY) = Stop Then Exit Function
If RunScript3("CheckAtt2", Player, DestX, DestY) = Stop Then Exit Function
'If GetTileAtt(Map, CheckX, CheckY) > 0 Then Exit function
'If GetTileAtt(Map, DestX, DestY) > 0 Then Exit function
'If GetTileAtt2(Map, CheckX, CheckY) > 0 Then Exit function
'If GetTileAtt2(Map, DestX, DestY) > 0 Then Exit function

For Loop = 1 To GetMaxUsers()
	If IsPlaying(Loop) Then
		If GetPlayerAccess(Loop) = 0 Then
			If GetPlayerMap(Loop) = Map Then
				If GetPlayerX(Loop) = CheckX Then
					If GetPlayerY(Loop) = CheckY Then 

'Target in position
						If GetPlayerHP(Loop) = GetPlayerMaxHP(Loop) Then 'Full HP
							PlayerWarp(Loop, Map, DestX, DestY)
						End If
					End If
				End If
			End If
		End If
	End If
Next Loop



End Function



