import 'package:fedesie_client_app/controller/upload_image_controller.dart';
import 'package:fedesie_client_app/pages/community/community_page.dart';
import 'package:fedesie_client_app/pages/login_page.dart';
import 'package:fedesie_client_app/pages/office/office_page.dart';
import 'package:fedesie_client_app/pages/profile/profile_setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileTestPage extends StatelessWidget {
  const ProfileTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> loginUser = GetStorage().read('loginUser');
    final ImageController controller = Get.put(ImageController());
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      SizedBox(height: 20),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text('Profile',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  GetStorage box = GetStorage();
                                  box.erase();
                                  Get.to(const LoginPage());
                                }, icon: Icon(Icons.exit_to_app))
                          ]),
                      SizedBox(height: 60),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: loginUser['profileUrl'] == null || loginUser['profileUrl'].isEmpty ?
                                  NetworkImage('https://media.istockphoto.com/id/1337144146/vector/default-avatar-profile-icon-vector.jpg?s=612x612&w=0&k=20&c=BIbFwuv7FxTWvh5S3vB6bkT0Qv8Vn8N5Ffseq84ClGI=')
                                  : NetworkImage(loginUser['profileUrl'])
                            )
                          ),

                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        loginUser['name'],
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                      Text(
                        loginUser['email'],
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ))
                ],
              )
          ),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
                    child: InkWell(
                      onTap: () {
                        Get.to(const ProfileSettingPage(), arguments: {'data': loginUser});
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.settings, size: 30, color: Colors.orange,),
                          SizedBox(width: 10.w),
                          Text('Paramètres', style: TextStyle(
                              fontSize: 16.sp
                          ),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  Container(
                    margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
                    child: InkWell(
                      onTap: () {
                        Get.to(const CommunityPage());
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.public, size: 30, color: Colors.orange,),
                          SizedBox(width: 10.w),
                          Text('Nos communautés', style: TextStyle(
                            fontSize: 16.sp
                          ),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Container(
                    margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
                    child: InkWell(
                      onTap: () {
                        Get.to(const OfficePage());
                      },
                      child: Row(
                        children: [
                          Icon(Icons.groups, size: 30, color: Colors.orange,),
                          SizedBox(width: 10.w),
                          Text('Membres du bureau éxecutif', style: TextStyle(
                              fontSize: 16.sp
                          ),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Container(
                    margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 500,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)
                                    )
                                ),
                                child: Center(
                                  child: ElevatedButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Fermer'),
                                  ),
                                ),
                              );
                            }
                        );
                      },
                      child: Row(
                         children: [
                          Icon(Icons.phone, size: 30, color: Colors.orange,),
                          SizedBox(width: 10.w),
                          Text('Contacts', style: TextStyle(
                              fontSize: 16.sp
                          ),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Container(
                    margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(context: context, 
                            builder: (BuildContext context) {
                              return Container(
                                height: 500,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)
                                  )
                                ),
                                child: Center(
                                  child: ElevatedButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Fermer'),
                                  ),
                                ),
                              );
                            }
                        );
                      },
                      child: Row(
                        children: [
                          Icon(Icons.info, size: 30, color: Colors.orange,),
                          SizedBox(width: 10.w),
                          Text('À propos', style: TextStyle(
                              fontSize: 16.sp
                          ),),
                        ],
                      ),
                    ),
                  ),
                ],
              )
          ),
        ],
      )),
    );
  }
}
