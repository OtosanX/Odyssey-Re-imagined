Sub Main(Player as Long)
dim Health as Long

Health = 40

If GetPlayerFlag(Player, 28) > 0 Then
	PlayerMessage(Player, "You must wait to use this ability.", Grey)
	Exit Sub
End If
If GetPlayerHP(Player) < Health Then
	PlayerMessage(Player, "You are too close to death.", Grey)
	Exit Sub
End If

SetPlayerHP(Player, GetPlayerHP(Player) - Health)
SetPlayerFlag(Player, 28, 1)
RunScript1("BuffCooldown", Player)

CreatePlayerFloatText(Player, "ARRGH", Red)
CreateCharacterEffect(GetPlayerMap(Player), Player, 7, 40, 3, 1, 0)

SetPlayerFlag(Player, 123, 5)
CalculateStats(Player)
Timer(Player, 60, "Debuff")

End Sub