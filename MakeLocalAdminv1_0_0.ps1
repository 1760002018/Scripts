# TP - 2020-11-23 12:57:00
#
#
$users = Get-ChildItem -Path 'HKLM:\Software\Microsoft\Windows NT\CurrentVersion\ProfileList\' | Where-Object {$_.Name -like "*ProfileList\S-1-12-1-*"}
foreach ($user in $users)
{
    $userSID = ([string] $user).replace("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\ProfileList\","")
    Write-Host $userSID
    Add-LocalGroupMember -Group Administrators -Member $userSID
}