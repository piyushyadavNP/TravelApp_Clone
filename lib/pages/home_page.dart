import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png": "Balloning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkling"
  };
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Menu Text
            Container(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Row(
                children: [
                  const Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.black,
                  ),
                  Expanded(child: Container()),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            // Discover Text
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: AppLargeText(text: "Discover"),
            ),
            const SizedBox(
              height: 20,
            ),
            // TabBar
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  labelPadding: const EdgeInsets.only(left: 20, right: 20),
                  controller: tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator:
                      CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                  tabs: const [
                    Tab(
                      text: "Places",
                    ),
                    Tab(
                      text: "Inspiration",
                    ),
                    Tab(
                      text: "Emotions",
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              height: 300,
              width: double.maxFinite,
              child: TabBarView(
                controller: tabController,
                children: [
                  ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(right: 15, top: 10),
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          image: const DecorationImage(
                              image: AssetImage("assets/images/mountain.jpeg"),
                              fit: BoxFit.cover),
                        ),
                      );
                    },
                  ),
                  Text("Hi"),
                  Text("Hi"),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(
                    text: "Explore More",
                    size: 22,
                  ),
                  AppText(
                    text: "See all",
                    color: AppColors.textColor1,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 120,
              width: double.maxFinite,
              margin: const EdgeInsets.only(left: 20),
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((_, index) => Container(
                      margin: const EdgeInsets.only(right: 30),
                      child: Column(
                        children: [
                          Container(
                            // margin: const EdgeInsets.only(right: 50, top: 10),
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/${images.keys.elementAt(index)}"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AppText(
                            text: images.values.elementAt(index),
                            color: AppColors.textColor2,
                          )
                        ],
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
