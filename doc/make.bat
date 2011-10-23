REM To create the documentation, you need LaTeX, Lilypond and Asymptote.
REM Then, run this script (don't forget to add lilypond and asymptote executables in your path)
REM The complete path to the cacofonix folder can't contain space. 

lilypond-book.py --format=latex --output=out --lily-output-dir=out cacofonix.tex || pause

cd out
latex -quiet cacofonix.tex
asy cacofonix-*.asy || pause
latex -quiet cacofonix.tex
latex -quiet cacofonix.tex || pause

dvips -q cacofonix.dvi
copy cacofonix.ps ..\

