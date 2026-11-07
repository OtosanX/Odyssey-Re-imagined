function main(player as long) as long
if hasobj(player,342) > 0 then 
main = stop
playermessage(player,"You cant carry more than one!",red)
goto outs
end if

outs:
end function