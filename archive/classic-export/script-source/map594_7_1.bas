sub main(player as long)
IF GETPLAYERHP(PLAYER) = GETPLAYERMAXHP(PLAYER) THEN
runscript1("flywarp", player)
end if
end sub