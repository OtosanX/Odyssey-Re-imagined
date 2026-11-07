Function main(player as long) as long
Dim a as long, b as long, c as long, d as long
b = getmaxusers()
d = getmapplayercount(1563)
c = random(d)


Dim SkipCounter as Long
SkipCounter = 0
if getflag(101) = 1 then
Timer(player, 45, "khargattack5")
For A = 1 to GetMaxUsers()
   If GetPlayerMap(A) = 1572 Then
          if GetPlayerEquipped(a, 5) = 398 then
          CreateCharacterEffect(1572,a,9,1,7,2,5)
          playermessage(a, "Flames burst beneath your feet, but your Elderfire Ring absorbs most of the inferno!", brightred)
               if getplayerhp(a) <= 20 then
               setplayerisdead(a, 1)
               else
               end if
          setplayerhp(a, (getplayermaxhp(player) - 20))
          else
      playermessage(a, "Kha'rg summons a mighty inferno that rages into life from under you!", brightred)
      CreateCharacterEffect(1572,a,6,1,7,2,5)
      if getplayerhp(a) <= 90 then
               setplayerisdead(a, 1)
               else
      setplayerhp(a, (getplayermaxhp(player) - 90))
         Exit Function
      End If
end if
end if
Next A
end if
main = continue
End Function