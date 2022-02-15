import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';

part 'misc.design.dart';

@Design(
  designLink: 'https://www.figma.com/',
  viewerInitValueMap: {
    'uri':
        'https://static.independent.co.uk/2021/06/16/08/newFile-4.jpg?quality=75&width=982&height=726&auto=webp',
  },
)
class Avatar extends StatelessWidget {
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
