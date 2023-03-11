function AddRuntime {
    $date = Get-Date -Format "yyyy-MM-dd HH:mm"  
    New-Item -Path "HKCU:\Software\PowershellScriptRunTime" -ItemType "Directory" -Force | Out-Null
    Set-ItemProperty -Path "HKCU:\Software\PowershellScriptRunTime" -Name "RunTime" -Value $date
    Write-Host "Script runtime added to HKCU"
}

function Menu {

    Write-Host "Press Ctrl+C to exit" -BackgroundColor Green
    Write-Host "Choose process search method" -BackgroundColor Green
    Write-Host "[1] By name"
    Write-Host "[2] By part of the name"
    Write-Host "[3] By process ID"
    Write-Host "Aditional options"
    Write-Host "[4] View all processes"
    Write-Host "[5] View all processes that exceed 100MB of RAM"
}

function KillProcess {
    if ($process) {
        $process
        Write-Host "Do you want to kill this process?(y/n)"-BackgroundColor Blue
        $choise = Read-Host

        if ($choise -eq "y") {
            Write-Host "Killing process"
            $process.Kill()
            Write-Host "Process killed" -BackgroundColor Green
        }
        else {
            Write-Host "Process will continue"
        }
    }

    else {
        Write-Host "Process not found" -BackgroundColor Red
    }
}

AddRuntime

while($true){
Menu
$userInput = Read-Host

Switch ($userInput) {

    # By name
    "1" {

        Write-Host "Input process name"
        $processSearch = Read-Host
    
        Write-Host "Getting process list"
    
        $process = Get-Process -Name $processSearch  -ErrorAction SilentlyContinue 
        
        KillProcess
    }

    # By part of the name
    "2" {
        Write-Host "Input part of a process name"
        $processSearch = Read-Host

        Write-Host "Getting process list"

        $process = Get-Process -Name *$processSearch*  -ErrorAction SilentlyContinue | Select-Object -First 1

        KillProcess

    }

    # By process ID
    "3" {
        Write-Host "Input process ID"
        $processSearch = Read-Host

        Write-Host "Getting process list"

        $process = Get-Process -ID $processSearch  -ErrorAction SilentlyContinue

        KillProcess
    }

    # View all processes
    "4" {
        Write-Host "Getting all processes"
        Get-Process
    }

    # View all processes that exceed 100MB of RAM
    "5" {

Write-Host "Press Ctrl+C to exit" -BackgroundColor Green
while ($true) {
    $date = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
    $filename = "C:\Temp\FilteredProcessList_$date.csv"
    Write-Host "Getting processes that exceed 100MB of RAM"
    $processes = Get-Process | Where-Object { $_.WorkingSet64 -gt 100MB } |
        Sort-Object -Property WorkingSet64 -Descending |
        Select-Object Name, Id, @{Name = "RAM Usage (MB)"; Expression = { $_.WorkingSet64 / 1MB } }
    $processes | Export-Csv -Path $filename -NoTypeInformation
    Write-Host "Process list exported" -BackgroundColor Green

    $files = Get-ChildItem -Path C:\Temp\ -Filter "FilteredProcessList_*.csv" | Sort-Object -Property LastWriteTime
    if ($files.Count -gt 5) {
        Remove-Item $files[0].FullName
        Write-Host "Oldest file deleted" -BackgroundColor Green
    }

    Write-Host "Waiting 30 seconds..."
    Start-Sleep -Seconds 30
}



    }
    
    default { Write-Host "Invalid choise" -BackgroundColor Red }
}
}