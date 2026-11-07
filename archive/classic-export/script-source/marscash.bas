SUB Main(Player as LONG)
'\marketcash
'Script by MarsPhoenix with much help by Fankadore

Dim openinvslot as LONG

If strcmp(ReadIniStr("Market",GetPlayerUser(Player),"Profit",""),"") Then
   PlayerMessage(Player,"You have no gold in the marketplace.",Yellow)
Else
   For openinvslot = 1 to 20
      If GetPlayerInvObject(Player,openinvslot) = 0 | GetPlayerInvObject(Player,openinvslot) = 6 Then
         GiveObj(Player,6,Val(ReadIniStr("Market",GetPlayerUser(Player),"Profit","")))
         PlayerMessage(Player,StrCat("Retrieved ",StrCat(ReadIniStr("Market",GetPlayerUser(Player),"Profit","")," Gold!")),Yellow)
         WriteIniStr("Market",GetPlayerUser(Player),"Profit","")
         openinvslot = 21
      Else
         If openinvslot = 20 Then
            PlayerMessage(Player,"Clear out your inventory! You don't have room.",BrightRed)
         End If
      End If
   Next openinvslot
End If
End SUB