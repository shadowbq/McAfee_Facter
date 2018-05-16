# Installing the MSI from EPO using EEDK

## Batch wrapper for EEDK to run msiexec

```
@echo off:: Get number of input parametersset argC=0for %%x in (%*) do Set /A argC+=1 :: ################################################:: Set environment to current product folderpushd "%~dp0":: Get software package source directory and set as variable SRCDIRSET SRCDIR=for /f "delims=" %%a in ('cd') do @set SRCDIR=%%aif %argC%==0 GOTO INSTALLif %1==uninstall GOTO UNINSTALL:INSTALL%comspec% /c %systemroot%\system32\msiexec.exe /i "%SRCDIR%\McProfilerSetup.msi" /quietGOTO END:UNINSTALL%comspec% /c %systemroot%\system32\MsiExec.exe /X{McProfilerSetup.msi} /quiet:ENDgoto EOF:: Exit and pass proper exit to agent:: ################################################:EOFExit /B 0
```
