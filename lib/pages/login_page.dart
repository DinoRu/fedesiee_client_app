import 'package:fedesie_client_app/controller/login_and_register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Image.asset('assets/fedesie_logo.png'),
                      )
                    ],
                  ),
                  const SizedBox(height: 44),
                  const Text("Connexion", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                  ),),
                  const SizedBox(height: 20),
                  buildTextField('Entrer votre email', 'login', ctrl.loginEmailController),
                  buildTextField('Mot de passe', 'password', ctrl.loginPasswordController),
                  forgotPassword(),
                  buildLogInAndRegButton(context, 'Se connecter', 'login',
                          () {
                        ctrl.loginWithEmailAndPassword();
                      }),
                  buildLogInAndRegButton(
                      context, 'Creer un compte', 'register', () {
                    Navigator.of(context).pushNamed('register');
                  }),
                ],
              ),
            )
        ),
      );
    });
  }

  Widget forgotPassword() {
    return Container(
      margin: EdgeInsets.only(left: 1.w),
      width: 260.w,
      height: 24.h,
      child: GestureDetector(
        onTap: () {},
        child: const Text("Mot de passe oublié?",
          style: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.underline
          ),
        ),
      ),
    );
  }

  Widget buildLogInAndRegButton(BuildContext context, String buttonName,
      String buttonType,
      void Function()? func) {
    return GestureDetector(
      onTap: func,
      child: Container(
        margin: EdgeInsets.only(
            left: 5.w, right: 5.w, top: buttonType == 'login' ? 20.h : 10.h),
        width: 375.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: buttonType == 'login' ? Colors.orangeAccent : Colors
                .transparent,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1)
              ),
            ],
            border: Border.all(
                color: buttonType == 'login'
                    ? Colors.transparent
                    : Colors.grey.withOpacity(0.5)
            )
        ),
        child: Center(
          child: Text(buttonName, style: TextStyle(
              color: buttonType == 'login'
                  ? Colors.white
                  : Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.normal
          ),),
        ),
      ),
    );
  }

  Widget buildTextField(String buttonText, String buttonType,
      TextEditingController controller) {
    return Container(
      margin: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 10.h),
      padding: EdgeInsets.only(left: 10.w),
      width: 375.w,
      height: 50.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: Colors.black54
          )
      ),
      child: Center(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: buttonText,
            icon: buttonType == 'login' ? const Icon(Icons.person) : const Icon(
                Icons.lock),
          ),
          obscureText: buttonType == 'password' ? true : false,
        ),
      ),
    );
  }
}
