Sub Main(Player as Long)

If GetPlayerMap(Player) = 1443 Then
	If GetPlayerFlag(Player, 10) = 13 Then
		RunScript0("TeamArena")
	Else
		PlayerMessage(Player, "You cannot start a Team Battle.", Grey)
	End If
Else
	PlayerMessage(Player, "This is not the Team Arena.", Grey)
End If

End Sub