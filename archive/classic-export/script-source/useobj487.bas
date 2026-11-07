function main(player as long) as long
dim a as long
dim b as long



mapmessage(getplayermap(player),strcat(getplayername(player)," has put on a Halloween costume!"), BRIGHTRED)

a = random(21)

select case a
case 0
	b  = 31
case 1
	b = 25
case 2
	b = 29
case 3
	b = 36
case 4
	b = 37
case 5
	b = 38 
case 6
	b = 39
case 7
	b = 40
case 8
	b = 43
case 9
	b = 45
case 10
	b = 45
case 11
	b = 49
case 12
	b = 50
case 13
	b = 54
case 14
	b = 56
case 15
	b = 58
case 16
	b = 58
case 17
	b = 63
case 18
	b = 69
case 19
	b = 91
case 20
	b = 97
End Select

setplayersprite(player, b)
setplayerstatus(player, 17)
takeobj(player, 487, 1)
CreatePlayerFloatText(Player, "BOO!!", BrightRed)


end function