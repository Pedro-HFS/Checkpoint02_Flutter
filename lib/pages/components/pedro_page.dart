import 'package:flutter/material.dart';
import '../../utils/paddings.dart';

class PedroPage extends StatelessWidget {
  final String title;
  final Widget body;
  final FloatingActionButton fab;

  PedroPage({required this.title, required this.body, required this.fab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: fab,
      body: Padding(
        padding: EdgeInsets.only(
          left: AppPaddings.borderPadding,
          right: AppPaddings.borderPadding,
          top: AppPaddings.topPadding,
        ),
        child: SingleChildScrollView(child: body),
      ),
    );
  }
}
