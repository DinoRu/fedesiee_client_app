import 'package:fedesie_client_app/controller/community_controller.dart';
import 'package:fedesie_client_app/pages/community/community_detail_page.dart';
import 'package:fedesie_client_app/pages/community/widgets/community_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommunityController>(builder: (ctrl) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Nos commnunautés"),
            scrolledUnderElevation: 0,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert),
              )
            ],
            backgroundColor: Colors.white,
          ),
          body: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.7
              ),
              itemCount: ctrl.communities.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.to(CommunityDetailPage(), arguments: {'data': ctrl.communities[index]});
                  },
                    child: cityContainer(ctrl.communities[index])
                );
              }
          )
      );
    });
  }

}

