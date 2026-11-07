Function Main(player as long) as long
dim a as long

a = random(getplayerendurance(player)) + 5

if a = 5 | a = 6 | a = 7 | a = 8 | a = 9 | a = 10 then
playermessage(player,"Ouch! You slip and fall to the bottom.",white)
setplayerhp(player,getplayermaxhp(player)/2)
playerwarp(player,235,5,10)
end if

if a = 11 | a = 12 | a = 13 | a = 14 | a = 15 | a = 16 | a = 17 | a = 18 | a = 19 | a = 20 | a = 21 | a = 22 | a = 23 | a = 24 | a = 25 then
playermessage(player,"Ouch! You slip but catch yourself before you fall.",white)
setplayerhp(player,getplayerhp(player)-10)
playerwarp(player,235,5,7)
end if


If a = 26 | a = 27 | a = 28 | a = 29 | a = 30 | a = 31 | a = 32 | a = 34 | a = 34 | a = 35 then
playermessage(player,"Your grip holds and you continue climbing down.",white)
end if

End Function
