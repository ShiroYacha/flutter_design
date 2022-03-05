import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';

part 'misc.design.dart';

@Design(
  designLink: 'https://www.figma.com/',
)
class Avatar extends StatelessWidget {
  @DesignField(
      parameter: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2')
  final String uri;

  final double radius;

  const Avatar({
    required this.uri,
    this.radius = 30.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CircleAvatar(
      backgroundColor: theme.backgroundColor,
      radius: radius,
      child: CircleAvatar(
        backgroundImage: Image.network(uri).image,
        radius: max(0, radius - 10),
      ),
    );
  }
}

@design
class AvatarDuo extends StatelessWidget {
  @DesignField(
    parameter: AvatarModel(
      uri: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2',
    ),
  )
  final AvatarModel left;

  final AvatarModel right;

  const AvatarDuo({
    required this.left,
    this.right = const AvatarModel(
      uri: 'https://cdn.omlet.co.uk/images/originals/sleeping_kitten.jpg',
    ),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _renderAvatar(context, left),
        _renderAvatar(context, right),
      ],
    );
  }

  CircleAvatar _renderAvatar(BuildContext context, AvatarModel model) {
    final theme = Theme.of(context);
    return CircleAvatar(
      backgroundColor: theme.backgroundColor,
      radius: model.radius,
      child: CircleAvatar(
        backgroundImage: Image.network(model.uri).image,
      ),
    );
  }
}

class AvatarModel {
  final String uri;
  final double radius;
  const AvatarModel({
    required this.uri,
    this.radius = 30.0,
  });
}
