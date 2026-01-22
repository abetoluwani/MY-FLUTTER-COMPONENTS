# Swiss Army Component

A reusable Flutter component library with widgets, utilities, and theme support. Ships with a simple CLI to help install and use the package in existing apps.

## Install

Add to your app's `pubspec.yaml`:

```yaml
dependencies:
  swiss_army_component: ^0.2.0
```

Or using our CLI inside your app directory:

```bash
sac install
flutter pub get
```

## Features

### Pre-built Widgets
- **Custom AppBar** - Flexible app bar component
- **Themed Buttons** - Customizable action buttons
- **Text Components** - Text styling with theme support
- **OTP Input** - Secure OTP entry field
- **Search Bar** - Search functionality
- **Text Fields** - Validation-ready input fields
- **Spacing Utilities** - Responsive spacing helpers

### Theme System
- Complete color palette management
- **Customizable colors** - override any color via `SACThemeConfig`
- Mode-aware colors: `...Light` fields apply to the light theme, `...Dark` fields apply to the dark theme; shared fields (e.g., `primary`) are used when mode-specific values are not provided.
- Custom chip themes
- Responsive design utilities
- Light and dark theme support
- Material 3 design

### Utilities
- Form validation functions
- Device utilities (tablet, phone detection)
- Application logging
- Constants management (API, images, sizes, strings)

### CLI
- `sac doctor` - Check Flutter environment
- `sac install` - Add this package to your app's pubspec
- `sac examples` - Show quick usage examples

## Usage

### As a Package

Import the package:

```dart
import 'package:swiss_army_component/swiss_army_component.dart';
```

**Using Widgets:**

```dart
// Custom AppButton
AppButton(
  label: 'Click Me',
  onPressed: () {},
)

// AppTextField
AppTextField(
  hintText: 'Enter text',
  onChanged: (value) {},
)

// OTP Input
OtpInput(
  onComplete: (otp) {
    print('OTP: $otp');
  },
)
```

**Using Utilities:**

```dart
// Validation
if (Validator.validateEmail(email)) {
  print('Valid email');
}

// Device info
bool isTablet = DeviceUtility.isTablet();
```

**Using Theme:**

```dart
import 'package:flutter/material.dart';
import 'package:swiss_army_component/swiss_army_component.dart';

// Use default theme
MaterialApp(
  theme: SACTheme.light(),
  darkTheme: SACTheme.dark(),
  home: const HomePage(),
);

// Customize colors (per-mode)
final config = SACThemeConfig(
  // Shared fallbacks
  primary: Colors.blue,
  secondary: Colors.amber,

  // Light-specific overrides
  primaryLight: Colors.teal,
  secondaryLight: Colors.orange,
  backgroundLight: const Color(0xFFFDFCF9),
  surfaceLight: Colors.white,

  // Dark-specific overrides
  primaryDark: Colors.deepPurple,
  secondaryDark: Colors.tealAccent,
);

MaterialApp(
  theme: SACTheme.light(config),
  darkTheme: SACTheme.dark(config),
  home: const HomePage(),
);

// Or define your own theme class
class AppTheme extends SACThemeBase {
  const AppTheme();

  @override
  SACThemeConfig? config() => const SACThemeConfig(
        // Different palettes per mode
        primaryLight: Colors.teal,
        secondaryLight: Colors.orange,
        primaryDark: Colors.deepPurple,
        secondaryDark: Colors.tealAccent,
      );
}

final appTheme = AppTheme();
MaterialApp(
  theme: appTheme.light(),
  darkTheme: appTheme.dark(),
  home: const HomePage(),
);
```

## Project Structure

```
lib/
├── widgets/                  # Reusable UI components
├── utils/                    # Utility functions
│   ├── constants/           # App constants (removed from exports)
│   ├── theme/               # Theme configuration
│   ├── validators/          # Form validators
│   ├── devices/             # Device utilities
│   └── logging/             # Logging utilities
└── swiss_army_component.dart # Public exports
```

## Dependencies

- `flutter` - Flutter framework
- `get` - State management and routing
- `flutter_screenutil` - Responsive design
- `google_fonts` - Font management
- `pinput` - OTP input widget
- `intl_phone_field` - Phone number input
- `url_launcher` - URL handling
- `intl` - Internationalization

## Customization

### Adding New Widgets

Create new widget files in `lib/widgets/` and export them from `lib/swiss_army_component.dart` for package mode.

### Customizing Theme

Edit theme files in `lib/utils/theme/` to match your brand colors and styles.

## Publishing to pub.dev

To publish this package to pub.dev:

1. Update the version in `pubspec.yaml`
2. Update `CHANGELOG.md` with new changes
3. Run:

```bash
flutter pub publish
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Authors

- [abetoluwani](https://github.com/abetoluwani)

## Support

For issues, feature requests, or questions:
- Open an issue on [GitHub Issues](https://github.com/abetoluwani/MY-FLUTTER-COMPONENTS/issues)
- Check existing issues for similar problems
