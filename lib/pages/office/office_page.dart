import 'package:fedesie_client_app/controller/office_controller.dart';
import 'package:fedesie_client_app/pages/office/widgets/office_page_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OfficePage extends StatelessWidget {
  const OfficePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OfficeController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            )
          ],
          title: Text('Bureau exécutif', style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w900,
              color: Colors.orange
          ),),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: controller.officemember.isEmpty ?
          Center(child: CircularProgressIndicator()) :
          ListView.separated(
            itemCount: controller.officemember.length,
            itemBuilder: (context, i) {
              return InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 20.h),
                          height: 800.h,
                          child: Column(
                            children: [
                              Center(
                                child: Container(
                                  margin: EdgeInsets.only(top: 20.h),
                                  width: 130,
                                  height: 130,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 4, color: Colors.orange),
                                      boxShadow: [
                                        BoxShadow(
                                            spreadRadius: 2,
                                            blurRadius: 10,
                                            color: Colors.black.withOpacity(0.1)
                                        )
                                      ],
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(controller.officemember[i].avatar ?? '')
                                      )
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                controller.officemember[i].name ?? '',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                ),
                              ),
                              Text(
                                controller.officemember[i].post ?? '',
                                style: TextStyle(
                                  color: Colors.orange[900]
                                ),
                              ),
                              SizedBox(height: 20.h),
                              Text(
                                controller.officemember[i].bio ?? '',
                                textAlign: TextAlign.center,
                              ),
                              Spacer(),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Fermer'),
                                ),
                              )
                            ],
                          ),
                        );
                      }
                  );
                },
                child: Row(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.orange),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1)
                            )
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(controller.officemember[i].avatar ?? '')
                          )
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.officemember[i].name ?? '',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20.sp
                            ),
                            maxLines: 2,
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            controller.officemember[i].post ?? '',
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.orange[900]
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, i) => const Divider(),
          ),
        ),
      );
    });
  }
}
