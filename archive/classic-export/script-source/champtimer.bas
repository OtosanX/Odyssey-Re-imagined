Sub Main()	
	Dim Loop as Long

	SetFlag(89, GetFlag(89) - 1)

	If GetFlag(89) = 10 Then GlobalMessage("Solo the Champ has closed.", Yellow)
	If GetFlag(89) = 1 Then
		MapMessage(1828, "You will be warped out in 1 minute.", Yellow)
		MapMessage(1829, "You will be warped out in 1 minute.", Yellow)
	End If

	If GetFlag(89) = 0 Then
		For Loop = 1 To GetMaxUsers()
			If GetPlayerMap(Loop) = 1828 | GetPlayerMap(Loop) = 1829 Then RunScript1("GameWarp", Loop)
		Next Loop
	End If

	If GetFlag(90) > 0 Then
		For Loop = 1 to GetMaxUsers()
			If GetPlayerMap(Loop) = 1828 Then
				If GetPlayerY(Loop) > 4 Then
					SetMonsterTarget(1828, 0, Loop)
				End If
			End If
		Next Loop
	End If
	
	If GetFlag(95) > 0 Then
		For Loop = 1 to GetMaxUsers()
			If GetPlayerMap(Loop) = 1829 Then
				If GetPlayerY(Loop) > 4 Then
					SetMonsterTarget(1829, 0, Loop)
				End If
			End If
		Next Loop
	End If
End Sub