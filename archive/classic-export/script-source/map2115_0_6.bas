
Function Main(Player as Long) AS LONG


If GetPlayerHP(Player) <> GetPlayerMaxHP(Player) Then
	PlayerWarp(Player, 2115, 1, 6)
	playermessage(player, "You need full health to enter!", grey)
	else

	playermessage(player, "With help from the current Fort owners, you enter.", white)
	PlayerWarp(Player, 2118, 10, 6)

end if
end function

