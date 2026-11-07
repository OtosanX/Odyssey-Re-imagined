Sub Main(Player AS LONG)
	If HasObj(Player, 508) > 0 Then
		CreatePlayerFloatText(Player, "Has Flag!", WHITE)
		Timer(Player, 2, "FlagTimer")
		SetFlag(181, GetFlag(181) + 1)
		If GetFlag(181) = 30 Then
			PlayerMessage(Player, "You have one minute to return the flag", WHITE)
		End If
		If GetFlag(181) > 60 Then
			GlobalMessage(StrCat(GetPlayerName(Player), " held the Red Flag too long and it has been returned!"), BrightRed)
			TakeObj(Player, 508, HasObj(Player, 508))
			SpawnObject(70, 508, 1, 1, 6)
			SetFlag(181, 0)
		End If
	End if
	
	If HasObj(Player, 509) > 0 Then
		CreatePlayerFloatText(Player, "Has Flag!", WHITE)
		Timer(Player, 2, "FlagTimer")
		SetFlag(182, GetFlag(182) + 1)
		If GetFlag(182) = 30 Then
			PlayerMessage(Player, "You have one minute to return the flag", WHITE)
		End If
		If GetFlag(182) > 60 Then
			GlobalMessage(StrCat(GetPlayerName(Player), " held the Blue Flag too long and it has been returned!"), BrightBlue)
			TakeObj(Player, 509, HasObj(Player, 509))
			SpawnObject(78, 509, 1, 10, 6)
			SetFlag(182, 0)
		End If
	End If
End Sub