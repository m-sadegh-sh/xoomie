import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:xoomie/src/base/screens/screen_base.dart';
import 'package:xoomie/src/base/widgets/default_value_switcher.dart';
import 'package:xoomie/src/base/widgets/expanded_single_child_scroll_view.dart';
import 'package:xoomie/src/base/widgets/localized_text.dart';
import 'package:xoomie/src/base/widgets/message_box.dart';
import 'package:xoomie/src/extensions/generic.dart';
import 'package:xoomie/src/sign_in/bloc/sign_in_with_google_bloc.dart';
import 'package:xoomie/src/sign_in/bloc/sign_in_with_google_event.dart';
import 'package:xoomie/src/sign_in/bloc/sign_in_with_google_state.dart';
import 'package:xoomie/src/styling/variables.dart';

class SignInWithGoogleScreen extends ScreenBase {
  const SignInWithGoogleScreen({
    super.key,
  });

  @override
  Widget buildBody(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return BlocBuilder<SignInWithGoogleBloc, SignInWithGoogleStateBase>(
      builder: (_, state) {
        final isFailed = state is SignInWithGoogleSignInFailedState;

        return ExpandedSingleChildScrollView(
          builder: (context, constraints) => Padding(
            padding: const EdgeInsets.all(paddingXXLarge),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LocalizedText(
                  (x) => x.signInWithGoogleScreenTitle,
                  style: textTheme.titleLarge,
                ),
                const SizedBox(
                  height: paddingXSmall,
                ),
                DefaultValueSwitcher<GenerateLocalizedString>(
                  value: (x) => isFailed
                      ? x.signInWithGoogleScreenSignInFailed
                      : x.signInWithGoogleScreenSigninIn,
                  builder: (value) => SizedBox(
                    width: double.infinity,
                    child: LocalizedText(
                      value,
                      style: textTheme.bodySmall,
                    ),
                  ),
                ),
                DefaultValueSwitcher<GenerateLocalizedString>(
                  value: isFailed ? state.message : (x) => '',
                  builder: (value) => MessageBox.error(
                    margin: const EdgeInsets.only(
                      top: paddingMedium,
                    ),
                    message: value,
                  ).when(condition: isFailed),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  List<Widget>? persistentFooterButtons(BuildContext context) {
    final bloc = BlocProvider.of<SignInWithGoogleBloc>(context);

    return [
      BlocBuilder<SignInWithGoogleBloc, SignInWithGoogleStateBase>(
        builder: (context, state) => SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              bloc.add(const SignInWithGoogleSignInEvent());
            }.when(
              condition: state is! SignInWithGoogleSigningInState,
            ),
            child: state is SignInWithGoogleSigningInState
                ? const SizedBox.square(
                    dimension: iconSizeSmall,
                    child: CircularProgressIndicator(
                      strokeWidth: strokeWidthSmall,
                    ),
                  )
                : LocalizedText(
                    (x) => x.signInWithGoogleScreenRetry,
                  ),
          ),
        ),
      ),
    ];
  }
}
