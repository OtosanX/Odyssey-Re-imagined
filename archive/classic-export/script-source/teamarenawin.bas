Sub Main()
dim Loop as Long, RedCount as Long, BlueCount as Long

For Loop = 1 To GetMaxUsers()
	If GetPlayerMap(Loop) = 1443 Then
		If GetPlayerFlag(Loop, 10) = 13 Then
			Select Case GetPlayerFlag(Loop, 11)
				Case 1
					RedCount = RedCount + 1
				Case 2
					BlueCount = BlueCount + 1
			End Select
		End If
	End If
Next Loop

If RedCount = 0 Then
	MapMessage(1443, "Blue Team has Won!", BrightGreen)
	SetFlag(153, 0)
	For Loop = 1 To GetMaxUsers()
		If GetPlayerMap(Loop) = 1443 Then
			If GetPlayerFlag(Loop, 10) = 13 Then
				PlayerWarp(Loop, 1443, 6, 10)
				PlayerMessage(Loop, strcat("You got ", strcat(str(GetPlayerFlag(Loop, 12)), " kills.")), White)
				SetPlayerFlag(Loop, 10, 0)
				SetPlayerFlag(Loop, 11, 0)
				SetPlayerFlag(Loop, 12, 0)
				SetPlayerGuild(Loop, GetPlayerFlag(Loop, 5))
				RunScript1("Sprite", Loop)
				RunScript1("Restore", Loop)
			End If
		End If
	Next Loop
End If

If BlueCount = 0 Then
	MapMessage(1443, "Red Team has Won!", BrightGreen)
	SetFlag(153, 0)
	For Loop = 1 To GetMaxUsers()
		If GetPlayerMap(Loop) = 1443 Then
			If GetPlayerFlag(Loop, 10) = 13 Then
				PlayerWarp(Loop, 1443, 5, 10)
				PlayerMessage(Loop, strcat("You got ", strcat(str(GetPlayerFlag(Loop, 12)), " kills.")), White)
				SetPlayerFlag(Loop, 10, 0)
				SetPlayerFlag(Loop, 11, 0)
				SetPlayerFlag(Loop, 12, 0)
				SetPlayerGuild(Loop, GetPlayerFlag(Loop, 5))
				RunScript1("Sprite", Loop)
				RunScript1("Restore", Loop)
			End If
		End If
	Next Loop
End If

End Sub