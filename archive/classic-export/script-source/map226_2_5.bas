sub main(player as long)
If InStr(GetPlayerName(Player), "Scrotoman") Then 
   PlayerWarp(Player, 1003, 5, 3)
   PlayerMessage(Player, "Back you go.", 9)
End If
end sub