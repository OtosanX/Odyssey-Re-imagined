SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "killalot87") Then OpenDoor(1024, 6, 5)
   If StrCmp(GetPlayerUser(Player), "dark_star") Then OpenDoor(1024, 6, 5)

END SUB