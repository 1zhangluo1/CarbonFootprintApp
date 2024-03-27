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
          Page111(text: "莫楚楚"),
          Page112(text: "郑粲然"),
          Page113(text: "郑秀婷"),
          Page114(text: "没有了")
        ],
      ),
        bottomNavigationBar: NavigationBar(
            destinations: const [
              NavigationDestination(
                tooltip: '计算',
                icon: Icon(Icons.calculate_outlined),
                label: '计算',
                selectedIcon: Icon(Icons.calculate),
              ),
              NavigationDestination(
                tooltip: 'AI',
                icon: Icon(Icons.chat_outlined),
                label: 'C知道',
                selectedIcon: Icon(Icons.chat),
              ),
              NavigationDestination(
                tooltip: '分析',
                icon: Icon(Icons.query_stats),
                label: '分析',
                selectedIcon: Icon(Icons.query_stats_outlined),
              ),
              NavigationDestination(
                tooltip: '我的',
                icon: Icon(Icons.person_outlined),
                label: '我的',
                selectedIcon: Icon(Icons.person),
              )
            ],
            onDestinationSelected: (index) {
              pageController.jumpToPage(index);
            },
            selectedIndex: selected)
    );
  }

}