#
# https://blogs.technet.microsoft.com/heyscriptingguy/2015/06/11/table-of-basic-powershell-commands/
#
# Add ImportCSV for a table style output
# {
#    ipcsv $csv -Header 'Tier name','Raid Type','UCap','ConCap','AvCap','%Sub','Higher','Lower'|
#        select -Skip 1|
#        ft -AutoSize
# }
#
# Use the gc|select skip to not print the CSV Table Header

$f="$env:TMP\facter-$pid.yaml"

& 'C:\Program Files\McAfee\Facter\facter.exe' -y --no-ruby networking.dhcp, networking.netmask networking.primary > $f

Get-Content $f | %{
    $csv="$env:TMP\facter-$pid.csv"
    Clear-Content $csv -ea Ignore
    ${#items}=3
    $o=[pscustomobject]@{}
}{
    $splitted=$_-split': '
    if($splitted){
        $o|Add-Member $splitted[0] $splitted[1]
        if(($o.psobject.properties.count|measure -sum).count -eq ${#items}){
            $o|	Export-Csv $csv -Append -NoTypeInformation
            $o=[pscustomobject]@{}
        }
    }
}{ Get-Content $csv | select -Skip 1}

