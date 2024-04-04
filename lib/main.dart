import 'package:eapp/core/store.dart';
import 'package:eapp/pages/cart_page.dart';
import 'package:eapp/pages/home_page.dart';
import 'package:eapp/pages/login_page.dart';
import 'package:eapp/utils/routes.dart';
import 'package:eapp/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      themeMode: ThemeMode.system,
       //theme data
      theme:Mythemes.lightheme(context),
      darkTheme: Mythemes.darktheme(context),
      debugShowCheckedModeBanner: false,  
       //theme data of app bar

      initialRoute: MyRoutes.homeRoute,
      
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.homeRoute : (context) =>  const  HomePage(),
        MyRoutes.loginRoute : (context) => const LoginPage(),
        MyRoutes.cartroute : (context) => const CartPage(),
        
      },
    );
  }
}
