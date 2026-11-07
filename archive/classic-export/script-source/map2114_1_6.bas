
Function Main(Player as Long) AS LONG

If GetPlayerHP(Player) <> GetPlayerMaxHP(Player) Then
	PlayerWarp(Player, 2114, 1, 7)
	playermessage(player, "You need full health to enter!", grey)
	else
	
playermessage(player, "With the permission of the current Fort owners, you teleport inside.", brightred)
PlayerWarp(Player, 2114, 4, 1)

end if
end function

