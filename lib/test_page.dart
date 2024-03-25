import 'package:fedesie_client_app/models/activity_category/category.dart';
import 'package:fedesie_client_app/pages/activities/widgets/activity_page_widget.dart';
import 'package:fedesie_client_app/pages/details/detail_page.dart';
import 'package:fedesie_client_app/pages/home/widgets/activity_list_page.dart';
// import 'package:fedesie_client_app/pages/home/widgets/activity_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'controller/home_controller.dart';
import 'models/activity/activity.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List<Activity> filteredActivities = [];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (controller) {
      return RefreshIndicator(
        onRefresh: () async {
          await controller.fetchActivities();
          setState(() {
            filteredActivities = controller.activitiyShowUI;
          });
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('Nos activités'),
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
            scrolledUnderElevation: 0,
            backgroundColor: Colors.white,
          ),
          body: DefaultTabController(
            length: controller.categories.length + 1, // +1 for "Tous"
            child: Column(
              children: [
                TabBar(
                  labelColor: Colors.orange,
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.grey[700]
                  ),
                  indicatorColor: Colors.orangeAccent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  tabs: [
                    Tab(text: 'Tous'),
                    for (var category in controller.categories)
                      Tab(text: category.name ?? ''),
                  ],
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: TabBarView(
                    children: [
                      // "Tous" tab
                      ListView.separated(
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.to(DetailPage(), arguments: {'data': controller.activitiyShowUI[index]});
                            },
                            child: ActivityList(
                              activity: controller.activitiyShowUI[index],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: controller.activitiyShowUI.length,
                      ),
                      // Category tabs
                      for (var category in controller.categories)
                        Builder(
                          builder: (BuildContext context) {
                            final categoryName = category.name;
                            filteredActivities = controller.activities.where((activity) => activity.categorie == categoryName).toList();
                            return RefreshIndicator(
                              onRefresh: () async {
                                await Future.delayed(Duration(seconds: 2));
                                await controller.fetchActivities();
                              },
                              child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Get.to(DetailPage(), arguments: {'data': filteredActivities[index]});
                                    },
                                    child: ActivityList(
                                      activity: filteredActivities[index],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) => const Divider(),
                                itemCount: filteredActivities.length,
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
