@echo off
title [Name]
echo Name your BAT file...
set /p name=
title [Title]
cls
echo Set Title...
set /p title=
echo @echo off > %name%.bat
echo title [%title%] >> %name%.bat
title [Lines]
:line
cls
echo Write a line...
set /p line=
echo echo %line% >> %name%.bat
echo Do you want another line? [Y/N]
set /p mlines=
if %mlines% == Y (goto :line)
cls
echo BAT file saved to "%name%.bat"
echo pause >> %name%.bat
echo cls >> %name%.bat
echo echo Made With BATMaker By Barigamb738 aka Shelly >> %name%.bat
echo pause >> %name%.bat
pause