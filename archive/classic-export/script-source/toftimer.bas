Sub Main()

SetFlag(85, GetFlag(85) - 1)
If GetFlag(85) = 0 Then GlobalMessage("ToF Run is now closed.", Yellow)

End Sub