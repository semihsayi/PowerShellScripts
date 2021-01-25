Get-ADUser -Filter * -SearchBase "OU=x,DC=x,DC=y,DC=z" -properties * | select * | export-csv ou.csv -notypeinformation
