Sub Main(Player as Long)

If GetPlayerEquipped(Player, 5) = 59 Then
	PlayerMessage(Player, "You must remove your Shard to adopt a new Mindset.", Grey)
	Exit Sub
End If
If GetPlayerFlag(Player, 23) <> 0 Then
	PlayerMessage(Player, "You must wait to adopt a new Mindset.", Grey)
	Exit Sub
End If
If GetPlayerHP(Player) <> GetPlayerMaxHP(Player) Then
	PlayerMessage(Player, "You require full health to adopt a new Mindset.", Grey)
	Exit Sub
End If
If GetPlayerFlag(Player, 205) = 2 Then
	PlayerMessage(Player, "You are already in this Mindset.", Grey)
	Exit Sub
End If

SetPlayerFlag(Player, 23, 1)
RunScript1("SpellCooldown", Player)

SetPlayerFlag(Player, 205, 2)
PlayerMessage(Player, "You have adopted a Heroic Mindset.", White)
CreateCharacterEffect(GetPlayerMap(Player), Player, 50, 80, 8, 0, 0)

End Sub