SUB Main(Player AS LONG)
If StrCmp(GetPlayerName(Player), "Rzarector") | StrCmp(GetPlayerName(Player), "Captain Jack") | StrCmp(GetPlayerName(Player), "Lord Hank") | StrCmp(GetPlayerName(Player), "l33t cleric") Then
   OpenDoor(1620, 6, 4)
End If
END SUB