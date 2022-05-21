import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olive/extensions.dart';
import 'package:zoomie/src/base/screens/screen_base.dart';
import 'package:zoomie/src/base/widgets/expanded_single_child_scroll_view.dart';
import 'package:zoomie/src/base/widgets/localized_text.dart';
import 'package:zoomie/src/router/bloc/router_bloc.dart';
import 'package:zoomie/src/router/bloc/router_event.dart';
import 'package:zoomie/src/styling/color_palette.dart';
import 'package:zoomie/src/styling/variables.dart';
import 'package:introduction_screen/introduction_screen.dart' as intro;
import 'package:flutter_gen/assets.gen.dart';

class IntroductionScreen extends ScreenBase {
  const IntroductionScreen({
    super.key,
  });

  @override
  Widget buildBody(BuildContext context) {
    final routerBloc = BlocProvider.of<RouterBloc>(context);

    return ExpandedSingleChildScrollView(
      builder: (_, constraints) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: paddingXXLarge,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: (constraints.maxHeight * 0.65).limitMin(580),
                  minHeight: 580,
                ),
                child: _Introduction(),
              ),
              const SizedBox(
                height: paddingXLarge,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: paddingXLarge,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      child: LocalizedText(
                        (x) => x.introductionScreenSignUp,
                      ),
                      onPressed: () => routerBloc.add(
                        const RouterGoToSignUpMethodEvent(),
                      ),
                    ),
                    const SizedBox(
                      height: paddingMedium,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LocalizedText(
                          (x) => x.introductionScreenExistingAccount,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(
                          width: paddingXSmall,
                        ),
                        TextButton(
                          child: LocalizedText(
                            (x) => x.introductionScreenSignIn,
                          ),
                          onPressed: () => routerBloc.add(
                            const RouterGoToSignInMethodEvent(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Introduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return intro.IntroductionScreen(
      pages: [
        _createPage(
          context: context,
          imageAsset: Assets.images.introductionSlide1,
          title: (x) => x.introductionScreenSlide1Title,
          body: (x) => x.introductionScreenSlide1mBody,
        ),
        _createPage(
          context: context,
          imageAsset: Assets.images.introductionSlide2,
          title: (x) => x.introductionScreenSlide2Title,
          body: (x) => x.introductionScreenSlide2Body,
        ),
        _createPage(
          context: context,
          imageAsset: Assets.images.introductionSlide3,
          title: (x) => x.introductionScreenSlide3Title,
          body: (x) => x.introductionScreenSlide3Body,
        ),
      ],
      showNextButton: false,
      showDoneButton: false,
      dotsDecorator: const intro.DotsDecorator(
        color: lightGrey2Color,
        activeColor: brandColor,
      ),
    );
  }

  intro.PageViewModel _createPage({
    required BuildContext context,
    required AssetGenImage imageAsset,
    required GenerateLocalizedString title,
    required GenerateLocalizedString body,
  }) {
    final textTheme = Theme.of(context).textTheme;

    return intro.PageViewModel(
      useScrollView: false,
      image: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadiusMedium),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: imageAsset.image(),
      ),
      title: LocalizedText.get(context, title),
      body: LocalizedText.get(context, body),
      decoration: intro.PageDecoration(
        imageFlex: 2,
        imagePadding: const EdgeInsets.only(
          bottom: paddingMedium,
        ),
        titleTextStyle: textTheme.bodyLarge!,
        titlePadding: const EdgeInsets.only(
          bottom: paddingMedium,
        ),
        bodyTextStyle: textTheme.bodyMedium!,
        bodyPadding: const EdgeInsets.symmetric(
          horizontal: paddingXXXLarge,
        ),
      ),
    );
  }
}
