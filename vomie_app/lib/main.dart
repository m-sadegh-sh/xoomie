import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vomie/src/app.dart';
import 'package:vomie/src/base/bloc/app_bloc_observer.dart';
import 'package:vomie/src/injection/root_services_registerar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  registerRootServices();

  BlocOverrides.runZoned(
    () => runApp(const App()),
    blocObserver: AppBlocObserver(),
  );
}
