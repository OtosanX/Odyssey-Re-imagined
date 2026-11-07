sub main(player as long)

if hasobj(player, 501) then
playermessage(player,"You touch the orb with your Key and dissapear.",brightblue)
else
playermessage(player,"The orb does not react to your touch.",brightblue)
end if

end sub