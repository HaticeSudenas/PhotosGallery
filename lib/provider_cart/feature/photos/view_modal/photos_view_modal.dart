import 'package:dio/dio.dart';
import 'package:dsc_flutter/provider_cart/core/network/application_constant.dart';
import 'package:dsc_flutter/provider_cart/feature/photos/model/photos_modal.dart';
import 'package:dsc_flutter/provider_cart/feature/photos/service/IPhotosService.dart';
import 'package:dsc_flutter/provider_cart/feature/photos/service/photo_service.dart';
import 'package:mobx/mobx.dart';
part 'photos_view_modal.g.dart';
class PhotosViewModal=_PhotosViewModalBase with _$PhotosViewModal;
abstract class _PhotosViewModalBase with Store{
  late final IPhotoService photoService;
  final Dio _dio= Dio(BaseOptions(baseUrl: ApplicationConstant.instance.baseUrl));
  @observable
  List<PhotosModal> photos=[];
  @observable
  bool isLoading=false;

  _PhotosViewModalBase(){
    photoService=PhotosService(_dio);
    fetchAllPhotos();
  }
  @action
  Future<void> fetchAllPhotos()async{
    changeLoading();
    final response=await photoService.fetchAllModal();
    changeLoading();
    photos=response;
  }
  @action
  void changeLoading(){
    isLoading=!isLoading;
  }
}