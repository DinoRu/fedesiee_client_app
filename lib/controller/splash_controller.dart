import 'package:fedesie_client_app/pages/home/home_test_page.dart';
import 'package:fedesie_client_app/pages/login_page.dart';
import 'package:fedesie_client_app/upload_image_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/users/user.dart';
import '../pages/application/application_page.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    splashController();
  }

  User? loginUser;

  void splashController() {
    Map<String, dynamic>? user = GetStorage().read('loginUser');
    Future.delayed(Duration(seconds: 10), () {
      if (user != null) {
        loginUser = User.fromJson(user);
        Get.off(const ApplicationPage());
      } else {
        Get.offAll(const LoginPage());
      }
    });
  }

}