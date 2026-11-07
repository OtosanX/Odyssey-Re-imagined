Sub Main(Player as Long, Target as Long)

SetPlayerFlag(Target, 101, 1)
If GetPlayerMap(Target) = 1828 | GetPlayerMap(Target) = 1829 Then RunScript1("GameWarp", Target)
GlobalMessage(strcat(GetPlayerName(Target), " has been banned from Solo the Champ."), Yellow)

End Sub