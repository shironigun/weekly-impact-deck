# 📊 Presentation Generation Guide

## Purpose

This guide explains how to fill out the stakeholder presentation at the end of
each week.

---

## Prerequisites

Before generating the presentation:

1. ✅ All tickets/defects/support items documented
2. ✅ Each file has **Developer** and **Business Impact** filled in _(required)_
3. ✅ Priority and Story Points included _when available_ (optional)
4. ✅ Run `.\generate-stats.ps1` to get weekly statistics
5. ✅ Update `kpi-tracker.csv` with this week's data

**Note:** Don't worry if Priority or Story Points are missing on some items. The
system works fine without them - just focus on having clear **Developer
attribution** and **Business Impact** descriptions.

---

## Step-by-Step Process

### 1. Generate Statistics (5 minutes)

```powershell
.\generate-stats.ps1
```

This will output:

- Total counts by type
- Developer contributions
- Story points
- Priority distribution
- Customer impact

**Copy these numbers** - you'll use them in the presentation.

---

### 2. Open Presentation Template (2 minutes)

Open `[WeekFolder]/presentation.html` in your text editor (VS Code, Notepad++,
etc.)

**DO NOT** open in browser yet - you need to edit the HTML first.

---

### 3. Update Each Slide

#### **SLIDE 1: Title & Overview**

Find and replace:

- `[##]` in "Week [##]" → Week number (e.g., "17")
- `[Month DD-DD, YYYY]` → Date range (e.g., "April 14-20, 2026")
- First stat card `[#]` → Number of improvements
- Second stat card `[#]` → Number of defects
- Third stat card `[#]` → Number of support tickets
- `[##] Items Completed` → Total count
- `[Names]` → Team member names (e.g., "Ahmad, Sarah, John")
- `[CRM, Mobile App, Database, etc.]` → Systems worked on

---

#### **SLIDE 2: Work Distribution Dashboard**

- Update the three stat cards with counts
- Update total effort: `[##] pts` → Story points from generate-stats.ps1 _(or
  leave blank/remove if not tracked)_
- Update customers impacted: `[##]` → Unique customer count
- Calculate percentages:
  - Proactive% = (Improvements / Total) × 100
  - Reactive% = (Defects / Total) × 100
  - Support% = (Support / Total) × 100

---

#### **SLIDE 3: Improvements Released**

For each improvement file in `tickets/`:

1. Copy the "Example improvement item" block
2. Replace:
   - `[Improvement Title]` → File title
   - `[Developer Name]` → From metadata
   - `[Priority]` and `priority-[high/medium/low]` → From metadata
   - `[Plain English explanation]` → From "Problem Solved" section
   - `[Why this matters]` → From "Business Value" section
   - `[How users are helped]` → From "User Benefit" section

**Tip**: Keep descriptions to 1-2 sentences max. Stakeholders don't need
technical details.

---

#### **SLIDE 4: Defects Resolved**

For each defect file in `defects/`:

1. Copy the "Example defect item" block
2. Replace:
   - `[Defect Title]` → File title
   - `[Developer Name]` → From metadata
   - `[Priority]` → From metadata
   - `[What couldn't users do?]` → From "User Issue" section
   - `[Customer name/ID]` → From metadata or customer details
   - `[What was fixed]` → From "Solution" section (plain English)
   - `[How this improves things]` → From "Resolution Benefit"

---

#### **SLIDE 5: Support Tickets Handled**

Group support tickets by category:

- Configuration & Enablement (adding users, departments, features)
- Troubleshooting (fixing issues)

For each support item in `support/`:

1. Copy the "support-item" div
2. Replace:
   - `[Customer Name]` → From metadata
   - `[Request description]` → Brief summary

**Count by category** and update `([#] tickets)` headers.

---

#### **SLIDE 6: Team Contributions**

For each developer (from generate-stats.ps1):

