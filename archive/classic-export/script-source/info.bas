Sub Main(Player as Long)

PlayerMessage(Player, "=Player Info=", Yellow)
If GetPlayerFlag(Player, 78) = 1 Then
	PlayerMessage(Player, strcat(GetPlayerName(Player), " is one of Fank's Henchmen!"), Green)
End If
If GetPlayerFlag(Player, 218) > 1 Then
	PlayerMessage(Player, strcat(GetPlayerName(Player), strcat(" has ruled over ToF Run ", strcat(str(GetPlayerFlag(Player, 218)), " times!"))), Green)
Else
	If GetPlayerFlag(Player, 218) = 1 Then
		PlayerMessage(Player, strcat(GetPlayerName(Player), " has ruled over ToF Run!"), Green)
	End If
End If
Select Case GetPlayerFlag(Player, 215)
	Case 1
		PlayerMessage(Player, strcat(GetPlayerName(Player), " has slain the Champ single handed!"), Red)
	Case 2
		PlayerMessage(Player, strcat(GetPlayerName(Player), " has slain the Bremen in close quarters!"), Red)
	Case 3
		PlayerMessage(Player, strcat(GetPlayerName(Player), " has slain the Vorpal Bunny in close quarters!"), Red)
	Case 4
		PlayerMessage(Player, strcat(GetPlayerName(Player), " has stared into the eyes of Death and preveiled!"), Red)
End Select
If GetPlayerFlag(Player, 6) > 0 Then PlayerMessage(Player, strcat(GetPlayerName(Player), " is an initiate of the Sanctuary Brotherhood."), Cyan)

End Sub