Sub Main(Player as Long)
dim Loop as Long, Count as Long

For Loop = 1 To GetMaxUsers()
	If GetPlayerFlag(Loop, 10) = 11 Then
		If GetPlayerFlag(Loop, 11) = 1 Then Count = Count + 1
	End If
Next Loop

If Count < GetFlag(104) Then
	RunScript1("FootballRed", Player)
	MapMessage(1423, strcat(GetPlayerName(Player), " has subbed in."), Red)
	MapMessage(1424, strcat(GetPlayerName(Player), " has subbed in."), Red)
	MapMessage(1425, strcat(GetPlayerName(Player), " has subbed in."), Red)
Else
	PlayerWarp(Player, 1423, 1, 0)
	PlayerMessage(Player, strcat("There are already ", strcat(str(GetFlag(104)), " players on the field.")), Yellow)
End If

End Sub