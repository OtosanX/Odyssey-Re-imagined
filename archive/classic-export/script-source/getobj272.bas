function main(player as long) as long
if hasobj(player,272) > 1 then 

main = stop
playermessage(player,"Three picks are too heavy for you to carry!",red)
goto outs
end if

outs:
end function