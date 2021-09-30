import 'package:flutter/material.dart';
import 'package:ice_shop/providers/app.dart';
import 'package:ice_shop/providers/provider_product.dart';
import 'package:ice_shop/providers/provider_user.dart';
import 'package:ice_shop/screens/screen_home.dart';
import 'package:ice_shop/screens/screen_login.dart';
import 'package:ice_shop/screens/splash.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: UserProvider.initialize()),
    ChangeNotifierProvider.value(value: ProductProvider.initialize()),
    ChangeNotifierProvider.value(value: AppProvider()),


  ], child: MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Colors.white
    ),
    home: ScreensController(),
  ),));
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch(user.status){
      case Status.Uninitialized:
        return Splash();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return Login();
      case Status.Authenticated:
        return HomePage();
      default: return Login();
    }
  }
}