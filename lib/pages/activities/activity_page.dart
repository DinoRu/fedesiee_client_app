import 'package:fedesie_client_app/controller/home_controller.dart';
import 'package:fedesie_client_app/pages/activities/widgets/activity_page_widget.dart';
import 'package:fedesie_client_app/pages/details/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (controller) {
      return RefreshIndicator(
        onRefresh: () async {
          controller.fetchActivities()!;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('Nos activités'),
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
            scrolledUnderElevation: 0,
            backgroundColor: Colors.white,
          ),
          body: Column(
            children: [
              SizedBox(
                height: 50.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.categories.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          controller.filterByCategory(controller.categories[index].name ?? "");
                        },
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Chip(
                              label: Text(controller.categories[index].name ?? ''),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(height: 20.h),
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              Get.to(DetailPage(), arguments: {'data': controller.activitiyShowUI[index]});
                            },
                            child: ActivityList(
                                activity: controller.activitiyShowUI[index],
                            )
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: controller.activitiyShowUI.length)
              )
            ],
          ),
        ),
      );
    });
  }
}
