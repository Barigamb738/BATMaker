@echo off
title [Nev]
echo Nevezd el a fileodat...
set /p name=
title [Cim]
cls
echo Allits be egy cimet...
set /p title=
echo @echo off > %name%.bat
echo title [%title%] >> %name%.bat
title [Szoveg]
:line
cls
echo Irj egy sor szoveget...
set /p line=
echo echo %line% >> %name%.bat
echo Szeretnel egy masik sor szoveget? [I/N]
set /p mlines=
if %mlines% == I (goto :line)
cls
echo BAT file elmentve "%name%.bat" neven.
echo pause >> %name%.bat
echo cls >> %name%.bat
echo echo A BATMakerrel lett csinalva Barigamb738 azaz Shellytol >> %name%.bat
echo pause >> %name%.bat
pause