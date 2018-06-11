# McAfee Facter

McAfee Facter is a distribution of the puppet/puppetlabs 64bit facter 3.x native binary for windows as an MSI. 

```C:\Program Files\McAfee\Facter>facter.exe -y --no-ruby
aio_agent_version: 5.5.1
dmi:
  manufacturer: Phoenix Technologies LTD
  product:
    name: VMware Virtual Platform
    serial_number: VMware-56 4d 50 a5 57 62 17 6c-18 d1 05 48 4d 99 78 1c
facterversion: 3.11.1
hypervisors:
  vmware:
    {}
identity:
  privileged: false
  user: DESKTOP-0SH1SKQ\smacgreg
is_virtual: true
kernel: windows
kernelmajversion: "10.0"
kernelrelease: 10.0.16299
kernelversion: 10.0.16299
memory:
  system:
    available: 3.58 GiB
    available_bytes: 3842289664
    capacity: 59.91%
    total: 8.93 GiB
    total_bytes: 9583448064
    used: 5.35 GiB
    used_bytes: 5741158400
networking:
  domain: corp.nai.org
  fqdn: DESKTOP-0SH1SKQ.corp.nai.org
  hostname: DESKTOP-0SH1SKQ
  interfaces:
    Ethernet:
      bindings:
        - address: 10.52.247.163
          netmask: 255.255.248.0
          network: 10.52.240.0
      ip: 10.52.247.163
      mac: "00:05:9A:3C:7A:00"
      mtu: 1200
      netmask: 255.255.248.0
      network: 10.52.240.0
    Ethernet0:
      bindings:
        - address: 172.16.231.128
          netmask: 255.255.255.0
          network: 172.16.231.0
      bindings6:
        - address: "fe80::5883:9035:3609:77be%3"
          netmask: "ffff:ffff:ffff:ffff::"
          network: "fe80::%3"
      dhcp: 172.16.231.254
      ip: 172.16.231.128
      ip6: "fe80::5883:9035:3609:77be%3"
      mac: "00:0C:29:99:78:1C"
      mtu: 1500
      netmask: 255.255.255.0
      netmask6: "ffff:ffff:ffff:ffff::"
      network: 172.16.231.0
      network6: "fe80::%3"
  ip: 10.52.247.163
  mac: "00:05:9A:3C:7A:00"
  mtu: 1200
  netmask: 255.255.248.0
  network: 10.52.240.0
  primary: Ethernet
os:
  architecture: x64
  family: windows
  hardware: x86_64
  name: windows
  release:
    full: "10"
    major: "10"
  windows:
    system32: "C:\\WINDOWS\\system32"
path: "C:\\Program Files (x86)\\Common Files\\Oracle\\Java\\javapath;C:\\ProgramData\\Oracle\\Java\\javapath;C:\\WINDOWS\\system32;C:\\WINDOWS;C:\\WINDOWS\\System32\\Wbem;C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\;C:\\Program Files\\PuTTY\\;C:\\Program Files\\Git\\cmd;C:\\Program Files\\nodejs\\;C:\\Program Files (x86)\\Calibre2\\;C:\\Program Files\\Microsoft SQL Server\\130\\Tools\\Binn\\;C:\\Program Files\\bind9\\bin;C:\\Program Files\\dotnet\\;C:\\ProgramData\\chocolatey\\bin;C:\\Users\\smacgreg\\AppData\\Local\\Microsoft\\WindowsApps;C:\\Users\\smacgreg\\AppData\\Local\\atom\\bin;C:\\Users\\smacgreg\\AppData\\Roaming\\npm;C:\\Users\\smacgreg\\AppData\\Local\\Microsoft\\WindowsApps;C:\\tools\\mingw64\\bin;"
processors:
  count: 2
  isa: x64
  models:
    - Intel(R) Core(TM) i5-6300U CPU @ 2.40GHz
  physicalcount: 1
system_uptime:
  days: 4
  hours: 102
  seconds: 368369
  uptime: 4 days
timezone: Eastern Daylight Time
virtual: vmware

C:\Program Files (x86)\McAfee\Facter>
```

## Facter for windows

This `facter.exe` has links against a slew a `.dlls` that are required for operation, and they are included in the `*.msi` package.

![Screenshot](meta/Apps%20%26%20Features%20Installed.png?raw=true "Screenshot")


## Installation

Installation requires the "administrative" context.
`msiexec /i facter.msi /passive /qn`


### Version Elements

As this package follows the semantic versioning of Puppet Facter, only the fourth version number is changed if there is an internal change (MSI tweaks, external facts, etc) to the MSI without changing the core `facter` elements. 

