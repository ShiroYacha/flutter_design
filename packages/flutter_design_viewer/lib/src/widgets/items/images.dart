import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:patterns_canvas/patterns_canvas.dart';

import '../../measures.dart';

class PatternedBackground extends HookConsumerWidget {
  const PatternedBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomPaint(
      size: const Size(double.infinity, double.infinity),
      painter: PatternPainter(
        theme: Theme.of(context),
      ),
    );
  }
}

class PatternPainter extends CustomPainter {
  final ThemeData theme;
  final Color? backgroundColor;
  final Color? foregroundColor;

  PatternPainter({
    required this.theme,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);

    FixedSizeDots(
      bgColor: backgroundColor ?? theme.scaffoldBackgroundColor,
      fgColor: (foregroundColor ?? theme.disabledColor).withOpacity(0.1),
    ).paintOnRect(
      canvas,
      size,
      rect,
      patternScaleBehavior: PatternScaleBehavior.customRect,
      customRect: rect,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class FixedSizeDots extends Pattern {
  @override
  String get description => "Dots";

  const FixedSizeDots({
    required Color bgColor,
    required Color fgColor,
  }) : super(
          patternType: PatternType.dots,
          bgColor: bgColor,
          fgColor: fgColor,
        );

  @override
  void paintWithPattern(
      Canvas canvas, double x, double y, double width, double height) {
    var rectSide = 5;
    var horizontalSquaresCount = width / rectSide;
    var verticalSquaresCount = height / rectSide;
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = bgColor;
    canvas.drawRect(Rect.fromLTWH(x, y, width, height), paint);

    var dx = 0.0, dy = 0.0;
    final dotsPath = Path();
    for (var j = 0; j < verticalSquaresCount; j++) {
      for (var i = 0; i < horizontalSquaresCount; i++) {
        paint
          ..style = PaintingStyle.fill
          ..color = fgColor;
        Rect oval = Rect.fromCircle(
            center: Offset(x + dx + rectSide / 2, y + dy + rectSide / 2),
            radius: rectSide / 4);
        dotsPath.addOval(oval);
        dx += rectSide;
      }
      dy += rectSide;
      dx = 0;
    }
    paint
      ..style = PaintingStyle.fill
      ..color = fgColor;
    canvas.drawPath(dotsPath, paint);
  }
}

class ThemableIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color? color;
  final bool useTheme;

  const ThemableIcon({
    required this.icon,
    this.size = 16,
    this.color,
    this.useTheme = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Icon(
      icon,
      size: size,
      color: color ?? (useTheme ? theme.colorScheme.onBackground : null),
    );
  }
}

class ThemableImage extends StatelessWidget {
  final String uri;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;
  final bool useTheme;
  const ThemableImage({
    required this.uri,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.color,
    this.useTheme = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (uri.startsWith('http') || !uri.contains('.')) {
      throw UnimplementedError();
    }
    final targetUri = useTheme ? _convertToThemedUri(context, uri) : uri;
    if (targetUri.endsWith('.svg')) {
      return SvgPicture.asset(
        targetUri,
        width: width,
        height: height,
        fit: fit,
        color: color,
        package: 'flutter_design_viewer',
      );
    }
    return Image.asset(
      targetUri,
      width: width,
      height: height,
      fit: fit,
      color: color,
      package: 'flutter_design_viewer',
    );
  }

  String _convertToThemedUri(BuildContext context, String uri) {
    final theme = Theme.of(context);
    if (theme.brightness == Brightness.light) return uri;
    final extension = uri.substring(uri.lastIndexOf('.'));
    return uri.replaceAll(extension, '_dark$extension');
  }
}

class LocaleBadge extends StatelessWidget {
  final String name;
  final Locale locale;
  final TextStyle? textStyle;
  const LocaleBadge({
    Key? key,
    required this.name,
    required this.locale,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: SpacingDesign.paddingAll3,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flag.fromString(
            locale.countryCode!,
            width: 20,
            height: 16,
          ),
          const SizedBox(width: 5),
          Text(name, style: textStyle),
        ],
      ),
    );
  }
}
