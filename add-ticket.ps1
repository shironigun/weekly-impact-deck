# Quick Ticket Creator
# Usage: .\add-ticket.ps1 -Type ticket -Number 1 -Title "short-description"
# Usage: .\add-ticket.ps1 -Type defect -Number 1 -Title "short-description"
# Usage: .\add-ticket.ps1 -Type support -Number 1 -Title "short-description"

param(
    [Parameter(Mandatory=$true)]
    [ValidateSet("ticket", "defect", "support")]
    [string]$Type,
    
    [Parameter(Mandatory=$true)]
    [int]$Number,
    
    [Parameter(Mandatory=$true)]
    [string]$Title
)

# Get current week folder (latest folder in current year)
$year = (Get-Date).Year
$yearPath = Join-Path $PSScriptRoot $year

if (-not (Test-Path $yearPath)) {
    Write-Host "❌ No year folder found. Run new-week-setup.ps1 first!" -ForegroundColor Red
    exit
}

$latestWeek = Get-ChildItem -Path $yearPath -Directory | Sort-Object Name -Descending | Select-Object -First 1

if (-not $latestWeek) {
    Write-Host "❌ No week folder found. Run new-week-setup.ps1 first!" -ForegroundColor Red
    exit
}

# Determine subfolder and template
$subfolder = switch ($Type) {
    "ticket"  { "tickets" }
    "defect"  { "defects" }
    "support" { "support" }
}
$templateFile = "$Type-template.md"
$templatePath = Join-Path $PSScriptRoot "templates" $templateFile

# Create filename with zero-padded number
$fileName = "$Type-$('{0:D2}' -f $Number)-$Title.md"
$destinationPath = Join-Path $latestWeek.FullName $subfolder $fileName

# Copy template to destination
Copy-Item $templatePath -Destination $destinationPath

Write-Host "✅ Created: $fileName" -ForegroundColor Green
Write-Host "📁 Location: $($latestWeek.Name)\$subfolder\" -ForegroundColor Cyan
Write-Host ""
Write-Host "Opening file for editing..." -ForegroundColor Yellow

# Open in default editor
Start-Process $destinationPath
