import 'package:kiwi/kiwi.dart';

KiwiContainer _container = KiwiContainer();

void registerSingleton<S>(Factory<S> factory) {
  _container.registerSingleton(factory);
}

void registerFactory<S>(Factory<S> factory) {
  _container.registerFactory(factory);
}

S resolve<S>() => _container.resolve<S>();
