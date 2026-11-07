sub main(player as long)
dim Prize as Long, A as Long, B as Long
For A = 1 to GetMaxUsers
B = random(4)


If GetPlayerMap(a) = 2117 THEN
PlayerWarp(A, 1, 5, 5)
If GetPlayerGuild(Player) = GetPlayerGuild(A) THEN
	PlayerMessage(A, "Your guild has earned 15000 gold!", white)
END IF
END IF

NEXT A

SetGuildBank((GetPlayerGuild(Player)), (GetGuildBank(GetPlayerGuild(Player)) + 15000))
'GlobalMessage(strcat(GetGuildName(GetPlayerGuild(Player)), " has solved the Ape Situation!"), BrightGreen)



END SUB
