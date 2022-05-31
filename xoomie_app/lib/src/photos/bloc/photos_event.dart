import 'package:xoomie/src/base/bloc/event_base.dart';

abstract class PhotosEventBase extends EventBase {
  const PhotosEventBase();
}

class PhotosLoadEvent extends PhotosEventBase {
  final String? userId;

  const PhotosLoadEvent({
    this.userId,
  });

  @override
  List<Object?> get props => [userId];
}
