import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xoomie/src/photos/bloc/photos_event.dart';
import 'package:xoomie/src/photos/bloc/photos_repository.dart';
import 'package:xoomie/src/photos/bloc/photos_state.dart';

class PhotosBloc extends Bloc<PhotosEventBase, PhotosStateBase> {
  final PhotosRepositoryBase repository;
  final String? userId;

  PhotosBloc({
    required this.repository,
    this.userId,
  }) : super(const PhotosInitialState()) {
    on<PhotosLoadEvent>(_onLoad);

    add(PhotosLoadEvent(
      userId: userId,
    ));
  }

  Future<void> _onLoad(
    PhotosLoadEvent event,
    Emitter<PhotosStateBase> emit,
  ) async {
    try {
      emit(const PhotosLoadingState());

      final photos = await repository.load(
        userId: userId,
      );

      emit(PhotosLoadedState(photos));
    } catch (e) {
      emit(PhotosLoadFailedState(
        (x) => 'x.photosBlocLoadFailed',
      ));
    }
  }
}
