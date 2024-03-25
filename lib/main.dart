import 'package:fedesie_client_app/controller/community_controller.dart';
import 'package:fedesie_client_app/controller/home_controller.dart';
import 'package:fedesie_client_app/controller/info_controller.dart';
import 'package:fedesie_client_app/controller/login_and_register_controller.dart';
import 'package:fedesie_client_app/controller/office_controller.dart';
import 'package:fedesie_client_app/controller/screen_controller.dart';
import 'package:fedesie_client_app/controller/upload_image_controller.dart';
import 'package:fedesie_client_app/firebase_options.dart';
import 'package:fedesie_client_app/pages/application/application_page.dart';
import 'package:fedesie_client_app/pages/login_page.dart';
import 'package:fedesie_client_app/pages/register_page.dart';
import 'package:fedesie_client_app/pages/screen_page.dart';
import 'package:fedesie_client_app/pages/splace/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  Get.put(ScreenController());
  Get.put(LoginController());
  Get.put(HomePageController());
  Get.put(CommunityController());
  Get.put(InfoController());
  Get.put(OfficeController());
  Get.put(ImageController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(385, 812),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Fedesie Client App',
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: const SplashPage(),
          routes: {
            "logIn":(context) => const LoginPage(),
            "register": (context) => const RegisterPage(),
            "accueil": (context) => const ApplicationPage(),
          },
        );
      },
    );
  }
}
