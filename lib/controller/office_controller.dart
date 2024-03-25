import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../models/office/office.dart';

class OfficeController extends GetxController {
  
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference memberCollection;

  List<OfficeMember> officemember = [];

  @override
  void onInit() async {
    memberCollection = firestore.collection('office_memebers');
    await fetchOfficeMembers();
    super.onInit();
  }


  fetchOfficeMembers() async {
    try {
      QuerySnapshot snapshot = await memberCollection.get();
      final List<OfficeMember> retrievedMembers = snapshot.docs.map((doc) => OfficeMember.fromJson(
          doc.data() as Map<String, dynamic>)).toList();
      officemember.clear();
      officemember.assignAll(retrievedMembers);
      Get.snackbar('Success', "Office members fetch successfully!", colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', "Something was wrong!", colorText: Colors.red);
    } finally {
      update();
    }
  }
  
}