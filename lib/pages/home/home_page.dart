import 'package:fedesie_client_app/controller/home_controller.dart';
import 'package:fedesie_client_app/pages/details/detail_page.dart';
import 'package:fedesie_client_app/test_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    return GetBuilder<HomePageController>(builder: (ctrl) {
      return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Decouverte',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Bienvenue sur fedesie, la communaute des ivoiriens de l'europe de l'est",
                      style: TextStyle(
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 300,
                      padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.orange,
                                Colors.white,
                                Colors.green
                              ]
                          ),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'FEDESIE',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: Colors.grey[900],
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Fondée le 6 Mai 2017,"
                                "notre Fédération des Étudiants et Stagiaires Ivoiriens de l’Europe de l’Est (FEDESIEE) est un organisme...",
                            style: TextStyle(
                                color: Colors.grey[900]
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                              'Top news',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18
                              ),
                            )
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward)
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://images.unsplash.com/photo-1588681664899-f142ff2dc9b1?q=80&w=2874&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
                              )
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Visite du president dans la region de Lipets',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '${date.day}.${date.month}.${date
                                            .year}',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic
                                        ),
                                      ),
                                    ),
                                    Icon(
                                        Icons.favorite_outline
                                    )
                                  ],
                                )
                              ],
                            )
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://images.unsplash.com/photo-1588681664899-f142ff2dc9b1?q=80&w=2874&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
                              )
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Visite du president dans la region de Lipets',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '${date.day}.${date.month}.${date
                                            .year}',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic
                                        ),
                                      ),
                                    ),
                                    Icon(
                                        Icons.favorite_outline
                                    )
                                  ],
                                )
                              ],
                            )
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                              'Evenement à avenir',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18
                              ),
                            )
                        ),
                        IconButton(
                            onPressed: () {
                              Get.to(TestPage());
                            },
                            icon: Icon(Icons.arrow_forward)
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(left: 10, right: 10),
              sliver: SliverGrid.builder(
                  itemCount: ctrl.recentActivities.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 30
                  ),
                  itemBuilder: (context, i) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(DetailPage(), arguments: {'data': ctrl.recentActivities[i]});
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          ctrl.recentActivities[i].image!
                                    )
                                ),
                              ),
                            ),),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: Text(
                                ctrl.recentActivities[i].titre ?? '',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20
              )
            ),
          ],
        ),
      );
    });
  }
}
