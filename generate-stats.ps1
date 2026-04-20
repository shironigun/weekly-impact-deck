# Weekly KPI Tracker and Stats Generator
# Run this at the end of the week to generate statistics for the presentation

param(
    [Parameter(Mandatory=$false)]
    [string]$WeekFolder
)

# If no week folder specified, use the latest
if (-not $WeekFolder) {
    $year = (Get-Date).Year
    $yearPath = Join-Path $PSScriptRoot $year
    
    if (-not (Test-Path $yearPath)) {
        Write-Host "❌ No year folder found!" -ForegroundColor Red
        exit
    }
    
    $latestWeek = Get-ChildItem -Path $yearPath -Directory | Sort-Object Name -Descending | Select-Object -First 1
    if (-not $latestWeek) {
        Write-Host "❌ No week folder found!" -ForegroundColor Red
        exit
    }
    
    $WeekFolder = $latestWeek.FullName
}

Write-Host "`n📊 Generating Weekly Statistics" -ForegroundColor Cyan
Write-Host "================================`n" -ForegroundColor Cyan

# Function to parse metadata from markdown files
function Get-TicketMetadata {
    param([string]$FilePath)
    
    $content = Get-Content -Path $FilePath -Raw
    $metadata = @{
        Type = ""
        Developer = ""
        Priority = ""
        StoryPoints = 0
        Status = ""
        Customer = ""
    }
    
    # Extract metadata fields
    if ($content -match "Type.*?:\s*(.*?)(?:\r?\n|$)") { $metadata.Type = $matches[1].Trim() }
    if ($content -match "Developer.*?:\s*(.*?)(?:\r?\n|$)") { $metadata.Developer = $matches[1].Trim() }
    if ($content -match "Priority.*?:\s*(.*?)(?:\r?\n|$)") { $metadata.Priority = $matches[1].Trim() }
    if ($content -match "Story Points.*?:\s*(.*?)(?:\r?\n|$)") { 
        $points = $matches[1].Trim()
        if ($points -match '\d+') { $metadata.StoryPoints = [int]$matches[0] }
    }
    if ($content -match "Status.*?:\s*(.*?)(?:\r?\n|$)") { $metadata.Status = $matches[1].Trim() }
    if ($content -match "Customer.*?:\s*(.*?)(?:\r?\n|$)") { $metadata.Customer = $matches[1].Trim() }
    
    return $metadata
}

# Count items by type
$ticketsPath = Join-Path $WeekFolder "tickets"
$defectsPath = Join-Path $WeekFolder "defects"
$supportPath = Join-Path $WeekFolder "support"

$ticketCount = if (Test-Path $ticketsPath) { (Get-ChildItem -Path $ticketsPath -Filter "*.md").Count } else { 0 }
$defectCount = if (Test-Path $defectsPath) { (Get-ChildItem -Path $defectsPath -Filter "*.md").Count } else { 0 }
$supportCount = if (Test-Path $supportPath) { (Get-ChildItem -Path $supportPath -Filter "*.md").Count } else { 0 }

$totalCount = $ticketCount + $defectCount + $supportCount

Write-Host "📈 Work Distribution:" -ForegroundColor Green
Write-Host "   Improvements: $ticketCount" -ForegroundColor White
Write-Host "   Defects Fixed: $defectCount" -ForegroundColor White
Write-Host "   Support Tickets: $supportCount" -ForegroundColor White
Write-Host "   Total Items: $totalCount`n" -ForegroundColor Yellow

# Calculate percentages
if ($totalCount -gt 0) {
    $improvementPct = [math]::Round(($ticketCount / $totalCount) * 100, 0)
    $defectPct = [math]::Round(($defectCount / $totalCount) * 100, 0)
    $supportPct = [math]::Round(($supportCount / $totalCount) * 100, 0)
    
    Write-Host "📊 Work Balance:" -ForegroundColor Green
    Write-Host "   Proactive (Improvements): $improvementPct%" -ForegroundColor Cyan
    Write-Host "   Reactive (Defects): $defectPct%" -ForegroundColor Cyan
    Write-Host "   Support: $supportPct%`n" -ForegroundColor Cyan
}

# Collect all tickets and analyze
$allTickets = @()
if (Test-Path $ticketsPath) {
    Get-ChildItem -Path $ticketsPath -Filter "*.md" | ForEach-Object {
        $meta = Get-TicketMetadata -FilePath $_.FullName
        $meta.FileName = $_.Name
        $meta.Type = "Improvement"
        $allTickets += $meta
    }
}

if (Test-Path $defectsPath) {
    Get-ChildItem -Path $defectsPath -Filter "*.md" | ForEach-Object {
        $meta = Get-TicketMetadata -FilePath $_.FullName
        $meta.FileName = $_.Name
        $meta.Type = "Defect"
        $allTickets += $meta
    }
}

if (Test-Path $supportPath) {
    Get-ChildItem -Path $supportPath -Filter "*.md" | ForEach-Object {
        $meta = Get-TicketMetadata -FilePath $_.FullName
        $meta.FileName = $_.Name
        $meta.Type = "Support"
        $allTickets += $meta
    }
}

# Developer statistics
$devStats = $allTickets | Where-Object { $_.Developer -ne "" -and $_.Developer -notlike "*[*" } | 
    Group-Object -Property Developer | 
    Select-Object Name, Count | 
    Sort-Object Count -Descending

if ($devStats) {
    Write-Host "👥 Developer Contributions:" -ForegroundColor Green
    foreach ($dev in $devStats) {
        Write-Host "   $($dev.Name): $($dev.Count) items" -ForegroundColor White
    }
    Write-Host ""
}

# Story points total
$totalPoints = ($allTickets | Where-Object { $_.StoryPoints -gt 0 } | Measure-Object -Property StoryPoints -Sum).Sum
if ($totalPoints -gt 0) {
    Write-Host "📌 Total Story Points: $totalPoints`n" -ForegroundColor Green
}

# Priority breakdown
$priorityStats = $allTickets | Where-Object { $_.Priority -ne "" -and $_.Priority -notlike "*[*" } | 
    Group-Object -Property Priority | 
    Select-Object Name, Count

if ($priorityStats) {
    Write-Host "🎯 Priority Distribution:" -ForegroundColor Green
    foreach ($priority in $priorityStats) {
        Write-Host "   $($priority.Name): $($priority.Count)" -ForegroundColor White
    }
    Write-Host ""
}

# Unique customers impacted
$customers = $allTickets | Where-Object { $_.Customer -ne "" -and $_.Customer -notlike "*[*" } | 
    Select-Object -ExpandProperty Customer -Unique

if ($customers) {
    $customerCount = ($customers | Measure-Object).Count
    Write-Host "🤝 Unique Customers Impacted: $customerCount`n" -ForegroundColor Green
}

# Generate summary for clipboard
Write-Host "📋 Summary (for presentation):" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan
Write-Host "Total Items: $totalCount"
Write-Host "- Improvements: $ticketCount"
Write-Host "- Defects: $defectCount"
Write-Host "- Support: $supportCount"
if ($totalPoints -gt 0) { Write-Host "Story Points: $totalPoints" }
if ($devStats) {
    Write-Host "`nTop Contributors:"
    $devStats | Select-Object -First 5 | ForEach-Object {
        Write-Host "- $($_.Name): $($_.Count) items"
    }
}
Write-Host "`n✅ Statistics generation complete!" -ForegroundColor Green
Write-Host "Use these numbers to update your presentation.html file.`n" -ForegroundColor Yellow
