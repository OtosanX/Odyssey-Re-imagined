function main(player as long, message as string) as long

'if strcmp(message,"Yes") then
'playermessage(player,"Excellent, I am most gracious. You see, my daughter left earlier this morning to find water. Yet she has not returned, I fear the worst for her. I would go myself, but alas my legs do not carry me as well as they once did. Please, find my daughter. I will repay you in any way I can.",grey)
'playermessage(player,"The wall ahead suddenly crumbles and opens into a passageway.", white)
'end if

if instr(message,"yes") & getplayerx(player) = 5 & getplayery(player) = 4 then
playermessage(player,"Excellent, I am most gracious. You see, my daughter left earlier this morning to find water. Yet she has not returned, I fear the worst for her. I would go myself, but alas my legs do not carry me as well as they once did. Please, find my daughter. I will repay you in any way I can.",grey)
playermessage(player,"The wall ahead suddenly crumbles and opens into a passageway.", white)
opendoor(85,5,1)
end if

'if instr(message,"No") & getplayerx(player) = 5 & getplayery(player) = 4 then
'playermessage(player,"I see, then I shall send you back from hence you came. I am most dissapointed.",grey)
'playermessage(player,"You suddenly feel light headed and dissapear.", white)
'end if

if instr(message,"no") & getplayerx(player) = 5 & getplayery(player) = 4 then
playermessage(player,"I see, then I shall send you back from hence you came. I am most dissapointed.",grey)
playermessage(player,"You suddenly feel light headed and dissapear.", white)
playerwarp(player,1,5,5)
end if

main = continue
end function