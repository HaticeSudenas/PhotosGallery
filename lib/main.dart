import 'package:dsc_flutter/mimari/core/theme/light_theme.dart';
import 'package:dsc_flutter/provider_cart/feature/tabbar/app_tabbar.dart';
import 'package:dsc_flutter/provider_cart/product/manager/shop/shop_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers:[
      //Provider<ShopManager>(create: (_) =>ShopManager() ,),
      ChangeNotifierProvider<ShopManager>(create: (context) => ShopManager(),)
    ],
    child: const MyApp(),
  ));

  //const MyApp()
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demoo',
      //initialRoute: "/",
      /*routes: {
        "/":(context) =>const LottieLearn(),
        "/feed":(context) =>const FeedView(),
      },*/
     home:AppTabBar(),
     theme:LightTheme.instance.data,
    );
  }
}
