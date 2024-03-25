import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TitlePage extends StatelessWidget {
  final String title;
  dynamic page;
  TitlePage({super.key, required this.title, this.page});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600
                ),
              )
          ),
          IconButton(
              onPressed:() {
                Get.to(page);
              },
              icon: Icon(Icons.more_horiz, size: 30,)
          )
        ],
      ),
    );
  }
}
