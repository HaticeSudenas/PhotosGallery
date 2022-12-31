import 'package:dsc_flutter/provider_cart/feature/basket/basket_view.dart';
import 'package:dsc_flutter/provider_cart/feature/photos/view/photos_view.dart';
import 'package:dsc_flutter/provider_cart/feature/tabbar/model/tab_modal.dart';
import 'package:flutter/material.dart';

class AppTabBar extends StatelessWidget {
  AppTabBar({super.key});
  final List<TabModal> tabModal = [
    TabModal(data: Icons.photo_album, title: "Photos", page: PhotosView()),
    TabModal(
        data: Icons.shopping_basket,
        title: "Basket",
        page: BasketView())
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            bottomNavigationBar: BottomAppBar(child: buildTabBar(),),
            body: buildTabBarView()));
  }

  TabBar buildTabBar() {
    return TabBar(
              tabs: List.generate(
                  tabModal.length,
                  (index) => Tab(
                        text: tabModal[index].title,
                        icon: Icon(tabModal[index].data),
                      )),
            );
  }

  TabBarView buildTabBarView() {
    return TabBarView(
            children: tabModal.map((e) => e.page).toList(),
          );
  }
}
