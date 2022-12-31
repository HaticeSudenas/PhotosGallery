import 'package:dsc_flutter/provider_cart/feature/photos/model/photos_modal.dart';
import 'package:flutter/cupertino.dart';

class ShopManager extends ChangeNotifier{
  List<PhotosModal> shopPhotoItems =[];
  double totalMoney=0;
  void sumtTotalMoney(){
    totalMoney=shopPhotoItems.fold(0, (previousValue, element) => previousValue+element.count*element.price);
    notifyListeners();
  }
  void addShopItem(PhotosModal modal){
    modal.count++;
    shopPhotoItems.add(modal);
    sumtTotalMoney();
    notifyListeners();
  }
  void removeShopItem(PhotosModal modal){
    modal.count=0;
    shopPhotoItems.remove(modal);
    sumtTotalMoney();
    notifyListeners();
  }
  void incrementItem(PhotosModal modal){
    if(!shopPhotoItems.contains(modal)){
      print("object");
    }
    else{
      shopPhotoItems.singleWhere((element) => element.id==modal.id).count++;
    }
    sumtTotalMoney();
    notifyListeners();
  }
  void deIncrementItem(PhotosModal modal){
    if(!shopPhotoItems.contains(modal)){
      print("object");
    }
    else{
      shopPhotoItems.singleWhere((element) => element.id==modal.id).count--;
    }
    sumtTotalMoney();
    notifyListeners();
  }
}