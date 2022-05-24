import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:xoomie/src/base/bloc/localized_error_builder.dart';
import 'package:xoomie/src/base/screens/screen_base.dart';
import 'package:xoomie/src/base/widgets/auto_unfocus.dart';
import 'package:xoomie/src/base/widgets/default_value_switcher.dart';
import 'package:xoomie/src/base/widgets/expanded_single_child_scroll_view.dart';
import 'package:xoomie/src/base/widgets/localized_text.dart';
import 'package:xoomie/src/base/widgets/message_box.dart';
import 'package:xoomie/src/extensions/generic.dart';
import 'package:xoomie/src/sign_in/bloc/sign_in_with_email_bloc.dart';
import 'package:xoomie/src/sign_in/bloc/sign_in_with_email_state.dart';
import 'package:xoomie/src/styling/variables.dart';

class SignInWithEmailScreen extends ScreenBase {
  const SignInWithEmailScreen({
    super.key,
  });

  @override
  Widget buildBody(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return ExpandedSingleChildScrollView.child(
      child: Padding(
        padding: const EdgeInsets.all(paddingXXLarge),
        child: BlocBuilder<SignInWithEmailBloc, SignInWithEmailStateBase>(
          builder: (context, state) {
            final isFailed = state is SignInWithEmailSignInFailedState;

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LocalizedText(
                  (x) => x.signInWithEmailScreenTitle,
                  style: textTheme.titleLarge,
                ),
                const SizedBox(
                  height: paddingXSmall,
                ),
                LocalizedText(
                  (x) => x.signInWithEmailScreenDescription,
                  style: textTheme.bodySmall,
                ),
                const SizedBox(
                  height: paddingLarge,
                ),
                _Form(),
                DefaultValueSwitcher<GenerateLocalizedString>(
                  value: isFailed ? state.failureResponse : (x) => '',
                  builder: (value) => MessageBox.error(
                    margin: const EdgeInsets.only(
                      top: paddingMedium,
                    ),
                    message: value,
                  ).when(condition: isFailed),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  List<Widget>? persistentFooterButtons(BuildContext context) {
    final bloc = BlocProvider.of<SignInWithEmailBloc>(context);

    return [
      BlocBuilder<SignInWithEmailBloc, SignInWithEmailStateBase>(
        builder: (context, state) => SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: bloc.submit.when(
              condition: state is! SignInWithEmailSigningInState,
            ),
            child: state is SignInWithEmailSigningInState
                ? const SizedBox.square(
                    dimension: iconSizeSmall,
                    child: CircularProgressIndicator(
                      strokeWidth: strokeWidthSmall,
                    ),
                  )
                : LocalizedText(
                    (x) => x.signInWithEmailScreenSignIn,
                  ),
          ),
        ),
      )
    ];
  }
}

class _Form extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SignInWithEmailBloc>(context);

    return BlocListener<SignInWithEmailBloc, SignInWithEmailStateBase>(
      listener: (_, state) {
        if (state is SignInWithEmailSigningInState) {
          AutoUnfocus.tryToUnfocus(context);
        }
      },
      child: BlocBuilder<SignInWithEmailBloc, SignInWithEmailStateBase>(
        builder: (context, state) => Column(
          children: [
            TextFieldBlocBuilder(
              textFieldBloc: bloc.emailField,
              textInputAction: TextInputAction.next,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              errorBuilder: localizedErrorBuilder,
              decoration: InputDecoration(
                label: LocalizedText(
                  (x) => x.signInWithEmailScreenEmail,
                ),
              ),
              isEnabled: state is! SignInWithEmailSigningInState,
            ),
            TextFieldBlocBuilder(
              textFieldBloc: bloc.passwordField,
              textInputAction: TextInputAction.done,
              autocorrect: false,
              keyboardType: TextInputType.text,
              errorBuilder: localizedErrorBuilder,
              decoration: InputDecoration(
                label: LocalizedText(
                  (x) => x.signInWithEmailScreenPassword,
                ),
              ),
              isEnabled: state is! SignInWithEmailSigningInState,
              onSubmitted: (_) => bloc.submit(),
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}
