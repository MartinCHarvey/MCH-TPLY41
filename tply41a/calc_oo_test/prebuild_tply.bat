setlocal

pushd "%~dp0"
set "OLDPATH=%PATH%"

for %%I in ("C:\MCH Stuff\github\tply41a\tply41a\Win32\Debug") do set "PATH=%PATH%;%%~fI"
for %%I in ("C:\MCH Stuff\github\tply41a\tply41a\genstate_debug\Win32\Debug") do set "PATH=%PATH%;%%~fI"

del errors.txt
del *.lst

plex calc_oo.l calc_oo_lex.pas calc_oo_lex.lst -v -oo
echo %ERRORLEVEL%

pyacc calc_oo.y calc_oo_parse.pas calc_oo_parse.lst -v -oo
echo %ERRORLEVEL%

genstate_debug calc_oo_parse.lst calc_oo_parse_debug.pas
echo %ERRORLEVEL%

set "PATH=%OLDPATH%"

popd
echo %ERRORLEVEL%
endlocal
echo %ERRORLEVEL%

