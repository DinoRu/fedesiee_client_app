import 'dart:convert';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:fedesie_client_app/pages/application/application_page.dart';
import 'package:fedesie_client_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/users/user.dart';

class LoginController extends GetxController {

  GetStorage box = GetStorage();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();

  /// Login controller
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();



  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userCollection;

  String hashPassword(String password) {
    var byte = utf8.encode(password);
    var digest = sha256.convert(byte);
    return digest.toString();
  }

 bool confirmPassword(String passord, String confirm_password) {
    return passord == confirm_password;
 }

 User? loginUser;

 // @override
 //  void onReady() {
 //    // TODO: implement onReady
 //   Map<String, dynamic>? user = GetStorage().read('loginUser');
 //   if (user != null) {
 //     loginUser = User.fromJson(user);
 //     Get.off(const ApplicationPage());
 //   }
 //    super.onReady();
 //  }

  @override
  void onInit() {
    // TODO: implement onInit
    userCollection = firestore.collection('users');
    super.onInit();
  }

  addUser() {
    try {
      if( emailController.text.isEmpty ||
          nameController.text.isEmpty ||
          cityController.text.isEmpty ||
          passwordController.text.isEmpty ||
          confirmpasswordController.text.isEmpty ||
          nameController.text.isEmpty
      ) {
        Get.snackbar('Error', "Something was wrong!", colorText: Colors.red);
        //? to stop the code
        return;
      }
      if (!confirmPassword(passwordController.text, confirmpasswordController.text)) {
        Get.snackbar('Error', "Password doesn't match", colorText: Colors.red);
        return;
      }
      DocumentReference doc = userCollection.doc();
      User user = User(
        id: doc.id,
        name: nameController.text,
        email: emailController.text,
        city: cityController.text,
        number: numberController.text,
        password: hashPassword(passwordController.text),
        confirm_password: hashPassword(confirmpasswordController.text),
      );
      final userJson = user.toJson();
      doc.set(userJson);
      Get.snackbar('Success', "User has been added successfully!", colorText: Colors.green);
      Get.to(const LoginPage());
    } catch (e) {
      Get.snackbar('Error', "Something was wrong!", colorText: Colors.red);
    } finally {
      update();
    }
  }

  // future for login with email and password

  Future<void> loginWithEmailAndPassword() async {
    try {
      String email = loginEmailController.text;
      String password = hashPassword(loginPasswordController.text);
      if (email.isNotEmpty && password.isNotEmpty) {
        var querySnapshot = await userCollection
                              .where('email', isEqualTo: email)
                              .where('password', isEqualTo: password).limit(1).get();
        if (querySnapshot.docs.isNotEmpty) {
          var userDoc = querySnapshot.docs.first;
          var userData = userDoc.data() as Map<String, dynamic>;
          box.write('loginUser', userData);
          loginEmailController.clear();
          loginPasswordController.clear();
          Get.snackbar('Success', 'Login Successfull', colorText: Colors.green);
          Get.off(const ApplicationPage());
        } else {
          Get.snackbar('Error', 'User not found, please register', colorText: Colors.red);
        }

      } else {
        Get.snackbar('Error', "Please enter a email and password", colorText: Colors.red);
      }
    } catch(er) {
        print("Failed to login:$er");
      }
  }

  updateUser(User user) async {
    try {
      var userRef = userCollection.doc(user.id);
      await userRef.update(user.toJson());
      Get.snackbar('Success', 'User updated', colorText: Colors.green);
      update();
    } catch(e) {
      Get.snackbar('Error', 'Something wrong', colorText: Colors.red);
    }
  }


}
