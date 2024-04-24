import 'package:carbon_foot_print/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';

class Analyze extends StatefulWidget {
  const Analyze({
    super.key,
  });

  @override
  _AnalyzeState createState() => _AnalyzeState();
}

class _AnalyzeState extends State<Analyze> {
  List<String> imagePath = [
    Assets.images.banner1.path,
    Assets.images.banner2.path,
    Assets.images.banner3.path,
    Assets.images.banner4.path,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 150,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image(
                          image: AssetImage(imagePath[index]),
                          fit: BoxFit.fill,
                        ));
                  },
                  itemCount: 4,
                  pagination: const SwiperPagination(),
                  loop: true,
                  autoplay: true,
                  duration: 1000,
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '周碳排放统计'.tr,
                  textScaleFactor: 1.3,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'titleIcon',
                    height: 1.0,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 0.5,
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
