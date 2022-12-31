import 'package:dio/dio.dart';
import 'package:dsc_flutter/provider_cart/feature/photos/model/photos_modal.dart';

abstract class IPhotoService{
  final Dio dio;

  IPhotoService(this.dio);
 Future<List<PhotosModal>> fetchAllModal();
}