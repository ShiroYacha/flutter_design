import 'package:build/build.dart';
import 'package:dart_style/dart_style.dart';
import 'package:flutter_design_annotation/flutter_design_annotation.dart';
import 'package:flutter_design_codegen/src/utils.dart';
// ignore: depend_on_referenced_packages
import 'package:glob/glob.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;
import 'package:source_gen/source_gen.dart';

class PageFactoryBuilder implements Builder {
  @override
  Map<String, List<String>> get buildExtensions {
    return const {
      r'$lib$': ['page_factory.design.dart']
    };
  }

  static AssetId _allFileOutput(BuildStep buildStep) {
    return AssetId(
      buildStep.inputId.package,
      p.join('lib', 'page_factory.design.dart'),
    );
  }

  @override
  Future<void> build(BuildStep buildStep) async {
    // fetch meta data
    final fields = <String>[];
    final importPackages = <String>[];
    await for (final input in buildStep.findAssets(Glob('lib/**/*.dart'))) {
      if (!await buildStep.resolver.isLibrary(input)) {
        continue;
      }
      final library = await buildStep.resolver.libraryFor(input);
      final classesInLibrary = LibraryReader(library).classes;
      for (final clazz in classesInLibrary) {
        if (!hasAnnotation<TDesign>(clazz.metadata)) continue;
        fields.add(buildClassPageFieldName(clazz));
        // parse import info
        final packageUri = clazz.source.uri.path.substring(
          clazz.source.uri.path.indexOf('/') + 1,
        );
        if (!importPackages.contains(packageUri)) {
          importPackages.add(packageUri);
        }
      }
    }
    final dedupFields = Set.from(fields).toList();

    // generate code
    if (dedupFields.isNotEmpty) {
      final sb = StringBuffer();
      for (final field in dedupFields) {
        sb.writeln('$field,');
      }
      await buildStep.writeAsString(
        _allFileOutput(buildStep),
        DartFormatter().format(
          '''
/// GENERATED CODE DO NOT MODIFY!!
/// 
import 'package:flutter_design/flutter_design.dart';

${importPackages.map((uri) => "import '$uri';").join('\n')}

final generatedComponentPages = <ViewerDocumentPage>[
$sb
];
''',
        ),
      );
    }
  }
}
