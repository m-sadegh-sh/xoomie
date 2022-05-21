import 'package:flutter/material.dart';

abstract class ScreenBase extends StatelessWidget {
  const ScreenBase({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SafeArea(
        child: buildBody(context),
      ),
      bottomNavigationBar: bottomNavigationBar(context),
      bottomSheet: bottomSheet(context),
    );
  }

  PreferredSizeWidget? appBar(BuildContext context) {
    final title = appBarTitle(context);
    final canPop = Navigator.of(context).canPop();

    if (title == null && !canPop) return null;

    return AppBar(
      title: title,
    );
  }

  Widget? appBarTitle(BuildContext context) => null;

  Widget? bottomNavigationBar(BuildContext context) => null;

  Widget? bottomSheet(BuildContext context) => null;

  Widget buildBody(BuildContext context);
}
