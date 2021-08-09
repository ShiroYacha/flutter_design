import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

class WidgetGenerator extends Generator {
  @override
  String generate(LibraryReader library, BuildStep buildStep) {
    return '''
///
/// Test
///
''';
  }
}
