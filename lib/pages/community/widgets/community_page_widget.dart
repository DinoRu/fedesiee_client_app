
import 'package:fedesie_client_app/models/community/community.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/member/member.dart';

Widget cityContainer(Community community) {
  return Container(
   margin: EdgeInsets.all(8),
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
      image: DecorationImage(
          image: NetworkImage(community.thumbnail ?? ''),
          fit: BoxFit.fill
      ),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          community.name ?? 'Moscou',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.orange
          ),
        ),
      ),
    ),
  );
}

Widget thumbnailWidget(Community community) {
  return SizedBox(
    height: 200.h,
    child: Image.network(
        community.thumbnail ?? '',
      fit: BoxFit.fill,
    ),
  );
}

class MemberWidget extends StatelessWidget {
  Community community;
  final Function onTap;

  MemberWidget(
      {
        super.key,
        required this.community,
        required this.onTap,
      }
  );

  @override
  Widget build(BuildContext context) {
    return Container();
    
  }
}
