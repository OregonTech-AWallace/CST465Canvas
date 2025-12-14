#Script for creating database for students and granting their permissions
#In order to retrieve the list, a query like the following is used against Banner:
# SELECT bbenroll_stu_id from oit.bbenrollment where bbenroll_crn='12345' and bbenroll_term_code='202501' and bbenroll_crse_status='A';
#Database name and username are both in the format <firstname>.<lastname
#Password is in the format Hootie<last 4 of 918>!
$passwordCredential = Get-Credential -UserName "cst465_admin" -Message "Enter the password for the CST465 Admin account"
$password = $passwordCredential.GetNetworkCredential().Password
$connectionString = "Server=cst465.database.windows.net;User ID=cst465_admin;Password=$password;Database=";
$students = get-content StudentList.txt
$masterConnectionString = $connectionString + "master"
$students | foreach{
    
    $user = get-aduser -properties employeeID -filter {employeeID -eq $_};
    $userDBConnectionString = $connectionString + $username
    $username = $user.sAMAccountName
    $password = "Hootie$($_.Remove(0, 5))!"
    $userDBConnectionString = $connectionString + $username
    write-output "Creating Database for $username"
    $createDatabaseStatement = "CREATE DATABASE [$($username)] (EDITION = 'Basic', SERVICE_OBJECTIVE = 'Basic', MAXSIZE = 2 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS"

    Invoke-Sqlcmd -ConnectionString $masterConnectionString -Query $createDatabaseStatement -QueryTimeout 600
    $createLoginStatement = "CREATE LOGIN [$($username)] WITH PASSWORD='$($password)'"
    Invoke-Sqlcmd -ConnectionString $masterConnectionString -Query $createLoginStatement -QueryTimeout 600
    $createUserStatement = "CREATE USER [$($username)] FROM LOGIN [$($username)]"
    Invoke-Sqlcmd -ConnectionString $userDBConnectionString -Query $createUserStatement -QueryTimeout 600
    $addRoleStatement = "EXEC sp_addrolemember N'db_owner', N'$($username)'";
    Invoke-Sqlcmd -ConnectionString $userDBConnectionString -Query $addRoleStatement -QueryTimeout 600
}