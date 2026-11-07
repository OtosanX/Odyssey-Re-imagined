function main(player as long) as long

if getplayeraccess(player) = 0 then
	if hasobj(player,508) | hasobj(player,509) then
		SetPlayerStatus(Player, 24)
	else
		SetPlayerStatus(Player, 0)
	end if
End If

end function