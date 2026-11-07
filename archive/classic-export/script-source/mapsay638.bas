function main(player as long, message as string) as long

if strcmp(message,"Yes") then
if hasobj(player, 476) then
playermessage(player, " *Opens the diary* Date: July 19, 1541. By the time you have read this last entry, I, along with everyone else who have been sent to eliminate the evil along with Lucifer in his lair, have died. We were ambushed outside of Lucifer's room, I was able to buy some time and write this entry but to say the least... We were unsuccessful and have failed, and found nothing conclusive of what might happen but we have found out, that there is a being, more superior than him",white) 
playermessage(player, " *Closes the diary* Thank you.. It was a tragic thing, but they have not died invain, Lucifer was slain by you. The people of Crendale can finally live in harmony. But this being, more superior than Lucifer.. Who could he be? Nonetheless warrior! Thank you! As a token of my gratitude, take this as a token of my gratitude. Show this to Granny Korgins.", blue) 
takeobj(player, 476, 1)
giveobj(player, 469, 1)
else
end if
end if
end function