# 📊 Weekly Impact Deck

> **Transform technical work into stakeholder-ready presentations**

A professional system for tracking, documenting, and presenting weekly software
development updates to non-technical stakeholders. Turn your team's work into
clear, business-focused presentations that demonstrate real impact.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

## 🎯 Purpose

Transform technical work into clear, business-focused presentations that
stakeholders actually understand. Perfect for:

- **Development Teams** sharing weekly progress
- **Product Managers** communicating with leadership
- **Support Teams** demonstrating customer impact
- **Anyone** who needs to explain technical work to non-technical audiences

## ✨ Features

### 📝 Organized Documentation

- **3 Work Categories**: Improvements, Defects, Support
- **Developer Attribution**: Track who did what
- **Business Impact Focus**: Plain English explanations
- **Flexible Metadata**: Optional fields for Priority, Story Points, Severity

###🎨 Professional Presentations

- **12-Slide Template**: Ready for stakeholder meetings
- **Visual Charts**: Developer contributions, work distribution
- **KPI Tracking**: Velocity, quality metrics, customer impact
- **Business Outcomes**: Connect technical work to business value

### ⚙️ Automation

- **PowerShell Scripts**: Automate folder creation and stats generation
- **Quick Setup**: New week ready in seconds
- **Auto Statistics**: Generate metrics from your markdown files
- **Templates**: Consistent formatting every time

## 🚀 Quick Start

### 1. Clone the Repository

```powershell
git clone https://github.com/shironigun/weekly-impact-deck.git
cd weekly-impact-deck
```

### 2. Start a New Week

```powershell
.\new-week-setup.ps1
```

This creates:

- Week folder structure (tickets/, defects/, support/)
- Presentation template
- README for the week

### 3. Add Your First Item

```powershell
# For an improvement/feature
.\add-ticket.ps1 -Type ticket -Number 1 -Title "performance-optimization"

# For a bug fix
.\add-ticket.ps1 -Type defect -Number 1 -Title "login-bug-fix"

# For a support request
.\add-ticket.ps1 -Type support -Number 1 -Title "customer-onboarding"
```

### 4. Fill in the Details

Each ticket file has sections for:

- **Metadata**: Developer, Priority (optional), Status
- **Business Impact**: Why it matters (for stakeholders)
- **Technical Details**: What was done

### 5. Generate Weekly Stats

```powershell
.\generate-stats.ps1
```

Get instant metrics on:

- Total items by type
- Developer contributions
- Story points (if tracked)
- Priority distribution
- Customer impact

### 6. Create Your Presentation

- Open the week's `presentation.html`
- Fill in the placeholders with your stats
- Follow the guide in`PRESENTATION-GUIDE.md`
- Present to stakeholders!

## 📁 Project Structure

```
weekly-updates/
├── templates/               # Templates for tickets and presentations
│   ├── ticket-template.md
│   ├── defect-template.md
│   ├── support-template.md
│   └── presentation-stakeholder.html
├── example/                 # Sample week with example data
│   ├── tickets/
│   ├── defects/
│   ├── support/
│   └── presentation.html
├── Scripts
│   ├── new-week-setup.ps1  # Create new week folder
│   ├── add-ticket.ps1      # Add new ticket file
│   └── generate-stats.ps1  # Generate statistics
├── Documentation
│   ├── QUICK-START.md      # Quick reference guide
│   ├── PRESENTATION-GUIDE.md  # How to build presentations
│   └── IMPLEMENTATION-SUMMARY.md  # Full feature list
├── .gitignore              # Protects your private data
└── LICENSE                 # MIT License
```

## 📖 Documentation

- **[QUICK-START.md](QUICK-START.md)** - Daily workflow and common commands
- **[PRESENTATION-GUIDE.md](PRESENTATION-GUIDE.md)** - Step-by-step presentation
  creation
- **[IMPLEMENTATION-SUMMARY.md](IMPLEMENTATION-SUMMARY.md)** - Complete feature
  overview
- **[example/](example/)** - Sample week with real-world examples

## 🎯 Key Concepts

### Business Impact Over Technical Details

❌ **Bad** (Too Technical):

> "Reduced query execution from 5930ms to 0.07ms using SARGable OR logic"

✅ **Good** (Business-Focused):

> "System loads conversations instantly, improving user productivity"

### Developer Attribution

Every item tracks who did the work:

- Recognizes team contributions
- Shows workload distribution
- Enables capacity planning

### Flexible Metadata

**Required:**

- Developer (who did it)
- Business Impact (why it matters)
- Status (done/in-progress)

**Optional:**

- Priority
- Story Points
- Severity

Even without optional fields, you get useful presentations!

### Stakeholder-Friendly Presentations

12 professional slides:

1. Weekly Overview
2. Work Distribution Dashboard
3. Improvements Released
4. Defects Resolved
5. Support Tickets Handled
6. **Team Contributions** (developer stats)
7. **Key Achievements** (business outcomes)
8. **KPIs & Metrics** (trending data)
9. Issues Identified (transparency)
10. Customer Feedback & Wins
11. Next Week Preview
12. Q&A

## 💡 Example Use Cases

### Software Development Team

Track features, bugs, and optimizations weekly. Show leadership the business
impact of technical work.

### Product Team

Demonstrate progress on roadmap items with clear customer benefits and adoption
metrics.

### Support Team

Highlight customer requests handled, common issues resolved, and impact on
customer satisfaction.

### DevOps Team

Communicate infrastructure improvements, incident resolutions, and system
stability achievements.

## 🔧 Requirements

- **PowerShell 5.1+** (Windows built-in)
- **Text Editor** (VS Code, Notepad++, etc.)
- **Web Browser** (for presentations)

That's it! No databases, no servers, no complex dependencies.

## 📊 KPI Tracking

Track these metrics week-over-week:

- **Velocity**: Items completed
- **Cycle Time**: Days from start to done
- **Quality**: Defects found vs. resolved
- **Customer Impact**: Dealers/users helped
- **Team Balance**: Work distribution across developers

Use the included `kpi-tracker-template.csv` to track trends.

## 🎨 Customization

### Modify Templates

Edit files in `templates/` to match your team's needs:

- Add custom fields
- Change section names
- Adjust the presentation design

### Adapt the Presentation

The HTML presentation is fully customizable:

- Change colors and branding
- Add/remove slides
- Modify charts and layouts

### Create Your Own Scripts

PowerShell scripts are simple and well-commented. Extend them for your workflow.

## 🤝 Contributing

Contributions welcome! If you have ideas to improve this system:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

Ideas we'd love to see:

- Additional PowerShell automation
- Presentation themes
- Integration with project management tools (Jira, Azure DevOps)
- Reporting dashboards
- Export formats (PDF, PowerPoint)

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file
for details.

## 🙏 Acknowledgments

Built for teams who need to bridge the gap between technical work and business
communication.

Special thanks to all the developers, product managers, and stakeholders who
inspired this system by asking "What did you accomplish this week?"

## 📞 Support

- **Issues**:
  [GitHub Issues](https://github.com/shironigun/weekly-impact-deck/issues)
- **Discussions**:
  [GitHub Discussions](https://github.com/shironigun/weekly-impact-deck/discussions)

---

**Made with ❤️ for development teams everywhere**

_Transform technical achievements into stakeholder victories_ 🚀
