import 'package:dsc_flutter/provider_cart/product/manager/shop/shop_manager.dart';
import 'package:dsc_flutter/provider_cart/product/widgets/photo_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class BasketView extends StatelessWidget {
  const BasketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: context.watch<ShopManager>().shopPhotoItems.isEmpty?Center(child: Text("Basket is Empty")):buildListView(context),
    );
  }

  ListView buildListView(BuildContext context) {
    return ListView.builder(
    itemCount: context.watch<ShopManager>().shopPhotoItems.length,
    itemBuilder: ((context, index) {
     return PhotoCard(modal: context.watch<ShopManager>().shopPhotoItems[index]);
   }));
  }
}
