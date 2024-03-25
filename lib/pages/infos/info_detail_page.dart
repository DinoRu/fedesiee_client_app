import 'package:fedesie_client_app/models/infos/infolist.dart';
import 'package:fedesie_client_app/pages/home/widgets/home_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InfoDetailPage extends StatelessWidget {
  const InfoDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    InfoList infoList = Get.arguments['data'];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(infoList.title!.trim()),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.more_vert)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Text(
                  infoList.title!,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 23.sp,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 25.h),
                child: Text(
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                    infoList.description!
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                  child: Image.network(infoList.thumbnail!)
              ),
              SizedBox(height: 20.h),
              Center(child: logoContainer()),
            ],
          ),
        ),
      ),
    );
  }
}