**Warning:** Because MSI ignores the fourth product version field, this allows downgrades when the first three product version fields are identical. For example, product version 1.0.0.1 will "upgrade" 1.0.0.2998 because they're seen as the same version (1.0.0). That could reintroduce serious bugs.

## External facts

run `external-dir` looking at cmds or yara etc..

```
PS C:\Program Files\McAfee\Facter> .\facter.exe -y --no-ruby --external-dir .\lib
aio_agent_version: 5.5.1
dmi:
  manufacturer: Phoenix Technologies LTD
  product:
    name: VMware Virtual Platform
    serial_number: VMware-56 4d 50 a5 57 62 17 6c-18 d1 05 48 4d 99 78 1c
facterversion: 3.11.1
hypervisors:
  vmware:
    {}
identity:
  privileged: false
  user: DESKTOP-0SH1SKQ\smacgreg
is_virtual: true
kernel: windows
kernelmajversion: "10.0"
kernelrelease: 10.0.16299
kernelversion: 10.0.16299
key1: val1
key2: val2
key3: val3
memory:
  system:
    available: 4.61 GiB
    available_bytes: 4954136576
    capacity: 48.31%
    total: 8.93 GiB
    total_bytes: 9583448064
    used: 4.31 GiB
    used_bytes: 4629311488
networking:
```

.bat command returning new facts

```
@echo off
echo key1=val1
echo key2=val2
echo key3=val3
REM Invalid - echo 'key4=val4'
REM Invalid - echo "key5=val5"
```

https://github.com/puppetlabs/facter/blob/master/Extensibility.md

https://puppet.com/docs/facter/3.9/custom_facts.html

## MSI Build Process

### Building localized installers from the command line
The first step in building a localized installer is to compile your WiX sources (in `wix` dir) using candle.exe:

```
candle.exe -nologo facter.wxs -out facter.wixobj
```
After the intermediate output file is generated you can then use light.exe to generate multiple localized MSIs:

```
light.exe -nologo facter.wixobj -cultures:en-us -loc en-us.wxl -out facter.msi
light.exe -nologo facter.wixobj -cultures:fr-fr -loc fr-fr.wxl -out facter-fr-fr.msi
```

The `-loc` flag is used to specify the language file to use. It is important to include the `-cultures` flag on the command line to ensure the correct localized strings are included for extensions such as WiXUIExtension.

## Releasing

```
C:\tools\mfe-facter-repo>git tag -a v3.11.1.8 -m "facter-3.11.1.8"

C:\tools\mfe-facter-repo>git push origin --tags
fatal: HttpRequestException encountered.
   An error occurred while sending the request.
Username for 'https://github.com': shadowbq
Password for 'https://shadowbq@github.com':
Counting objects: 11, done.
Delta compression using up to 2 threads.
Compressing objects: 100% (10/10), done.
Writing objects: 100% (11/11), 7.35 KiB | 0 bytes/s, done.
Total 11 (delta 5), reused 0 (delta 0)
remote: Resolving deltas: 100% (5/5), completed with 5 local objects.
To https://github.com/shadowbq/McAfee_Facter.git
 * [new tag]         v3.11.1.8 -> v3.11.1.8
 ```


### Familiarity with WixEditor

Using the WiX Editor with the new Wix Binary tools to build the MSI, although it doesnt support more complex options.

![Screenshot](meta/WiXEditor.png?raw=true "Screenshot")

## Checking for installation

The MSI installer does a good job of logging the installation into "App & Features" and creating/uninstalling windows Registry keys.

![Screenshot](meta/Registry_Entries.png?raw=true "Screenshot")


## Uninstalling

Facter includes a Windows Registry key "ProductID" which can be used for uninstallation with msiexec

`msiexec /x {C93DC4BF-D45E-40E4-A1D6-8467250E2AFB}`

Note: The ProductID will change with each new version of the MSI.

## Supportablity

This is a community tool orginally written by PuppetLabs and is distributed "as is" while licensed under the Apache 2.0 License. McAfee does not, and will not provide support for this tool. 

## Using Facter within McAfee Active Response

MFE Facter can be used just like any program in the McAfee EDR Tool MAR. There is a powershell script to transpose the `yaml` output of *multiline explicit facter* request to `csv`.

You must list the number of columns you want for your collector, modify it, and upload it to EPO MAR Response Catalog.

![Screenshot](meta/MAR-Facter.png?raw=true "Screenshot")

## LICENSE

MIT LICENSE - Where available and applicable to content not already licensed under the Apache 2.0. 

The LICENSE in this context refers to all content custom to this repository and created under the authors work. All content/binaries or subsidary work including the distribution of precompiled packaged binaries maintains it original license, authors, and restrictions.

## Puppet Labs Reference

* https://github.com/puppetlabs/facter

* https://github.com/puppetlabs/facter/blob/master/LICENSE
