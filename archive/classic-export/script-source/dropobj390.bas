Function Main(Player as Long) AS LONG

If GetPlayerMap(Player) = 139 Then
	If GetPlayerX(Player) = 5 & GetPlayerY(Player) = 10 Then
		Main = Stop
		PlayerMessage(Player, "You cant drop that here.", Grey)
	Else
		If GetPlayerX(Player) = 4 & GetPlayerY(Player) = 10 Then
			Main = Stop
			PlayerMessage(Player, "You cant drop that here.", Grey)
		Else
			If GetPlayerX(Player) = 6 & GetPlayerY(Player) = 10 Then
				Main = Stop
				PlayerMessage(Player, "You cant drop that here.", Grey)
			Else
				Main = Continue
			End If
		End If
	End If
Else
	Main = Continue
End If

End Function