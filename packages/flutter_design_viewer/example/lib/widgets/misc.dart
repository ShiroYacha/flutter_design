import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';

part 'misc.design.dart';

@Design(
  designLink: 'https://www.figma.com/',
)
class Avatar extends StatelessWidget {
  @DesignField(
      parameter:
          'https://www.ladbible.com/cdn-cgi/image/width=720,quality=70,format=jpeg,fit=pad,dpr=1/https%3A%2F%2Fs3-images.ladbible.com%2Fs3%2Fcontent%2Fdc3138d56184d0490ddcc02c5e8a3b7a.png')
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
class AvatarV2 extends StatelessWidget {
  @DesignField()
  final AvatarModel model;

  const AvatarV2({
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
