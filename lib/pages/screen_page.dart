import 'package:dots_indicator/dots_indicator.dart';
import 'package:fedesie_client_app/controller/screen_controller.dart';
import 'package:fedesie_client_app/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenPage extends StatefulWidget {
  const ScreenPage({super.key});

  @override
  State<ScreenPage> createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GetBuilder<ScreenController>(builder: (ctrl) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(),
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.only(top: 100.h),
              width: 376.w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PageView(
                    onPageChanged: (index) {
                      ctrl.scroll(index);
                    },
                    controller: pageController,
                    children: [
                      _page(
                          1,
                          context,
                          "Suivant",
                          "FEDESIE, BIENVENUE",
                          'Fondée le 6 Mai 2017, '
                          'notre Fédération des Étudiants et Stagiaires Ivoiriens de '
                          'l’Europe de l’Est (FEDESIEE) est un organisme...',
                          "assets/fedesie_logo.png"
                      ),
                      _page(
                          2,
                          context,
                          "Suivant",
                          "NATURE, CARACTÈRE ET COMPOSITION",
                          "Notre FEDESIEE est une société de personnes et "
                          "de droit privé dont l'objet social ne doit pas être lucratif...",
                          "assets/fl_xs.png"
                      ),
                      _page(
                        3,
                        context,
                        "Commencer",
                        "MISSIONS",
                        "La mission de notre organisme se résume en 3 mots : \n"
                            "       UNITÉ, FRATERNITÉ, PROGRÈS",
                        'assets/logo_fedesie_png.png',
                      )
                    ],
                  ),
                  Positioned(
                      bottom: 50.h,
                      child: DotsIndicator(
                        position: ctrl.page,
                        dotsCount: 3,
                        mainAxisAlignment: MainAxisAlignment.center,
                        decorator: const DotsDecorator(
                          activeColor: Colors.orangeAccent,
                          activeSize: Size(18.0, 8.0),
                          activeShape: RoundedRectangleBorder()
                        ),
                      ))
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subtitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 300.w,
          height: 300.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 30.h),
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 24.sp,
                color: Colors.black,
                fontWeight: FontWeight.normal
            ),
          ),
        ),
        Container(
          width: 375.w,
          margin: EdgeInsets.only(top: 10.h),
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          alignment: Alignment.center,
          child: Center(
            child: Text(
              subtitle,
              style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black.withOpacity(0.8),
                  fontWeight: FontWeight.normal
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            // within 0-2 index
            if (index < 3){
              // animation
              pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.easeIn
              );
            } else {
                // Get.to(() => const HomePage());
              Navigator.of(context).pushNamedAndRemoveUntil("logIn", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 25.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 40.h,
            decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(25.w),
                boxShadow: [
                  BoxShadow(
                      color: Colors.green.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 1)
                  )
                ]
            ),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                    fontSize: 24.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.normal
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
