$connection = New-Object System.Data.SqlClient.SqlConnection
$connection.ConnectionString = "server=x.x.x.x\SQLExpress;database=y;User Id=x;Password=y"
$connection.Open()

$OUpath = 'OU-Path'

$time="text"
$cmd = New-Object System.Data.SqlClient.SqlCommand
$cmd.connection = $connection

$jobDescription="BulkInsert"

$users = 
get-aduser -filter * -properties SAMAccountName, Department,Title,Mobile,Description,Organization,LastLogonDate,EmailAddress,DistinguishedName  -SearchBase $OUpath -SearchScope OneLevel | select SAMAccountName, Department,Title,Mobile,Description,Organization,@{name="LastLogonDate";expression={($_.LastLogonDate).ToShortDauserring()}},EmailAddress,DistinguishedName

$user = Foreach ($user in $users){

$cmd.CommandText = "INSERT INTO dbo.ActiveDirectoryUserResults (SAMAccountName,Department,Title,Mobile,Description,Organization,jobDescription,lastLogonTimestamp,EmailAddress,Dn)
VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}')" -f
$user.SAMAccountName ,$user.Department,$user.Title,$user.Mobile,$user.Description,$user.Organization,$jobDescription,$user.LastLogonDate ,$user.EmailAddress, $users.DistinguishedName
$cmd.ExecuteNonQuery()

} 


$connection.Close()
