import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:xoomie/src/base/widgets/localized_text.dart';
import 'package:xoomie/src/router/bloc/router_bloc.dart';
import 'package:xoomie/src/router/bloc/router_event.dart';
import 'package:xoomie/src/router/bloc/router_state.dart';
import 'package:xoomie/src/router/models/home_contents.dart';
import 'package:xoomie/src/styling/variables.dart';
import 'package:olive/extensions.dart';

class NavigationItem {
  final IconData icon;
  final GenerateLocalizedString label;
  final HomeContents content;

  bool match(RouterStateBase state) {
    if (state is! RouterHomeState) return false;
    return state.selectedContent == content;
  }

  NavigationItem({
    required this.icon,
    required this.label,
    required this.content,
  });
}

final items = [
  NavigationItem(
    icon: Icons.home,
    label: (x) => x.homeBottomNavigationBarRandom,
    content: HomeContents.random,
  ),
  NavigationItem(
    icon: Icons.search,
    label: (x) => x.homeBottomNavigationBarSearch,
    content: HomeContents.search,
  ),
];

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<RouterBloc>(context);

    return BlocBuilder<RouterBloc, RouterStateBase>(
      builder: (_, state) => BottomNavigationBar(
        currentIndex: items.indexOrNull((x) => x!.match(state)) ?? 0,
        onTap: (int index) => bloc.add(
          RouterGoToHomeEvent(
            selectedContent: items[index].content,
          ),
        ),
        items: items.map((item) {
          return BottomNavigationBarItem(
            icon: _BottomNavigationBarIcon(
              item.icon,
              isSelected: state is RouterHomeState &&
                  state.selectedContent == item.content,
            ),
            label: LocalizedText.get(context, item.label),
          );
        }).toList(),
      ),
    );
  }
}

class _BottomNavigationBarIcon extends StatelessWidget {
  final IconData icon;
  final bool isSelected;

  const _BottomNavigationBarIcon(
    this.icon, {
    this.isSelected = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).bottomNavigationBarTheme;
    final color =
        isSelected ? theme.selectedItemColor : theme.unselectedItemColor;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: isSelected ? theme.selectedItemColor! : Colors.transparent,
            width: 2.0,
          ),
        ),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: paddingXSmall,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: paddingXSmall,
        horizontal: paddingMedium,
      ),
      child: Icon(
        icon,
        color: color,
      ),
    );
  }
}
