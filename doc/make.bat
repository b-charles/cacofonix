REM To create the documentation, you need LaTeX, Lilypond and Asymptote.
REM Don't forget to add lilypond and asymptote executables in your path.
REM Don't forget to add asymptote.sty in the MikTeX path.
REM Then, run this script.
REM The complete path to the cacofonix folder can't contain space. 

lilypond-book.py --format=latex --output=out --lily-output-dir=out cacofonix.tex

cd out
latex -quiet cacofonix.tex
asy cacofonix-*.asy
latex -quiet cacofonix.tex
latex -quiet cacofonix.tex
latex -quiet cacofonix.tex

dvips -q cacofonix.dvi
copy cacofonix.ps ..\

