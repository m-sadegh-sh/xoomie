import 'package:xoomie/src/base/models/model_base.dart';
import 'package:xoomie/src/photos/models/photo_model.dart';

class PhotoGroupModel extends ModelBase {
  final DateTime date;
  final List<PhotoModel> photos;

  PhotoGroupModel({
    required this.date,
    required this.photos,
  });

  @override
  List<Object?> get props => [date, photos];
}
