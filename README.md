# Sync Serve

## Setup

### Prerequisites
- Dart SDK installed
- Git installed
- Flutter version- 3.29.3

### Installation Steps

1. Clone the repository
   ```bash
   git clone https://github.com/Integrated-Identities/SyncServe.git
   cd SyncServe
   ```

2. Configure Git hooks
   ```bash
   dart tools/setup.dart
   ```

3. Install dependencies
   ```bash
   dart pub get
   ```

### Generating localization

```bash
flutter gen-l10n
```

> [!NOTE]  
> If you see error like - `arget of URI doesn't exist: 'package:flutter_gen/gen_l10n/app_localizations.dart'.`, try running `flutter clean && flutter gen-l10n && flutter run`.

### Running the Application

```bash
dart run
```
