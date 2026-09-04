$CurrentAccount = "$env:USERDOMAIN\$env:USERNAME"
$Username = Read-Host "Please enter the new username"
Write-Host "Initialising account setup..." -ForegroundColor Green
Write-Host "Executing script as: $CurrentAccount" -ForegroundColor Cyan
Write-Host "Creating user: $Username"
