
You are an expert in Flutter, Dart, Riverpod, Freezed, Flutter Hooks, Mailer, Secure storage and Shared preferences.

# Sync Serve Copilot Instructions
### Agent Instruction
If you are an AI assistant setting up this project, follow these steps from this README in order:

1. Ensure Git, Dart, and Flutter (v3.29.3) are installed.
2. Clone this repo and enter its directory.
3. Run `dart tools/setup.dart` to configure Git hooks.
4. Run `dart pub get`.
5. Run `flutter gen-l10n` to generate localization.

### When updating documentation:
- Keep `README.md` focused on getting started, setup, and running the app.
- Place all detailed or module-specific explanations in appropriately named Markdown files under the `docs/` directory (e.g., `docs/state_management.md`, `docs/email.md`).
- Update or create these `docs/*.md` files as needed to reflect code structure or features.
- Do not duplicate content between README and docs.

# Key Principles
- Write concise, technical Dart code with accurate examples.
- Use MVVM, functional and declarative programming patterns where appropriate.
- Prefer composition over inheritance.
- Use descriptive variable names with auxiliary verbs (e.g., isLoading, hasError).
- Structure files: exported widget, subwidgets, helpers, static content, types.
- When using a package, refer to its latest official documentation before generating usage code or examples.

## Dart/Flutter
- Use const constructors for immutable widgets.
- Leverage Freezed for immutable state classes and unions.
- Use arrow syntax for simple functions and methods.
- Prefer expression bodies for one-line getters and setters.
- Use trailing commas for better formatting and diffs.

## Error Handling and Validation
- Implement error handling in views using SelectableText.rich instead of SnackBars.
- Display errors in SelectableText.rich with red color for visibility.
- Handle empty states within the displaying screen.
- Use AsyncValue for proper error handling and loading states.
- Avoid using generic `Exception` or `Error` classes. Use specific built-in exceptions or create a custom exception class when needed.
- Place custom exceptions in `lib/exceptions/` and name them clearly based on the context (e.g., `EmailSendFailure`, `AuthTokenMissingException`).

## Riverpod-Specific Guidelines
- Use @riverpod annotation for generating providers.
- Prefer AsyncNotifierProvider and NotifierProvider over StateProvider.
- Avoid StateProvider, StateNotifierProvider, and ChangeNotifierProvider.
- Use ref.invalidate() for manually triggering provider updates.
- Implement proper cancellation of asynchronous operations when widgets are disposed.

## Localization
- Use localization strings from `lib/l10n/app_en.arb`.
- Ensure all localized strings include a clear `@description` for translators and developers.
- Arrange localization keys alphabetically within the `.arb` file.
- Any UI-visible, language-specific text must be stored in the localization file and used via generated localization classes in Widgets.

## Performance Optimization
- Use const widgets where possible to optimize rebuilds.
- Implement list view optimizations (e.g., ListView.builder).
- Use AssetImage for static images and cached_network_image for remote images.

## Key Conventions
1. Optimize for Flutter performance metrics (first meaningful paint, time to interactive).
2. Prefer stateless widgets:
   - Use ConsumerWidget with Riverpod for state-dependent widgets.
   - Use HookConsumerWidget when combining Riverpod and Flutter Hooks.

## UI and Styling
- Use Flutter's built-in widgets and create custom widgets.
- Implement responsive design using LayoutBuilder or MediaQuery.
- Use themes for consistent styling across the app.
- Use Theme.of(context).textTheme.titleLarge instead of headline6, and headlineSmall instead of headline5 etc.
- Reuse styles from `lib/theme/styles.dart` whenever the variable name clearly describes the intended use.
- If a suitable named style does not exist, define the new style inside `styles.dart` to maintain centralized and consistent styling.

## Model and Database Conventions
- Include createdAt, updatedAt, and isDeleted fields in database tables.
- Use @JsonSerializable(fieldRename: FieldRename.snake) for models.
- Implement @JsonKey(includeFromJson: true, includeToJson: false) for read-only fields.

## Widgets and UI Components
- Create small, private widget classes instead of methods like Widget _build....
- Implement RefreshIndicator for pull-to-refresh functionality.
- In TextFields, set appropriate textCapitalization, keyboardType, and textInputAction.
- Always include an errorBuilder when using Image.network.
- Use hooks wherever possible.

## Miscellaneous
- Use log instead of print for debugging.
- Use Flutter Hooks / Riverpod Hooks where appropriate.
- Keep lines no longer than 80 characters, adding commas before closing brackets for multi-parameter functions.
- Use @JsonValue(int) for enums that go to the database.
- Avoid using string literals directly in code. Use constants, enums, or localization entries instead.
- Prefer defining string constants in a centralized file (e.g., `constants.dart`, `strings.dart`) or using `AppLocalizations`.

## Code Generation
- Utilize build_runner for generating code from annotations (Freezed, Riverpod, JSON serialization).
- Run 'flutter pub run build_runner build --delete-conflicting-outputs' after modifying annotated classes.

### Documentation
- Document complex logic and non-obvious code decisions.
- Use Dart-style `///` comments to document public functions, classes, and fields.
- Avoid over-commenting simple or self-explanatory code.
- When documenting a function, include any custom or built-in exceptions it can throw using `@throws` tags (e.g., `/// @throws EmailSendFailure when SMTP server is unreachable.`).
- Follow official Flutter, Riverpod, Mailer, Secure storage and Shared preferences documentation for best practices.
- Think if documentation in README or docs/*.md should be updated. Use README for high-level setup and usage, and docs/*.md for detailed explanations of specific features or modules.

Refer to Flutter, Riverpod, Mailer, Secure storage and Shared preferences documentation for Widgets, State Management, and Backend Integration best practices.
    