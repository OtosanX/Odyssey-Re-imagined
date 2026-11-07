SUB Main(Player AS LONG)
If StrCmp(GetPlayerName(Player), "Rzarector") | StrCmp(GetPlayerName(Player), "Captain Jack") Then
   OpenDoor(432, 7, 3)
End If
END SUB