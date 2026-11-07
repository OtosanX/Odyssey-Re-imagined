
Sub Main(Player as Long)
Dim Mana as Long
'Area of Effect - Mage Spell
If GetPlayerMap(Player) = 1427 | GetPlayerMap(Player) = 1828 | GetPlayerMap(Player) = 1829 | getplayermap(player) = 1949 Then Exit Sub

Mana = 40


if getplayerflag(player, 250) < 3 | getplayerflag(player,250) > 3 then
	playermessage(player, "You must be a venerate Rogue to use this spell.", white)
	exit sub
end if




If GetPlayerFlag(Player, 23) > 0 Then
	PlayerMessage(Player, "You must wait to cast again.", Grey)
	Exit Sub
End If

If GetPlayerMana(Player) < Mana Then
	PlayerMessage(Player, "You must regenerate before casting.", Grey)
	Exit Sub
End If

SetPlayerMana(Player, GetPlayerMana(Player) - Mana)
SetPlayerFlag(Player, 23, 1)

SetPlayerFlag(Player, 24, GetPlayerMap(Player))
SetPlayerFlag(Player, 21, GetPlayerX(Player))
SetPlayerFlag(Player, 22, GetPlayerY(Player))

CreateTileEffect(GetPlayerMap(Player), GetPlayerX(Player), GetPlayerY(Player), 50, 50, 8, 2, 0)
Timer(Player, 1, "testbomb")

End Sub