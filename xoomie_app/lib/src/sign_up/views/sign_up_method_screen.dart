import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xoomie/src/base/screens/screen_base.dart';
import 'package:xoomie/src/base/widgets/expanded_single_child_scroll_view.dart';
import 'package:xoomie/src/base/widgets/footer_links.dart';
import 'package:xoomie/src/base/widgets/localized_text.dart';
import 'package:xoomie/src/router/bloc/router_bloc.dart';
import 'package:xoomie/src/router/bloc/router_event.dart';
import 'package:xoomie/src/styling/variables.dart';
import 'package:flutter_gen/assets.gen.dart';

class SignUpMethodScreen extends ScreenBase {
  const SignUpMethodScreen({
    super.key,
  });

  @override
  Widget buildBody(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final routerBloc = BlocProvider.of<RouterBloc>(context);

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
                    height: constraints.maxWidth * 0.4,
                    child: Assets.images.appLogo.svg(),
                  );
                },
              ),
              const SizedBox(
                height: paddingXXLarge,
              ),
              LocalizedText(
                (x) => x.signUpMethodScreenTitle,
                style: textTheme.titleSmall,
              ),
              const SizedBox(
                height: paddingXLarge,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: LocalizedText(
                    (x) => x.signUpMethodScreenContinueWithEmail,
                  ),
                  onPressed: () => routerBloc.add(
                    const RouterGoToSignUpWithEmailEvent(),
                  ),
                ),
              ),
              const SizedBox(
                height: paddingXXLarge,
              ),
              const FooterLinks(),
            ],
          ),
        ),
      ),
    );
  }
}
