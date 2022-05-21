import 'package:equatable/equatable.dart';

abstract class StateBase extends Equatable {
  const StateBase();

  @override
  List<Object?> get props => [];

  @override
  String toString();
}
