
import 'package:fedesie_client_app/pages/details/detail_page.dart';
import 'package:fedesie_client_app/test_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../models/activity/activity.dart';
import '../../../models/activity_category/category.dart';

class ActivityListPage extends StatelessWidget {
  final List<Activity> activities;
  const ActivityListPage({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 250.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: activities.length,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () {
                  Get.to(const DetailPage(), arguments: {'data': activities[i]});
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(activities[i].image ?? '', fit: BoxFit.fill, height: 150.h,),
                      SizedBox(height: 10),
                      Text(
                        activities[i].titre ?? "",
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        activities[i].place ?? '',
                        style: TextStyle(
                            color: Colors.orange[900],
                            fontWeight: FontWeight.w600
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}


List<dynamic> icons = [
  'assets/icons/friend.png',
  'assets/icons/confetti.png',
  'assets/icons/cubes.png',
  'assets/icons/sports.png',
  'assets/icons/meet.png',
];


class CategoriePage extends StatelessWidget {
  final List<Category> categories;
  const CategoriePage({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Container(
          margin: EdgeInsets.only(left: 5.w, right: 5.w),
          height: 70,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, i) {
                return Container(
                  width: 200,
                  margin: EdgeInsets.only(right: 10.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        Colors.white54,
                        Colors.green,
                      ],
                      stops: [0.1, 1]
                    ),

                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(icons[i], width: 40, height: 40,),
                      Text(
                          categories[i].name ?? '',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                );
              }
          ),
        ),
    );
  }
}

