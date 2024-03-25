import 'package:fedesie_client_app/pages/home/widgets/home_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

AppBar buildOfficeAppBar() {
  return AppBar(
    scrolledUnderElevation: 0,
    backgroundColor: Colors.white,
    title: Container(
      margin: EdgeInsets.only(top: 15.h, left: 25.w, right: 25.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Bureau', style: TextStyle(
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

Widget officeText() {
  return Container(
    margin: EdgeInsets.only(top: 20.h, left: 25.w),
    width: 325.w,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Membres',
          style: TextStyle(
            fontSize: 24.w,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
        Text('du bureau executif',
          style: TextStyle(
              fontSize: 24.w,
              fontWeight: FontWeight.bold,
              color: Colors.black,
          ),
        ),
      ],
    ),
  );
}

Widget officeMemberGrid(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 15.h),
    height: MediaQuery.of(context).size.height,
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 0.6,
      ),
      itemCount: 39,
      itemBuilder: (context, index) {
        return Container(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.w),
                  image: DecorationImage(
                    image: AssetImage('assets/images/presi_img.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: 200.w,
                  height: 75.h,
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.w),
                      bottomRight: Radius.circular(20.w)
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Ephraim Koffi lllllllllllllllllllllll',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Titre 2',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}


Widget officeMember(BuildContext context) {
  return Container(
    width: 325.w,
    margin: EdgeInsets.only(top: 15.h),
    padding: EdgeInsets.only(left: 30.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Membres ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.sp
              ),
            ),
            Text('du bureau executif',
              style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold
              ),
            )
          ],
        ),

      ],
    ),
  );

}

Widget listOfOfficeMember(BuildContext context) {
  return Column(
    children: [
      const Text('Membres du bureau executif'),
      Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => buildMemberContainer(context),
              separatorBuilder: (contex, index) => const Divider(),
              itemCount: 39
          )
      )
    ],
  );
}
