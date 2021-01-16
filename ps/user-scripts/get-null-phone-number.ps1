$Path = 'C:\Temp\1.csv'

get-aduser -filter * -properties SAMAccountName, Department,Title,Mobile,Description,Organization,lastLogonTimestamp,EmailAddress | select SAMAccountName, Department,Title,Mobile,Description,Organization, @{Name="Stamp"; Expression={[DateTime]::FromFileTime($_.lastLogonTimestamp).ToString('yyyy-MM-dd hh:mm:ss')}}, EmailAddress  | Export-Csv -Path $Path –notypeinformation