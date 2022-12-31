import 'package:dsc_flutter/provider_cart/feature/photos/model/photos_modal.dart';
import 'package:dsc_flutter/provider_cart/product/manager/shop/shop_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhotoCard extends StatefulWidget {
  const PhotoCard({super.key, required this.modal});
  final PhotosModal modal;

  @override
  State<PhotoCard> createState() => _PhotoCardState();
}

class _PhotoCardState extends State<PhotoCard> with AutomaticKeepAliveClientMixin {
  bool isIncrementOpen=false;
  void isIncremenentChange(){
    if(!isIncrementOpen){
      context.read<ShopManager>().addShopItem(widget.modal);
    }
    else{
      context.read<ShopManager>().removeShopItem(widget.modal);
    }
    setState(() {
      isIncrementOpen=!isIncrementOpen;
    });
  }
  @override
  Widget build(BuildContext context) {
   super.build(context);
    return Card(child: 
    Stack(children: [
      buildListTileCard(),
      Positioned(right: 0,child: buildCardShopIncrement())
    ]));
  }

  ListTile buildListTileCard() {
    return ListTile(subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.modal.title ?? '',maxLines: 2,),
        IconButton(icon:const Icon( Icons.shopping_basket),onPressed:isIncremenentChange)
      ],
    ),title:Image.network(widget.modal.url??'') /*Container(height: 150,color:Colors.red,),*/);
  }

  Widget buildCardShopIncrement() {
    return AnimatedContainer(
      duration:const Duration(milliseconds:200),
      height:isIncrementOpen? 70:0,
      width:isIncrementOpen? 40:0,
      child: Card(
              elevation: 10,
              color: Colors.white,
              child: Column(children: [
                  Expanded(flex: 4,child:buildIconButtonIncrement()),
                  const Spacer(),
                  Expanded(flex: 4,child:buildIconButtondeIncrement())
                ],
              )),
    );
  }

  IconButton buildIconButtondeIncrement() => IconButton(padding: EdgeInsets.zero,onPressed: () {context.read<ShopManager>().deIncrementItem(widget.modal);}, icon: Icon(Icons.remove));

  IconButton buildIconButtonIncrement() => IconButton(padding: EdgeInsets.zero,onPressed: () {context.read<ShopManager>().incrementItem(widget.modal);}, icon: Icon(Icons.add));
  
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  
}
