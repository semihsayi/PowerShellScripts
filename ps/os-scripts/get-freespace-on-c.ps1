"x.x.x.x", "x.x.x.x", "x.x.x.x" | foreach {
    Get-WmiObject -Class Win32_LogicalDisk `
    -ComputerName $_ -Filter "DeviceId='C:'" } |
    Format-Table SystemName, @{Name="Free"; 
    Expression={[math]::round($($_.FreeSpace/1GB), 2)}} -auto