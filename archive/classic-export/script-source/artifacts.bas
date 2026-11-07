Sub Main()
dim Loop as Long

For Loop = 1 To GetMaxUsers()
	If HasObj(Loop, 393) Then
		If GetPlayerGuild(Loop) = 0 Then
			RunScript1("ArtifactSpawn", Loop)
		Else
			'Endurance Buff
			SetPlayerFlag(Loop, 124, 7)
		End If
	Else
		SetPlayerFlag(Loop, 124, 0)
	End If
	If HasObj(Loop, 389) Then
		If GetPlayerGuild(Loop) = 0 Then
			RunScript1("ArtifactSpawn", Loop)
		Else
			'Agility Buff
			SetPlayerFlag(Loop, 126, 5)
		End If
	Else
		SetPlayerFlag(Loop, 126, 0)
	End If
	CalculateStats(Loop)
Next Loop

End Sub