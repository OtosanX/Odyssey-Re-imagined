sub main(player as long)
dim Prize as Long, A as Long, B as Long
For A = 1 to GetMaxUsers
B = random(4)

'GlobalMessage("Darkcone Fort has new temporary keepers!", yellow)

setflag (189,0)
setflag(190,120)
setflag(193,120)

 
setflag(186, getplayerguild(player)) 'SET FLAG HERE
setflag(185, 1)




If GetPlayerMap(a) = 2117 THEN
PlayerWarp(A, 114, 7, 4)
GiveObj(A, 606, 1)
If GetPlayerGuild(Player) = GetPlayerGuild(A) THEN


playermessage(A, "Your guild has gained special access to Darkcone Fort for 120 minutes.", brightred)
	PlayerMessage(A, "You have contributed 20,000 gold to your guild bank!", white)


SetGuildBank((GetPlayerGuild(Player)), (GetGuildBank(GetPlayerGuild(Player)) + 20000))

END IF
END IF

NEXT A



END SUB

