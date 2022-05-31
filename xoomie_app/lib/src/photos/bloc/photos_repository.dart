import 'dart:async';
import 'package:xoomie/src/photos/models/photo_model.dart';

abstract class PhotosRepositoryBase {
  Future<List<PhotoModel>> load({
    required String? userId,
  });
}

class UnsplashPhotosRepository extends PhotosRepositoryBase {
  @override
  Future<List<PhotoModel>> load({
    required String? userId,
  }) async {
    return [
      PhotoModel(id: '1'),
    ];
  }
}
