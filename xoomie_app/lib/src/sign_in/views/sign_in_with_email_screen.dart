import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:xoomie/src/base/bloc/localized_error_builder.dart';
import 'package:xoomie/src/base/screens/screen_base.dart';
import 'package:xoomie/src/base/widgets/auto_unfocus.dart';
import 'package:xoomie/src/base/widgets/expanded_single_child_scroll_view.dart';
import 'package:xoomie/src/base/widgets/localized_text.dart';
import 'package:xoomie/src/extensions/function.dart';
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
    final bloc = BlocProvider.of<SignInWithEmailBloc>(context);

    return ExpandedSingleChildScrollView.child(
      child: Padding(
        padding: const EdgeInsets.all(paddingXXLarge),
        child: Column(
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
            const SizedBox(
              height: paddingXXLarge,
            ),
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
            ),
          ],
        ),
      ),
    );
  }
}

class _Form extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SignInWithEmailBloc>(context);

    return BlocListener<SignInWithEmailBloc, SignInWithEmailStateBase>(
      listener: (_, state) {
        ScaffoldMessenger.of(context).clearSnackBars();

        if (state is SignInWithEmailSigningInState) {
          AutoUnfocus.tryToUnfocus(context);
        } else if (state is SignInWithEmailSignInFailedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).errorColor,
              content: LocalizedText(
                state.failureResponse,
              ),
            ),
          );
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
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}
