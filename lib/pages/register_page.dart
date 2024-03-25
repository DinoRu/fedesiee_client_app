import 'package:fedesie_client_app/controller/login_and_register_controller.dart';
import 'package:fedesie_client_app/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
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

                  const Text("Creer un compte", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                  ),),
                  const SizedBox(height: 20),
                  buildTextField(
                      'Entrer votre email', 'login', Icon(Icons.email), controller.emailController),
                  buildTextField('Nom et prenom',
                    'login',
                    Icon(Icons.person),
                    controller.nameController
                  ),
                  buildTextField('Ville', 'city',
                      Icon(Icons.location_city),
                      controller.cityController
                  ),
                  numberPhone(controller.numberController),
                  buildTextField(
                      'Mot de passe', 'password',
                      Icon(Icons.lock),
                      controller.passwordController
                  ),
                  buildTextField('Confirmer le mot de passe', 'password',
                      Icon(Icons.lock),
                    controller.confirmpasswordController
                  ),
                  buildLogInAndRegButton(context, 'Creer un compte',
                          () {
                      controller.addUser();
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
      void Function()? func) {
    return GestureDetector(
      onTap: func,
      child: Container(
        margin: EdgeInsets.only(left: 5.w, right: 5.w, top: 20.h),
        width: 375.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: Colors.green,
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
              color: Colors.transparent,
            )
        ),
        child: Center(
          child: Text(buttonName, style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.normal
          ),),
        ),
      ),
    );
  }

  Widget buildTextField(String buttonText, String buttonType, Icon icon,
      TextEditingController controller
      ) {
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
            icon: icon,
          ),
          obscureText: buttonType == 'password' ? true : false,
        ),
      ),
    );
  }

  Widget numberPhone(TextEditingController controller) {
    return IntlPhoneField(
      controller: controller,
      decoration: InputDecoration(
          hintText: 'Numero de telephone',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.black54
              ),
              borderRadius: BorderRadius.circular(20)
          )
      ),
      initialCountryCode: 'RU',
    );
  }
}
