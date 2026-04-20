# Example Weekly Update

This folder contains example files demonstrating how to use the Weekly Updates
system.

## Files Included

### Improvements (tickets/)

- **ticket-01-product-catalog-performance.md** - Example of a performance
  optimization
- **ticket-02-search-autocomplete.md** - Example of a feature enhancement

### Defects (defects/)

- **defect-01-cart-items-disappearing.md** - Example of a bug fix with customer
  impact

### Support (support/)

- **support-01-multi-currency-enablement.md** - Example of a customer support
  request

### Presentation

- **presentation.html** - Template stakeholder presentation (open in browser)

## How to Use This Example

1. Review the example ticket files to see how to format your own
2. Notice the key sections:
   - **Metadata** (Developer, Priority, Status)
   - **Business Impact** (Problem Solved, Business Value, User Benefit)
   - **Technical Details** (Description, Issue, Solution)

3. Open `presentation.html` in a browser to see the slide structure

4. When ready, create your own week folder using:
   ```powershell
   .\new-week-setup.ps1
   ```

## Key Takeaways

- Focus on **business impact** in plain language for stakeholders
- Include **developer attribution** for team recognition
- **Optional fields** (Priority, Story Points) can be left blank
- Keep descriptions **non-technical** where possible
- Show both accomplishments and transparency about challenges
