import 'package:fedesie_client_app/pages/home/widgets/home_page_widgets.dart';
import 'package:fedesie_client_app/pages/profile/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildProfAppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              profileIconAndEditButton(context),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.only(left: 25.w),
                child: buildListView(Icons.settings, 'Parametres'),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 25.w),
                child: buildListView(Icons.people, 'Membres du bureau'),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 25.w),
                child: buildListView(Icons.info_outline, 'À propos de nous'),
              ),
              SizedBox(height: 50.h),
              logoContainer(),
              // SizedBox(height: 20,),
              // Padding(
              //   padding: EdgeInsets.only(left: 25.w),
              //   child: buildListView(),
              // ),
              // SizedBox(height: 20),
              // Padding(
              //   padding: EdgeInsets.only(left: 25.w),
              //   child: buildListView(),
              // )
            ],
          ),
        )
      ),
    );
  }
}
