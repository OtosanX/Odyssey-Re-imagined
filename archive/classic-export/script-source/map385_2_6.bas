SUB Main(Player AS LONG)
If StrCmp(GetPlayerName(Player), "Rzarector") | StrCmp(GetPlayerName(Player), "Captain Jack") Then
   OpenDoor(385, 2, 7)
End If
END SUB