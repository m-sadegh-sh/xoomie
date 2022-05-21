import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xoomie/src/base/screens/screen_base.dart';
import 'package:xoomie/src/base/widgets/default_value_switcher.dart';
import 'package:xoomie/src/base/widgets/localized_text.dart';
import 'package:xoomie/src/extensions/generic.dart';
import 'package:xoomie/src/splash/bloc/splash_bloc.dart';
import 'package:xoomie/src/splash/bloc/splash_state.dart';
import 'package:xoomie/src/styling/variables.dart';
import 'package:flutter_gen/assets.gen.dart';

class SplashScreen extends ScreenBase {
  const SplashScreen({
    super.key,
  });

  @override
  Widget buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(paddingLarge),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _SplashLogo(),
          _SplashState(),
        ],
      ),
    );
  }
}

class _SplashLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: LayoutBuilder(
          builder: (_, BoxConstraints constraints) {
            return SizedBox(
              height: constraints.maxWidth * 0.5,
              child: Assets.images.splashLogo.image(),
            );
          },
        ),
      ),
    );
  }
}

class _SplashState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: BlocBuilder<SplashBloc, SplashStateBase>(
        builder: (_, state) {
          if (state is SplashInitializingState) {
            return _SplashContent(
              message: state.message,
            );
          }

          if (state is SplashInitializedState) {
            return _SplashContent(
              message: (x) => x.splashScreenInitialized,
            );
          }

          if (state is SplashInitializationFailedState) {
            return _SplashContent(
              message: state.message,
              failed: true,
            );
          }

          return _SplashContent(
            message: (x) => x.commonWaiting,
          );
        },
      ),
    );
  }
}

class _SplashContent extends StatelessWidget {
  final GenerateLocalizedString? message;
  final bool failed;

  const _SplashContent({
    this.message,
    this.failed = false,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultValueSwitcher<GenerateLocalizedString>(
      value: message,
      builder: (value) => _SplashText(
        text: value,
        failed: failed,
      ),
    );
  }
}

class _SplashText extends StatelessWidget {
  final GenerateLocalizedString? text;
  final bool failed;

  const _SplashText({
    required this.text,
    required this.failed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.all(paddingMedium),
      padding: const EdgeInsets.all(paddingMedium),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadiusMedium),
        color: theme.errorColor.when(
          condition: failed,
        ),
      ),
      child: LocalizedText(
        text,
        style: theme.textTheme.labelSmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
