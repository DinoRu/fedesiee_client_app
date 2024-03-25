import 'package:fedesie_client_app/models/activity/activity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityList extends StatelessWidget {
  final Activity activity;
  const ActivityList({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          SizedBox(
            width: 150,
            height: 100,
            child: Image.network(
             activity.image.toString(),
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${activity.titre}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                ),
                Text(
                  '${activity.description}',
                  maxLines: 2,
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Text('${activity.date}'),
                    SizedBox(width: 20.w),
                    Text('${activity.place}'),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
