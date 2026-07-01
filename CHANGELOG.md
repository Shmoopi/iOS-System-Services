# Changelog

All notable changes to this project are documented here. This project adheres to
[Semantic Versioning](https://semver.org/).

## [3.0.0] - 2026

### Added
- **Swift Package Manager support** via `Package.swift` and an umbrella
  `module.modulemap`.
- Device-identifier mappings through current hardware: iPhone 11 – iPhone 16e,
  iPad / iPad Air / iPad mini / iPad Pro (incl. M2/M3/M4 models), iPod touch
  (7th gen) and Apple TV HD / 4K.
- Correct device-model detection on the Simulator using
  `SIMULATOR_MODEL_IDENTIFIER`.
- Family-level fallbacks so unrecognised / future device identifiers resolve to
  a sensible name instead of `Unknown`.
- A modern launch screen so the demo renders full-screen on all devices, and a
  `SSDemoTab` launch hook for deterministic screenshots.
- `CLAUDE.md`, `CONTRIBUTING.md`, this changelog, and a CI workflow.

### Changed
- **Minimum deployment target raised to iOS 15.0.**
- `deviceOrientation` now reads the active `UIWindowScene.interfaceOrientation`
  instead of the deprecated `-[UIApplication statusBarOrientation]`.
- Modernised the Xcode project (upgrade check, automatic signing, `gnu17`) and
  the demo `Info.plist` (`arm64` capability, removed the blanket App Transport
  Security exception — the external-IP request already uses HTTPS).
- Rewrote the README with badges, installation options, a full API reference and
  refreshed screenshots; updated the podspec.
- Rebuilt the demo's Memory and Disk screens with safe-area Auto Layout so the
  labels, pie chart and gauge adapt to every device size instead of scattering
  with hard-coded frames; refreshed all screenshots on an iPhone 16 Pro.

### Fixed
- Memory leak / potential over-release in `SSUUID` (`CFUUIDCreateString` result
  is now released via `__bridge_transfer`; no `CFRelease` on a null reference).
- Silenced the unavoidable `CTCarrier` deprecation warnings with a documented
  `#pragma clang` block; the carrier accessors degrade gracefully to `nil`.

## [2.0.1]

- Apple uses GiB instead of GB; fixed `route.h` issue; added pedometer checks;
  updated device identifiers; clarified comments.

## [2.0.0]

- Removed older/unavailable methods, updated the demo project, added CocoaPods
  support, fixed bugs and addressed naming issues.
