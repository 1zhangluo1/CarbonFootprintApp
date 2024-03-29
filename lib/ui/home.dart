import 'package:carbon_foot_print/common/Global.dart';
import 'package:carbon_foot_print/ui/main_four_page/ai_chat.dart';
import 'package:carbon_foot_print/ui/main_four_page/analyze_chart.dart';
import 'package:carbon_foot_print/ui/main_four_page/calculate.dart';
import 'package:carbon_foot_print/ui/main_four_page/profile.dart';
import 'package:flutter/material.dart';

class MainStruct extends StatefulWidget {
  const MainStruct({super.key});

  @override
  State<MainStruct> createState() => _MainStruct();
}

class _MainStruct extends State<MainStruct> {
  int selected = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: PageView(
          physics: const PageScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              selected = index;
            });
          },
          controller: pageController,
          children: const [
            Page111(text: "计算器界面"),
            Page112(text: "AI"),
            Page113(text: "分析"),
            Page114()
          ],
        ),
        bottomNavigationBar: SizedBox(
          child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.calculate_outlined),
                label: "计算",
                tooltip: "计算",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_outlined),
                label: "C知道",
                tooltip: "AI",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.query_stats),
                label: "分析",
                tooltip: "分析报告",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined),
                label: "我的",
                tooltip: "我的",
              ),
            ],
            onTap: (index) {
              pageController.jumpToPage(index);
            },
            currentIndex: selected,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
          ),
        ));
  }
}
