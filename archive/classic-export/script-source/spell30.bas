Sub Main(Player as Long)

If GetPlayerFlag(Player, 23) <> 0 Then
	PlayerMessage(Player, "You must wait to adopt a new Mindset.", Grey)
	Exit Sub
End If
If GetPlayerHP(Player) <> GetPlayerMaxHP(Player) Then
	PlayerMessage(Player, "You require full health to adopt a new Mindset.", Grey)
	Exit Sub
End If
If GetPlayerFlag(Player, 205) = 0 Then
	PlayerMessage(Player, "You are already in this Mindset.", Grey)
	Exit Sub
End If

SetPlayerFlag(Player, 23, 1)
RunScript1("SpellCooldown", Player)

SetPlayerFlag(Player, 205, 0)
PlayerMessage(Player, "You have adopted a Berserk Mindset.", White)
CreateCharacterEffect(GetPlayerMap(Player), Player, 49, 50, 8, 0, 0)
RunScript1("BuffMindset", Player)

End Sub