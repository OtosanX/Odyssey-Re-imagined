Sub Main(Value as Long)
	if Value = 0 then
		globalmessage(strcat("The global timer is currently set for ",strcat(str(getflag(2))," seconds.")),white)
	else
		setflag(2,Value)
		globalmessage(strcat("Broadcast timer is set to ",strcat(str(Value)," seconds.")),white)
	end if
End Sub