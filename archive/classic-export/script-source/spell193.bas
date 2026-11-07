
Sub Main(Player as Long)
	dim Map as Long, X as Long, Y as Long
	dim Loop as Long, Mana as Long, Health as Long, Energy as Long
	dim CalcX as Long, CalcY as Long


If GetPlayerGuild(Player) = 0 Then
playermessage(player, "You must be in a Guild.", grey)
exit sub
end if

if getplayerflag(player, 23) = 1 then
		playermessage(player,"This spell is in cooldown.",white)
		exit sub
	end if

If HasObj(Player, 280) >= 5 Then
	TakeObj(Player, 280, 2) 
Else
	PlayerMessage(Player, "You need Ancient Relics to cast this spell!", Grey)
	Exit Sub
End If

If GetPlayerFlag(Player, 16) = 0 Then
playermessage(player, "Your spells must be set to Guild only.", grey)
exit sub
end if


    'Check if we are cooling down still
	

	'Set Cooldown Timer
	SetPlayerFlag(Player, 23, 1)
	Timer(Player, 5, "Cooldown")
    
  

  
  
Map = GetPlayerMap(Player)
	X = GetPlayerX(Player)
	Y = GetPlayerY(Player)
	Mana = 45
	Energy = 15
	Health = GetPlayerHP(Player) - Divide(GetPlayerMaxHP(Player), 2)
	If Health < 1 Then Health = 1
	





	If GetTileAtt(Map, X, Y) = 6 | GetTileAtt2(Map, X, Y) = 6 Then
		PlayerMessage(Player, "You may not cast that here.", Grey)
		Exit Sub
	End If
	If GetPlayerMana(Player) < Mana Then
		PlayerMessage(Player, "You must regenerate before casting.", Grey)
		Exit Sub
	End If
	If GetPlayerHP(Player) >= Health Then
	SetPlayerHP(Player, GetPlayerHP(Player) - Health)
	Else
	PlayerMessage(Player, "You are too close to death.", Grey)
	End If


	CreatePlayerFloatText(Player, "Sevria Lehr!", BrightGreen)
	SetPlayerMana(Player, GetPlayerMana(Player) - Mana)
	SetPlayerEnergy(Player, GetPlayerEnergy(Player) - Energy)

	For Loop = 1 to GetMaxUsers()
		If IsPlaying(Loop) Then
	'		If GetPlayerClass(Loop) <> 4 Then
				If Map = GetPlayerMap(Loop) Then
					If Player <> Loop Then
						CalcX = Abs(GetPlayerX(Loop) - X)
						CalcY = Abs(GetPlayerY(Loop) - Y)
						If CalcX < 4 & CalcY < 4 Then
							If GetPlayerFlag(Player, 16) = 0 Then
								
								If GetPlayerGuild(Loop) > 0 Then
									If GetMapIsFriendly(Map) = True | GetMapIsPK(Map) = True Then
										RunScript2("heal1", Loop, Health)
									Else
										'Unguildeds cant heal guildeds on a white map
									End If
								Else
									RunScript2("heal1", Loop, Health)
								End If
							Else
								If GetPlayerGuild(Player) > 0 Then
									If GetPlayerGuild(Player) = GetPlayerGuild(Loop) Then
										RunScript2("heal1", Loop, Health)
										
									End If
								Else
									End If
								End If
							End If
						End If
					End If
				End If
	'		End If

	Next Loop

End Sub
