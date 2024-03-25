import 'package:fedesie_client_app/models/activity/activity.dart';
import 'package:fedesie_client_app/pages/home/widgets/home_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Activity activity = Get.arguments['data'];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(activity.titre!.trim()),
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
              SizedBox(
                child: Image.network(activity.image!)
              ),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Text(
                    activity.titre!,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 23.sp,
                    ),
                ),
              ),
              SizedBox(height: 5.h),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 4.w),
                    child: Text(
                      activity.date!,
                      style: TextStyle(
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  Text(activity.place!, style: TextStyle(fontSize: 12.sp),)
                ],
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 25.h),
                child: Text(
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                  activity.description!
                ),
              ),
              Center(child: logoContainer()),
            ],
          ),
        ),
      ),
    );
  }
}
