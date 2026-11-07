SUB Main(Player as LONG)
'\marketcheck
'Script by MarsPhoenix with much help by Fankadore
Dim slot as LONG,objectnum as LONG,specialvalue as LONG,a as LONG,price as LONG
PlayerMessage(Player,ReadIniStr("PlayerNameLookup","PNL","Prophet of Fire",""),Yellow)

For slot = 1 to 15
   If strcmp(ReadIniStr("Market",GetPlayerUser(Player),str(slot),""), "") Then
	'Empty Slot
   Else
      objectnum = val(ReadIniStr("Market",GetPlayerUser(Player),str(slot),"")) - 100000000
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
      price = val(ReadIniStr("Market",GetPlayerUser(Player),str(slot + 100),""))
      If GetObjectType(objectnum) = 0 | GetObjectType(objectnum) = 5 | GetObjectType(objectnum) = 7 | GetObjectType(objectnum) = 9 | GetObjectType(objectnum) = 10 Then
         PlayerMessage(Player,StrCat("Slot ",StrCat(str(slot),StrCat(": ",StrCat(GetObjectName(objectnum),StrCat("   Price: ",str(price)))))),Yellow)
      Else
         specialvalue = val(ReadIniStr("Market",GetPlayerUser(Player),str(slot),"")) - 100000000
         specialvalue = specialvalue - objectnum
         specialvalue = Divide(specialvalue,1000)
         If GetObjectType(objectnum) = 6 | GetObjectType(objectnum) = 11 Then
            PlayerMessage(Player,StrCat("Slot ",StrCat(str(slot),StrCat(": ",StrCat(str(specialvalue),StrCat(" ",StrCat(GetObjectName(objectnum),StrCat("s ",StrCat("   Price: ",str(price))))))))),Yellow)
         Else
            PlayerMessage(Player,StrCat("Slot ",StrCat(str(slot),StrCat(": ",StrCat(GetObjectName(objectnum),StrCat("   Durability: ",StrCat(str(specialvalue),StrCat("   Price: ",str(price)))))))),Yellow)
         End If
      End If
   End If
Next slot
PlayerMessage(Player,StrCat("Money in Market: ",ReadIniStr("Market",GetPlayerUser(Player),"Profit","")),Yellow)
End SUB