import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:xoomie/src/base/screens/screen_base.dart';
import 'package:xoomie/src/base/widgets/default_transition_switcher.dart';
import 'package:xoomie/src/base/widgets/localized_text.dart';
import 'package:xoomie/src/base/widgets/region.dart';
import 'package:xoomie/src/home/widgets/home_bottom_navigation_bar.dart';
import 'package:xoomie/src/photos/models/photo_group_model.dart';
import 'package:xoomie/src/photos/models/photo_model.dart';
import 'package:xoomie/src/router/bloc/router_bloc.dart';
import 'package:xoomie/src/router/bloc/router_state.dart';
import 'package:xoomie/src/router/models/home_contents.dart';
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
        duration: animationDurationShort,
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
          (x) => x.homeScreenRandomTitle,
          key: const ValueKey('random'),
        );
      case HomeContents.search:
        return LocalizedText(
          (x) => x.homeScreenSearchTitle,
          key: const ValueKey('search'),
        );
    }
  }

  @override
  Widget buildBody(BuildContext context) {
    return BlocBuilder<RouterBloc, RouterStateBase>(
      builder: (_, state) => DefaultTransitionSwitcher(
        transitionType: SharedAxisTransitionType.horizontal,
        child: _buildContent(state),
      ),
    );
  }

  Widget _buildContent(RouterStateBase state) {
    if (state is! RouterHomeState) {
      return Container();
    }

    switch (state.selectedContent) {
      case HomeContents.random:
        return _HomeRandom();
      case HomeContents.search:
        return _HomeSearch();
    }
  }

  @override
  Widget? bottomNavigationBar(BuildContext context) =>
      const HomeBottomNavigationBar();
}

final groups = [
  PhotoGroupModel(
    date: DateTime(2022, 06, 01),
    photos: [
      PhotoModel(id: '1'),
      PhotoModel(id: '2'),
      PhotoModel(id: '3'),
      PhotoModel(id: '4'),
      PhotoModel(id: '5'),
      PhotoModel(id: '6'),
    ],
  ),
  PhotoGroupModel(
    date: DateTime(2022, 05, 29),
    photos: [
      PhotoModel(id: '1'),
      PhotoModel(id: '2'),
      PhotoModel(id: '3'),
      PhotoModel(id: '4'),
      PhotoModel(id: '5'),
      PhotoModel(id: '6'),
    ],
  ),
  PhotoGroupModel(
    date: DateTime(2022, 05, 25),
    photos: [
      PhotoModel(id: '1'),
      PhotoModel(id: '2'),
      PhotoModel(id: '3'),
      PhotoModel(id: '4'),
      PhotoModel(id: '5'),
      PhotoModel(id: '6'),
    ],
  ),
  PhotoGroupModel(
    date: DateTime(2022, 05, 12),
    photos: [
      PhotoModel(id: '1'),
      PhotoModel(id: '2'),
      PhotoModel(id: '3'),
      PhotoModel(id: '4'),
      PhotoModel(id: '5'),
      PhotoModel(id: '6'),
    ],
  ),
  PhotoGroupModel(
    date: DateTime(2022, 04, 29),
    photos: [
      PhotoModel(id: '1'),
      PhotoModel(id: '2'),
      PhotoModel(id: '3'),
      PhotoModel(id: '4'),
      PhotoModel(id: '5'),
      PhotoModel(id: '6'),
    ],
  ),
];

class _HomeRandom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(paddingXLarge),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LocalizedText(
                (x) => x.homeRandomPhotosTitle,
                style: textTheme.titleLarge,
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Icon(
                  Icons.sort,
                  size: iconSizeMedium,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: paddingSmall,
          ),
          LocalizedText(
            (x) => x.homeRandomPhotosDescription,
            style: textTheme.bodyMedium,
          ),
          const SizedBox(
            height: paddingSmall,
          ),
          Expanded(
            child: _PhotoGroupList(
              key: const ValueKey("randomPhotos"),
              groups: groups,
            ),
          ),
        ],
      ),
    );
  }
}

class _PhotoGroupList extends StatelessWidget {
  final List<PhotoGroupModel> groups;

  const _PhotoGroupList({
    required this.groups,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: groups.length,
      itemBuilder: (context, index) {
        final group = groups[index];

        return _PhotoGroup(
          key: ValueKey(group.date),
          group: group,
        );
      },
    );
  }
}

class _PhotoGroup extends StatelessWidget {
  final PhotoGroupModel group;

  const _PhotoGroup({
    required this.group,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Region.text(
          text: DateFormat.MMMEd().format(group.date),
          style: textTheme.bodySmall,
        ),
        _PhotoList(
          key: ValueKey(group.date),
          photos: group.photos,
        ),
      ],
    );
  }
}

class _PhotoList extends StatelessWidget {
  final List<PhotoModel> photos;

  const _PhotoList({
    required this.photos,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: photos.length,
      itemBuilder: (context, index) {
        final photo = photos[index];

        return _PhotoItem(
          key: ValueKey(photo.id),
          photo: photo,
        );
      },
    );
  }
}

class _PhotoItem extends StatelessWidget {
  final PhotoModel photo;

  const _PhotoItem({
    required this.photo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(photo.id);
  }
}

class _HomeSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Text("Search"),
      ],
    );
  }
}
