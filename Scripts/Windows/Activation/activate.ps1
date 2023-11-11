if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
    Write-Host "[" -NoNewline; Write-Host "!" -ForegroundColor Red -NoNewline; Write-Host "] " -NoNewline; Write-Host "Please Run This Program As Administrator"
    Exit(1)
}

Clear-Host
$ErrorActionPreference = 'SilentlyContinue'

function FindKey {
    $SetKey = $null

    if ((Get-WmiObject Win32_OperatingSystem).Caption -eq "Microsoft Windows 11 Home" -or "Microsoft Windows 10 Home") {
        $SetKey = "TX9XD-98N7V-6WMQ6-BX7FG-H8Q99"
        ActivationProcess
    }

    if ((Get-WmiObject Win32_OperatingSystem).Caption -eq "Microsoft Windows 11 Pro" -or "Microsoft Windows 10 Pro") {
        $SetKey = "W269N-WFGWX-YVC9B-4J6C9-T83GX"
        ActivationProcess
    }
    
    if ((Get-WmiObject Win32_OperatingSystem).Caption -eq "Microsoft Windows 11 Pro for Workstations" -or "Microsoft Windows 10 Pro for Workstations") {
        $SetKey = "NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J"
        ActivationProcess
    }

    if ((Get-WmiObject Win32_OperatingSystem).Caption -eq "Microsoft Windows 11 Education" -or "Microsoft Windows 10 Education") {
        $SetKey = "NW6C2-QMPVW-D7KKK-3GKT6-VCFB2"
        ActivationProcess
    }

    if ((Get-WmiObject Win32_OperatingSystem).Caption -eq "Microsoft Windows 11 Enterprise" -or "Microsoft Windows 10 Enterprise") {
        $SetKey = "NPPR9-FWDCX-D2C8J-H872K-2YT43"
        ActivationProcess
    }
    ActivationProcess

    function ActivationProcess {
        slmgr /upk
        slmgr /ckms
        slmgr /cpky

        slmgr /ipk $SetKey
        slmgr /skms kms8.msguides.com
        slmgr /ato
    }
}
