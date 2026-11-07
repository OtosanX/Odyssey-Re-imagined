SUB Main(Player AS LONG)
If StrCmp(GetPlayerName(Player), "cowman") Then OpenDoor(826, 6, 8)
If StrCmp(GetPlayerName(Player), "goatman") Then OpenDoor(826, 6, 8)
END SUB