FUNCTION Main(Player AS LONG, a as long, b as long) AS LONG
if getplayeraccess(player) > 0 then
a = random(123)
b = random(24)
setplayersprite(player,a)
setplayerstatus(player,b)
main = stop
else
   Main = Continue
end if
END FUNCTION