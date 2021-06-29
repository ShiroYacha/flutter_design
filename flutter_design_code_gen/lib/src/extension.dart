import 'package:recase/recase.dart';

extension StringExtension on String {
  String get pascalCase => ReCase(this).pascalCase;
}
