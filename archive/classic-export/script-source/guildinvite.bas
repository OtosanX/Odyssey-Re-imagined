Function Main(Player AS LONG) AS LONG
	If GetPlayerFlag(Player, 10) > 0 Then
		PlayerMessage(Player, "You cannot invite people to your guild during an event dipshit", Grey)
		Main = Stop
		Exit Function
	End If
	
	Main = Continue
End Function