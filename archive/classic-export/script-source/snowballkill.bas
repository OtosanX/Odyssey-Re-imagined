Sub Main(Killer as Long, Killed as Long)

If GetPlayerFlag(Killer, 11) = 1 Then
	SetPlayerFlag(Killer, 11, 0)
	SetPlayerSprite(Killer, 34)
	RunScript1("Restore", Killer)
	SetPlayerFlag(Killer, 12, GetPlayerFlag(Killer, 12) + 1)

	SetPlayerFlag(Killed, 11, 1)
	SetPlayerSprite(Killed, 113)
	RunScript1("Restore", Killed)
	MapMessage(620, strcat(GetPlayerName(Killer), strcat(" tags ", strcat(GetPlayerName(Killed), "!"))), Yellow)
Else
	SetPlayerFlag(Killer, 12, GetPlayerFlag(Killer, 12) + 1)
End If

End Sub