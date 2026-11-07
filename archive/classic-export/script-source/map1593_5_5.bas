Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "MarsPhoenix") Then OpenDoor(1593, 5, 4)
If StrCmp(GetPlayerUser(Player), "Dragoons") Then OpenDoor(1593, 5, 4)
If StrCmp(GetPlayerUser(Player), "DragoonsThief") Then OpenDoor(1593, 5, 4)

End Sub