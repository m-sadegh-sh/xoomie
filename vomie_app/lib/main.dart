import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zoomie/firebase_options.dart';
import 'package:zoomie/src/app/views/app_container.dart';
import 'package:zoomie/src/base/bloc/app_bloc_observer.dart';
import 'package:zoomie/src/injection/root_services_registerar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  registerRootServices();

  EquatableConfig.stringify = true;

  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  BlocOverrides.runZoned(
    () => HydratedBlocOverrides.runZoned(
      () => runApp(const AppContainer()),
      storage: storage,
    ),
    blocObserver: AppBlocObserver(),
  );
}
