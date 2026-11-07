SUB Main(Player as LONG, Parm1 as LONG) 
Dim sevendigit as LONG, a as LONG, roundcheck as LONG

sevendigit = Parm1 
 
'Finds the middle 3 numbers of a seven-digit number (xxOOOxx) 
For a = 1 to 10 
   If sevendigit >= 1000000 Then 
      sevendigit = sevendigit - 1000000 
   End If 
Next a 
For a = 1 to 10 
   If sevendigit >= 100000 Then 
      sevendigit = sevendigit - 100000 
   End If 
Next a 

roundcheck = sevendigit 
For a = 1 to 10 
   If roundcheck >= 10000 Then 
      roundcheck = roundcheck - 10000 
   End If 
Next a 
For a = 1 to 10 
   If roundcheck >= 1000 Then 
      roundcheck = roundcheck - 1000 
   End If 
Next a 
For a = 1 to 10 
   If roundcheck >= 100 Then 
      roundcheck = roundcheck - 100 
   End If 
Next a 
sevendigit = sevendigit - roundcheck 
sevendigit = Divide(sevendigit,100) 
PlayerMessage(Player,str(sevendigit),BrightGreen) 
End SUB