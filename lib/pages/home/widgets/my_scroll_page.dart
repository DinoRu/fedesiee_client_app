import 'dart:async';
import 'package:fedesie_client_app/controller/home_controller.dart';
import 'package:fedesie_client_app/models/annonces/annonce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class ScrollPageView extends StatefulWidget {
  const ScrollPageView({super.key});

  @override
  State<ScrollPageView> createState() => _ScrollPageViewState();
}

class _ScrollPageViewState extends State<ScrollPageView> {
  final PageController pageController = PageController(initialPage: 0);

  int currentPage = 0;

  List<Annonce> annonces = [];

  late List<Widget> _pages;

  int _activePage = 0;

  Timer? _timer;

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if(pageController.page == annonces.length - 1) {
        pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      } else {
        pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final homeController = Get.find<HomePageController>();
    annonces = homeController.annoncesList;
    _pages = List.generate(annonces.length, (index) => ImagePlaceholder(annonce: annonces[index]));
    startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      child: Stack(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              width: 375.w,
              child: PageView.builder(
                  controller: pageController,
                  itemCount: annonces.length,
                  onPageChanged: (value) {
                    setState(() {
                      _activePage = value;
                    });
                  },
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: _pages[i],
                      ),
                    );
                  }),
            ),
            Positioned(
                bottom: 15.h,
                left: 0,
                right: 0,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(_pages.length, (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: InkWell(
                        onTap: () {
                          pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                        },
                        child: CircleAvatar(
                          radius: 4,
                          backgroundColor: _activePage == index ? Colors.orange : Colors.grey,
                        ),
                      ),
                    )),
                  ),
                )
            )
          ]
      ),
    );
  }
}

class ImagePlaceholder extends StatelessWidget {
  final Annonce? annonce;
  const ImagePlaceholder({super.key, this.annonce});

  @override
  Widget build(BuildContext context) {
    return Image.network("${annonce!.thumbnail}", fit: BoxFit.fill);
  }
}

