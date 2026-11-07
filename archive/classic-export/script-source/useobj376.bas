Sub Main(Player as Long)
dim Gate as Long
Gate = 0

If GetPlayerMap(Player) = 909 Then
	If GetPlayerX(Player) = 4 & GetPlayerY(Player) = 5 Then
		If GetPlayerDirection(Player) = Up Then
			Gate = 1
		End If
	End If
	If GetPlayerX(Player) = 5 & GetPlayerY(Player) = 4 Then
		If GetPlayerDirection(Player) = Left Then
			Gate = 1
		End If
	End If
End If

If Gate = 1 Then
	OpenDoor(909, 3, 4)
	OpenDoor(909, 4, 4)
	PlayerMessage(Player, "Sailor says, ''Lets go.''", Grey)
	TakeObj(Player, 376, 1)
Else
	PlayerMessage(Player, "One way ticket to Northcoast.", Grey)
End If

End Sub