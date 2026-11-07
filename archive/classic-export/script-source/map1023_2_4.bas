SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "killalot87") Then OpenDoor(1023, 2, 5)
   If StrCmp(GetPlayerUser(Player), "dark_star") Then OpenDoor(1023, 2, 5)

END SUB