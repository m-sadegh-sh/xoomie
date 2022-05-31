import 'package:xoomie/src/base/bloc/state_base.dart';
import 'package:xoomie/src/base/widgets/localized_text.dart';
import 'package:xoomie/src/photos/models/photo_model.dart';

abstract class PhotosStateBase extends StateBase {
  const PhotosStateBase();
}

class PhotosInitialState extends PhotosStateBase {
  const PhotosInitialState();
}

class PhotosLoadingState extends PhotosStateBase {
  const PhotosLoadingState();
}

class PhotosLoadedState extends PhotosStateBase {
  final List<PhotoModel> photos;

  const PhotosLoadedState(this.photos);

  @override
  List<Object?> get props => [photos];
}

class PhotosLoadFailedState extends PhotosStateBase {
  final GenerateLocalizedString? message;

  const PhotosLoadFailedState(this.message);

  @override
  List<Object?> get props => [message];
}
