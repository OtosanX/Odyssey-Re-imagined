SUB Main(Player as LONG,Parm1 as LONG,Parm2 as LONG,Parm3 as LONG)
'\marketsell -inventory slot- -amount- -price-
'Script by MarsPhoenix with much help by Fankadore
Dim slot as LONG,objectnum as LONG,objectcode as LONG,prefixsuffixcode as LONG

objectnum = GetPlayerInvObject(Player,Parm1)

If Parm1 = 0 | Parm1 > 21 Then
	PlayerMessage(Player,"Your inventory slots are 1-20. Try and pick one that actually exists.",BrightRed)
	Exit Sub
End If
If objectnum = 0 Then
	PlayerMessage(Player,"There's nothing in that inventory slot, skippy.",BrightRed)
	Exit Sub
End If

If GetObjectType(objectnum) = 0 | GetObjectType(objectnum) = 5 | GetObjectType(objectnum) = 6 | GetObjectType(objectnum) = 7 | GetObjectType(objectnum) = 9 | GetObjectType(objectnum) = 10 | GetObjectType(objectnum) = 11 Then
	If GetObjectType(objectnum) = 6 | GetObjectType(objectnum) = 11 Then
		If Parm2 = 0 Then
			PlayerMessage(Player,"Yeah, no one is going to buy 0 of something. Put in a value.",BrightRed)
			Exit Sub
		End If
		If Parm2 >= 100000 Then
			PlayerMessage(Player,"You can stack up to 99,999 at a time. That's more than enough. Who has 100,000 of anything besides Gold?",BrightRed)
			Exit Sub
		End If
		If GetPlayerInvValue(Player,Parm1) < Parm2 Then
			PlayerMessage(Player,"I'm sure you wish you had that many to sell, but you don't.",BrightRed)
			Exit Sub
		End If
		If Parm3 = 0 Then
			PlayerMessage(Player,"You don't REALLY wanna give that out for free, do you? At least put 1.",BrightRed)
			Exit Sub
		End If
		If Parm3 > 10000000 Then
			PlayerMessage(Player,"10,000,000 is already a ripoff maximum value, why don't you just use that?",BrightRed)
			Exit Sub
		End If
		For slot = 1 to 15
			If strcmp(ReadIniStr("Market",GetPlayerUser(Player),str(slot),""), "") Then
				objectcode = 100000000 + (Parm2 * 1000) + objectnum
				WriteIniStr("Market",GetPlayerUser(Player),str(slot),str(objectcode))
				WriteIniStr("Market",GetPlayerUser(Player),str(slot + 100),str(Parm3))
				TakeObj(Player,objectnum,Parm2)
				If Parm2 = 1 Then
					PlayerMessage(Player,StrCat("1 ",StrCat(GetObjectName(objectnum),StrCat(" put up for the price of ",StrCat(Str(Parm3)," Gold.")))),Yellow)
				Else
					PlayerMessage(Player,StrCat(Str(Parm2),StrCat(" ",StrCat(GetObjectName(objectnum),StrCat("s put up for the price of ",StrCat(Str(Parm3)," Gold each."))))),Yellow)
				End If
				slot = 16
			End If
			If slot = 15 Then PlayerMessage(Player,"You don't even have room for this! Sell or take out your items.",BrightRed)
		Next slot
	Else
		If Parm3 = 0 Then
			PlayerMessage(Player,"You don't REALLY wanna give that out for free, do you? At least put 1.",BrightRed)
			Exit Sub
		End If
		If Parm3 > 10000000 Then
			PlayerMessage(Player,"10,000,000 is already a ripoff maximum value already, why don't you just use that?",BrightRed)
			Exit Sub
		End If
		For slot = 1 to 15
			If strcmp(ReadIniStr("Market",GetPlayerUser(Player),str(slot),""), "") Then
				objectcode = 100001000 + objectnum
				WriteIniStr("Market",GetPlayerUser(Player),str(slot),str(objectcode))
				WriteIniStr("Market",GetPlayerUser(Player),str(slot + 100),str(Parm3))
				TakeObj(Player,objectnum,1)
				PlayerMessage(Player,StrCat("1 ",StrCat(GetObjectName(objectnum),StrCat(" put up for the price of ",StrCat(Str(Parm3)," Gold.")))),Yellow)
				slot = 16
			End If
			If slot = 15 Then PlayerMessage(Player,"You don't even have room for this! Sell or take out your items.",BrightRed)
		Next slot
	End If
Else
	PlayerMessage(Player,"Equipment is currently not functional with the market. ReMoTe has yet to add a way to check and store object durability.",BrightRed)
'         If Parm3 > 0 Then
'            If Parm3 < 10000000 Then
'               For slot = 1 to 15
'                  If ReadIniStr("Market",GetPlayerUser(Player),str(slot),"") = "" Then
'                     objectcode = 100000000 + (1000 * GetObjDurability(Player,Parm1) + objectnum
'                     WriteIniStr("Market",GetPlayerUser(Player),str(slot),str(objectcode))
'                     WriteIniStr("Market",GetPlayerUser(Player),str(slot + 100),str(Parm3))
'                     prefixsuffixcode = 1000000 + (GetItemPrefix(Player,Parm1) * 1000) + GetItemSuffix(Player,Parm1)
'                     WriteIniStr("Market",GetPlayerUser(Player),str(slot + 200),str(prefixsuffixcode))
'                     TakeObj(Player,objectnum,1)
'                     PlayerMessage(Player,StrCat("1 ",StrCat(GetObjectName(objectnum),StrCat(" put up for the price of ",StrCat(Str(Parm3)," Gold.")))),Yellow)
'                     slot = 16
'                  End If
'                  If slot = 15 Then
'                     PlayerMessage(Player,"You don't even have room for this! Sell or take out your items.",BrightRed)
'                 End If
'               Next slot
'            Else
'               PlayerMessage(Player,"10,000,000 is already a ripoff maximum value already, why don't you just use that?",BrightRed)
'            End If
'         Else
'            PlayerMessage(Player,"You don't REALLY wanna give that out for free, do you? At least put 1.",BrightRed)
'         End If
End If

End Sub