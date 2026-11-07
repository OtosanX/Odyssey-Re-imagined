Sub Main(Killer as Long, Killed as Long)

If GetPlayerFlag(Killed, 11) = 1 Then
	RunScript1("FootballRedSub", Killed)
	MapMessage(1423, strcat(GetPlayerName(Killer), strcat(" knocks ", strcat(GetPlayerName(Killed), " onto the bench!"))), Blue)
	MapMessage(1424, strcat(GetPlayerName(Killer), strcat(" knocks ", strcat(GetPlayerName(Killed), " onto the bench!"))), Blue)
	MapMessage(1425, strcat(GetPlayerName(Killer), strcat(" knocks ", strcat(GetPlayerName(Killed), " onto the bench!"))), Blue)
End If
If GetPlayerFlag(Killed, 11) = 2 Then
	RunScript1("FootballBlueSub", Killed)
	MapMessage(1423, strcat(GetPlayerName(Killer), strcat(" knocks ", strcat(GetPlayerName(Killed), " onto the bench!"))), Red)
	MapMessage(1424, strcat(GetPlayerName(Killer), strcat(" knocks ", strcat(GetPlayerName(Killed), " onto the bench!"))), Red)
	MapMessage(1425, strcat(GetPlayerName(Killer), strcat(" knocks ", strcat(GetPlayerName(Killed), " onto the bench!"))), Red)
End If

End Sub