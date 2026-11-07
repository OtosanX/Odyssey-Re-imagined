Function Main(Player as Long) as Long
dim Chance as Long, Object as Long

Chance = 6
Object = 103
RunScript3("RareDrop", Player, Chance, Object)

Main = Continue

End Function