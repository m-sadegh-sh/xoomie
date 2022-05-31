import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xoomie/src/base/screens/screen_base.dart';
import 'package:xoomie/src/base/widgets/default_transition_switcher.dart';
import 'package:xoomie/src/base/widgets/localized_text.dart';
import 'package:xoomie/src/home/widgets/home_bottom_navigation_bar.dart';
import 'package:xoomie/src/router/bloc/router_bloc.dart';
import 'package:xoomie/src/router/bloc/router_state.dart';
import 'package:xoomie/src/router/models/home_contents.dart';
import 'package:xoomie/src/sign_out/bloc/sign_out_bloc.dart';
import 'package:xoomie/src/sign_out/bloc/sign_out_event.dart';
import 'package:xoomie/src/styling/variables.dart';

class HomeScreen extends ScreenBase {
  const HomeScreen({
    super.key,
  });

  @override
  Widget? appBarTitle(BuildContext context) {
    return BlocBuilder<RouterBloc, RouterStateBase>(
      builder: (_, state) => DefaultTransitionSwitcher(
        transitionType: SharedAxisTransitionType.horizontal,
        child: _buildTitle(state),
      ),
    );
  }

  Widget _buildTitle(RouterStateBase state) {
    if (state is! RouterHomeState) {
      return Container();
    }

    switch (state.selectedContent) {
      case HomeContents.random:
        return LocalizedText(
          (x) => x.homeActiveContentRandom,
          key: const ValueKey('random'),
        );
      case HomeContents.search:
        return LocalizedText(
          (x) => x.homeActiveContentSearch,
          key: const ValueKey('search'),
        );
    }
  }

  @override
  Widget buildBody(BuildContext context) {
    final signOutBloc = BlocProvider.of<SignOutBloc>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'HOME',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: paddingSmall,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            child: LocalizedText(
              (x) => 'Sign out',
            ),
            onPressed: () => signOutBloc.add(const SignOutSignOutEvent()),
          ),
        ),
      ],
    );
  }

  @override
  Widget? bottomNavigationBar(BuildContext context) =>
      const HomeBottomNavigationBar();
}
