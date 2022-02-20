import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/flutter_design_viewer.dart';
import 'package:flutter_design_viewer/src/measures.dart';
import 'package:flutter_design_viewer/src/widgets/items/text.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrouter/vrouter.dart';

import '../../utils.dart';
import 'frames.dart';

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

class TextDescriptionStyle {
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  const TextDescriptionStyle._({
    this.titleStyle,
    this.descriptionStyle,
  });

  factory TextDescriptionStyle.page(BuildContext context) {
    final theme = Theme.of(context);
    return TextDescriptionStyle._(
      titleStyle: theme.textTheme.headline2?.copyWith(
        fontWeight: FontWeight.w800,
        color: theme.colorScheme.onBackground,
      ),
      descriptionStyle: theme.textTheme.headline5?.copyWith(
        color: theme.colorScheme.onBackground.withOpacity(0.8),
      ),
    );
  }
  factory TextDescriptionStyle.section(BuildContext context) {
    final theme = Theme.of(context);
    return TextDescriptionStyle._(
      titleStyle: theme.textTheme.headline3?.copyWith(
        fontWeight: FontWeight.w800,
        color: theme.colorScheme.onBackground,
      ),
      descriptionStyle: theme.textTheme.headline6?.copyWith(height: 1.4),
    );
  }
  factory TextDescriptionStyle.paragraph(BuildContext context) {
    final theme = Theme.of(context);
    return TextDescriptionStyle._(
      titleStyle: theme.textTheme.headline4?.copyWith(
        fontWeight: FontWeight.w500,
        color: theme.colorScheme.onBackground,
      ),
      descriptionStyle: theme.textTheme.subtitle1?.copyWith(height: 1.4),
    );
  }
}

class TextDescription extends StatelessWidget {
  final TextDescriptionStyle style;
  final String? title;
  final String? description;
  const TextDescription({
    required this.style,
    this.title,
    this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
      TextSpan(
        children: [
          if (title != null)
            TextSpan(
              text: '$title\n\n',
              style: style.titleStyle,
            ),
          if (description != null)
            WidgetSpan(
              child: MarkdownText(
                description!,
                textStyle: style.descriptionStyle,
              ),
            ),
        ],
      ),
    );
  }
}

class ComponentSection extends HookConsumerWidget {
  final ViewerComponentSection component;
  const ComponentSection({
    required this.component,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _scrollIntoViewIfUrlEndsWithId(context, component.id);
    final widgetDisplayHeight =
        ref.watch(viewerSettingsProvider.select((v) => v.widgetDisplayHeight));
    return Paddings.vertical20(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextDescription(
            style: TextDescriptionStyle.section(context),
            title: component.title,
            description: component.description,
          ),
          ProviderScope(
            overrides: [
              viewerComponentSectionProvider.overrideWithValue(component),
            ],
            child: ComponentFramePanel(
              widgetDisplayHeight: widgetDisplayHeight,
            ),
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
          TextDescription(
            style: TextDescriptionStyle.section(context),
            title: paragraph.title,
            description: paragraph.description,
          ),
          ...paragraph.contents.fold(
            [],
            (previousValue, element) => [
              ...previousValue,
              ...element.fold(
                [],
                (p, e) => [
                  ...p,
                  e.map(
                    text: (text) => const SizedBox.shrink(),
                    link: (link) => const SizedBox.shrink(),
                    image: (image) => ViewerImageDisplay(item: image),
                    widget: (widget) => const SizedBox.shrink(),
                  ),
                  Spacers.v40,
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void _scrollIntoViewIfUrlEndsWithId(BuildContext context, String id) {
  final router = VRouter.of(context);
  useEffect(() {
    if (router.url.endsWith(id)) {
      ensureScrollableVisible(context);
    }
  }, [router.url]);
}

class ViewerImageDisplay extends StatelessWidget {
  final ViewerImageCollectionItem item;
  const ViewerImageDisplay({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (item.style) {
      case ViewerImageCollectionItemStyle.imageOnLeft:
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: item.url,
              width: item.width,
              height: item.height,
            ),
            Spacers.h40,
            Expanded(
              child: TextDescription(
                style: TextDescriptionStyle.paragraph(context),
                title: item.title,
                description: item.description,
              ),
            ),
          ],
        );
      default:
        return const SizedBox.shrink();
    }
  }
}

class ApiDocsSection extends HookConsumerWidget {
  final ViewerApiDocsSection apiDocs;
  final List<ViewerComponentSection> components;
  const ApiDocsSection({
    required this.apiDocs,
    required this.components,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    _scrollIntoViewIfUrlEndsWithId(context, apiDocs.id);
    final headerTextStyle = theme.textTheme.subtitle2;
    return Paddings.vertical20(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextDescription(
            style: TextDescriptionStyle.section(context),
            title: apiDocs.title,
            description: apiDocs.description,
          ),
          ...components.fold(
            <Widget>[],
            (pv, e) => [
              ...pv,
              TextDescription(
                style: TextDescriptionStyle.paragraph(context),
                title: e.ctorName,
              ),
              DataTable(
                columns: [
                  DataColumn(
                    label: Text(
                      'Name',
                      style: headerTextStyle,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Type',
                      style: headerTextStyle,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Default value',
                      style: headerTextStyle,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Documentation',
                      style: headerTextStyle,
                    ),
                  ),
                ],
                rows: e.builder.fieldMetaDataset
                    .map(
                      (e) => DataRow(
                        cells: <DataCell>[
                          DataCell(
                            Container(
                              decoration: BoxDecoration(
                                color: theme.dialogBackgroundColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: SpacingDesign.s10,
                                  vertical: SpacingDesign.s6),
                              child: Text(e.name),
                            ),
                          ),
                          DataCell(
                            Text(
                              '${e.typeName}${e.isOptional ? '?' : ''}',
                              style: theme.textTheme.bodyText1?.copyWith(
                                color: theme.primaryColor,
                              ),
                            ),
                          ),
                          DataCell(
                            e.defaultValue != null
                                ? Text(e.defaultValueCode!)
                                : const SizedBox.shrink(),
                          ),
                          DataCell(
                            e.documentation != null
                                ? Text(e.documentation!)
                                : const SizedBox.shrink(),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
