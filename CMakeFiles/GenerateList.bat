@ECHO OFF
SETLOCAL DisableDelayedExpansion
SET "CMAKEDIR=%__CD__%"
CD ..
SET "PROJDIR=%__CD__%"
CD Src

ECHO(
ECHO set(sources ${sources} > "%CMAKEDIR%sourcelist.in"
FOR /R . %%F IN (*) DO (
  SET "p=%%F"
  SETLOCAL EnableDelayedExpansion
  SET "f=!p:%PROJDIR%=!"
  SET "f=!f:\=/!"
  ECHO !f! >> "%CMAKEDIR%sourcelist.in"
  ENDLOCAL
)
ECHO ) >> "%CMAKEDIR%sourcelist.in"