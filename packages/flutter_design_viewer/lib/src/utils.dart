import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

///
/// Helper method to create an item based on predicate of an input value. This method
/// takes item creation methods as map value in order to lazily create the widget
/// (also useful to prevent fallible precondition).
///
/// Example:
/// ```dart
/// Container(child:
///   buildWhen<Person, Widget>(person,
///     {
///       (p) => p.hasMeaningfulAvatarUrl : (p) => CircleAvatar(child: Image.network(p.avatarUrl)),
///       (p) => p.hasInitials : (p) => CircleAvatar(child: Text(p.initials)),
///     },
///     orElse: () => PlaceholderAvatar()
///   )
/// )
/// ```
///
U? buildWhen<T, U>(T input, Map<bool Function(T), U Function(T)> map,
    {U? Function()? orElse}) {
  for (final predicate in map.keys) {
    if (predicate(input)) {
      return map[predicate]!(input);
    }
  }
  return (orElse ?? () => null)();
}

///
/// Helper method to create an item based on predicate function. This method
/// takes item creation methods as map value in order to lazily create the widget
/// (also useful to prevent fallible precondition).
///
/// Example:
/// ```dart
/// Container(child:
///   buildWhen<Widget>(person,
///     {
///       () => hasMeaningfulAvatarUrl : () => CircleAvatar(child: Image.network(avatarUrl)),
///       () => hasInitials : () => CircleAvatar(child: Text(initials)),
///     },
///     orElse: () => PlaceholderAvatar()
///   )
/// )
/// ```
///
U? buildIf<U>(
  Map<bool Function(), U Function()> map, {
  U? Function()? orElse,
}) {
  for (final predicate in map.keys) {
    if (predicate()) {
      return map[predicate]!();
    }
  }
  return (orElse ?? () => null)();
}

/// Similar to [useEffect] but async using [Future.microtask].
void useAsyncEffect(Future<Dispose?> Function() effect, [List<Object?>? keys]) {
  useEffect(() {
    final disposeFuture = Future.microtask(effect);
    return () => disposeFuture.then((dispose) => dispose?.call());
  }, keys);
}

void ensureScrollableVisible(
  BuildContext context, {
  int milliseconds = 500,
}) {
  WidgetsBinding.instance?.scheduleFrameCallback((timeStamp) {
    Scrollable.ensureVisible(
      context,
      duration: Duration(milliseconds: milliseconds),
    );
  });
}
