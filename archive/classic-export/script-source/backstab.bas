Sub Main(Player AS LONG)

	Dim Dir AS LONG, DestDir AS LONG
	Dim Map AS LONG, StartX AS LONG, StartY AS LONG
	Dim CheckX AS LONG, CheckY AS LONG
	Dim DestX AS LONG, DestY AS LONG
	Dim Damage AS LONG, Mana AS LONG
	
	Map = GetPlayerMap(Player)
	StartX = GetPlayerX(Player)
	StartY = GetPlayerY(Player)
	Dir = GetPlayerDirection(Player)
	Mana = 1
	Select Case Dir
		Case 0 'Up
			CheckX = StartX
			CheckY = StartY - 1
			DestX = CheckX
			DestY = CheckY - 1
			DestDir = 1
		Case 1 'Down
			CheckX = StartX
			CheckY = StartY + 1
			DestX = CheckX
			DestY = CheckY + 1
			DestDir = 0
		Case 2 'Left
			CheckX = StartX - 1
			CheckY = StartY
			DestX = CheckX - 1
			DestY = CheckY
			DestDir = 3
		Case 3 'Right
			CheckX = StartX + 1
			CheckY = StartY
			DestX = CheckX + 1
			DestY = CheckY
			DestDir = 2
	End Select
	
	'Check bounds, if an invalid place to check then exit the script
	If CheckX < 0 | CheckY < 0 | CheckX > 11 | CheckY > 11 Then Exit Sub
	If DestX < 0 | DestY < 0 | DestX > 11 | DestY > 11 Then Exit Sub
	If HasObj(Player, 298) = 0 Then
		PlayerMessage(Player, "You lack a required item.", Grey)
		Exit Sub	'Stabbin Dagger
	End If
'	If GetPlayerFlag(Player, 23) <> 0 Then
'		PlayerMessage(Player, "You may not cast so often.", Grey)
'		Exit Sub
'	End If
	If GetPlayerMana(Player) < Mana Then
		PlayerMessage(Player, "You must regenerate before casting again.", Grey)
		Exit Sub
	End If

	Dim A AS LONG
	For A = 1 to GetMaxUsers
		If IsPlaying(A) Then
			If GetPlayerMap(A) = Map & GetPlayerX(A) = CheckX & GetPlayerY(A) = CheckY Then
				If GetTileIsVacant(Map, DestX, DestY) = True Then
					If GetTileNoDirectionalWalls(Map, StartX, StartY, Dir) = True & GetTileNoDirectionalWalls(Map, CheckX, CheckY, Dir) = True & GetTileNoDirectionalWalls(Map, DestX, DestY, DestDir) = True Then
						PlayerWarp(Player, Map, DestX, DestY)
						SetPlayerDirection(Player, DestDir)
						If Dir = GetPlayerDirection(A) Then
							Damage = GetPlayerDamage(Player) + Divide(GetPlayerDamage(Player), 4)
							CreateCharacterEffect(GetPlayerMap(A), A, 38, 60, 8, 0, 0)
						Else
							If (Dir = 0 & GetPlayerDirection(A) = 1) | (Dir = 1 & GetPlayerDirection(A) = 0) | (Dir = 2 & GetPlayerDirection(A) = 3) | (Dir = 3 & GetPlayerDirection(A) = 2) Then
								Damage = GetPlayerDamage(Player)
								AttackPlayer(A, Player, Damage)
								CreateCharacterEffect(GetPlayerMap(A), A, 66, 60, 8, 0, 0)
								CreateCharacterEffect(GetPlayerMap(Player), Player, 66, 60, 8, 0, 0)
							Else
								Damage = GetPlayerDamage(Player) + Divide(GetPlayerDamage(Player), 6)
								CreateCharacterEffect(GetPlayerMap(A), A, 66, 60, 8, 0, 0)
							End If
						End If
						AttackPlayer(Player, A, Damage)
						SetPlayerMana(Player, GetPlayerMana(Player) - Mana)
'						SetPlayerFlag(Player, 23, 1)
'						RunScript1("cooldown", Player)
						Exit Sub
					End If
				End If
			End If
		End If
	Next A
	
'	For A = 0 to 5
'		If GetMonsterType(Map, A) > 0 & GetMonsterX(Map, A) = CheckX & GetMonsterY(Map, A) = CheckY Then
'			If GetTileIsVacant(Map, DestX, DestY) = True Then
'				If GetTileNoDirectionalWalls(Map, StartX, StartY, Dir) = True & GetTileNoDirectionalWalls(Map, CheckX, CheckY, Dir) = True & GetTileNoDirectionalWalls(Map, DestX, DestY, DestDir) = True Then
'					PlayerWarp(Player, Map, DestX, DestY)
'					SetPlayerDirection(Player, DestDir)
'					Damage = GetPlayerDamage(Player) + Divide(GetPlayerDamage(Player), 4)
'					AttackMonster(Player, A, 1)
'					Exit Sub
'				End If
'			End If
'		End If
'	Next A
End Sub
	