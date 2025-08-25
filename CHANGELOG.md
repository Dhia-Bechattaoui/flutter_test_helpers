# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.0.5] - 2025-01-27

### Fixed
- Fixed DateTime extension methods to properly handle microseconds for endOfDay, endOfMonth, and endOfYear
- Resolved widget testing helper issues with Directionality context for cross-platform compatibility
- Fixed MediaQuery widget test conflicts by using proper widget finder strategies
- Corrected navigation widget tests to include proper route definitions

### Changed
- Updated widget testing helpers to use Directionality instead of MaterialApp/Scaffold for better test isolation
- Enhanced test coverage with 99 comprehensive tests across all functionality
- Improved analysis options configuration by removing deprecated and unrecognized lint rules
- Optimized package metadata for better discoverability and Pana scoring

### Added
- Enhanced integration tests for cross-platform functionality verification
- Improved example application demonstrating WASM compatibility
- Better error handling and test reliability across all platforms

## [0.0.4] - 2025-08-25

### Changed
- Updated package version to 0.0.4 for maintenance release
- Enhanced platform support verification and testing
- Improved WASM compatibility and web platform support
- Optimized example application structure for better testing
- Enhanced dependency management and version compatibility

## [0.0.3] - 2025-08-25

### Changed
- Updated package version to 0.0.3 for maintenance release
- Improved code quality and linting compliance
- Enhanced platform support verification
- Optimized analysis configuration for better scoring

## [0.0.2] - 2024-12-19

### Changed
- Updated package version to 0.0.2 for maintenance release

## [0.0.1] - 2024-12-19

### Added
- Initial release of flutter_test_helpers package
- Mock data generators for common Flutter data types
- Test utilities for widget testing
- Widget testing helpers and extensions
- Support for all 6 platforms: iOS, Android, Web, Windows, macOS, Linux
- WASM compatibility
- Comprehensive test coverage
- Flutter linting rules compliance
