import 'package:freezed_annotation/freezed_annotation.dart';

part 'design.freezed.dart';

@freezed
class ThemeElement with _$ThemeElement {
  const factory ThemeElement({required String name}) = _ThemeElement;
}
