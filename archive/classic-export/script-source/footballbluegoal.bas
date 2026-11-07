Sub Main(Player as Long, Map as Long)

If Map = 1425 Then	'Own Goal
	SetFlag(100, GetFlag(100) + 1)
	MapMessage(1424, "OWN GOAL!!", BrightRed)
	If GetFlag(100) > GetFlag(101) Then
		MapMessage(1424, strcat("Red ", strcat(str(GetFlag(100)), strcat(" - ", strcat(str(GetFlag(101)), " Blue")))), BrightRed)
	Else
		MapMessage(1424, strcat("Blue ", strcat(str(GetFlag(101)), strcat(" - ", strcat(str(GetFlag(100)), " Red")))), BrightBlue)
	End If
	Select Case Random(3)
		Case 0
			MapMessage(1424, strcat(GetPlayerName(Player), " is a numpty."), Blue)
		Case 1
			MapMessage(1424, strcat(GetPlayerName(Player), " what are you playing at."), Blue)
		Case 2
			MapMessage(1424, strcat(GetPlayerName(Player), " - LEEROY JENKINS!!"), Blue)
	End Select
Else	'Goal
	SetFlag(101, GetFlag(101) + 1)
	MapMessage(1424, "GOAL!!", BrightGreen)
	If GetFlag(100) > GetFlag(101) Then
		MapMessage(1424, strcat("Red ", strcat(str(GetFlag(100)), strcat(" - ", strcat(str(GetFlag(101)), " Blue")))), BrightRed)
	Else
		MapMessage(1424, strcat("Blue ", strcat(str(GetFlag(101)), strcat(" - ", strcat(str(GetFlag(100)), " Red")))), BrightBlue)
	End If
	Select Case Random(3)
		Case 0
			MapMessage(1424, strcat(GetPlayerName(Player), " with a beauty! Go on my son!"), Green)
		Case 1
			MapMessage(1424, strcat(GetPlayerName(Player), " puts it in the back of the net!"), Green)
		Case 2
			MapMessage(1424, strcat(GetPlayerName(Player), " - HERO!"), Green)
	End Select
End If

End Sub