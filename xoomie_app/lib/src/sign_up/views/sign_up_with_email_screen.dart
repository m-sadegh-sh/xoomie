import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:xoomie/src/base/bloc/localized_error_builder.dart';
import 'package:xoomie/src/base/screens/screen_base.dart';
import 'package:xoomie/src/base/widgets/auto_unfocus.dart';
import 'package:xoomie/src/base/widgets/expanded_single_child_scroll_view.dart';
import 'package:xoomie/src/base/widgets/localized_text.dart';
import 'package:xoomie/src/extensions/function.dart';
import 'package:xoomie/src/sign_up/bloc/sign_up_with_email_bloc.dart';
import 'package:xoomie/src/sign_up/bloc/sign_up_with_email_state.dart';
import 'package:xoomie/src/styling/variables.dart';

class SignUpWithEmailScreen extends ScreenBase {
  const SignUpWithEmailScreen({
    super.key,
  });

  @override
  Widget buildBody(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final bloc = BlocProvider.of<SignUpWithEmailBloc>(context);

    return ExpandedSingleChildScrollView.child(
      child: Padding(
        padding: const EdgeInsets.all(paddingXXLarge),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LocalizedText(
              (x) => x.signUpWithEmailScreenTitle,
              style: textTheme.titleLarge,
            ),
            const SizedBox(
              height: paddingXSmall,
            ),
            LocalizedText(
              (x) => x.signUpWithEmailScreenDescription,
              style: textTheme.bodySmall,
            ),
            const SizedBox(
              height: paddingLarge,
            ),
            _Form(),
            const SizedBox(
              height: paddingXXLarge,
            ),
            BlocBuilder<SignUpWithEmailBloc, SignUpWithEmailStateBase>(
              builder: (context, state) => SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: bloc.submit.when(
                    condition: state is! SignUpWithEmailSigningUpState,
                  ),
                  child: state is SignUpWithEmailSigningUpState
                      ? const SizedBox.square(
                          dimension: iconSizeSmall,
                          child: CircularProgressIndicator(
                            strokeWidth: strokeWidthSmall,
                          ),
                        )
                      : LocalizedText(
                          (x) => x.signUpWithEmailScreenSignUp,
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
    final bloc = BlocProvider.of<SignUpWithEmailBloc>(context);

    return BlocListener<SignUpWithEmailBloc, SignUpWithEmailStateBase>(
      listener: (_, state) {
        ScaffoldMessenger.of(context).clearSnackBars();

        if (state is SignUpWithEmailSigningUpState) {
          AutoUnfocus.tryToUnfocus(context);
        } else if (state is SignUpWithEmailSignUpFailedState) {
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
      child: BlocBuilder<SignUpWithEmailBloc, SignUpWithEmailStateBase>(
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
                  (x) => x.signUpWithEmailScreenEmail,
                ),
              ),
              isEnabled: state is! SignUpWithEmailSigningUpState,
            ),
            TextFieldBlocBuilder(
              textFieldBloc: bloc.passwordField,
              textInputAction: TextInputAction.done,
              autocorrect: false,
              keyboardType: TextInputType.text,
              errorBuilder: localizedErrorBuilder,
              decoration: InputDecoration(
                label: LocalizedText(
                  (x) => x.signUpWithEmailScreenPassword,
                ),
              ),
              isEnabled: state is! SignUpWithEmailSigningUpState,
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}
