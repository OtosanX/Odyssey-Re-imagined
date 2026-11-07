SUB Main(Player AS LONG)

	If getflag(183) = 1 then
		playermessage(player, "Lavos has activated the fire shield, you cannot interrupt him!", grey)
		playerwarp(player, 2110,11,2)
		Exit Sub
	end if

	If GetFlag(184) then
		playerwarp(player, 2110,11,2)
		playermessage(player, StrCat(StrCat("The fire shield has the energy to last ", Str(GetFlag(184))), " more minutes.''"), grey)
	else
		playerwarp(player, 2111,1,10)
	end if
END SUB