SUB Main(Player AS LONG)
	Dim CanExit as Long
	CanExit = 1
	
	If HasObj(Player, 1) Then

	Else
		If GetPlayerEquipped(Player, 1) > 0 Then

		Else
			CanExit = 0
		End If
	End If
	
	If HasObj(Player, 35) Then

	Else
		If GetPlayerEquipped(Player, 2) > 0 Then

		Else
			CanExit = 0
		End If
	End If
	
	
	If HasObj(Player, 10) Then

	Else
		If GetPlayerEquipped(Player, 3) > 0 Then

		Else
			CanExit = 0
		End If
	End If
	
	If HasObj(Player, 11) Then

	Else
		If GetPlayerEquipped(Player, 4) > 0 Then

		Else
			CanExit = 0
		End If
	End If
	
	If CanExit = 0 Then
		PlayerWarp(Player, 678, 9, 7)
	Else
		ResetMap(678)
		PlayerWarp(Player, 678, 5, 5)
		PlayerMessage(Player, "Great job!  Now, to equip your new items, double click them.", BRIGHTGREEN)
	End If
END SUB