@echo off

set filename=BATMakerfile
echo @echo off > BATMakerfile.bat

:main
cls
title [Main]
echo [1]-[Fajlnev beallitasa]
echo.
echo [2]-[Oldal keszitese]
echo.
echo [3]-[Kod irasa]
echo.
echo [4]-[Valtozo keszitese]
echo.
echo [5]-[Kesz]

set /p input=
if %input% == 1 (goto :setfilename) else (if %input% == 2 (goto :pagesc) else (if %input% == 5 (goto :end) else (if %input% == 3 (goto :code) else (if %input% == 4 (goto :vari) else (goto :main)))))

:setfilename
cls
title [Fajlnev]
echo Nevezd el a BAT fajlod:
set /p filename=
echo @echo off > %filename%.bat
del BATMakerfile.bat
goto :main

:pagesc
echo cls >> %filename%.bat
:pagesc2
cls
title [Oldal keszites]
echo [1]-[Cim beallitasa]-[%title%]
echo.
echo [2]-[Szoveg irasa]
echo.
echo [3]-[Szin beallitasa]
echo.
echo [4]-[Kod irasa]
echo.
echo [5]-[Kesz]

set /p input=
if %input% == 1 (goto :pagetitle) else (if %input% == 2 (goto :linesc) else (if %input% == 3 (goto :setcolor) else (if %input% == 4 (goto :codep) else (if %input% == 5 (goto :pagefinish) else (goto :pagesc2)))))
goto :pagesc2

:pagetitle
title [Cim]
cls
echo Cim beallitasa:
set /p title=
echo title [%title%] >> %filename%.bat
goto :pagesc2

:pagefinish
set title=
echo pause >> %filename%.bat
goto :main

:linesc
cls
echo Szeretnel bemenetet a felhasznalotol? [I/N]
echo Ezt az erteket elerheted kesobb ezzel: %%userInput%%
set /p doUserInput=
cls
echo Irj egy sor szoveget...
set /p line=
if %doUserInput% == Y (goto :UserInput) else (echo echo %line% >> %filename%.bat)
:doOtherLine
cls
echo Szeretnel egy uj sort? [I/N]
set /p mlines=
if %mlines% == I (goto :linesc)
goto :pagesc2

:UserInput
cls
echo set /p userInput=%line% >> %filename%.bat
echo Szeretned a bemenetet valtozoba belehelyezni? [I/N]
set /p doInputInVar=
cls
if %doInputInVar% == I (goto :userInputY)
goto :doOtherLine
:userInputY
set /p Var=A valtozo neve:
echo set %Var%=%%userInput%% >> %filename%.bat
goto :doOtherLine

:setcolor
cls
echo Szin beallitasa
echo 0 = Fekete      8 = Szurke
echo 1 = Kek         9 = Vilagos Keke
echo 2 = Zold        A = Vilagos Zold
echo 3 = Turkiz      B = Vilagos Turkiz
echo 4 = Piros       C = Vilagos Piros
echo 5 = Lila        D = Vilagos Lila
echo 6 = Sarga       E = Vilagos Sarga
echo 7 = Feher       F = Vilagos Feher
set /p color=
echo color %color% >> %filename%.bat
goto :pagesc2

:code
cls
echo Irj egy sor ERVENYES batch kodot...
set /p codeLine=
echo %codeLine% >> %filename%.bat
echo Szeretnel egy uj sor kodot? [I/N]
set /p mcodeLines=
if %mcodeLines% == I (goto :code)
goto :main

:codep
cls
echo Irj egy sor ERVENYES batch kodot...
set /p codeLine=
echo %codeLine% >> %filename%.bat
echo Szeretnel egy uj sor kodot? [I/N]
set /p mcodeLines=
if %mcodeLines% == I (goto :code)
goto :pagesc2

:vari
cls
set Value=
set /p VarName=Set variable name:
echo Do you want to assign a value to it? [Y/N]
set /p doValue=
if %doValue% == Y (cls) else (goto :variEnd)
set /p Value=Set variable value:
:variEnd
cls
echo set %VarName%=%Value% >> %filename%.bat
echo You will be able to access it with:%%%VarName%%%
pause
cls
echo Do you want to make a new variable? [Y/N]
set /p domVari=
if %domVari% == Y (goto :vari)
goto :main

:end
cls
echo cls >> %filename%.bat
echo color 2 >> %filename%.bat
echo echo A BATMakerV2vel lett csinalva Barigamb738 azaz Shellytol >> %filename%.bat
echo pause >> %filename%.bat
pause