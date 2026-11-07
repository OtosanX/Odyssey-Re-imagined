Sub Main(Target AS LONG, Level AS LONG)
	Dim A As Long
	For A = 1 To 5000
		If GetPlayerLevel(Target) < Level Then
				GivePlayerExp(Target, 50000)
		Else
				SetPlayerHP(Target, GetPlayerMaxHP(Target))
				SetPlayerEnergy(Target, GetPlayerMaxEnergy(Target))
				SetPlayerMana(Target, GetPlayerMaxMana(Target))
				Exit Sub
		End If
	Next A
End Sub