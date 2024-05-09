import 'package:carbon_foot_print/routes/route.dart';
import 'package:carbon_foot_print/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Ad extends StatelessWidget {
  const Ad({super.key});

  @override
  Widget build(BuildContext buildContext) {
    Future.delayed(Duration(seconds: 1), () {
      Get.off(MainStruct(),transition: Transition.rightToLeft);
    });
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/img.png'), // 替换为您的图片路径
                  fit: BoxFit.fill, // 让图片填充满整个容器
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 100,
              child: Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('C',textScaleFactor: 2.5,style: TextStyle(
                    color: Colors.greenAccent,
                    fontFamily: "logoIcon",
                  )),
                  Text('碳足迹计算器',textScaleFactor: 2.5,style: TextStyle(
                    color: Colors.green,
                    fontFamily: "logoIcon",
                  )),
                  Text('O2',textScaleFactor: 2.5,style: TextStyle(
                    color: Colors.greenAccent,
                    fontFamily: "logoIcon",
                  )),
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}
