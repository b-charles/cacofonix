REM To create the documentation, you need LaTeX and Lilypond.
REM Then, run this script (don't forget to add lilypond executables in your path)

lilypond-book.py --format=latex --output=out --lily-output-dir=out -V cacofonix.tex || pause

cd out
latex cacofonix.tex
latex cacofonix.tex
latex cacofonix.tex || pause

dvips cacofonix.dvi
copy cacofonix.ps ..\

