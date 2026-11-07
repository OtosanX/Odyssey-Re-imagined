Sub Main(Player as Long, Energy as Long)

CreatePlayerFloatText(Player, str(Energy), Yellow)
SetPlayerEnergy(Player, GetPlayerEnergy(Player) + Energy)
If GetPlayerEnergy(Player) > GetPlayerMaxEnergy(Player) Then SetPlayerEnergy(Player, GetPlayerMaxEnergy(Player))

End Sub