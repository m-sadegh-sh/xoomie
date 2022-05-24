import 'package:flutter/material.dart';

abstract class ScreenBase extends StatelessWidget {
  const ScreenBase({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: appBar(context),
      body: SafeArea(
        child: Scaffold(
          primary: false,
          body: buildBody(context),
          persistentFooterButtons: persistentFooterButtons(context),
        ),
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

  Widget buildBody(BuildContext context);

  List<Widget>? persistentFooterButtons(BuildContext context) => null;

  Widget? bottomNavigationBar(BuildContext context) => null;

  Widget? bottomSheet(BuildContext context) => null;
}
