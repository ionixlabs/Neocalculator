# Project Details: NeoCalculator

## Overview
NeoCalculator is a beautiful, cross-platform calculator app built with Flutter. It features a modern neumorphic design, advanced calculation capabilities, and a highly customizable user experience. The app is designed to run seamlessly on Android, iOS, Windows, macOS, and Web.

---

## Key Features
- Neumorphic UI for a soft, modern look
- Basic and advanced calculator functions
- Calculation history with easy access
- Customizable themes and user preferences
- Responsive design for all device types
- Animated buttons and overlays
- Cross-platform support (Android, iOS, Windows, macOS, Web)

---

## Technology Stack
- **Framework:** Flutter (Dart)
- **State Management:** GetX
- **UI/UX:** Custom widgets, Google Fonts, Lottie animations
- **Persistence:** Shared Preferences, custom database
- **Other Packages:**
  - math_expressions
  - auto_size_text
  - intl
  - url_launcher
  - fraction
  - timeago
  - logger
  - flutter_slidable
  - tutorial_coach_mark
  - system_theme
  - smooth_page_indicator
  - lucide_icons
  - flutter_launcher_icons
  - package_info_plus

---

## Project Structure
```
lib/
  controllers/        # State management controllers
  repo/               # Data storage and retrieval
  screens/            # UI screens (calculator, dashboard, history, settings)
  utils/              # Utilities, models, and extensions
  widgets/            # Reusable UI components
assets/               # Fonts, icons, lottie animations
```

---

## Setup & Usage
1. **Clone the repository:**
   ```bash
   git clone <your-repo-url>
   cd neocalculator
   ```
2. **Install dependencies:**
   ```bash
   flutter pub get
   ```
3. **Run the app:**
   ```bash
   flutter run
   ```
   Or use your preferred IDE (VSCode, Android Studio, etc.)

---

## Maintainer & License
- **Maintainer:** [Your Name or Organization]
- **License:** MIT License

For more information, see the README or contact the project maintainer. 

---

## Library/File Details

### lib/main.dart
- **Purpose:** Entry point of the app. Initializes system settings, loads preferences, sets up dependency injection (GetX), and launches the main app widget.
- **Key Features:** 
  - Locks orientation to portrait.
  - Loads system accent color.
  - Registers Google Fonts licenses.
  - Sets up theme and preferences controllers.
  - Uses `GetMaterialApp` for navigation and theming.
  - Home screen is the Dashboard.

### lib/calculator_icons.dart
- **Purpose:** Custom icon font definitions for calculator-specific icons.
- **Key Features:** 
  - Defines a set of calculator-related icons (plus, minus, divide, equals, etc.) using a custom font.
  - Provides static `IconData` for use throughout the app.

### lib/tutorial_screen.dart
- **Purpose:** Displays an onboarding/tutorial overlay for first-time users.
- **Key Features:** 
  - Uses `tutorial_coach_mark` and Lottie animations to guide users through app features.
  - Highlights settings and history gestures.
  - Manages animation controllers and tutorial state.

### lib/controllers/theme_controller.dart
- **Purpose:** Manages app theming (light/dark, dynamic color, font).
- **Key Features:** 
  - Loads and applies theme based on user preferences and system accent color.
  - Supports dynamic color and font changes.
  - Persists theme mode in storage.

### lib/controllers/preference_controller.dart
- **Purpose:** Manages user preferences and calculation results.
- **Key Features:** 
  - Loads and saves settings and results using a repository.
  - Handles first-run logic and onboarding.
  - Provides methods to update settings and clear results.

### lib/repo/database.dart
- **Purpose:** Abstracts persistent storage using `SharedPreferences`.
- **Key Features:** 
  - Generic `set`, `get`, and `remove` methods for various data types.
  - Used by controllers to persist user data and settings.

### lib/utils/const.dart
- **Purpose:** Centralizes app-wide constants.
- **Key Features:** 
  - App name, asset paths, storage keys, and (commented) GitHub link.

### lib/utils/enum.dart
- **Purpose:** Defines enums for calculator buttons, fonts, and theme colors.
- **Key Features:** 
  - `CalculatorButton`: Button types and display values.
  - `Fonts`: Supported font families, with methods for text theme and license loading.
  - `ThemeColor`: Predefined color options for theming.

### lib/utils/result_model.dart
- **Purpose:** Data model for calculation results.
- **Key Features:** 
  - Stores output, expression, and timestamp.
  - Provides serialization/deserialization and error/result factory constructors.

### lib/utils/settings_model.dart
- **Purpose:** Data model for user settings.
- **Key Features:** 
  - Stores haptic feedback, button radius, font, theme color, and other preferences.
  - Provides serialization/deserialization and copy methods.
  - Default settings via `normal()` factory.

### lib/screens/calculator_screen/calculator_controller.dart
- **Purpose:** Main logic and state management for the calculator.
- **Key Features:** 
  - Handles input, editing, and formatting of expressions.
  - Manages calculation, result display, and error handling.
  - Supports haptic feedback, parentheses, and operator logic.
  - Saves results to history and interacts with other controllers. 

### lib/widgets/info_dialog.dart
- **Purpose:** Displays an informational dialog with app details, gestures, and credits.
- **Key Features:**
  - Animated Lottie icons for gestures and branding.
  - Shows app version and links to GitHub.
  - Includes credits and license access.

### lib/widgets/number_pad.dart
- **Purpose:** Renders the calculator's number and operation pad.
- **Key Features:**
  - Arranges number and operation buttons in a grid.
  - Uses custom icons and neumorphic buttons.
  - Handles button presses via callbacks.

### lib/widgets/input_widget.dart
- **Purpose:** Displays the calculator's input field.
- **Key Features:**
  - Uses `AutoSizeTextField` for responsive text sizing.
  - Read-only, styled for large, clear input display.
  - Adapts to theme and color.

### lib/widgets/confirm_dialog.dart
- **Purpose:** Shows a confirmation dialog for user actions.
- **Key Features:**
  - Customizable title, content, and confirm button text.
  - Themed for light/dark mode.
  - Provides cancel and confirm actions. 

### lib/widgets/neumorphic_button.dart
- **Purpose:** Custom button widget with neumorphic (soft, raised) visual style.
- **Key Features:**
  - Animated elevation and shadow for press/release.
  - Supports custom border radius, size, and shadow.
  - Handles tap and long-press events.

### lib/widgets/calculator_app_bar.dart
- **Purpose:** App bar for the calculator, with navigation and actions.
- **Key Features:**
  - Page indicator for switching between settings, calculator, and history.
  - Info and clear-history actions with animated transitions.
  - Integrates with controllers for state and navigation.

### lib/widgets/button_radius_dialog.dart
- **Purpose:** Dialog for adjusting the button corner radius.
- **Key Features:**
  - Slider to preview and set button radius.
  - Demo button for live preview.
  - Reset and save options.

### lib/widgets/stacked_button.dart
- **Purpose:** Button widget with two stacked (vertical or horizontal) interactive areas.
- **Key Features:**
  - Supports both vertical and horizontal layouts.
  - Each half can trigger a separate action.
  - Neumorphic styling and animated elevation. 

---
## Code Documentation Improvements

- All main Dart source files now include file-level and section comments.
- Each file clearly states its purpose and the main class or widget it defines.
- This improves code readability, maintainability, and onboarding for new contributors. 