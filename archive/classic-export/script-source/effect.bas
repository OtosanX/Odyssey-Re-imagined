Sub Main(Player as Long)
dim Loop as Long

PlayerMessage(Player, str(GetPlayerFlag(Player, 255)), White)
CreateCharacterEffect(GetPlayerMap(Player), Player, GetPlayerFlag(Player, 255), 40, 8, 0, 0)
SetPlayerFlag(Player, 255, GetPlayerFlag(Player, 255) + 1)

End Sub