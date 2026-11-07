function main(player as long, message as string) as long

	If GetPlayerStatus(Player) = 9 Then SetPlayerStatus(Player, 0)
	If GetPlayerSprite(Player) = 255 Then SetPlayerSprite(Player, 0)

playermessage(player, "Say ''help'' for information on how to use the secure trading rooms.",grey) 

main = continue
end function