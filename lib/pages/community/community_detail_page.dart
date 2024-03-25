import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/community_controller.dart';
import '../../models/community/community.dart';

class CommunityDetailPage extends StatelessWidget {

  CommunityDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Community community = Get.arguments['data'];
    return GetBuilder<CommunityController>(builder: (ctrl) {
      return Scaffold(
          appBar: AppBar(
            title: Text(community.name ?? ''),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.network(community.thumbnail ?? ''),
                SizedBox(height: 20.h),
                Text('Membres'),
                SizedBox(height: 20.h),
              ],
            ),
          )
      );
    });
  }
}



