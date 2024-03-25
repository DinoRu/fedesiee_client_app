import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fedesie_client_app/models/community/community.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/member/member.dart';

class CommunityController  extends GetxController{

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference communitiesCollection;
  late CollectionReference memberCollection;

  List<Community> communities = [];
  List<Member> members = [];

  @override
  Future<void> onInit() async {
    communitiesCollection = firestore.collection("community");
    memberCollection = firestore.collection('membres');
    await fetchCommunities();
    super.onInit();
  }

  fetchCommunities() async {
    try {
      QuerySnapshot communitySnapshot = await communitiesCollection.get();
      final List<Community> retrievedCommunities = communitySnapshot.docs.map((doc) => Community.fromJson(
          doc.data() as Map<String, dynamic>)).toList();
      communities.clear();
      communities.assignAll(retrievedCommunities);
      Get.snackbar('Success', "Community fetch successfully!", colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', "Something was wrong!", colorText: Colors.red);
    } finally {
      update();
    }
  }

  Future<void> getMemberForCommunity(String id) async {
    try {
      QuerySnapshot memberSnapshot = await memberCollection.where('id', isEqualTo: id).get();
      final List<Member> retrievedMembers = memberSnapshot.docs.map((doc) => Member.fromJson(
          doc.data() as Map<String, dynamic>)).toList();
      members.clear();
      members.assignAll(retrievedMembers);
      Get.snackbar('Success', 'Members was fetch successfully', colorText: Colors.green);
    } catch(e) {
      Get.snackbar('Error', 'Something wrong!', colorText: Colors.red);
    } finally {
      update();
    }
  }

}