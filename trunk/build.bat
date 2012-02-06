
REM MAIN

del /Q .\cacofonix

mkdir cacofonix

copy cacofonix.m   cacofonix
copy Note.m        cacofonix
copy NoteInit.m    cacofonix
copy NoteInit_fr.m cacofonix
copy ForElise.m    cacofonix

REM Doc

mkdir doc_src
copy ..\doc\cacofonix.tex doc_src
copy ..\doc\make.bat      doc_src
copy ..\doc\make          doc_src
move doc_src cacofonix

ps2pdf ..\doc\cacofonix.ps .\cacofonix\cacofonix.pdf || pause

REM Démos

mkdir "GO AWAY!"
copy BadRomance.m         "GO AWAY!"
copy DarkWorld.m          "GO AWAY!"
copy DragonRoostIsland.m  "GO AWAY!"
copy FarewellHyruleKing.m "GO AWAY!"
copy GerudoValley.m       "GO AWAY!"
copy LApresMidi.m         "GO AWAY!"
copy LegendaryHero.m      "GO AWAY!"
copy MyFreezeRay.m        "GO AWAY!"
copy MysteryTrain.m       "GO AWAY!"
copy OnTheRise.m          "GO AWAY!"
copy SongOfStorms.m       "GO AWAY!"
copy TheEntertainer.m     "GO AWAY!"
copy ThePianoDuet.m       "GO AWAY!"
copy VictorsPianoSolo.m   "GO AWAY!"
copy WilliamTell.m        "GO AWAY!"
copy Zelda.m              "GO AWAY!"

mkdir "cacofonix\DON'T OPEN\YOU DON'T SEE ME"
move "GO AWAY!" "cacofonix\DON'T OPEN\YOU DON'T SEE ME"

7z a cacofonix.zip cacofonix

erase /Q .\cacofonix

