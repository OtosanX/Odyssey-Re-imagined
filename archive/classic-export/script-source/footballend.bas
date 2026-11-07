Sub Main(Player as Long)

If GetFlag(100) > GetFlag(101) Then
	If GetPlayerFlag(Player, 11) = 1 | GetPlayerFlag(Player, 11) = 3 Then
		GiveObj(Player, 483, 1)
	End If
Else
	If GetFlag(100) <> GetFlag(101) Then
		If GetPlayerFlag(Player, 11) = 2 | GetPlayerFlag(Player, 11) = 4 Then
			GiveObj(Player, 483, 1)
		End If
	End If
End If
PlayerMessage(Player, strcat("You scored ", strcat(str(GetPlayerFlag(Player, 12)), " goals!")), BrightGreen)
RunScript1("GameWarp", Player)

SetPlayerGuild(Player, GetPlayerFlag(Player, 5))
RunScript1("Sprite", Player)
SetPlayerFlag(Player, 10, 0)
SetPlayerFlag(Player, 11, 0)
SetPlayerFlag(Player, 12, 0)

End Sub