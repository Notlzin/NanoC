@echo off
REM linker.bat - ng-linker (NanoC Linker) (fixed paths)(GPT-5 edition)

if "%~1"=="" (
  echo Usage: linker.bat outname.nexe in1.no [in2.no ...]
  exit /b 1
)

set OUTNAME=%1
shift

REM Always write to build\bin in project root (one up from linker folder)
set OUT=..\build\bin\%OUTNAME%

if not exist ..\build\bin mkdir ..\build\bin

REM Start new file
> "%OUT%" echo MAGIC: NANO
>> "%OUT%" echo VERSION: 1
>> "%OUT%" echo ENTRY: main
>> "%OUT%" echo PAYLOAD:

:loop
if "%~1"=="" goto done

REM All inputs are in build\objects (one up from linker)
set INFILE=..\build\objects\%~1

if exist "%INFILE%" (
  >> "%OUT%" echo ; from %INFILE%
  type "%INFILE%" >> "%OUT%"
) else (
  >> "%OUT%" echo ; MISSING: %INFILE%
)

shift
goto loop

:done
echo Done. Output written to %OUT%
