Function Main(Player as Long) AS LONG

If strcmp(GetPlayerUser(Player), "Lisa14") Then
	GlobalMessage(strcat(GetPlayerName(Player), " thinks she's tough... but she wobbles."), BrightBlue)
Else
	If GetPlayerGender(Player) = 0 Then
		GlobalMessage(strcat(GetPlayerName(Player), " thinks he's tough... but he's not."), BrightBlue)
	Else
		GlobalMessage(strcat(GetPlayerName(Player), " thinks she's tough... but she's not."), BrightBlue)
	End If
End If

Main = Continue

End Function