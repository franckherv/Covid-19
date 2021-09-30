import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:resp_api_3/components/home_builing.dart';
import 'package:resp_api_3/routes/app_route.dart';
import 'package:resp_api_3/screens/home_screen.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}