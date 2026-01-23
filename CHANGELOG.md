# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.4.0] - 2026-01-23

### Added

- **SocialLoginButton**: New widget for social authentication with built-in branding for Google, Apple, Facebook, and Email providers. Uses embedded SVGs for logos, so no asset configuration is required.

### Dependencies

- Added `flutter_svg` for rendering SVG icons.

---

## [0.3.3] - 2026-01-23

### Changed

- **Button Elevation**: Changed default elevation for `AppElevatedButton` and `NormalElevatedButton` from `2.0` to `0.0` for a flatter, more modern default look.

---

## [0.3.2] - 2026-01-23

### Fixed

- **AppText Font Family Inheritance**: Removed hardcoded Poppins font default. `AppText` now properly inherits `fontFamily` from `Theme.of(context)`. Users can still use Poppins by setting it in their theme or via the `fontFamily` property.

---

## [0.3.1] - 2026-01-23

### Fixed

- **AppText Theme Color Inheritance**: Removed hardcoded black color default from `AppText` and all derived widgets, allowing proper color inheritance from theme.
- **Style Merging**: `AppText` now correctly prioritizes explicit properties (like `color`, `fontSize`) over the provided `textStyle`.
- **Custom Font Support**: Added support for non-Google fonts. Providing a `fontFamily` now uses a standard `TextStyle`, enabling asset-based fonts.

### Changed

- Updated text widgets to behave more predictably when composing styles.

---

## [0.3.0] - 2026-01-23

### Added

- **Comprehensive Theme System**: Expanded `SACThemeConfig` with 50+ new properties for granular control over all Flutter Material components
  - Component-specific theming: Scaffold, AppBar, BottomNavigationBar, NavigationBar, NavigationRail, Drawer, FAB
  - Button theming: ElevatedButton, OutlinedButton, TextButton, FilledButton, IconButton
  - Surface theming: Cards, Dialogs, BottomSheet, Snackbar, PopupMenu
  - Input theming: TextField decoration, Checkbox, Radio, Switch, Slider, ProgressIndicator
  - Display theming: Tooltip, Divider, ListTile, TabBar, DataTable, Chip, Badge, SearchBar, SegmentedButton, ExpansionTile
  - Typography: Full `TextTheme` customization with `fontFamily` and individual text style overrides
  - Interaction states: splash, highlight, hover, focus, disabled colors
  - Mode-specific overrides: Separate `...Light` and `...Dark` properties for complete light/dark mode customization

### Changed

- Updated `README.md` with advanced theming documentation and examples
- Enhanced `example/example.dart` to showcase new theme capabilities including typography configuration

### Fixed

- Lint issue in OTP widget: Added braces around if-statement return
- Removed unnecessary library declaration
- Removed duplicate import in test file

---

## [0.2.1] - 2026-01-23

### Added

- Comprehensive `example/example.dart` showcasing all components
- MIT LICENSE file
- `.pubignore` to exclude IDE/build files from published package

### Changed

- Updated README with CLI installation instructions (`dart pub global activate swiss_army_component`)

---

## [0.1.0] - 2026-01-22

### Added

- Initial release of My Flutter Components package
- Pre-built widgets:
  - Custom AppBar
  - Themed AppButton
  - AppText for text styling
  - OTP input field
  - SearchBar component
  - Space utilities
  - TextFields with validation
  - General widget utilities
- Complete theme system:
  - Color palette management
  - Chip theme customization
  - Responsive design support
- Utility functions:
  - Form validators
  - Text formatters
  - Device utilities
  - Application logging
  - Helper functions
- Constants:
  - API constants
  - Image paths
  - Size constants
  - Text strings
- Documentation and examples

## [0.2.0] - 2026-01-22

### Changed

- Converted repository to a pure package by removing all app template files (`lib/main.dart`, `lib/app/**`).
- Updated README and Setup Guide to focus on package usage only.
- Renamed package from `my_flutter_components` to `swiss_army_component`.

### Added

- CLI `sac` with commands:
  - `doctor` to check Flutter environment
  - `install` to add `swiss_army_component` to an app's `pubspec.yaml`
  - `examples` to print usage snippets
- Pubspec updates: version bump to `0.2.0`, `executables` entry, and CLI dependencies.
