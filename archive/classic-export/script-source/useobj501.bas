sub main(player as long)
 dim a as long, b as long, c as long, d as long
 dim v as long, x as long, y as long, z as long

  if getplayeraccess(player) > 0 then
   for a = 1 to 2000
    b = 0
    c = 0
    d = 0
    v = 0
    x = 0
    y = 0
    z = 0

 'if getmapplayercount(a) = 0 then
   for b = 1 to 255
    if GetObjNum(a,b) > 0 then
     c = 1
    end if
   next b

    if c = 0 then
     for b = 0 to 6
      if getmonstertype(a,b) > 0 then
       d = 1
      end if
   next b
    if d = 0 then
    for v = 0 to 2
    for x = 0 to 11

    if gettileatt(a,x,y) > 0 then
     z = 1
    end if
     next x

    if y < 12 then
     y = y + 1
     v = 0
    else
     v = 3

    if z = 0 then
     playermessage(player,strcat("The lowest unused map is: ", str(a)),yellow)
    exit sub
    end if
   end if
    next v
  end if
 end if
'end if
  next a
 else
  playermessage(player,"You aren't a god!",yellow)
 end if
end sub