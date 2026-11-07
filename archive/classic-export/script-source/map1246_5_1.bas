SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "leprachaun") Then OpenDoor(1246, 5, 1)
   If StrCmp(GetPlayerUser(Player), "ogie141") Then OpenDoor(1246, 5, 1)

END SUB