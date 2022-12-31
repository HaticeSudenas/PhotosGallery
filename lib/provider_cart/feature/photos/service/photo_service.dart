import 'package:dsc_flutter/provider_cart/feature/photos/model/photos_modal.dart';
import 'package:dsc_flutter/provider_cart/feature/photos/service/IPhotosService.dart';

part './photo_service_path.dart';
class PhotosService extends IPhotoService{
  PhotosService(super.dio);

  @override
  Future<List<PhotosModal>> fetchAllModal() async {
    final response=await dio.get(_PhotoServicePath.PHOTOS.rawValue);
    if(response.statusCode==200){
      final data=response.data;
      if(data is List){
        return data.map((e) => PhotosModal.fromJson(e)).toList();
      }
      return [];
    }
    throw UnimplementedError();
  }

}