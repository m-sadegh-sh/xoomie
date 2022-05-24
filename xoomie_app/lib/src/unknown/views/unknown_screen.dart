import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xoomie/src/base/screens/screen_base.dart';
import 'package:xoomie/src/base/widgets/expanded_single_child_scroll_view.dart';
import 'package:xoomie/src/base/widgets/localized_text.dart';
import 'package:flutter_gen/assets.gen.dart';
import 'package:xoomie/src/router/bloc/router_bloc.dart';
import 'package:xoomie/src/router/bloc/router_event.dart';
import 'package:xoomie/src/styling/variables.dart';

class UnknownScreen extends ScreenBase {
  const UnknownScreen({
    super.key,
  });

  @override
  Widget buildBody(BuildContext context) {
    return ExpandedSingleChildScrollView.child(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(paddingXXLarge),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LayoutBuilder(
                builder: (_, BoxConstraints constraints) {
                  return SizedBox(
                    height: constraints.maxWidth * 0.75,
                    child: Assets.images.charactersAwkward.svg(),
                  );
                },
              ),
              const SizedBox(
                height: paddingXXLarge,
              ),
              LocalizedText(
                (x) => x.unknownTitle,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: paddingSmall,
              ),
              LocalizedText(
                (x) => x.unknownDescription,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  List<Widget>? persistentFooterButtons(BuildContext context) {
    final bloc = BlocProvider.of<RouterBloc>(context);

    return [
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => bloc.add(
            const RouterResetEvent(),
          ),
          child: LocalizedText(
            (x) => x.unknownStartOver,
          ),
        ),
      ),
    ];
  }
}
