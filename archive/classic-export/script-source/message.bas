Sub Main(Player as Long)
dim Message as String

Message = strcat(Message, GetPlayerName(Player))
Message = strcat(Message, "[")
Message = strcat(Message, str(GetPlayerFlag(Player, 225)))
Message = strcat(Message, "], ")

PlayerMessage(Player, Message, White)

End Sub