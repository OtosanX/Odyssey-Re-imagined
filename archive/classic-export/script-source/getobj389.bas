Function Main(Player as Long) as Long

If GetPlayerGuild(Player) > 0 Then
	If HasObj(Player, 393) | HasObj(Player, 389) Then
		PlayerMessage(Player, "You are already holding an Artifact.", Grey)
		Main = Stop
	Else
		GlobalMessage(strcat(GetPlayerName(Player), " has picked up the Dragonia Candle!"), Yellow)
		Main = Continue
	End If
Else
	PlayerMessage(Player, "You must be Guilded to handle this Artifact.", Grey)
	Main = Stop
End If

End Function