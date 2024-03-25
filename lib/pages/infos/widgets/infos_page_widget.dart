import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../models/infos/infolist.dart';


class infoList extends StatelessWidget {
  InfoList info;
  infoList({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          SizedBox(
            height: 100,
            width: 150,
            child: Image.network(
              info.thumbnail ??  'https://images.unsplash.com/photo-1560169573-5ff6f7f35fe4?q=80&w=2740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  info.title ?? '',
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                // Text(info?),
              ],
            ),
          )
        ],
      ),
    );
  }
}
