import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_viewer/src/measures.dart';
import 'package:flutter_design_viewer/src/utils.dart';
import 'package:flutter_design_viewer/src/widgets/items/containers.dart';
import 'package:ionicons/ionicons.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Paddings.all10(
      child: Row(
        children: [
          const Expanded(child: SizedBox.shrink()),
          SearchButton(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Ionicons.logo_github),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Ionicons.logo_twitter),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Ionicons.moon),
          ),
        ],
      ),
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.dividerColor,
        ),
      ),
      padding: SpacingDesign.paddingAll6,
      child: Row(
        children: [
          const Icon(Ionicons.search),
          Spacers.h6(),
          Text(
            'Search',
            style: theme.textTheme.subtitle1,
          ),
          Spacers.h6(),
          KeyContainer(
              label: buildIf({
                    () => Platform.isMacOS || Platform.isIOS: () => '⌘',
                  }) ??
                  'Ctrl'),
          Spacers.h3(),
          const KeyContainer(label: 'K'),
        ],
      ),
    );
  }
}
