import 'dart:io';

void main() async {
  print('🔧 Setting up Git hooks...');

  try {
    // Run the git config command to set core.hooksPath
    final result = await Process.run(
      'git',
      ['config', 'core.hooksPath', '.github/hooks'],
    );

    if (result.exitCode == 0) {
      print('✅ Git hooks successfully configured to use .github/hooks');
    } else {
      print('❌ Failed to configure Git hooks:');
      print(result.stderr);
      exit(1);
    }
  } catch (e) {
    print('❌ Error configuring Git hooks: $e');
    exit(1);
  }

  print('🎉 Setup complete!');
}
