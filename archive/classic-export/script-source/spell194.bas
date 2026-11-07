Sub Main(Player as Long)
	Dim Count as Long, Energy as Long, XCoord as Long, YCoord as Long, Loop as Long
	'Area of Effect - Sacrafice Energy
	If GetPlayerMap(Player) = 1427 | GetPlayerMap(Player) = 1828 | GetPlayerMap(Player) = 1829 Then Exit Sub

	If GetPlayerFlag(Player, 213) = 1 Then
	PlayerMessage(Player, "Cooling down.", Grey)
	exit sub
	end if

	For Loop = 1 to GetMaxUsers()
		If IsPlaying(Loop) Then
			If GetPlayerMap(Loop) = GetPlayerMap(Player) Then
				XCoord = Abs(GetPlayerX(Loop) - GetPlayerX(Player))
				YCoord = Abs(GetPlayerY(Loop) - GetPlayerY(Player))
				If XCoord < 2 & YCoord < 2 Then
					If GetPlayerGuild(Player) > 0 Then
						If GetPlayerGuild(Player) = GetPlayerGuild(Loop) Then
							If Player <> Loop Then
								If GetPlayerAccess(Loop) = 0 Then
								Count = Count + 1
								End If
							End If
						End If
					End If
				End If
			End If
		End If
	Next Loop

	If Count > 0 Then
		Energy = Divide(GetPlayerEnergy(Player), Count)
		SetPlayerEnergy(Player, 0)
		CreatePlayerFloatText(Player, "Nike Tima!", BrightGreen)
			
		SetPlayerFlag(Player, 213, 1)
		Timer(Player, 60, "SACTIMER")

		For Loop = 1 to GetMaxUsers()
			If IsPlaying(Loop) Then
				If GetPlayerMap(Loop) = GetPlayerMap(Player) Then
					XCoord = Abs(GetPlayerX(Loop) - GetPlayerX(Player))
					YCoord = Abs(GetPlayerY(Loop) - GetPlayerY(Player))
					If XCoord < 2 & YCoord < 2 Then
						If Player <> Loop Then
							If GetPlayerAccess(Loop) = 0 Then
								If GetPlayerGuild(Player) > 0 Then
									If GetPlayerGuild(Player) = GetPlayerGuild(Loop) Then
										'SetPlayerEnergy(Loop, GetPlayerEnergy(Loop) + Energy)
										'If GetPlayerEnergy(Loop) > GetPlayerMaxEnergy(Loop) Then SetPlayerEnergy(Loop, GetPlayerMaxEnergy(Loop))
										'CreatePlayerFloatText(Loop, str(Energy), Yellow)
										CreateCharacterEffect(GetPlayerMap(Loop), Loop, 46, 50, 20, 1, 0)
										RunScript2("energy1", Loop, Energy)
										End If
									End If
								End If
							End If
						End If
					End If
				End If

		Next Loop
	End If

End Sub

'RunScript2("heal1", Loop, Health)