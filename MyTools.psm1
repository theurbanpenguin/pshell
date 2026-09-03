# Function to create user if not exists
function New-User {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [string]$username,
        [Parameter(Mandatory = $false)]
        [string]$displayname,
        [Parameter(Mandatory = $false)]
        [string]$description,
        [Parameter(Mandatory = $false)]
        [System.Security.SecureString]$password
    )
        if (-not $username) {$username = (Read-host "User") }
        if (-not $displayname) {$displayname = (Read-host "Full Name")}
        if (-not $description) {$description = (Read-host "Description")}
        if (-not $password) {$password = (Read-host "Password" -AsSecureString)}
    $displayname = ConvertTo-ProperCase -text $displayname
    if (Get-LocalUser -Name $username -ErrorAction SilentlyContinue) {
        Write-Host "User: $username exists" -ForegroundColor Red
    } else {
                New-LocalUser -Name $username -FullName $displayname `
                -Description $description `
                -Password $password
                Write-Host "User: $username created" -ForegroundColor Green
    }
}

function Show-Greeting {
    param(
        [string]$Name = "World"
    )
    Write-Host "Hello $Name"
}

function ConvertTo-ProperCase {
    param(
        [Parameter(Mandatory=$true)]
        [string]$text
    )
    (Get-Culture).TextInfo.ToTitleCase($text.ToLower())
}