1. Copy the "dev-row" div
2. Replace:
   - `[Developer Name]` → Developer name
   - `style="width: [%]%;"` → Calculate: (DevItems / MaxDevItems) × 100
   - `[#] items` → Number of items (in both places)

#### Table Section:

Add a row for each developer showing:

- Name
- # Improvements
- # Defects
- # Support
- Total

---

#### **SLIDE 7: Key Achievements**

Translate technical work to business outcomes:

**Examples:**

❌ **Bad** (too technical):

> "Reduced query execution from 5930ms to 0.07ms"

✅ **Good** (business-focused):

> "System loads conversations instantly, improving user productivity"

For each impact card:

- Choose an icon (⚡🤝🔒📱)
- Write a clear title
- Describe WHAT was done (1 sentence)
- Describe the RESULT in business terms

**Focus areas**: Stability, Customer Satisfaction, Data Security, User
Experience

---

#### **SLIDE 8: KPIs & Metrics**

Use data from `kpi-tracker.csv`:

**This Week vs Last Week:**

- Velocity: Items completed (calculate % change)
- Cycle Time: Days from start to done (↑ or ↓)
- Defect Resolution: Average days to fix bugs
- Customers Helped: Unique count

**Quality Metrics Table:**

- New Defects Found
- Defects Resolved
- Support Response Time

**Calculate trends**:

- ↑ if increasing (good for velocity, bad for cycle time)
- ↓ if decreasing
- → if stable

---

#### **SLIDE 9: Issues Identified**

For any **unresolved** defects or known issues:

1. Copy the "issue-item" div
2. Replace:
   - `[Issue Title]` → Problem description
   - `[Assigned To]` → Developer investigating
   - Priority badge → High/Medium/Low
   - `[Who/what is affected]` → Customer or system area
   - `[Current investigation status]` → Where you are in troubleshooting
   - `[What's being done]` → Next actions

**Purpose**: Show transparency and ownership. Stakeholders appreciate honesty.

---

#### **SLIDE 10: Customer Feedback**

**Quote Section** (if available):

- Add actual customer feedback
- Use a real quote if you have one
- Attribute properly

**Impact Cards:**

- **New Features Enabled**: Count of new capabilities activated
- **User Onboarding**: New users added
- **Notable Wins**: Standout achievements
- **System Reliability**: Uptime stats or "No reported downtime"

---

#### **SLIDE 11: Looking Ahead**

**Priorities List:**

- List 3-4 main objectives for next week
- Use plain English, avoid jargon
- Focus on outcomes, not tasks

**Planned Releases Table:**

- What will be delivered
- Type (Improvement/Defect/Support)
- Who's working on it
- Target day

**Capacity:**

- Team availability % (account for PTO, holidays)
- Expected throughput (based on average velocity)

---

#### **SLIDE 12: Q&A**

Update contact information:

- `[Team Lead Name]` → Your name
- `[Email]` → Contact email
- `[Slack Channel]` → Team channel

---

## 4. Review Checklist

Before presenting:

- [ ] All `[placeholders]` replaced
- [ ] Numbers add up correctly (total = improvements + defects + support)
- [ ] Percentages calculated properly
- [ ] No technical jargon - everything in plain English
- [ ] Developer names spelled correctly
- [ ] Customer names accurate
- [ ] Business impact clearly stated
- [ ] Positive tone (transparency, but not negative)
- [ ] Slides flow logically

---

## 5. Test the Presentation

1. Open `presentation.html` in a browser
2. Use arrow keys to navigate through all 12 slides
3. Check that:
   - All content is visible (not cut off)
   - Numbers make sense
   - No placeholder text remains
   - Formatting looks good

---

## 6. Present to Stakeholders

**Presentation Tips:**

### Slide 1: Set the Context (30 sec)

- "This week we completed X items across Y areas"
- Set positive, professional tone

### Slide 2: Show the Balance (30 sec)

- "Our work was X% proactive improvements, Y% reactive fixes"
- Demonstrates healthy balance

