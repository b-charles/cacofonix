
lilypond-book.py --format=latex --output=out --lily-output-dir=out -V cacofonix.tex
pause

cd out
latex cacofonix.tex
latex cacofonix.tex
pause

dvips cacofonix.dvi
copy cacofonix.ps ..\

