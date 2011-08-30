
REM MAIN

erase /F "cacofonix.zip"

call:azip "cacofonix.zip" cacofonix.m
call:azip "cacofonix.zip" Note.m
call:azip "cacofonix.zip" NoteInit.m
call:azip "cacofonix.zip" NoteInit_fr.m
call:azip "cacofonix.zip" ForElise.m

REM Doc

call:azip doc_src.zip ../doc/cacofonix.tex
call:azip doc_src.zip ../doc/make.bat
call:azip "cacofonix.zip" doc_src.zip
erase /F doc_src.zip

ps2pdf ../doc/cacofonix.ps ./cacofonix.pdf || pause
call:azip "cacofonix.zip" cacofonix.pdf
erase /F "cacofonix.pdf"

REM Démos

call:azip "GO AWAY!.zip" DarkWorld.m
call:azip "GO AWAY!.zip" DragonRoostIsland.m
call:azip "GO AWAY!.zip" FarewellHyruleKing.m
call:azip "GO AWAY!.zip" GerudoValley.m
call:azip "GO AWAY!.zip" LApresMidi.m
call:azip "GO AWAY!.zip" LegendaryHero.m
call:azip "GO AWAY!.zip" MyFreezeRay.m
call:azip "GO AWAY!.zip" MysteryTrain.m
call:azip "GO AWAY!.zip" OnTheRise.m
call:azip "GO AWAY!.zip" SongOfStorms.m
call:azip "GO AWAY!.zip" TheEntertainer.m
call:azip "GO AWAY!.zip" ThePianoDuet.m
call:azip "GO AWAY!.zip" VictorsPianoSolo.m
call:azip "GO AWAY!.zip" WilliamTell.m
call:azip "GO AWAY!.zip" Zelda.m

call:azip "YOU DON'T SEE ME.zip" "GO AWAY!.zip"
call:azip "DON'T OPEN.zip" "YOU DON'T SEE ME.zip"

call:azip "cacofonix.zip" "DON'T OPEN.zip"

erase /F "GO AWAY!.zip"
erase /F "YOU DON'T SEE ME.zip"
erase /F "DON'T OPEN.zip"

goto:eof

:azip
7z a "%~1" "%~2" || pause
goto:eof

