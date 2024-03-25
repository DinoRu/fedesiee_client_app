import 'dart:io';

import 'package:fedesie_client_app/controller/upload_image_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';


class UploadImagePage extends StatelessWidget {
   const UploadImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImageController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Upload to FireStore'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 40),
              ElevatedButton(
                  onPressed: (){
                    ctrl.getImage();
                  },
                  child: const Text('Choose image'),
              ),
              Obx(() => Text(ctrl.message.value)),
              Obx(() => Text(ctrl.downloadUrl.value)),
              SizedBox(
                height: 200,
                child: Obx(() {
                  if(ctrl.image.value == null) {
                    return Center(
                      child: Text('No image selected'),
                    );
                  } else {
                    return Image.file(ctrl.image.value!);
                  }
                }),
              ),
              ElevatedButton(
                  onPressed: () {
                    ctrl.uploadImage();
                  },
                  child: Text('Uplaod Image')
              ),
              Container(
                width: 200, // ajustez la largeur selon vos besoins
                height: 200, // ajustez la hauteur selon vos besoins
                decoration: BoxDecoration(
                  // Ajoutez une décoration pour le container si nécessaire
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                child: Obx(() {
                  final imageUrl = ctrl.downloadUrl.value;
                  if (imageUrl.isEmpty) {
                    return Center(
                      child: Text('No image available'),
                    );
                  } else {
                    return Image(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      );
    });
  }
}
