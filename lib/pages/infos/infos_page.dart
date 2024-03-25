import 'package:fedesie_client_app/controller/info_controller.dart';
import 'package:fedesie_client_app/pages/infos/info_detail_page.dart';
import 'package:fedesie_client_app/pages/infos/widgets/infos_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfoController>(builder: (ctrl) {
      return RefreshIndicator(
        onRefresh: () async {
          ctrl.fetchListInfos();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            scrolledUnderElevation: 0,
            backgroundColor: Colors.white,
            title: Text(
              'Infos utiles',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
              textAlign: TextAlign.start,
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    print('Affiche le menu des notification');
                  },
                  icon: Icon(Icons.more_vert))
            ],
          ),
          body: ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: ctrl.infolists.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    Get.to(InfoDetailPage(), arguments: {'data': ctrl.infolists[index]});
                  },
                  child: infoList(info: ctrl.infolists[index]),
              );
            },
          ),
        ),
      );
    });
  }
}
