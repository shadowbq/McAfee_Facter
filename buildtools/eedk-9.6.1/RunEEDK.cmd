@rem Example of use CLI
@rem When uploading a package to ePO, use the -GenPass: option to 
@rem generate an encrypted password for the command line's use.
@rem
@rem ePO.Endpoint.Deployment.Kit.exe -GenPass:"myclearpassword"
@rem this returns: -ePOPassword:"my0KaA5RtQYLdse/SeGF4w=="

ePO.Endpoint.Deployment.Kit.exe ^
-Build:"C:\temp\build" ^
-Folder:"E:\ftproot\McAfee\AntiVirus\Stinger\FakeAlert-Stinger" ^
-ProdName:"STINGER_" ^
-ProdID:1000 ^
-ProdVer:10.2.0.286 ^
-ProdDesc:"Fake AV Stinger" ^
-Install:"stinger.exe /ADL /GO /LOG /SILENT" ^
-Platform:"W2KAS|W2KDC|W2KS|WNT7W|WIN8W|WVST|WVSTS|WIN8S|WXPHE|WXPS|WXPW" ^
-CheckIn:current ^
-ePOServer:"epo:8443" ^
-ePOUser:"admin" ^
-ePOPass:"my0KaA5RtQYLdse/SeGF4w==" ^
-Branch:"Evaluation" ^
-Overwrite:true ^
-Unsigned:true ^
-ePOTest:true ^
-Log:"c:\temp\build\eedk.log"

@IF ERRORLEVEL == 4 echo Unknown Error 4 && GOTO End
@IF ERRORLEVEL == 3 echo Checkin Error 3 && GOTO End
@IF ERRORLEVEL == 2 echo Build Error 2 && GOTO End
@IF ERRORLEVEL == 1 echo Parameter Error 1 && GOTO End
@IF ERRORLEVEL == 0 echo Ok

:end
