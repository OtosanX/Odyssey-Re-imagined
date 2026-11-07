Sub Main()
if getflag(84) = 0 then
globalmessage("Equal opportunity carnage will begin shortly, type /ecarn on a level 1 Knight for a instant warp to the waiting room!", brightgreen)
setflag(84,1)
exit Sub
else
globalmessage("Equal opportunity warps have ended.", brightgreen)
setflag(84,0)
exit Sub
end if
End Sub