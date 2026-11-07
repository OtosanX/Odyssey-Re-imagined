Function main(player as long) as long
Dim a as long, x as long, y as long

a = random(100) + 1

if getplayerdirection(player) = left then
x = getplayerx(player) - 1
y = getplayery(player)
else
if getplayerdirection(player) = right then
x = getplayerx(player) + 1
y = getplayery(player)
else
if getplayerdirection(player) = up then
x = getplayerx(player)
y = getplayery(player) - 1 
else
if getplayerdirection(player) = down then
x = getplayerx(player)
y = getplayery(player) + 1 
else
end if
end if
end if
end if


if hasobj(player, 164) >= 1 then
takeobj(player, 164, 1)

select case a

case 1
playermessage(player,"You make a wish! You receive.. another wish.",white)
spawnobject(getplayermap(player),434,1,x,y)

case 2
playermessage(player,"You make a wish! You receive two more wishes.",white)
spawnobject(getplayermap(player),6,700,x,y)

case 3
playermessage(player,"You make a wish! You receive three more wishes.",white)
spawnobject(getplayermap(player),6,1000,x,y)

case 4
playermessage(player,"You make a wish! You receive four more wishes.",white)
spawnobject(getplayermap(player),435,1,x,y)

case 5
playermessage(player,"You make a wish! You receive 100,000 gold.",white)
spawnobject(getplayermap(player),6,400,x,y)


case 6
playermessage(player,"You make a wish! You receive 200,000 gold.",white)
spawnobject(getplayermap(player),6,2500,x,y)

case 7
playermessage(player,"You make a wish! You receive 300,000 gold.",white)
spawnobject(getplayermap(player),6,2500,x,y)

case 8
playermessage(player,"You make a wish! You receive 400,000 gold.",white)
spawnobject(getplayermap(player),6,2500,x,y)

case 9
playermessage(player,"You make a wish! You receive 500,000 gold.",white)
spawnobject(getplayermap(player),6,2500,x,y)

case 10
playermessage(player,"You make a wish! You receive 600,000 gold.",white)
spawnobject(getplayermap(player),6,2500,x,y)

case 11
playermessage(player,"You make a wish! You receive 700,000 gold.",white)
spawnobject(getplayermap(player),6,2500,x,y)

case 12
playermessage(player,"You make a wish! You receive 800,000 gold.",white)
spawnobject(getplayermap(player),6,2500,x,y)

case 13
playermessage(player,"You make a wish! You receive 1,000,000 gold.",white)
spawnobject(getplayermap(player),6,2500,x,y)

case 14
playermessage(player,"You make a wish! You die.",white)
spawnobject(getplayermap(player),6,2500,x,y)

case 15
playermessage(player,"You make a wish! You die.",white)
spawnobject(getplayermap(player),6,2500,x,y)

case 16
playermessage(player,"You make a wish! You die.",white)
spawnobject(getplayermap(player),6,2500,x,y)

case 17
playermessage(player,"You make a wish! You die.",white)
spawnobject(getplayermap(player),6,2500,x,y)

case 18
playermessage(player,"You make a wish! You die.",white)
spawnobject(getplayermap(player),6,2500,x,y)


case 19
playermessage(player,"You make a wish! You receive a Ztiwhsborf.",white)
spawnobject(getplayermap(player),6,2500,x,y)


case 20
playermessage(player,"You make a wish! You receive a Ztiwhsborf.",white)
spawnobject(getplayermap(player),6,2500,x,y)


case 21
playermessage(player,"You make a wish! You receive a Ztiwhsborf.",white)
spawnobject(getplayermap(player),6,2500,x,y)


case 22
playermessage(player,"You make a wish! You receive a Hammer of Frost.",white)
spawnobject(getplayermap(player),6,2500,x,y)


case 23
playermessage(player,"You make a wish! You receive a Frostburn Tome.",white)
spawnobject(getplayermap(player),6,2500,x,y)


case 24
playermessage(player,"You make a wish! You receive a Quarterstaff.",white)
spawnobject(getplayermap(player),6,2500,x,y)

case 25
playermessage(player,"You make a wish! You know, you're probably a nice guy, and I hate to do this to you, but you get nothing. Sorry.",white)
spawnobject(getplayermap(player),6,2500,x,y)

case 25
playermessage(player,"You make a wish! You receive the thoughts of Senatious...",white)
playermessage(player,"On the Wish spell: Well, I thought the Wish spell would be a very interesting pasttime for lvl 100 Mages, you know, give them stuff to do.",grey)
playermessage(player,"It took a long time to put this spell together, it consists of many separate scripts and took quite a while for me to write out.",grey)
playermessage(player,"I started scripting this spell around the same time I was finishing Tal von Ubel. I got tired of writing scripts for the Kha'rg fight and started working on this.",grey)
playermessage(player,"There are around 100 possible Wish outcomes. It will be a very long time until all are seen.",grey)

case 25
playermessage(player,"You make a wish! You receive the thoughts of Senatious...",white)
playermessage(player,"On Tal von Ubel: Tal von Ubel (or, TvU) is something I started designing around December of '04. It was originally a great big bandit fort that had a fairly long quest to gain entrance to.",grey)
playermessage(player,"The quest was made (and entirely completed) by Atrus. The quest still exists, and someday may see the light of day in another form. I could never make the fort look like I wanted it to, so I scrapped it.",grey)
playermessage(player,"Tal von Ubel actually originated on the server I did with Smithy a few years ago. It was sort of my interpretation of Mordor for Odyssey. Tal von Ubel is a name I got from a translator. I believe it means something like Valley of Evil, in German, or something similar.",grey)
playermessage(player,"The original one was headed by ''Archdemon Baz'' (pronounced Boz), and he resided in a great big tower in the middle of the valley. (Yes, both actually ARE valleys of evil, surrounded by mountain and encased in lava, filled with demons.)",grey)
playermessage(player,"This Tal von Ubel is led by the great Demongod Kha'rg'arn'gour (Or Kha'rg, for short). Kha'rg resides in the Cave of Demons gods, in the center of the area. Initially, the Kha'rg fight would be an admin led event, with an admin actually playing as Kha'rg. Kha'rg has made several appearances outside of TvU, played by me, where he massacred.. well, most everyone.",grey)
playermessage(player,"I later decided though, it would be best for Kha'rg to just be a very challenging monster fight, in case I ever quit or wasn't able to get online. What makes the fight so challenging is that there are around 8 or 9 scripts running during the fight.",grey)


case else

end select

else
end if
main = continue
End Function