# Changelog

All notable changes to this project will be documented in this file.

## Upcoming Release Notes
- **Planned Feature**: Scientific Mode (Trigonometry, Logarithms)
- **Planned Feature**: Currency Converter
- **Improvement**: Refine dark mode color palette
- **Task**: Finalize App Icon and Splash Screen

## Version History

### 1.0.1 (2026-02-02)
- Added `CHANGELOG.md` to track version history.
- Documentation updates.

### Update 15: Unit and Widget Testing
- Implemented comprehensive unit tests for calculator core logic.
- Added widget tests for `CalculatorScreen` to verify UI components.
- Resolved build and dependency issues related to testing.

### Update 14: Theme System Extensibility
- The theme system is designed for easy expansion:
  - You can add new theme colors by updating the `ThemeColor` enum.
  - You can add new fonts by updating the `Fonts` enum in `lib/utils/enum.dart`.
  - Dynamic color support allows the app to use the system accent color if enabled.
- The settings UI and `ThemeController` will automatically reflect new colors and fonts added to the enums.
- This makes it easy to keep the app visually fresh and customizable for users.

### Update 13: Theme Color Customization
- You can now add more theme colors to the app by updating the `ThemeColor` enum in `lib/utils/enum.dart`.
- To add a new color, simply add a new entry to the enum, e.g.:
  ```dart
  magenta(Color(0xFFFF00FF))
  ```
- The new color will be available for selection in the settings page after updating the enum and (if needed) the color picker UI.

#### Available Theme Colors
- sunsetOrange (#FF5E5B)
- oceanBlue (#0077B6)
- forestGreen (#2A9D8F)
- lavenderPurple (#9D4EDD)
- sunshineYellow (#FFD166)
- coralPink (#FF6F61)
- skyBlue (#00B4D8)
- mintGreen (#3DDC97)
- royalPurple (#7209B7)
- goldenYellow (#FFC300)
- blushRed (#E63946)
- tealBlue (#008080)
- peachOrange (#FFA07A)
- emeraldGreen (#50C878)
- midnightBlue (#191970)

### Update 12: Code Comments & Documentation
- Added file-level and section comments to all main source files in `lib/`.
- Enhanced code clarity and maintainability for all core modules and widgets.

### Update 11: Documentation
- Updated README with clearer setup instructions and folder structure.
- Added this `CHANGELOG.md` for tracking changes.

### Update 10: Bug Fixes
- Fixed minor UI glitches on certain devices.
- Resolved issues with theme persistence and history storage.

### Update 9: Platform Support
- Verified and improved cross-platform compatibility (Android, iOS, macOS, Windows, Web).
- Updated platform-specific configuration files for consistency.

### Update 8: Codebase Refactoring
- Modularized code by separating logic into controllers, UI into screens/widgets, and utilities into the utils directory.
- Improved code readability and maintainability.

### Update 7: Feature Enhancements
- Calculation history screen improved for better usability.
- Added customizable themes and user preferences.
- Improved support for advanced calculator functions.

### Update 6: UI/UX Improvements
- Enhanced neumorphic design for a more modern and soft appearance.
- Improved button animations and overlays for better user interaction.
- Responsive layout adjustments for mobile, desktop, and web platforms.

### Update 5: Miscellaneous
- Commented out the GitHub link in `lib/utils/const.dart`.

### Update 4: Dependency Updates
- Downgraded `cupertino_icons` to version `^1.0.6`.
- Added `build_runner` to `dev_dependencies`.

### Update 3: Asset and Font Management
- Added asset directories for Google Fonts and Lottie animations in `pubspec.yaml`.
- Registered custom font family `CalculatorIcons`.

### Update 2: Android Permissions
- Added `android.permission.VIBRATE` to `AndroidManifest.xml` for vibration support.

### Update 1: App Name Change
- The app name has been changed from **Neumorphic Calculator** to **NeoCalculator** across all platforms (Android, iOS, macOS, Windows, and Flutter project files).
- Updated in: `pubspec.yaml`, `AndroidManifest.xml`, `Info.plist`, `AppInfo.xcconfig`, `Runner.rc`, and `lib/utils/const.dart`.