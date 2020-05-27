@echo off

set filename=BATMakerfile
echo @echo off > BATMakerfile.bat

:main
cls
title [Main]
echo [1]-[Set file name]
echo.
echo [2]-[Create page]
echo.
echo [3]-[Write code line]
echo.
echo [4]-[Make variable]
echo.
echo [5]-[Finish]

set /p input=
if %input% == 1 (goto :setfilename) else (if %input% == 2 (goto :pagesc) else (if %input% == 5 (goto :end) else (if %input% == 3 (goto :code) else (if %input% == 4 (goto :vari) else (goto :main)))))

:setfilename
cls
title [File name]
echo Name your BAT file:
set /p filename=
echo @echo off > %filename%.bat
del BATMakerfile.bat
goto :main

:pagesc
echo cls >> %filename%.bat
:pagesc2
cls
title [Create page]
echo [1]-[Set page title]-[%title%]
echo.
echo [2]-[Write line]
echo.
echo [3]-[Set color]
echo.
echo [4]-[Write code line]
echo.
echo [5]-[Finish]

set /p input=
if %input% == 1 (goto :pagetitle) else (if %input% == 2 (goto :linesc) else (if %input% == 3 (goto :setcolor) else (if %input% == 4 (goto :codep) else (if %input% == 5 (goto :pagefinish) else (goto :pagesc2)))))
goto :pagesc2

:pagetitle
title [Page title]
cls
echo Set Title:
set /p title=
echo title [%title%] >> %filename%.bat
goto :pagesc2

:pagefinish
set title=
echo pause >> %filename%.bat
goto :main

:linesc
cls
echo Do you want user input? [Y/N]
echo You will be able to write it out later with: %%userInput%%
set /p doUserInput=
cls
echo Write a line...
set /p line=
if %doUserInput% == Y (goto :UserInput) else (echo echo %line% >> %filename%.bat)
:doOtherLine
cls
echo Do you want another line? [Y/N]
set /p mlines=
if %mlines% == Y (goto :linesc)
goto :pagesc2

:UserInput
cls
echo set /p userInput=%line% >> %filename%.bat
echo Do you want the input to be inserted into a variable? [Y/N]
set /p doInputInVar=
cls
if %doInputInVar% == Y (goto :userInputY)
goto :doOtherLine
:userInputY
set /p Var=Name of the variable:
echo set %Var%=%%userInput%% >> %filename%.bat
goto :doOtherLine

:setcolor
cls
echo Set textcolor

echo 0 = Black       8 = Gray
echo 1 = Blue        9 = Light Blue
echo 2 = Green       A = Light Green
echo 3 = Aqua        B = Light Aqua
echo 4 = Red         C = Light Red
echo 5 = Purple      D = Light Purple
echo 6 = Yellow      E = Light Yellow
echo 7 = White       F = Bright White
set /p color=
echo color %color% >> %filename%.bat
goto :pagesc2

:code
cls
echo Write a line of VALID batch code...
set /p codeLine=
echo %codeLine% >> %filename%.bat
echo Do you want another line of code? [Y/N]
set /p mcodeLines=
if %mcodeLines% == Y (goto :code)
goto :main

:codep
cls
echo Write a line of VALID batch code...
set /p codeLine=
echo %codeLine% >> %filename%.bat
echo Do you want another line of code? [Y/N]
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
echo echo Made With BATMakerV2 By Barigamb738 aka Shelly >> %filename%.bat
echo pause >> %filename%.bat
pause