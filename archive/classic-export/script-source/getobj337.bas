function main(player as long) as long
main = continue
if hasobj(player,337) > 0 then 
main = stop
playermessage(player,"You can only hold one keys!",red)
end if
end function