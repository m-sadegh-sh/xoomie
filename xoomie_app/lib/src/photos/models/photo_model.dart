import 'package:xoomie/src/base/models/model_base.dart';

class PhotoModel extends ModelBase {
  final String id;

  PhotoModel({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
