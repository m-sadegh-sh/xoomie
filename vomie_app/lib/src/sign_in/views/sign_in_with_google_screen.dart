import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:zoomie/src/base/screens/screen_base.dart';
import 'package:zoomie/src/base/widgets/default_value_switcher.dart';
import 'package:zoomie/src/base/widgets/expanded_single_child_scroll_view.dart';
import 'package:zoomie/src/base/widgets/localized_text.dart';
import 'package:zoomie/src/extensions/function.dart';
import 'package:zoomie/src/sign_in/bloc/sign_in_with_google_bloc.dart';
import 'package:zoomie/src/sign_in/bloc/sign_in_with_google_event.dart';
import 'package:zoomie/src/sign_in/bloc/sign_in_with_google_state.dart';
import 'package:zoomie/src/styling/variables.dart';

class SignInWithGoogleScreen extends ScreenBase {
  const SignInWithGoogleScreen({
    super.key,
  });

  @override
  Widget buildBody(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final bloc = BlocProvider.of<SignInWithGoogleBloc>(context);

    return BlocBuilder<SignInWithGoogleBloc, SignInWithGoogleStateBase>(
      builder: (_, state) => ExpandedSingleChildScrollView(
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
                value: (x) => state is! SignInWithGoogleSignInFailedState
                    ? x.signInWithGoogleScreenSignInFailed
                    : x.signInWithGoogleScreenSigninIn,
                builder: (value) => LocalizedText(
                  value,
                  style: textTheme.bodySmall,
                ),
              ),
              DefaultValueSwitcher<GenerateLocalizedString>(
                value: state is SignInWithGoogleSignInFailedState
                    ? state.message
                    : (x) => '',
                builder: (value) => Container(
                  margin: const EdgeInsets.only(
                    top: paddingMedium,
                  ),
                  padding: const EdgeInsets.all(paddingMedium),
                  decoration: BoxDecoration(
                    color: Theme.of(context).errorColor.withOpacity(0.2),
                    border: Border.all(
                      color: Theme.of(context).errorColor,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(borderRadiusMedium),
                  ),
                  child: LocalizedText(
                    value,
                    style: TextStyle(color: Theme.of(context).errorColor),
                  ),
                ),
              ),
              const SizedBox(
                height: paddingXXLarge,
              ),
              const Spacer(),
              SizedBox(
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
            ],
          ),
        ),
      ),
    );
  }
}
