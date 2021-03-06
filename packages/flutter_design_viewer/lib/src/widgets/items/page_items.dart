import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/flutter_design_viewer.dart';
import 'package:flutter_design_viewer/src/measures.dart';
import 'package:flutter_design_viewer/src/widgets/items/text.dart';
import 'package:flutter_design_viewer/src/widgets/scaffolds/root_scaffold.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: sections.fold(
          [],
          (previousValue, element) => [
                ...previousValue,
                _TableOfContentEntry(
                  id: element.id,
                  title: element.title,
                ),
                ...element.maybeMap(
                  component: (component) =>
                      component.examples.map((e) => _TableOfContentEntry(
                            id: e.id,
                            title: e.title,
                            level: 1,
                          )),
                  orElse: () => [],
                ),
              ]),
    );
  }
}

class _TableOfContentEntry extends StatelessWidget {
  const _TableOfContentEntry({
    Key? key,
    required this.id,
    required this.title,
    this.level = 0,
  }) : super(key: key);

  final String id;
  final String title;
  final int level;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sizeFactor = 1 / pow(level + 1, 1 / 3);
    return Padding(
      padding: EdgeInsets.only(left: level * 16),
      child: TextButton.icon(
        onPressed: () {
          VRouter.of(context).to(
            VRouter.of(context).url,
            hash: id,
            isReplacement: true,
          );
        },
        icon: Icon(
          FeatherIcons.cornerDownRight,
          color: theme.primaryColor,
          size: 24 * sizeFactor,
        ),
        label: Text(
          title,
          style: theme.textTheme.headline6?.copyWith(
            color: theme.primaryColor,
            fontSize: 24 * sizeFactor,
          ),
        ),
      ),
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
      descriptionStyle: theme.textTheme.headline6?.copyWith(
        height: 1.4,
        fontWeight: FontWeight.w200,
      ),
    );
  }

  factory TextDescriptionStyle.subSection(BuildContext context) {
    final theme = Theme.of(context);
    return TextDescriptionStyle._(
      titleStyle: theme.textTheme.headline4?.copyWith(
        fontWeight: FontWeight.w800,
        color: theme.colorScheme.onBackground,
      ),
      descriptionStyle: theme.textTheme.headline6?.copyWith(
        height: 1.4,
        fontWeight: FontWeight.w200,
      ),
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

class TitleDescription extends StatelessWidget {
  final TextDescriptionStyle style;
  final String? title;
  final String? description;
  final IconData? icon;
  const TitleDescription({
    required this.style,
    this.title,
    this.description,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Row(
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  size: style.titleStyle?.fontSize,
                ),
                Spacers.h10,
              ],
              SelectableText(
                '$title',
                style: style.titleStyle,
              ),
            ],
          ),
          Spacers.v16,
        ],
        if (description != null)
          MarkdownText(
            description!,
            textStyle: style.descriptionStyle,
          ),
      ],
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
          TitleDescription(
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
          if (component.examples.isNotEmpty)
            ...component.examples.fold(
              [],
              (previousValue, element) => [
                ...previousValue,
                Spacers.v40,
                HookBuilder(builder: (context) {
                  _scrollIntoViewIfUrlEndsWithId(context, element.id);
                  return TitleDescription(
                    style: TextDescriptionStyle.subSection(context),
                    title: element.title,
                    description: element.description,
                    icon: Ionicons.cube_outline,
                  );
                }),
                Spacers.v16,
                ProviderScope(
                  overrides: [
                    viewerComponentSectionProvider.overrideWithValue(
                      component.copyWith(
                        builder: element.builder,
                      ),
                    ),
                  ],
                  child: ComponentFramePanel(
                    widgetDisplayHeight: widgetDisplayHeight,
                  ),
                ),
              ],
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
          TitleDescription(
            style: TextDescriptionStyle.section(context),
            title: paragraph.title,
            description: paragraph.description,
          ),
          Spacers.v40,
          ...paragraph.contents.fold(
            [],
            (previousValue, element) => [
              ...previousValue,
              element.map(
                text: (text) => TitleDescription(
                  style: TextDescriptionStyle.paragraph(context),
                  title: text.title,
                  description: text.description,
                ),
                image: (image) => ViewerImageDisplay(item: image),
                widget: (widget) => widget.widget,
              ),
              Spacers.v20,
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
    return null;
  }, [router.url]);
}

class ViewerImageDisplay extends HookConsumerWidget {
  final ViewerImageCollectionItem item;
  const ViewerImageDisplay({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = CachedNetworkImage(
      imageUrl: item.url,
      width: item.width,
      height: item.height,
    );
    final screenBreakpoint = ref.watch(screenBreakpointProvider);
    if (screenBreakpoint == ScreenBreakpoint.mobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          image,
          Spacers.v10,
          TitleDescription(
            style: TextDescriptionStyle.paragraph(context),
            title: item.title,
            description: item.description,
          )
        ],
      );
    }
    switch (item.style) {
      case ViewerImageCollectionItemStyle.imageOnLeft:
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            image,
            Spacers.h40,
            Expanded(
              child: TitleDescription(
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
          TitleDescription(
            style: TextDescriptionStyle.section(context),
            title: apiDocs.title,
            description: apiDocs.description,
          ),
          ...components.fold(
            <Widget>[],
            (pv, e) => [
              ...pv,
              TitleDescription(
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

                /// TODO: improve to use a proper data table with dynamic height configuration
                dataRowHeight: e.builder.fieldMetaDataset
                        .any((e) => e.documentation?.isNotEmpty == true)
                    ? 80
                    : null,
                rows: e.builder.fieldMetaDataset
                    .map(
                      (e) => DataRow(
                        cells: <DataCell>[
                          DataCell(
                            _ApiFieldNameTag(name: e.name),
                          ),
                          DataCell(
                            Text(
                              '${e.typeName}${e.isNullable ? '?' : ''}',
                              style: theme.textTheme.bodyText1?.copyWith(
                                color: theme.primaryColor,
                              ),
                            ),
                          ),
                          DataCell(
                            e.defaultValue != null
                                ? Text(e.defaultValueCode!)
                                : const SizedBox(width: 100),
                          ),
                          DataCell(
                            e.documentation != null
                                ? Padding(
                                    padding: SpacingDesign.paddingAll16,
                                    child: SingleChildScrollView(
                                      controller: useScrollController(),
                                      child: Text(
                                        e.documentation!,
                                        style: GoogleFonts.robotoMono(),
                                      ),
                                    ),
                                  )
                                : const SizedBox(width: 100),
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

class _ApiFieldNameTag extends StatelessWidget {
  final String name;
  const _ApiFieldNameTag({
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.dialogBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: SpacingDesign.s10, vertical: SpacingDesign.s6),
      child: Text(name),
    );
  }
}
