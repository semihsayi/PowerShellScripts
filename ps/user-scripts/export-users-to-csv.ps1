$OUpath = 'OU=OU Path'
$ExportPath = 'c:\Temp\users.csv'
Get-ADUser -Filter {Enabled -eq $true} -properties *  -SearchBase $OUpath -SearchScope OneLevel | select CN,Department,DisplayName,EmailAddress,mobile,title | Export-Csv -NoType $ExportPath
