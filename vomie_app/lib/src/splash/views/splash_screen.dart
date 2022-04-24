import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vomie/src/base/screens/screen_base.dart';
import 'package:vomie/src/base/widgets/default_widget_switcher.dart';
import 'package:vomie/src/base/widgets/localized_text.dart';
import 'package:vomie/src/splash/bloc/splash_bloc.dart';
import 'package:vomie/src/splash/bloc/splash_state.dart';
import 'package:vomie/src/styling/variables.dart';
import 'package:flutter_gen/assets.gen.dart';

class SplashScreen extends ScreenBase {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  List<Color> createBackgroundColors(BuildContext context) {
    return [Colors.yellow];
  }

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _SplashLogo(),
        _SplashState(),
      ],
    );
  }
}

class _SplashLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        return SizedBox(
          height: constraints.maxWidth / 1.75,
          child: Assets.images.splashLogo.image(),
        );
      },
    );
  }
}

class _SplashState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashStateBase>(
      builder: (_, state) {
        if (state is SplashInitializingState) {
          return _SplashContent(
            message: state.message,
          );
        }

        if (state is SplashInitializedState) {
          return _SplashContent(
            message: (x) => '',
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
    );
  }
}

class _SplashContent extends StatefulWidget {
  final GenerateLocalizedString? message;
  final bool failed;

  const _SplashContent({
    this.message,
    this.failed = false,
    Key? key,
  }) : super(key: key);

  @override
  _SplashContentState createState() => _SplashContentState();
}

class _SplashContentState extends State<_SplashContent> {
  GenerateLocalizedString? firstMessage;
  GenerateLocalizedString? secondMessage;

  @override
  void initState() {
    super.initState();
    setState(() => firstMessage = widget.message);
  }

  @override
  void didUpdateWidget(covariant _SplashContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      if (firstMessage == null) {
        firstMessage = widget.message;
        secondMessage = null;
      } else {
        firstMessage = null;
        secondMessage = widget.message;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultWidgetSwitcher(
      showPrimary: firstMessage != null,
      primary: _SplashText(
        firstMessage,
        failed: widget.failed,
      ),
      secondary: _SplashText(
        secondMessage,
        failed: widget.failed,
      ),
    );
  }
}

class _SplashText extends StatelessWidget {
  final GenerateLocalizedString? text;
  final bool failed;

  const _SplashText(
    this.text, {
    required this.failed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.all(paddingMedium),
      padding: const EdgeInsets.all(paddingMedium),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadiusMedium),
        color: failed ? theme.errorColor : null,
      ),
      child: LocalizedText(
        text,
        style: theme.textTheme.subtitle2!.copyWith(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
