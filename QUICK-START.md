# 📋 Quick Reference Guide - Weekly Updates

## Daily Workflow (When Something is Released)

### Option 1: Using PowerShell Script (Easiest)

```powershell
# For improvements/features:
.\add-ticket.ps1 -Type ticket -Number 1 -Title "short-description"

# For defects/bugs:
.\add-ticket.ps1 -Type defect -Number 1 -Title "short-description"

# For support requests:
.\add-ticket.ps1 -Type support -Number 1 -Title "short-description"
```

### Option 2: Manual

1. Navigate to current week folder: `2026\Week-XX-XXX\`
2. Copy appropriate template from `templates\` folder
3. Rename: `ticket-##-description.md`, `defect-##-description.md`, or
   `support-##-description.md`
4. Fill in details (**including metadata: Developer, Priority, Business
   Impact**)

## Starting a New Week

```powershell
.\new-week-setup.ps1
```

This creates:

- `2026\Week-##-Date\` folder structure
- `tickets\`, `defects\`, and `support\` subfolders
- Fresh stakeholder `presentation.html`
- Week `README.md`

## End of Week - Generate Presentation

```powershell
# 1. Generate statistics
.\generate-stats.ps1

# 2. Update presentation.html with stats
# See PRESENTATION-GUIDE.md for detailed instructions

# 3. Update kpi-tracker.csv for trending
```

## File Naming

| Type    | Format                      | Example                             |
| ------- | --------------------------- | ----------------------------------- |
| Tickets | `ticket-##-description.md`  | `ticket-01-short-url-generation.md` |
| Defects | `defect-##-description.md`  | `defect-01-pdf-send-failure.md`     |
| Support | `support-##-description.md` | `support-01-add-users.md`           |

## Folder Structure

```
Weekly Updates/
├── 2026/
│   └── Week-17-April-14-20/
│       ├── tickets/              ← Improvements
│       ├── defects/              ← Bug fixes
│       ├── support/              ← Support requests
│       ├── presentation.html     ← Stakeholder slides
│       └── README.md
├── templates/                    ← All templates
│   ├── ticket-template.md
│   ├── defect-template.md
│   ├── support-template.md
│   └── presentation-stakeholder.html
├── new-week-setup.ps1           ← Run weekly
├── add-ticket.ps1               ← Run daily
├── generate-stats.ps1           ← Run end of week
├── kpi-tracker.csv              ← Weekly metrics
├── PRESENTATION-GUIDE.md        ← How to fill presentation
└── README.md                     ← Full documentation
```

## Common Commands

```powershell
# List all files in current week
Get-ChildItem 2026\Week-*\* -Recurse

# Generate weekly statistics
.\generate-stats.ps1

# Open presentation
Start-Process 2026\Week-XX\presentation.html

# Count tickets this week
(Get-ChildItem 2026\Week-XX\tickets\).Count
(Get-ChildItem 2026\Week-XX\defects\).Count
(Get-ChildItem 2026\Week-XX\support\).Count
```

## Important: Fill in Metadata!

Each ticket/defect/support file should include:

**Required:**

- ✅ **Developer**: Who worked on it _(required for stats)_
- ✅ **Status**: Released/Fixed/In Progress _(required)_
- ✅ **Business Impact**: Why it matters _(required for stakeholders)_

**Optional (but helpful for trending):**

- 📊 **Priority**: High/Medium/Low _(optional - include if known)_
- 📊 **Story Points**: Effort estimate _(optional - include if estimated)_
- 📊 **Severity**: For defects _(optional - include if assessed)_

Even if Priority and Story Points are missing, you can still generate useful
statistics and presentations. Focus on describing the **business impact**
clearly.

## Tips

✅ Create ticket files **immediately** when something is released ✅ Fill in
**all metadata fields** (especially Developer and Business Impact) ✅ Keep
descriptions **non-technical** for stakeholders  
✅ Run **generate-stats.ps1** before updating presentation ✅ Review
**PRESENTATION-GUIDE.md** before stakeholder meeting ✅ Update
**kpi-tracker.csv** weekly for trends

---

**Need Help?**

- Quick start: This file
- Presentation help: `PRESENTATION-GUIDE.md`
- Full docs: `README.md`
