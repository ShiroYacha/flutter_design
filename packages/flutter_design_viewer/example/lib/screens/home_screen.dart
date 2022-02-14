import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:ionicons/ionicons.dart';

part 'home_screen.design.dart';

@design
class HomeScreen extends StatelessWidget {
  final Widget body;
  const HomeScreen({
    required this.body,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: body,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Ionicons.add),
      ),
    );
  }
}
