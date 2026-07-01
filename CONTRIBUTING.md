# Contributing

Thanks for your interest in improving **iOS System Services**! Contributions of
all kinds are welcome — bug reports, new device identifiers, documentation fixes
and features.

## Ground rules

- **The project stays Objective-C.** Please don't port it to Swift.
- Match the existing style: defensive `@try/@catch`, sentinel return values
  (`nil` / `-1` / `false`), nullability annotations, and the dense explanatory
  comments.
- The demo app must build **without warnings** before a PR is merged.

## Getting set up

```bash
git clone https://github.com/Shmoopi/iOS-System-Services.git
cd iOS-System-Services/SystemServicesDemo
open SystemServicesDemo.xcodeproj
```

Build from the command line to verify changes:

```bash
cd SystemServicesDemo
xcodebuild -project SystemServicesDemo.xcodeproj \
  -scheme SystemServicesDemo \
  -sdk iphonesimulator \
  -destination 'platform=iOS Simulator,name=iPhone 16' \
  build CODE_SIGNING_ALLOWED=NO
```

## Adding a new device

Add the mapping to the `else if` chain in
`System Services/Utilities/SSHardwareInfo.m`
(`+systemDeviceTypeFormatted:`). Keep specific `iPad…` checks **above** the
`hasPrefix:@"iPad"` catch-all, and leave the family-level fallbacks last.

## Submitting changes

1. Fork and create a feature branch.
2. Make your change and confirm the demo builds cleanly.
3. Update `CHANGELOG.md`.
4. Open a pull request describing what changed and why.
