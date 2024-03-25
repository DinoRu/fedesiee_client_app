import 'package:fedesie_client_app/pages/application/application_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {

  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: buildPage(_index),
          bottomNavigationBar: Container(
            width: 375.w,
            height: 58.h,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey.withOpacity(0.1),
                )
              )
            ),
            child: BottomNavigationBar(
              elevation: 0,
              onTap: (value) {
                setState(() {
                  _index=value;
                });
              },
              currentIndex: _index,
              selectedItemColor: Colors.orangeAccent,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.view_cozy),
                  label: 'Activités',

                ),
                BottomNavigationBarItem(icon: Icon(Icons.info), label: 'info'),
                BottomNavigationBarItem(icon: Icon(Icons.location_city), label: 'community'),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
              ],
            ),
          )
        )
        ),
      );
  }
}
