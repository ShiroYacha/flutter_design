import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vrouter/vrouter.dart';

class MarkdownText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  const MarkdownText(
    this.text, {
    Key? key,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MarkdownBody(
      data: text,
      onTapLink: (String text, String? url, String? title) {
        if (url?.startsWith(RegExp(r'http(s)?://', caseSensitive: false)) ==
            true) {
          launch(url!);
        } else if (url?.startsWith(RegExp(r'www\.', caseSensitive: false)) ==
            true) {
          launch('http://' + url!);
        } else if (url?.startsWith('/') == true) {
          VRouter.of(context).to(url!);
        }
      },
      selectable: true,
      styleSheet: MarkdownStyleSheet.fromTheme(
        theme,
      ).copyWith(
        p: textStyle,
        code: GoogleFonts.spaceMono(fontSize: 16),
      ),
    );
  }
}
