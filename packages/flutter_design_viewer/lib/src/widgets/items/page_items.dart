import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/src/measures.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrouter/vrouter.dart';

class TableOfContents extends StatelessWidget {
  final List<ViewerSectionUnion> sections;

  const TableOfContents({
    required this.sections,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: sections
          .map(
            (e) => TextButton.icon(
              onPressed: () {
                VRouter.of(context).to('#${e.id}');
              },
              icon: Icon(
                FeatherIcons.cornerDownRight,
                color: theme.primaryColor,
              ),
              label: Text(
                e.title,
                style: theme.textTheme.headline6?.copyWith(
                  color: theme.primaryColor,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class SectionHeaderStyle {
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  const SectionHeaderStyle._({
    this.titleStyle,
    this.descriptionStyle,
  });

  factory SectionHeaderStyle.page(BuildContext context) {
    final theme = Theme.of(context);
    return SectionHeaderStyle._(
      titleStyle: theme.textTheme.headline2?.copyWith(
        fontWeight: FontWeight.w800,
        color: theme.colorScheme.onBackground,
      ),
      descriptionStyle: theme.textTheme.headline5?.copyWith(
        color: theme.colorScheme.onBackground.withOpacity(0.8),
      ),
    );
  }
  factory SectionHeaderStyle.section(BuildContext context) {
    final theme = Theme.of(context);
    return SectionHeaderStyle._(
      titleStyle: theme.textTheme.headline3?.copyWith(
        fontWeight: FontWeight.w800,
        color: theme.colorScheme.onBackground,
      ),
      descriptionStyle: theme.textTheme.headline6?.copyWith(height: 1.4),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final SectionHeaderStyle style;
  final String title;
  final String? description;
  const SectionHeader({
    required this.style,
    required this.title,
    this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
      TextSpan(
        text: '$title\n\n',
        style: style.titleStyle,
        children: [
          if (description != null)
            TextSpan(
              text: description!,
              style: style.descriptionStyle,
            ),
        ],
      ),
    );
  }
}

class ParagraphSection extends HookConsumerWidget {
  final ViewerParagraphSection paragraph;
  const ParagraphSection({
    required this.paragraph,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _scrollIntoViewIfUrlEndsWithId(context, paragraph.id);
    return Paddings.vertical20(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            style: SectionHeaderStyle.section(context),
            title: paragraph.title,
            description: paragraph.description,
          )
        ],
      ),
    );
  }
}

void _scrollIntoViewIfUrlEndsWithId(BuildContext context, String id) {
  final router = VRouter.of(context);
  useEffect(() {
    if (router.url.endsWith(id)) {
      WidgetsBinding.instance?.scheduleFrameCallback((timeStamp) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 500),
        );
      });
    }
  }, [router.url]);
}
