import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fedesie_client_app/models/infos/infolist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoController  extends GetxController{

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference infolistCollection;

  List<InfoList> infolists = [];

  @override
  Future<void> onInit() async {
    infolistCollection = firestore.collection("listinfos");
    await fetchListInfos();
    super.onInit();
  }

  fetchListInfos() async {
    try {
      QuerySnapshot infolistSnapshot = await infolistCollection.get();
      final List<InfoList> retrievedListInfos = infolistSnapshot.docs.map((doc) => InfoList.fromJson(
          doc.data() as Map<String, dynamic>)).toList();
      infolists.clear();
      infolists.assignAll(retrievedListInfos);
      Get.snackbar('Success', "Info fetch successfully!", colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', "Something was wrong!", colorText: Colors.red);
    } finally {
      update();
    }
  }
}