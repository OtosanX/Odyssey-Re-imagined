function main(player as long) as long

if getplayermap(player) = 148 & getplayeraccess(player) = 0 | StrCmp(GetPlayerName(Player), "Gold") then
if getflag(64) = 0 then
main = continue
else
playermessage(player, "Trivia Hall chat is currently off.",white)
main = stop
exit function
end if
end if

main = continue

end function