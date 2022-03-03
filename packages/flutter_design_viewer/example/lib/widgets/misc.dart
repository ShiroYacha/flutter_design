import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';

part 'misc.design.dart';

@Design(
  designLink: 'https://www.figma.com/',
)
class Avatar extends StatelessWidget {
  @DesignField(
    initialValue: 'https://example.com',
    parameter: DataTemplateStringLoremParameter(
      length: 15,
    ),
  )
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
      ),
    );
  }
}

class AvatarModel {
  final String? uri;
  final String? name;
  const AvatarModel({
    this.uri,
    this.name,
  }) : assert(uri != null || name != null);
}
