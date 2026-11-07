SUB Main(Player AS LONG)
If StrCmp(GetPlayerName(Player), "Rzarector") | StrCmp(GetPlayerName(Player), "Captain Jack") | StrCmp(GetPlayerName(Player), "Lord Hank") | StrCmp(GetPlayerName(Player), "l33t cleric") | StrCmp(GetPlayerName(Player), "magic") | StrCmp(GetPlayerName(Player), "slasher") Then
   OpenDoor(1735, 6, 9)
End If
END SUB