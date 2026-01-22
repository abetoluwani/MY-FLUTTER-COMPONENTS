# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
