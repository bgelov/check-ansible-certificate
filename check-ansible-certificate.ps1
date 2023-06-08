# Get Ansible certificate on 5986 port and show it

$a = $(powershell -command "netsh http show sslcert ipport='0.0.0.0:5986'")

$regex = [regex] "\w{40}"

$Thumbprint = $regex.Matches($a).Value

Get-ChildItem -Path "Cert:\*$Thumbprint*" -Recurse | Format-List Thumbprint, PSParentPath, NotBefore, NotAfter, Issuer, Subject