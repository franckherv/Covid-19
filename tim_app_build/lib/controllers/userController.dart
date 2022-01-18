

import 'package:get/get.dart';
import 'package:tim_app_build/model/user_models.dart';

class UserController extends GetxController {
  var isAuth = false;
  UserModel? user = null;

  setUser(UserModel utilisateur) {
    this.user = utilisateur;
  }

  authenticateUser() {
    this.isAuth = true;
  }

  unauthenticateUser() {
    this.isAuth = false;
  }
}
