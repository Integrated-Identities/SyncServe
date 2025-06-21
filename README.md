# Sync Serve

## Setup

### Prerequisites
- Dart SDK installed
- Git installed
- Flutter version- 3.29.3
- Firebase CLI installed (see Firebase setup section)

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

4. Generate code
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

5. Generate localization
   ```bash
   flutter gen-l10n
   ```

   > [!NOTE]  
   > If you see error like - `Target of URI doesn't exist: 'package:flutter_gen/gen_l10n/app_localizations.dart'.`, try running `flutter clean && flutter gen-l10n && flutter run`.

### Firebase Setup

1. Install Firebase CLI - `https://firebase.google.com/docs/cli`

2. Login to Firebase:
   ```bash
   firebase login
   ```

3. List the firebase projects you have access to:
   ```bash
   firebase projects:list
   ```

   You should be able to see _syncserve-i2_ in the list. If not, please contact admin.

3. Install FlutterFire CLI:
   ```bash
   dart pub global activate flutterfire_cli
   ```

4. Configure Firebase for your app:
   ```bash
   flutterfire configure
   ```
   This will:
   - Create a new Firebase project or select an existing one
   - Configure Firebase for your selected platforms (Android, iOS, etc.)
   - Generate the `lib/firebase_options.dart` file with your Firebase credentials

### Environment Setup

1. Configure Environment Variables
   ```bash
   # Copy the environment template
   cp .env-local .env
   ```
   See [Environment Setup Guide](docs/environment-setup.md) for detailed instructions on configuring all required environment variables.

### Running the Application

```bash
dart run
```

> [!IMPORTANT]  
> Never commit the `.env` file to version control as it contains sensitive information.
