Sub Main(Player as Long)
dim Loop as Long, Count as Long

For Loop = 1 To GetMaxUsers()
	If GetPlayerFlag(Loop, 10) = 11 Then
		If GetPlayerFlag(Loop, 11) = 2 Then Count = Count + 1
	End If
Next Loop

If Count < GetFlag(104) Then
	RunScript1("FootballBlue", Player)
	MapMessage(1423, strcat(GetPlayerName(Player), " has subbed in."), Blue)
	MapMessage(1424, strcat(GetPlayerName(Player), " has subbed in."), Blue)
	MapMessage(1425, strcat(GetPlayerName(Player), " has subbed in."), Blue)
Else
	PlayerWarp(Player, 1425, 10, 11)
	PlayerMessage(Player, strcat("There are already ", strcat(str(GetFlag(104)), " players on the field.")), Yellow)
End If

End Sub