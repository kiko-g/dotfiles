# user role check
Function Test-Elevated {
  $wid = [System.Security.Principal.WindowsIdentity]::GetCurrent()
  $prp = New-Object System.Security.Principal.WindowsPrincipal($wid)
  $adm = [System.Security.Principal.WindowsBuiltInRole]::Administrator
  $prp.IsInRole($adm)
}

If (Test-Elevated) {
  Write-Output "Running as admin!"
} Else {
  Write-Output "Running as regular user."
}

Function PSVersion {
  Get-Host | Select-Object Version
}

Function profile {
  code $PROFILE
}

# jetbrains
Function ij($path) {
  C:\Users\Francisco\AppData\Local\JetBrains\Toolbox\apps\IDEA-U\ch-0\211.6693.111\bin\idea64.exe $path
}

# git functions
Function gadd {
  git add -A
}

Function gstatus {
  git status -s
}

Function gcommit {
  git commit -m
}

Function glog {
  git log --oneline --graph
}

$settings = (Get-Item "C:\users\$env:UserName\AppData\Local\Packages\Microsoft.WindowsTerminal_*\LocalState\settings.json")
Function settings {
  code $settings
}


$sdis = "D:\FEUP\SDIS"
$sdis_p2 = "D:\FEUP\SDIS\Projects\proj2"
$lbaw = "D:\FEUP\LBAW"
$comp = "D:\FEUP\COMP"
$about_me = "D:\Dev\about-me-github"
$dotfiles = "D:\Dev\dotfiles"
$finishers = "D:\Dev\finishers"
$json_server = "D:\Dev\json-server"
$website = "D:\Dev\kiko-g.github.io"
$ni = "D:\Dev\NIAEFEUP"
$leetcode = "D:\Dev\leetcode"
$sheets = "D:\Dev\sheets"
