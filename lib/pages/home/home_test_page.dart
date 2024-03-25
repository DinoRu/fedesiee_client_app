import 'package:dots_indicator/dots_indicator.dart';
import 'package:fedesie_client_app/controller/home_controller.dart';
import 'package:fedesie_client_app/controller/info_controller.dart';
import 'package:fedesie_client_app/pages/home/widgets/activity_list_page.dart';
import 'package:fedesie_client_app/pages/home/widgets/my_scroll_page.dart';
import 'package:fedesie_client_app/pages/home/widgets/title_page.dart';
import 'package:fedesie_client_app/pages/infos/infos_page.dart';
import 'package:fedesie_client_app/test_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../infos/info_detail_page.dart';


class HomeTestPage extends StatelessWidget {
  const HomeTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final infoController = Get.put(InfoController());

    initializeDateFormatting('fr', null);
    DateTime date = DateTime.now();
    String formattedDate = DateFormat.yMMMMd('fr').format(date);
    return GetBuilder<HomePageController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: Text('FEDESIEE',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 20,
              color: Colors.orange,
            ),
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                ScrollPageView(),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: SizedBox(
                    width: 375.w,
                    height: 150.h,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                                  'Top news',
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600
                                  ),
                                )
                            ),
                            IconButton(
                                onPressed: () {
                                  Get.to(const InfoPage());
                                },
                                icon: Icon(Icons.more_horiz, size: 30,)
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Get.to(const InfoDetailPage(), arguments: {'data': infoController.infolists[0]});
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15),
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment
                                    .start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text(
                                          infoController.infolists[0].title ?? '',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                        SizedBox(height: 10.h),
                                        Text(formattedDate),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5.w),
                                    height: 100,
                                    width: 150,
                                    child: Image.network(
                                      infoController.infolists[0].thumbnail ?? '',
                                      fit: BoxFit.fill),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                TitlePage(title: 'Categories', page: '',),
                SizedBox(height: 10.h),
                CategoriePage(categories: ctrl.categories),
                SizedBox(height: 10.h),
                TitlePage(title: 'Activités à avenir', page: TestPage(),),
                SizedBox(height: 10.h),
                ActivityListPage(activities: ctrl.activities),

              ],
            ),
          ),
        ),
      );
    });
  }
}
