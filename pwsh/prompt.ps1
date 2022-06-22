function prompt {
    $userdata = (whoami).Split('\')
    $username = $userdata[1]
    $pcname = $userdata[0]
    $userinfo = $username + "@" + $pcname

    $wd = (Get-Location).Path
    $pr = [System.Environment]::GetFolderPath(40)
    $loc = $wd
    if($wd.StartsWith($pr)){
        $loc = $wd.Replace($pr,"~")
    }

    $currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    $isAdmin = $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
    $statuschar = "$"
    if ($isAdmin){
        $statuschar = "#"
    }

    Write-Host "[PWSH] " -ForegroundColor "Yellow" -NoNewline
    Write-Host $userinfo -ForegroundColor "Green" -NoNewline
    Write-Host ":" -ForegroundColor "White" -NoNewline
    Write-Host $loc -ForegroundColor "Blue" -NoNewline
    Write-Host " " -ForegroundColor "White" -NoNewline
    Write-Host $statuschar -ForegroundColor "White" -NoNewline

    return " "
}
