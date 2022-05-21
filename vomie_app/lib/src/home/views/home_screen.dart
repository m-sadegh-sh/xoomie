import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoomie/src/base/screens/screen_base.dart';
import 'package:zoomie/src/base/widgets/localized_text.dart';
import 'package:zoomie/src/sign_out/bloc/sign_out_bloc.dart';
import 'package:zoomie/src/sign_out/bloc/sign_out_event.dart';
import 'package:zoomie/src/styling/variables.dart';

class HomeScreen extends ScreenBase {
  const HomeScreen({
    super.key,
  });

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
}
