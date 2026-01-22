import 'dart:io';

import 'package:args/args.dart';
import 'package:yaml_edit/yaml_edit.dart';

void main(List<String> arguments) async {
  final parser = ArgParser()
    ..addCommand('doctor')
    ..addCommand('examples');

  final install = parser.addCommand('install');
  install.addFlag(
    'git',
    abbr: 'g',
    defaultsTo: false,
    help: 'Install using Git dependency (from GitHub).',
  );
  install.addOption(
    'path',
    abbr: 'p',
    defaultsTo: '.',
    help: 'Path to the app root containing pubspec.yaml',
  );

  ArgResults argResults;
  try {
    argResults = parser.parse(arguments);
  } catch (e) {
    _printUsage(parser);
    exitCode = 64; // usage error
    return;
  }

  if (argResults.command == null) {
    _printUsage(parser);
    return;
  }

  switch (argResults.command!.name) {
    case 'doctor':
      await _doctor();
      break;
    case 'examples':
      _examples();
      break;
    case 'install':
      final cmd = argResults.command!;
      final useGit = cmd['git'] as bool;
      final path = cmd['path'] as String;
      await _install(path: path, useGit: useGit);
      break;
    default:
      _printUsage(parser);
  }
}

void _printUsage(ArgParser parser) {
  stdout.writeln('Swiss Army Component CLI');
  stdout.writeln('Usage: sac <command> [options]');
  stdout.writeln('');
  stdout.writeln('Commands:');
  stdout.writeln(
    '  doctor                Check Flutter environment and versions',
  );
  stdout.writeln(
    '  install [-g] [-p .]   Add swiss_army_component to pubspec.yaml',
  );
  stdout.writeln('  examples              Show usage examples');
  stdout.writeln('');
  stdout.writeln('Options:');
  stdout.writeln('  -g, --git             Install dependency from GitHub');
  stdout.writeln('  -p, --path            Path to app root (default: .)');
}

Future<void> _doctor() async {
  stdout.writeln('Checking Flutter environment...');
  try {
    final result = await Process.run('flutter', ['--version']);
    if (result.exitCode == 0) {
      stdout.writeln(result.stdout);
      stdout.writeln('Flutter is installed.');
    } else {
      stdout.writeln(result.stderr);
      stdout.writeln(
        'Flutter check failed. Ensure Flutter is installed and on PATH.',
      );
    }
  } catch (e) {
    stdout.writeln('Error running flutter: $e');
    stdout.writeln('Ensure Flutter is installed and available in PATH.');
  }
}

void _examples() {
  stdout.writeln('Usage examples for Swiss Army Component');
  stdout.writeln('');
  stdout.writeln('Add to pubspec.yaml:');
  stdout.writeln('  dependencies:');
  stdout.writeln('    swiss_army_component: ^0.2.0');
  stdout.writeln('');
  stdout.writeln('Import and use:');
  stdout.writeln(
    "  import 'package:swiss_army_component/swiss_army_component.dart';",
  );
  stdout.writeln('');
  stdout.writeln('AppTheme example:');
  stdout.writeln('  MaterialApp(');
  stdout.writeln('    theme: SACTheme.light(),');
  stdout.writeln('    darkTheme: SACTheme.dark(),');
  stdout.writeln('  )');
  stdout.writeln('');
  stdout.writeln('Custom theme colors:');
  stdout.writeln('  final config = SACThemeConfig(');
  stdout.writeln('    primary: Colors.blue,');
  stdout.writeln('    secondary: Colors.amber,');
  stdout.writeln('  );');
  stdout.writeln('  MaterialApp(');
  stdout.writeln('    theme: SACTheme.light(config),');
  stdout.writeln('    darkTheme: SACTheme.dark(config),');
  stdout.writeln('  )');
  stdout.writeln('');
  stdout.writeln('Widgets example:');
  stdout.writeln('  AppButton(label: "Click Me", onPressed: () {});');
}

Future<void> _install({required String path, required bool useGit}) async {
  final pubspecPath = File(path).absolute.path.endsWith('pubspec.yaml')
      ? File(path).absolute.path
      : File('${Directory(path).absolute.path}/pubspec.yaml').path;

  final file = File(pubspecPath);
  if (!file.existsSync()) {
    stderr.writeln('pubspec.yaml not found at: $pubspecPath');
    exitCode = 66; // cannot open input
    return;
  }

  final content = file.readAsStringSync();
  final editor = YamlEditor(content);

  // Ensure dependencies exists
  try {
    editor.parseAt(['dependencies']);
  } catch (_) {
    editor.update(['dependencies'], {});
  }

  // Add swiss_army_component dependency
  if (useGit) {
    editor.update(
      ['dependencies', 'swiss_army_component'],
      {
        'git': {
          'url': 'https://github.com/Mensa-Philosophical-Circle/Swiss-Army.git',
          'ref': 'main',
        },
      },
    );
  } else {
    editor.update(['dependencies', 'swiss_army_component'], '^0.2.0');
  }

  file.writeAsStringSync(editor.toString());
  stdout.writeln('Added swiss_army_component to $pubspecPath');
  stdout.writeln('Run: flutter pub get');
}
