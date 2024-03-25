import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildProfAppBar() {
  return AppBar(
    scrolledUnderElevation: 0,
    title: Container(
      margin: EdgeInsets.only(top: 15.h, left: 25.w, right: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 24.w,
            height: 24.h,
            child: Image.asset('assets/icons/menus.png'),
          ),
          Text('Profile', style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
            ),
          ),
          SizedBox(
            height: 24.h,
            width: 24.w,
            child: Image.asset('assets/icons/dots.png'),
          )
        ],
      ),
    ),
  );
}

Widget profileIconAndEditButton(BuildContext context){
  return Container(
    margin: EdgeInsets.only(top: 20.h),
    width: MediaQuery.of(context).size.width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.only(right: 6.w),
          width: 80.w,
          height: 80.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                  image: AssetImage("assets/icons/man.png")
              )
          ),
          child: Image(
            width: 25.w,
            height: 25.h,
            image: const AssetImage('assets/icons/user-pen.png'),
          ),
        ),
        SizedBox(height: 10.h),
        Text('Ephraim Koffi',
          style: TextStyle(fontSize: 16.sp)
        )
      ],
    ),
  );
}

Widget buildListView(IconData icon, String text) {
  return Column(
    children: [
      GestureDetector(
        onTap: (){},
        child: Container(
          child: Row(
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                padding: EdgeInsets.all(7.0),
                child: Center(child: Icon(icon, color: Colors.white,)),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20.w)
                ),
              ),
              SizedBox(width: 15.w),
              Text(text,
                style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
              ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
