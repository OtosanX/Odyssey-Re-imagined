Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Deathblow") Then OpenDoor(622, 1, 9)
If strcmp(GetPlayerUser(Player), "xxmegadethxx") Then OpenDoor(622, 0, 9)

End Sub