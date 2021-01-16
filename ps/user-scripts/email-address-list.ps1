$Path = 'C:\Temp\1.csv'

Get-ADUser -filter * -properties EmailAddress | select-object Name, EmailAddress | Export-Csv -Path $Path –notypeinformation