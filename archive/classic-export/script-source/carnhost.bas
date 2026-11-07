 Sub Main()
	if getflag(82) = 0 then
		globalmessage("Carnage will begin shortly, type /carn for a instant warp to the waiting room!  You do not lose items or experience in a carnage battle.", brightblue)
		setflag(82,1)
	else
		globalmessage("Carnage warps have been closed.", brightblue)
		setflag(82,0)
	end if
End Sub