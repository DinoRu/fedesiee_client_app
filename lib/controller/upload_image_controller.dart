
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';


class ImageController extends GetxController {
  
  Rx<File?> image = Rx<File?>(null);
  RxString message = ''.obs;
  RxString downloadUrl = ''.obs;
  
  final picker = ImagePicker();
  
  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    } else {
      print("No image selected");
    }
  }

  Future uploadImage() async {
    if(image.value != null ) {
      String filename = basename(image.value!.path);
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref(filename);
      message.value = "Uploading file. Please wait...";
      try {
        TaskSnapshot uploadTask = await ref.putFile(image.value!);
        if (uploadTask.state == TaskState.success) {
          message.value = 'File Uploaded Successfully';
          final _downloadUrl = await ref.getDownloadURL();
          downloadUrl.value = _downloadUrl.toString();
        } else {
          message.value = 'Error Uploading File';
        }
      } catch(e) {
        message.value = 'Errror Uploading File: $e';
      }
    }
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }


}

