import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fedesie_client_app/controller/login_and_register_controller.dart';
import 'package:fedesie_client_app/controller/upload_image_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/users/user.dart';

class ProfileSettingPage extends StatelessWidget {
  const ProfileSettingPage({super.key});

  Future<void> _uploadImageAndSave(XFile? imageUrl, User user, LoginController ctrl) async {
    if(imageUrl == null) return;
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child('profile_images').child('${user.id}.jpg');
    UploadTask uploadTask = ref.putFile(File(imageUrl.path));
    await uploadTask.whenComplete(() async {
      try {
        String downloadUrl = await ref.getDownloadURL();
        await FirebaseFirestore.instance.collection('users')
            .doc(user.id)
            .update({
          'profileUrl': downloadUrl,
        });
        print('Url de la photo mise a jour avec success');
        user.profileUrl = downloadUrl;
        ctrl.updateUser(user);
        GetStorage().write('loginUser', user.toJson());
        Get.back();
      } catch(e) {
        print(e.toString());
      }
    });
  }

  Future<void> _getImageAndUpload(User user, LoginController ctrl) async {
    final ImagePicker _picker = ImagePicker();
    XFile? imageFile = await _picker.pickImage(source: ImageSource.gallery);
    _uploadImageAndSave(imageFile, user, ctrl);
  }


  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> user = Get.arguments['data'];

    TextEditingController nameController = TextEditingController(
        text: user['name']);
    TextEditingController villeController = TextEditingController(
        text: user['city']);
    TextEditingController emailController = TextEditingController(
        text: user['email']);
    TextEditingController numberController = TextEditingController(
        text: user['number']);

    final userUpdate = GetStorage().read('loginUser');

    return GetBuilder<LoginController>(builder: (ctrl) {
      return GetBuilder<ImageController>(builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Modifier son profil'),
          ),
          body: SingleChildScrollView(
            child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50.h),
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              User user = User.fromJson(userUpdate);
                              _getImageAndUpload(user, ctrl);
                            },
                            child: Container(
                              height: 130,
                              width: 130,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: user['profileUrl'] == null || user['profileUrl'].isEmpty ?
                                      NetworkImage('https://media.istockphoto.com/id/1337144146/vector/default-avatar-profile-icon-vector.jpg?s=612x612&w=0&k=20&c=BIbFwuv7FxTWvh5S3vB6bkT0Qv8Vn8N5Ffseq84ClGI=')
                                          : NetworkImage(user['profileUrl'])
                                  )
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Text('Choisir une photo'),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 60),
                    Container(
                      padding: EdgeInsets.only(left: 50.w, right: 50.w),
                      child: Column(
                        children: [
                          buildTextField('Nom & prenom', nameController),
                          SizedBox(height: 20),
                          buildTextField('Ville', villeController),
                          SizedBox(height: 20),
                          buildTextField('Email', emailController),
                          SizedBox(height: 20),
                          buildTextField('Numero', numberController),
                          SizedBox(height: 60),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OutlinedButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text(
                                    'Annuler',
                                    style: TextStyle(
                                        fontSize: 15,
                                        letterSpacing: 2,
                                        color: Colors.black
                                    ),
                                  )
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  var logUser = GetStorage().read('loginUser');
                                  user = Get.arguments['data'];
                                  User userUpdate = User(
                                    id: user['id'],
                                    name: nameController.text,
                                    email: emailController.text,
                                    city: villeController.text,
                                    number: numberController.text,
                                    password: user['password'],
                                    confirm_password: user['confirm_password'],
                                    profileUrl: logUser['profileUrl']
                                  ) ;
                                  ctrl.updateUser(userUpdate);
                                  GetStorage().write('loginUser', userUpdate.toJson());
                                  Get.back();
                                },
                                child: Text(
                                  'Valider',
                                  style: TextStyle(
                                      fontSize: 15,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
                                  side: BorderSide.none,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),

                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
            ),
          ),
        );
      });
    });
  }

  Widget buildTextField(String labelText, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 20
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey
        ),
        border: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.black
            )
        ),
      ),
    );
  }

}
