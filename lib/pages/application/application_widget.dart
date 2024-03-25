import 'package:fedesie_client_app/pages/activities/activity_page.dart';
import 'package:fedesie_client_app/pages/community/community_page.dart';
import 'package:fedesie_client_app/pages/home/home_page.dart';
import 'package:fedesie_client_app/pages/home/home_test_page.dart';
import 'package:fedesie_client_app/pages/infos/infos_page.dart';
import 'package:fedesie_client_app/pages/office/office_page.dart';
import 'package:fedesie_client_app/pages/profile/profile_page.dart';
import 'package:fedesie_client_app/test_page.dart';
import 'package:flutter/cupertino.dart';

import '../profile/profile_test_page.dart';

Widget buildPage(int index) {

  List<Widget> widgets = [
    const HomeTestPage(),
    const TestPage(),
    const InfoPage(),
    const CommunityPage(),
    const ProfileTestPage(),
  ];
  return widgets[index];
}
