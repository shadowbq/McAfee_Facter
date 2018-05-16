# Installing the MSI from EPO using EEDK

## Batch wrapper for EEDK to run msiexec

```bat
@echo off:: Get number of input parameters
set argC=0
for %%x in (%*) doSet /A argC+=1
:: ################################################
:: Set environment to current product folder
pushd "%~dp0"
:: Get software package source directory and set as variable 
SRCDIRSET SRCDIR=
for /f "delims=" %%a in ('cd') do @set SRCDIR=%%a
if %argC%==0 GOTO INSTALL
if %1==uninstall GOTO UNINSTALL

:INSTALL
%comspec% /c %systemroot%\system32\msiexec.exe /i "%SRCDIR%\McProfilerSetup.msi" /quiet
GOTO END

:UNINSTALL
%comspec% /c %systemroot%\system32\MsiExec.exe /X{McProfilerSetup.msi} /quiet

:END
GOTO EOF

:: Exit and pass proper exit to agent
:: ################################################

:EOF
Exit /B 0
```
