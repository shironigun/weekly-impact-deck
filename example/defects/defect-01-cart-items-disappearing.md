# Mobile App | Shopping Cart Bug - Items Disappearing

## Metadata

- **Type**: Defect
- **Developer**: Carol Davis
- **Priority**: High _(optional)_
- **Severity**: High _(optional - impact level)_
- **Story Points**: 3 _(optional - leave blank if not estimated)_
- **Status**: Fixed
- **Customers Impacted**: Mobile app users (approx. 1000 users affected)

## Defect

Bug #789: Shopping cart items disappearing after app backgrounding

## Project

E-Commerce Mobile App

## Business Impact (For Stakeholders)

- **User Issue**: Customers couldn't complete purchases because items
  disappeared from cart when switching apps
- **Business Impact**: Lost sales and poor customer experience leading to app
  store complaints
- **Urgency**: Critical bug affecting revenue - increased cart abandonment rate
  by 25%
- **Resolution Benefit**: Customers can now shop confidently without losing cart
  contents

## Description

Mobile app users reported that items added to shopping cart would disappear if
they backgrounded the app (e.g., to check email) and returned later.

## Issue

- Cart items vanish after app is backgrounded for more than 30 seconds
- User has to re-add all items
- Caused frustration and cart abandonment
- Negative app store reviews mentioning this issue

## Customer Details

- **Customer:** Mobile app users (general)
- **Affected Area:** Shopping cart persistence
- **Attempted Fix:** Initially thought it was a server session issue
- **Workaround**: Users had to complete checkout without leaving the app

## Root Cause

App state management was not properly saving cart data to local storage when app
went to background. Cart state was only held in memory.

## Solution

- Implemented proper state persistence using AsyncStorage
- Added before-background event handler to save cart state
- Implemented cart state restoration on app foreground
- Added unit tests to prevent regression

## Status

- ✅ Cart persistence working correctly
- ✅ Tested across iOS and Android
- ✅ No more reports of disappearing cart items
