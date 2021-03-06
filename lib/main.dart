import 'package:e_com/pages/cart_page.dart';
import 'package:e_com/pages/home_page.dart';
import 'package:e_com/pages/login_page.dart';
import 'package:e_com/utils/routes.dart';
import 'package:e_com/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'core/store.dart';

void main() {
  runApp(VxState(store: Mystore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.HomeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.HomeRoute: (context) => HomePage(),
        MyRoutes.cartRoute: (context) => CartPage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}
