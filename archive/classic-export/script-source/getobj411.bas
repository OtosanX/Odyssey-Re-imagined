Function Main(Player AS LONG, Value AS LONG) AS LONG
    If GetPlayerClass(Player) = 4 Then
'		If HasObj(Player, 411) + Value > 2 Then
'			PlayerMessage(Player, "You can't carry anymore Living Essence.", Grey)
'			Main = Stop
'		Else
			Main = Continue
'		End If
	Else
		PlayerMessage(Player, "As you touch the Living Essence it burns you!", Red)
		Main = Stop
	End If
End Function