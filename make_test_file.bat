@echo off

echo Assembling...

copy "Kirby Super Star (USA).sfc" out.sfc
asar --symbols=wla main.asm out.sfc

:checkmatch
fc "Kirby Super Star (USA).sfc" out.sfc > nul
if errorlevel 1 goto matchmiss

:matchsuccess
echo Compiled ROM matches!
goto done

:matchmiss
echo Compiled ROM does NOT match!

:done
pause