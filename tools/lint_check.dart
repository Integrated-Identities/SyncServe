import 'dart:io';

void main() async {
  bool failed = false;

  print('🔍 CHECKING LINTING ISSUES...');
  final fixes = await Process.run('dart', ['fix', '--dry-run', '.']);
  final failedLintCheck = fixes.stdout.toString().contains('proposed fix');
  if (failedLintCheck) {
    print('❌ Linting issues found:');
    print(fixes.stdout);
    failed = true;
  }

  print('\n🔍 CHECKING FORMATTING ISSUES...');
  final format = await Process.run(
    'dart',
    ['format', '-o', 'none', '--set-exit-if-changed', '.'],
  );
  final formatOutput = format.stdout.toString();
  final formattedFilesCount =
      RegExp(r'(\d+) changed').firstMatch(formatOutput)?.group(1);
  final changedCount =
      formattedFilesCount != null ? int.parse(formattedFilesCount) : 0;

  final formatFailed = changedCount > 0;

  if (formatFailed) {
    print('❌ Formatting issues found.');
    print(formatOutput);
    failed = true;
  }

  if (failed) {
    print(
      '\n🚫 Commit blocked. Fix the issues above. Please run following command(s):',
    );
    if (failedLintCheck) {
      print('dart fix --apply .');
    }
    if (formatFailed) {
      print('dart format .');
    }
    exit(1);
  } else {
    print('\n✅ All checks passed. Ready to commit.');
  }
}
