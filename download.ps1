$MyPath = $env:PSModulePath -split ';'
$MyModule = (Join-Path $MyPath[0] "MyTools")
New-Item -Path $MyModule  -ItemType Directory -Force
Invoke-WebRequest `
    -URI "https://raw.githubusercontent.com/theurbanpenguin/pshell/main/MyTools.psm1" `
    -OutFile (Join-Path $MyModule "MyTools.psm1")