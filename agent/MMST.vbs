'Create Custom Properties to pull Make, Model, Serial and Type in EPO
'created by: Daniel VanMeter
'
'
On error resume next


strComputer = "."


Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\CIMV2") 
Set colItems = objWMIService.ExecQuery( _
    "SELECT * FROM Win32_ComputerSystem",,48) 
For Each objItem in colItems 
Model = objItem.Model

Next

Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\CIMV2") 
Set colItems = objWMIService.ExecQuery( _
    "SELECT * FROM Win32_BIOS",,48) 
For Each objItem in colItems 
Company = objItem.Manufacturer
Serial = objItem.SerialNumber

Next

Set objWMIService = GetObject("winmgmts:" _
    & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colChassis = objWMIService.ExecQuery _
    ("Select * from Win32_SystemEnclosure")
For Each objChassis in colChassis
    For  Each strChassisType in objChassis.ChassisTypes
        Select Case strChassisType


            Case 1
            CaseType ="Other"
             
            Case 2
            CaseType ="Unknown"
               
            Case 3
            CaseType ="Desktop"
              
            Case 4
            CaseType ="Low Profile Desktop"
               
            Case 5
            CaseType ="Pizza Box"
              
            Case 6
            CaseType ="Minitower"
                
            Case 7
            CaseType ="Tower"
               
            Case 8
            CaseType ="Portable"
               
            Case 9
            CaseType ="Laptop"
              
            Case 10
            CaseType ="Notebook"
              
            Case 11
            CaseType ="Handheld"
              
            Case 12
            CaseType ="Docking Station"
               
            Case 13
            CaseType ="All-in-One"
             
            Case 14
            CaseType ="Sub-Notebook"
             
            Case 15
            CaseType ="Space Saving"
              
            Case 16
            CaseType ="Lunch Box"

            Case 17
            CaseType ="Main System Chassis"
            
            Case 18
            CaseType ="Expansion Chassis"
              
            Case 19
            CaseType ="Sub-Chassis"
             
            Case 20
            CaseType ="Bus Expansion Chassis"
             
            Case 21
            CaseType ="Peripheral Chassis"
              
            Case 22
            CaseType ="Storage Chassis"
               
            Case 23
            CaseType ="Rack Mount Chassis"
           
            Case 24
            CaseType ="Sealed-Case PC"
               
            Case Else
            CaseType ="Unknown"
               
            End Select
    Next

Next

const HKEY_LOCAL_MACHINE = &H80000002

Set StdOut = WScript.StdOut

Set oReg=GetObject("winmgmts:{impersonationLevel=impersonate}!\\" &_ 
strComputer & "\root\defaultSmiley FrustratedtdRegProv")

strKeyPath = "SOFTWARE\Network Associates\ePolicy Orchestrator\Agent\CustomProps"

oReg.CreateKey HKEY_LOCAL_MACHINE,strKeyPath

strKeyPath = "SOFTWARE\Network Associates\ePolicy Orchestrator\Agent\CustomProps"

strValueName = "CustomProps1"

strValue = Company

oReg.SetStringValue HKEY_LOCAL_MACHINE,strKeyPath,strValueName,strValue

strValueName = "CustomProps2"

strValue = Model

oReg.SetStringValue HKEY_LOCAL_MACHINE,strKeyPath,strValueName,strValue

strValueName = "CustomProps3"

strValue = Serial

oReg.SetStringValue HKEY_LOCAL_MACHINE,strKeyPath,strValueName,strValue

strValueName = "CustomProps4"

strValue = CaseType

oReg.SetStringValue HKEY_LOCAL_MACHINE,strKeyPath,strValueName,strValue

