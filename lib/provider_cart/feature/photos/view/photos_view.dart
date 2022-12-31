import 'package:dsc_flutter/provider_cart/feature/photos/view_modal/photos_view_modal.dart';
import 'package:dsc_flutter/provider_cart/product/widgets/photo_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../product/manager/shop/shop_manager.dart';

final _viewmodal = PhotosViewModal();

class PhotosView extends StatelessWidget {
  const PhotosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: buildisLoading(),
        actions: [buildActionChip(context)],
      ),
      body: buildGridView(),
    );
  }

  Observer buildisLoading() {
    return Observer(builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Visibility(child: CircularProgressIndicator(color:Colors.blue,),visible: _viewmodal.isLoading,),
        );
      },);
  }

  ActionChip buildActionChip(BuildContext context) {
    return ActionChip(
            label: Text("\$ ${context.watch<ShopManager>().totalMoney}"),
            avatar: Icon(Icons.shopping_bag),
            onPressed: () {});
  }

  Widget buildGridView() {
    return Observer(builder: ((context) {
      return GridView.builder(
        itemCount: _viewmodal.photos.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.8),
        itemBuilder: (context, index) {
          return PhotoCard(modal: _viewmodal.photos[index]);
        },
      );
    }),  
    );
  }

}
