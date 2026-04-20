# Weekly Updates Setup Script
# Run this at the start of each week to create a new week folder

# Get current date and week information
$currentDate = Get-Date
$year = $currentDate.Year
$weekNum = (Get-Culture).Calendar.GetWeekOfYear($currentDate, [System.Globalization.CalendarWeekRule]::FirstDay, [DayOfWeek]::Monday)

# Calculate week start (Monday) and end (Sunday)
$daysUntilMonday = ([int][DayOfWeek]::Monday - [int]$currentDate.DayOfWeek + 7) % 7
if ($daysUntilMonday -ne 0 -and $currentDate.DayOfWeek -ne [DayOfWeek]::Monday) {
    $weekStart = $currentDate.AddDays(-($daysUntilMonday + 7))
} else {
    $weekStart = $currentDate.AddDays(-$daysUntilMonday)
}
$weekEnd = $weekStart.AddDays(6)

$weekStartStr = $weekStart.ToString("MMMM-dd")
$weekEndStr = $weekEnd.ToString("dd")
$folderName = "Week-$weekNum-$weekStartStr-$weekEndStr"

Write-Host "Creating folder structure for: $folderName" -ForegroundColor Cyan

# Create week folder structure
$weekPath = Join-Path $year $folderName
New-Item -ItemType Directory -Path $weekPath -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path $weekPath "tickets") -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path $weekPath "defects") -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path $weekPath "support") -Force | Out-Null

Write-Host "✓ Created folder: $weekPath" -ForegroundColor Green

# Copy presentation template (use stakeholder version if it exists)
$presentationPath = Join-Path $weekPath "presentation.html"
$stakeholderTemplate = "templates\presentation-stakeholder.html"
$fallbackTemplate = "templates\presentation-template.html"

if (Test-Path $stakeholderTemplate) {
    Copy-Item $stakeholderTemplate -Destination $presentationPath
    Write-Host "✓ Copied stakeholder presentation template" -ForegroundColor Green
} elseif (Test-Path $fallbackTemplate) {
    Copy-Item $fallbackTemplate -Destination $presentationPath
    Write-Host "✓ Copied presentation template" -ForegroundColor Green
} else {
    Write-Host "⚠️  No presentation template found" -ForegroundColor Yellow
}

# Create README for the week
$readmePath = Join-Path $weekPath "README.md"
$readmeContent = @"
# Week $weekNum - $weekStartStr-$weekEndStr

## Overview
Weekly updates and releases for this week.

## Folders
- **tickets/**: Improvements and enhancements
- **defects/**: Bug fixes and issues resolved
- **support/**: Customer support requests handled

## Files
- **presentation.html**: Stakeholder presentation (open in browser)

## Instructions
1. Add tickets daily using: ``.\add-ticket.ps1 -Type [ticket/defect/support] -Number ## -Title "description"``
2. Fill in all metadata fields (Developer, Priority, Business Impact)
3. Update presentation.html at end of week for stakeholder meeting

"@
Set-Content -Path $readmePath -Value $readmeContent

Write-Host "✓ Created week README" -ForegroundColor Green

Write-Host "`n✅ Setup complete!" -ForegroundColor Green
Write-Host "`nWeek folder: $weekPath" -ForegroundColor Yellow
Write-Host "`nNext steps:" -ForegroundColor Cyan
Write-Host "  1. As tickets are released, copy templates from 'templates' folder"
Write-Host "  2. Fill in ticket details daily"
Write-Host "  3. Update presentation.html at end of week"
Write-Host ""
