SUB Main(Player AS LONG)
If StrCmp(GetPlayerName(Player), "Rzarector") | StrCmp(GetPlayerName(Player), "Captain Jack") Then
   OpenDoor(432, 2, 5)
End If
END SUB