sub main(player as long)
if hasobj(player,456) >= 1 then
takeobj(player,456,1)
else
playerwarp(player,1856,10,10)
playermessage(PLayer,"YOU NEED ITENS",red)
end if


dim a as long

for a = 0 to getmaxusers()
if getplayermap(a) = 1856 & getplayery(a) <= 9 then 
goto outs
playerwarp(player,1856,10,10)
playermessage(player,"someone is already fighting it!",red)
end if
next a
if getplayermap(player) = 1856 then runscript1("bosswarp",a)
outs:
end sub