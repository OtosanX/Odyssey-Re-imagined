SUB Main(Player as LONG,Parm1 as LONG)
'\marketcancel -slotnumber-
'Script by MarsPhoenix with much help by Fankadore
Dim a as LONG,openinvslot as LONG,objectnum as LONG,specialvalue as LONG,prefixnum as LONG,suffixnum as LONG,originalamount as LONG

If strcmp(ReadIniStr("Market",GetPlayerUser(Player),str(Parm1),""), "") Then
   PlayerMessage(Player,"There's nothing in that slot!",BrightRed)
Else
   For openinvslot = 1 to 20
      objectnum = val(ReadIniStr("Market",GetPlayerUser(Player),str(Parm1),"")) - 100000000
      For a = 1 to 10
         If objectnum >= 10000000 Then
            objectnum = objectnum - 10000000
         End If
      Next a
      For a = 1 to 10
         If objectnum >= 1000000 Then
            objectnum = objectnum - 1000000
         End If
      Next a
      For a = 1 to 10
         If objectnum >= 100000 Then
            objectnum = objectnum - 100000
         End If
      Next a
      For a = 1 to 10
         If objectnum >= 10000 Then
            objectnum = objectnum - 10000
         End If
      Next a
      For a = 1 to 10
         If objectnum >= 1000 Then
            objectnum = objectnum - 1000
         End If
      Next a
         If GetObjectType(objectnum) = 0 | GetObjectType(objectnum) = 5 | GetObjectType(objectnum) = 7 | GetObjectType(objectnum) = 9 | GetObjectType(objectnum) = 10 Then
            If RunScript0(strcat("GetObj",str(objectnum))) = 1 Then
               PlayerMessage(Player,"You can't carry anymore of this object!",BrightRed)
               Exit SUB
            End If
            If GetPlayerInvObject(Player,openinvslot) = 0 Then
               GiveObj(Player,objectnum,1)
               PlayerMessage(Player,"Item retrieved!",BrightGreen)
               WriteIniStr("Market",GetPlayerUser(Player),str(Parm1),"")
               WriteIniStr("Market",GetPlayerUser(Player),str(Parm1 + 100),"")
               openinvslot = 21
            Else
               If openinvslot = 20 Then
                  PlayerMessage(Player,"Clear out your inventory! You don't have room.",BrightRed)
               End If
            End If
         Else
            specialvalue = val(ReadIniStr("Market",GetPlayerUser(Player),str(Parm1),"")) - 100000000
            specialvalue = specialvalue - objectnum
            specialvalue = Divide(specialvalue,1000)
            If GetObjectType(objectnum) = 6 | GetObjectType(objectnum) = 11 Then
               If RunScript0(strcat("GetObj",str(objectnum))) = 1 Then
                  PlayerMessage(Player,"You can't carry anymore! of this object!",BrightRed)
                  Exit SUB
               End If
               If GetPlayerInvObject(Player,openinvslot) = 0 | GetPlayerInvObject(Player,openinvslot) = objectnum Then
                  GiveObj(Player,objectnum,specialvalue)
                  If specialvalue = 1 Then
                     PlayerMessage(Player,"Item retrieved!",BrightGreen)
                  Else
                     PlayerMessage(Player,"Items retrieved!",BrightGreen)
                  End If
                  WriteIniStr("Market",GetPlayerUser(Player),str(Parm1),"")
                  WriteIniStr("Market",GetPlayerUser(Player),str(Parm1 + 100),"")
                  openinvslot = 21
               Else
                  If openinvslot = 20 Then
                     PlayerMessage(Player,"Clear out your inventory! You don't have room.",BrightRed)
                  End If
               End If
            Else
PlayerMessage(Player,"How did you get an Equipment item into storage?",BrightRed)
'               If GetPlayerInvObject(Player,openinvslot) = 0 Then
'                  GiveObj(Player,objectnum,1)
'                  SetObjDurability(Player,openinvslot,specialvalue)
'                  suffixnum = val(ReadIniStr("Market",GetPlayerUser(Player),str(Parm1 + 200),"") - 1000000
'                  For a = 1 to 10
'                     If suffixnum >= 100000 Then
'                        suffixnum = suffixnum - 100000
'                     End If
'                  Next a
'                  For a = 1 to 10
'                     If suffixnum >= 10000 Then
'                        suffixnum = suffixnum - 10000
'                     End If
'                  Next a
'                  For a = 1 to 10
'                     If suffixnum >= 1000 Then
'                        suffixnum = suffixnum - 1000
'                     End If
'                  Next a
'                  prefixnum = val(ReadIniStr("Market",GetPlayerUser(Player),str(Parm1 + 200),"") - 1000000
'                  prefixnum = prefixnum - suffixnum
'                  prefixnum = Divide(prefixnum,1000)
'                  SetItemPrefix(Player,openinvslot,prefixnum)
'                  SetItemSuffix(Player,openinvslot,suffixnum)
'                  PlayerMessage(Player,"Item retrieved!",BrightGreen)
'                  WriteIniStr("Market",GetPlayerUser(Player),str(Parm1),"")
'                  WriteIniStr("Market",GetPlayerUser(Player),str(Parm1 + 100),"")
'                  WriteIniStr("Market",GetPlayerUser(Player),str(Parm1 + 200),"")
'                  openinvslot = 21
'               Else
'                  If openinvslot = 20 Then
'                     PlayerMessage(Player,"Clear out your inventory! You don't have room.",BrightRed)
'                  End If
'               End If                
            End If
         End If
   Next openinvslot
End If
End SUB