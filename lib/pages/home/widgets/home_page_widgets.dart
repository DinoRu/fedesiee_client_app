import 'package:dots_indicator/dots_indicator.dart';
import 'package:fedesie_client_app/controller/screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    scrolledUnderElevation: 0,
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      height: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 40.w,
            height: 30.h,
            child: Image.asset('assets/icons/menus.png'),
          ),
          GestureDetector(
            onTap: (){},
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icons/man.png')
                )
              ),
              ),
            ),
        ],
      ),
    ),
  );
}

Widget homePageText(String text, {Color color = Colors.black, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: 24.sp,
          fontWeight: FontWeight.bold
      ),
    ),
  );

}

Widget searchView() {
  return Row(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 288.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: Colors.black38,
          ),
          borderRadius: BorderRadius.circular(20.h)
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 15.w),
              width: 16.w,
              height: 16.h,
              child: const Icon(Icons.search, color: Colors.black38,),
            ),
            Container(
              margin: EdgeInsets.only(top: 0.h),
              width: 240,
              height: 40.h,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5.w, 10.h, 0, 10.h),
                  border: InputBorder.none,
                  hintText: 'Recherche...',
                ),
              ),
            )
          ],
        ),
      ),
      GestureDetector(
        onTap: (){},
        child: Container(
          margin: EdgeInsets.only(top: 20.h),
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black38),
            borderRadius: BorderRadius.circular(13.w)
          ),
          child: Icon(Icons.tune, size: 40,),
        ),
      )
    ],
  );
}

Widget slidersViews(ScreenController ctrl) {
  PageController pageController = PageController();
  return Column(
    children: [
      Container(
          margin: EdgeInsets.only(top: 20.h),
          width: 325.w,
          height: 160.h,
          child: PageView(
            controller: pageController,
            onPageChanged: (value){
              ctrl.scroll(value);
            },
            children: [
              _sliderContainer(path: 'assets/images/image.png'),
              _sliderContainer(path: 'assets/images/nuit_1.png'),
              _sliderContainer(path: 'assets/images/conf_1.png'),
            ],
          )
      ),
      Container(
        margin: EdgeInsets.only(top: 5.h),
        child: DotsIndicator(
          dotsCount: 3,
          position: ctrl.page,
          decorator: const DotsDecorator(
            color: Colors.grey,
            activeColor: Colors.orangeAccent,
            size: Size.square(5.0),
            activeSize: Size(17.0, 5.0),
            activeShape: RoundedRectangleBorder(
            )
          ),
        ),
      )
    ],
  );
}

Widget _sliderContainer({String path = 'assets/images/image.png'}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.h),
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(path)
        )
    ),
  );
}

Widget menuView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _reusableSubtitleText('Dernieres infos'),
            GestureDetector(
              onTap: (){},
                child: _reusableSubtitleText('+', color: Colors.black54, fontSize: 10)
            )
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 15.h),
        width: 325.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.w),
        ),
        child: Column(
          children: [
            _listInfoTitle('Passports disponibles', 'Voici la liste des passports disponibles..'),
            _listInfoTitle("Demande d'aide financiere pour une soeur malade", 'Notre soeur du nom de .....')
          ],
        ),
      )
    ],
  );
}

Widget _reusableSubtitleText(String text,
    {Color color = Colors.black, int fontSize = 16, FontWeight fontWeight = FontWeight.bold}) {
  return Container(
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        overflow: TextOverflow.ellipsis
      ),
    ),
  );
}

Widget _listInfoTitle(String title, String subtitle ) {
  return Container(
    width: 325.h,
    child: ListTile(
      title: _reusableSubtitleText(title),
      subtitle: _reusableSubtitleText(subtitle, fontWeight: FontWeight.normal),
      leading: const Icon(Icons.info_outline),
      trailing: const Icon(Icons.chevron_right),

    ),
  );
}

Widget reusableTitle(String text, {Color color=Colors.black, int fontSize=16, FontWeight fontWeight=FontWeight.bold}) {
  return Container(
    margin: EdgeInsets.only(top: 15.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: fontSize.sp,
            fontWeight: fontWeight
          ),
        ),
        IconButton(
          onPressed: (){},
            icon: Icon(Icons.chevron_right)
        )
      ],
    ),
  );
}




Widget _reusableMenuText(String menuText) {
  return Container(
    margin: EdgeInsets.only(right: 15.w),
    decoration: BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.circular(7.w),
      border: Border.all(color: Colors.black12)
    ),
    child: Center(
      child: reusableTitle(
        menuText,
        fontWeight: FontWeight.normal,
        fontSize: 11,
        color: Colors.white
      ),
    ),
  );
}

Widget buildMemberContainer(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 15.h),
    width: MediaQuery.of(context).size.width,
    height: 160.h,
    decoration: BoxDecoration(
      color: Colors.white60,
      borderRadius: BorderRadius.circular(15.h),
    ),
    child: Row(
      children: [
        Container(
          width: 145.w,
          height: 145.h,
          margin: EdgeInsets.only(left: 5.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.w),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.w),
            child: const Image(
              image: AssetImage('assets/images/presi_img.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 5.h),
              width: 150.w,
              child: Text(
                'Ephraim Koffi',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp
                ),
              ),
            ),
            Text('President', )
          ],
        )
      ],
    ),
  );
}

Widget sliderOfficeMember(BuildContext context) {
  return Container(
    width: 325.w,
    height: 160.h,
    child: PageView(
      children: [
        buildMemberContainer(context),
        buildMemberContainer(context),
        buildMemberContainer(context),
      ],
    ),
  );
}

Widget logoContainer() {
  return Container(
    margin: EdgeInsets.only(top: 20.h),
    width: 325.w,
    child: Column(
      children: [
        Image(
            image: AssetImage('assets/fedesie_logo.png'),
          width: 40.w,
          height: 40.h,
        ),
        Text(
          'Ma FEDESIEE',
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        )
      ],
    ),
  );
}