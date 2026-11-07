Sub Main(Player as Long)
dim Flag as Long, Count as Long, Cost as Long
Cost = GetFlag(180)

If GetFlag(170) > 0 Then
	PlayerMessage(Player, "A Tournament is already in progress.", Grey)
'	PlayerWarp(Player, 1883, GetPlayerX(Player), 11)
	RunScript1("GameWarp", Player)
	Exit Sub
End If

If GetFlag(80) = 0 Then
	PlayerMessage(Player, "The tournament arena is closed.", Grey)
	PlayerWarp(Player, 1883, GetPlayerX(Player), 11)
	Exit Sub
End If

If HasObj(Player, 6) < Cost Then
	PlayerMessage(Player, strcat("You require ", strcat(str(Cost), " Gold to enter this Tournament.")), Grey)
	PlayerWarp(Player, 1883, GetPlayerX(Player), 11)
	Exit Sub
End If

Count = 0
For Flag = 171 To 178
	If GetFlag(Flag) = 0 Then
		Select Case Flag
			Case 171
				PlayerWarp(Player, 1883, 2, 6)
			Case 172
				PlayerWarp(Player, 1883, 2, 8)
			Case 173
				PlayerWarp(Player, 1883, 4, 6)
			Case 174
				PlayerWarp(Player, 1883, 4, 8)
			Case 175
				PlayerWarp(Player, 1883, 6, 6)
			Case 176
				PlayerWarp(Player, 1883, 6, 8)
			Case 177
				PlayerWarp(Player, 1883, 8, 6)
			Case 178
				PlayerWarp(Player, 1883, 8, 8)
		End Select
		SetFlag(Flag, Player)
		SetPlayerFlag(Player, 10, 14)
		SetPlayerFlag(Player, 11, 0)
		TakeObj(Player, 6, Cost)
		SetFlag(179, GetFlag(179) + Cost)
		GoTo EndLoop
	End If
Next Flag
PlayerWarp(Player, 1883, GetPlayerX(Player), 11)

EndLoop:
For Flag = 171 To 178
	If GetFlag(Flag) > 0 Then Count = Count + 1
Next Flag

If Count = 8 Then
	MapMessage(1883, strcat("The Tournament Prize Pot is ", strcat(str(GetFlag(179)), " Gold!")), Yellow)
	RunScript0("TournamentRound1")
End If

End Sub