### Slide 3-5: Highlight Key Items (2-3 min)

- Don't read everything
- Pick 2-3 most important items to mention
- Ask: "Any questions on these improvements?"

### Slide 6: Recognize the Team (1 min)

- Call out top contributors
- Thank the team

### Slide 7: Business Impact (2 min)

- **Most important slide!**
- Connect work to business outcomes
- Use examples stakeholders care about

### Slide 8: Show Trends (1 min)

- "We're seeing improvement in..."
- Data-driven insights

### Slide 9: Be Transparent (1 min)

- "We're aware of these issues and actively working on them"
- Shows ownership and control

### Slide 10: Customer Wins (1 min)

- Share positive feedback
- Celebrate successes

### Slide 11: Set Expectations (1 min)

- "Here's what you can expect next week"
- Manage expectations

### Slide 12: Open Discussion (5+ min)

- Let stakeholders ask questions
- Gather feedback
- Note action items

---

## Handling Missing Data

**Don't worry if some metadata is incomplete!**

### If Priority is Missing:

- Skip showing it in the presentation slide
- Focus on what was accomplished instead
- Mention in verbal presentation: "This was identified as important for
  [customer/reason]"

### If Story Points are Missing:

- In Slide 2, remove or replace the "Total Effort" KPI card
- Alternatively, show "Total Items: XX" instead of points
- In KPI tracking, leave that column blank for the week

### If Severity is Missing (Defects):

- Use Priority instead, or
- Describe impact in plain language: "High impact - affected multiple dealers"
  vs "Low impact - cosmetic issue"

### What You MUST Have:

- ✅ **Developer name** - Who did the work (for attribution)
- ✅ **Business impact** - Why it matters (for stakeholders)
- ✅ **Status** - Released/Fixed/In Progress

**Pro Tip:** If data is consistently missing, consider:

1. Making it easier to capture (simplify the template)
2. Estimating in bulk (assign ballpark priorities during weekly review)
3. Focusing on trends that you CAN measure (# of items, customers helped, etc.)

---

## Common Mistakes to Avoid

❌ **Too technical**: "Implemented SARGable OR logic in SQL JOIN" ✅
**Business-focused**: "Improved database efficiency for faster searches"

❌ **Vague**: "Made improvements to the system" ✅ **Specific**: "Reduced
conversation loading time by fixing database queries"

❌ **Negative tone**: "Fixed a bunch of bugs caused by bad code" ✅
**Professional**: "Resolved several issues to improve system stability"

❌ **Too long**: Paragraphs of text per slide ✅ **Concise**: Bullet points, 1-2
sentences max

---

## Time Estimates

- **Generate stats**: 5 minutes
- **Fill out presentation**: 30-45 minutes (first time), 20-30 minutes (once
  familiar)
- **Review and test**: 10 minutes
- **Total**: ~45-60 minutes

---

## Automation Opportunities

Future improvements to save time:

1. **Auto-populate from markdown**: Script to extract metadata and fill HTML
2. **Template snippets**: VS Code snippets for common patterns
3. **KPI dashboard**: Auto-calculate from CSV
4. **Slide generator**: PowerShell to build slides from folder contents

---

## Tips for Success

1. **Fill in daily**: Update the presentation a little each day as tickets
   complete (easier than all at once)
2. **Keep it simple**: Stakeholders want clarity, not complexity
3. **Focus on impact**: Always answer "So what?" for business value
4. **Show trends**: Week-over-week comparisons are powerful
5. **Be honest**: Transparency builds trust
6. **Practice**: Run through the presentation once before the meeting
7. **Update KPI tracker**: Keep historical data for trending

---

## Questions?

If you need help:

1. Check example presentations in previous week folders
2. Review this guide
3. Ask team lead for assistance

---

**Remember**: The goal is to inform stakeholders about the team's work in terms
they understand and care about. Focus on business impact, transparency, and
clear communication.

🎯 **Good luck with your presentation!**
