@echo off
:: MFE Facter Package for ePO. 
:: Apache 2.0 License
:: McAfee, LLC. 2018

:: Get number of input parameters
set argC=0
for %%x in (%*) do Set /A argC+=1

:: ################################################
:: Set environment to current product folder
pushd "%~dp0"

:: Get software package source directory and set as variable SRCDIRSET 
SET SRCDIR=
for /f "delims=" %%a in ('cd') do @set SRCDIR=%%a

if %argC%==0 GOTO INSTALL
if %1==uninstall GOTO UNINSTALL

:INSTALL
%comspec% /c %systemroot%\system32\msiexec.exe /i "%SRCDIR%\facter.msi" /passive /quiet
GOTO END

:UNINSTALL
%comspec% /c %systemroot%\system32\MsiExec.exe /X{facter.msi} /quiet

:END
GOTO EOF

:: Exit and pass proper exit to agent
:: ################################################

:EOF
Exit /B 0